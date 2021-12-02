import 'contact.dart';

class Sorting {
  void sortByName(List<Contact> contactList) {
    contactList.sort((a, b) =>
        a.getFullName().toString().compareTo(b.getFullName().toString()));
  }

  void sortByEmail(List<Contact> contactList) {
    contactList.sort((a, b) => a.getEmail().compareTo(b.getEmail()));
  }

  void sortByOccupation(List<Contact> contactList) {
    contactList.sort((a, b) => a.getOccupation().compareTo(b.getOccupation()));
  }

  void sortByAddress(List<Contact> contactList) {
    contactList.sort((a, b) => a.getAddress().compareTo(b.getAddress()));
  }

  void sortByWebsite(List<Contact> contactList) {
    contactList.sort((a, b) => a.getWebsite().compareTo(b.getWebsite()));
  }
}
