class UpdateUserDTO {
  final String name;
  final String job;

  UpdateUserDTO({
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
