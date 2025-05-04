class UserListDTO {
  final List<UserDTO> users;
  final int page;
  final int total;

  UserListDTO({
    required this.users,
    required this.page,
    required this.total,
  });

  factory UserListDTO.fromJson(Map<String, dynamic> json) {
    return UserListDTO(
      users:
          (json['data'] as List).map((user) => UserDTO.fromJson(user)).toList(),
      page: json['page'],
      total: json['total'],
    );
  }
}

class UserDTO {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserDTO({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class CreateUserDTO {
  final String name;
  final String email;
  final String job;

  CreateUserDTO({
    required this.name,
    required this.email,
    required this.job,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': '',
      'job': job,
    };
  }
}

class UpdateUserDTO {
  final String name;
  final String email;
  final String job;

  UpdateUserDTO({
    required this.name,
    required this.email,
    required this.job,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': '',
      'job': job,
    };
  }
}

class UserResponseDTO {
  final String id;
  final String name;
  final String email;
  final String job;
  final DateTime createdAt;
  final DateTime? updatedAt;

  UserResponseDTO({
    required this.id,
    required this.name,
    required this.email,
    required this.job,
    required this.createdAt,
    this.updatedAt,
  });

  factory UserResponseDTO.fromJson(Map<String, dynamic> json) {
    return UserResponseDTO(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      job: json['job'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}
