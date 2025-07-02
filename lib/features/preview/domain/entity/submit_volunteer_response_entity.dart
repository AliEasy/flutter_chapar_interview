class SubmitVolunteerResponseEntity {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? birthday;
  List<String>? skills;
  String? createdAt;
  String? updatedAt;

  SubmitVolunteerResponseEntity({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.birthday,
    this.skills,
    this.createdAt,
    this.updatedAt,
  });
}
