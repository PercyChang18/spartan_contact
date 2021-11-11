class Contact {
  String name;
  String phone;
  String email;

  Contact({
    required this.name,
    required this.phone,
    required this.email,
  });

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
}
