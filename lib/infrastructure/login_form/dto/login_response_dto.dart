import '../../../domain/login_form/entity/login_response_entity.dart';

class LoginResponseDTO {
  final String token;

  LoginResponseDTO({required this.token});

  factory LoginResponseDTO.fromJson(Map<String, dynamic> json) {
    return LoginResponseDTO(token: json['token']);
  }

  LoginResponseEntity toEntity() {
    return LoginResponseEntity(token: token);
  }
}
