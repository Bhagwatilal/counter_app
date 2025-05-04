import 'package:dio/dio.dart';
import '../login_form/dto/login_response_dto.dart';
import '../login_form/dto/user_list_dto.dart' as list_dto;
import '../login_form/dto/create_user_dto.dart' as create_dto;
import '../login_form/dto/update_user_dto.dart' as update_dto;
import '../login_form/dto/user_response_dto.dart' as response_dto;

class LoginApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api', // Changed base URL
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'reqres-free-v1',
      },
    ),
  );

  Future<LoginResponseDTO> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return LoginResponseDTO.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? 'Login failed');
    }
  }

  Future<list_dto.UserListDTO> getUsers({int page = 1}) async {
    try {
      final response = await _dio.get(
        '/users',
        queryParameters: {'page': page},
      );

      return list_dto.UserListDTO.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? 'Failed to fetch users');
    }
  }

  Future<response_dto.UserResponseDTO> createUser(
      create_dto.CreateUserDTO user) async {
    try {
      final response = await _dio.post(
        '/users',
        data: user.toJson(),
      );
      return response_dto.UserResponseDTO.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? 'Failed to create user');
    }
  }

  Future<response_dto.UserResponseDTO> updateUser(
      int userId, update_dto.UpdateUserDTO user) async {
    try {
      final response = await _dio.put(
        '/users/$userId',
        data: user.toJson(),
      );
      return response_dto.UserResponseDTO.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? 'Failed to update user');
    }
  }

  Future<void> deleteUser(int userId) async {
    try {
      await _dio.delete('/users/$userId');
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? 'Failed to delete user');
    }
  }
}
