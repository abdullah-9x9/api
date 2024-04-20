class StudentModal {
  int? id;
  String? name;
  String? email;
  String? phone;
  Null? age;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  StudentModal(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.age,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  StudentModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    age = json['age'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['age'] = this.age;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
