class Contact {
  late String name;
  late String phone;
  late String email;
  late int id;
/*
  Contact({
    required this.name,
    required this.phone,
    required this.email,
    this.id = 1,
  });
*/
  Contact(String name, String phone, String email, int id) {
    this.name = name;
    this.phone = phone;
    this.email = email;
    this.id = id;
  }

  String getName() {
    return name;
  }

  void setName(name) {
    this.name = name;
  }

  String getPhone() {
    return phone;
  }

  void setPhone(phone) {
    this.phone = phone;
  }

  String getEmail() {
    return this.email;
  }

  void setEmail(email) {
    this.email = email;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'Contact {id: $id, name: $name, phone: $phone, email: $email}';
  }
}
