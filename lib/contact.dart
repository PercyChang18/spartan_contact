/// Represents a contact.
/// @author Viola Yasuda
/// @version 11/16/2021
class Contact {
  String fullName;
  String firstName;
  String lastName;
  String occupation;
  String phone;
  String email;
  String address;
  String website;
  //String notes;
  int id;

  /// Constructs a Contact.
  Contact(
      this.fullName,
      this.firstName,
      this.lastName,
      this.occupation,
      this.phone,
      this.email,
      this.address,
      this.website,
      /*this.notes,*/ this.id);

  /// Gets the contact's full name.
  String getFullName() {
    return fullName;
  }

  /// Gets the contact's first name.
  String getFirstName() {
    return firstName;
  }

  /// Gets the contact's last name.
  String getLastName() {
    return lastName;
  }

  /// Updates the contact's name.
  void setName(String name) {
    fullName = name;
    List<String> full = name.split(" ");
    firstName = full[0];
    lastName = full[full.length - 1];
  }

  /// Gets the contact's occupation.
  String getOccupation() {
    return occupation;
  }

  /// Updates the contact's occupation.
  void setOccupation(String occupation) {
    this.occupation = occupation;
  }

  /// Gets the contact's phone number.
  String getPhone() {
    return phone;
  }

  /// Updates the contact's phone number.
  void setPhone(String phone) {
    this.phone = phone;
  }

  /// Gets the contact's email address.
  String getEmail() {
    return email;
  }

  /// Updates the contact's email address.
  void setEmail(String email) {
    this.email = email;
  }

  /// Gets the contact's home address
  String getAddress() {
    return address;
  }

  /// Updates the contact's home address.
  void setAddress(String address) {
    this.address = address;
  }

  /// Gets the contact's website.
  String getWebsite() {
    return website;
  }

  // /// Updates the contact's notes.
  // void setNotes(String notes) {
  //   this.notes = notes;
  // }
  //
  // /// Gets the contact's notes.
  // String getNotes() {
  //   return notes;
  // }

  /// Gets the contact's ID.
  int getID() {
    return id;
  }

  /// Updates the contact's website.
  void setWebsite(String website) {
    this.website = website;
  }

  /// Creates a map containing the contact's information.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'firstName': firstName,
      'lastName': lastName,
      'occupation': occupation,
      'phone': phone,
      'email': email,
      'address': address,
      'website': website,
      //'notes': notes
    };
  }

  /// Returns the contact's information in the form of a String.
  @override
  String toString() {
    return 'Contact {id: $id, name: $fullName, occupation: $occupation, phone: $phone, email: $email, address: $address, website: $website}';
  }
}
