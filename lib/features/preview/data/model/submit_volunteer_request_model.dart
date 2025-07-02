class SubmitVolunteerRequestModel {
  String? fullName;
  String? email;
  String? phone;
  String? birthday;
  List<String>? skills;

  SubmitVolunteerRequestModel({
    this.fullName,
    this.email,
    this.phone,
    this.birthday,
    this.skills,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = fullName;
    map['email'] = email;
    map['phone'] = phone;
    map['birthday'] = birthday;
    map['skills'] = skills;
    return map;
  }
}
