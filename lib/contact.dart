class Contact {
  late String name;
  late String occupation;
  late String phone;
  late String email;
  late String address;
  late String website;
  late int id;

  Contact(this.name, this.occupation, this.phone, this.email, this.address,
      this.website, this.id);

  String getName() {
    return name;
  }

  void setName(name) {
    this.name = name;
  }

  String getOccupation() {
    return occupation;
  }

  void setOccupation(occupation) {
    this.occupation = occupation;
  }

  String getPhone() {
    return phone;
  }

  void setPhone(phone) {
    this.phone = phone;
  }

  String getEmail() {
    return email;
  }

  void setEmail(email) {
    this.email = email;
  }

  String getAddress() {
    return address;
  }

  void setAddress(address) {
    this.address = address;
  }

  String getWebsite() {
    return website;
  }

  void setWebsite(website) {
    this.website = website;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'occupation': occupation,
      'phone': phone,
      'email': email,
      'address': address,
      'website': website,
    };
  }

  @override
  String toString() {
    return 'Contact {id: $id, name: $name, occupation: $occupation, phone: $phone, email: $email, address: $address, website: $website}';
  }
}
