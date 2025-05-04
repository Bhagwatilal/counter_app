import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../infrastructure/data_source/login_api.dart';
import '../../infrastructure/login_form/dto/user_list_dto.dart' as list_dto;
import '../../infrastructure/login_form/dto/create_user_dto.dart' as create_dto;
import '../../infrastructure/login_form/dto/update_user_dto.dart' as update_dto;
import '../../presentation/core/snackbar/custom_snackbar.dart';
import '../../presentation/core/button/text_input/custom_text_input.dart';
import '../../presentation/core/button/custom_button.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final LoginApi _loginApi = LoginApi();
  final _formKey = GlobalKey<FormState>();
  List<list_dto.UserDTO> _users = [];
  List<list_dto.UserDTO> _createdUsers = []; // Track locally created users
  bool _isLoading = true;
  String? _error;
  String _name = '';
  String _email = '';
  String _job = '';
  int _nextUserId = 1000; // Start with a high number to avoid conflicts

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final response = await _loginApi.getUsers();
      setState(() {
        _users = response.users;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _createUser() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final user = create_dto.CreateUserDTO(name: _name, job: _job);
        final response = await _loginApi.createUser(user);

        // Add the created user to local state
        final newUser = list_dto.UserDTO(
          id: _nextUserId++,
          email: '${_name.toLowerCase().replaceAll(' ', '.')}@reqres.in',
          firstName: _name.split(' ').first,
          lastName: _name.split(' ').length > 1 ? _name.split(' ').last : '',
          avatar: 'assests/avatars${_nextUserId % 6 + 1}-blank_profile.jpg',
        );

        setState(() {
          _createdUsers.add(newUser);
        });

        CustomSnackbar.show(
          context,
          message: 'User created successfully!',
          backgroundColor: Colors.green,
        );
        Navigator.pop(context);
      } catch (e) {
        CustomSnackbar.show(
          context,
          message: e.toString(),
          backgroundColor: Colors.red,
        );
      }
    }
  }

  Future<void> _updateUser(list_dto.UserDTO user) async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final updatedUser = update_dto.UpdateUserDTO(name: _name, job: _job);
        await _loginApi.updateUser(user.id, updatedUser);

        // Update the user in local state
        setState(() {
          if (_createdUsers.contains(user)) {
            final index = _createdUsers.indexOf(user);
            _createdUsers[index] = list_dto.UserDTO(
              id: user.id,
              email: user.email,
              firstName: _name.split(' ').first,
              lastName:
                  _name.split(' ').length > 1 ? _name.split(' ').last : '',
              avatar: user.avatar,
            );
          }
        });

        CustomSnackbar.show(
          context,
          message: 'User updated successfully!',
          backgroundColor: Colors.green,
        );
        Navigator.pop(context);
      } catch (e) {
        CustomSnackbar.show(
          context,
          message: e.toString(),
          backgroundColor: Colors.red,
        );
      }
    }
  }

  Future<void> _deleteUser(list_dto.UserDTO user) async {
    try {
      await _loginApi.deleteUser(user.id);

      // Remove the user from local state
      setState(() {
        if (_createdUsers.contains(user)) {
          _createdUsers.remove(user);
        }
      });

      CustomSnackbar.show(
        context,
        message: 'User deleted successfully!',
        backgroundColor: Colors.green,
      );
    } catch (e) {
      CustomSnackbar.show(
        context,
        message: e.toString(),
        backgroundColor: Colors.red,
      );
    }
  }

  void _showCreateUserForm() {
    _name = '';
    _email = '';
    _job = '';
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: _buildUserForm(
          title: 'Create User',
          onSubmit: _createUser,
        ),
      ),
    );
  }

  void _showUpdateUserForm(list_dto.UserDTO user) {
    _name = '${user.firstName} ${user.lastName}';
    _email = user.email;
    _job = '';
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: _buildUserForm(
          title: 'Update User',
          onSubmit: () => _updateUser(user),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(list_dto.UserDTO user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete User'),
        content: Text(
            'Are you sure you want to delete ${user.firstName} ${user.lastName}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteUser(user);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Widget _buildUserForm({
    required String title,
    required VoidCallback onSubmit,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            CustomTextInput(
              label: 'Name',
              value: _name,
              onChanged: (value) => setState(() => _name = value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                if (value.split(' ').length < 2) {
                  return 'Please enter both first and last name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextInput(
              label: 'Email',
              value: _email,
              onChanged: (value) => setState(() => _email = value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextInput(
              label: 'Job',
              value: _job,
              onChanged: (value) => setState(() => _job = value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a job';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              label: title,
              onPressed: onSubmit,
              enabled: _name.isNotEmpty &&
                  _email.isNotEmpty &&
                  _job.isNotEmpty &&
                  _name.split(' ').length >= 2,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final allUsers = [..._users, ..._createdUsers];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateUserForm,
        child: const Icon(Icons.add),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_error!),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _fetchUsers,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: allUsers.length,
                  itemBuilder: (context, index) {
                    final user = allUsers[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage
                          (user.avatar),
                        ),
                        title: Text('${user.firstName} ${user.lastName}'),
                        subtitle: Text(user.email),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _showUpdateUserForm(user),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _showDeleteConfirmation(user),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
