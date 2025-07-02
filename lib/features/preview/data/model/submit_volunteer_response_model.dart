class SubmitVolunteerResponseModel {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? birthday;
  List<String>? skills;
  String? createdAt;
  String? updatedAt;

  SubmitVolunteerResponseModel({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.birthday,
    this.skills,
    this.createdAt,
    this.updatedAt,
  });

  factory SubmitVolunteerResponseModel.fromJson(Map<String, dynamic> json) {
    return SubmitVolunteerResponseModel(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      phone: json['phone'],
      birthday: json['birthday'],
      skills: json['skills'] != null ? (json['skills'] as List)
          .map((e) => e.toString())
          .toList() : null,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
