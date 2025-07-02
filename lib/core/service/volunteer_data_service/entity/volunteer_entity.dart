class VolunteerEntity {
  String? fullName;
  String? email;
  String? phone;
  String? birthday;
  List<String>? skills;

  VolunteerEntity({
    this.fullName,
    this.email,
    this.phone,
    this.birthday,
    this.skills,
  });

  VolunteerEntity copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? birthday,
    List<String>? skills,
  }) {
    return VolunteerEntity(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birthday: birthday ?? this.birthday,
      skills: skills ?? this.skills,
    );
  }
}
