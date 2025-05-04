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
