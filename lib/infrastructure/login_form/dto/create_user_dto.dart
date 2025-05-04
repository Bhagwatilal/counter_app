class CreateUserDTO {
  final String name;
  final String job;

  CreateUserDTO({
    required this.name,
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
