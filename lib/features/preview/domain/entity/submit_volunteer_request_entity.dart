class SubmitVolunteerRequestEntity {
  String? fullName;
  String? email;
  String? phone;
  String? birthday;
  List<String>? skills;

  SubmitVolunteerRequestEntity({
    this.fullName,
    this.email,
    this.phone,
    this.birthday,
    this.skills,
  });
}
