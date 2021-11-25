import 'contact.dart';
import 'view.dart';
import 'contacts_database.dart';
import 'dart:async';

/// Represents a model. Holds the data for the Spartan Contacts app.
/// @author Viola Yasuda
/// @version 11/16/2021
class Model {
  late List<Contact> fullContactsList = converter();
  String organizationStyle;
  late List<View> views;
  late List<Contact> displayedContactsList;

  /// Constructs a Model object.
  Model(this.organizationStyle) {
    views = <View>[];
    displayedContactsList = fullContactsList;
  }

  /// Gets the full contacts list.
  List<Contact> getFullContactsList() {
    return fullContactsList;
  }

  /// Updates the full contacts list.
  void setFullContactsList() {
    fullContactsList = converter();
    //update displayedContactsList
  }

  /// Helper method for setFullContactsList().
  /// Converts async contacts list from getContacts() to a standard List<Contact>.
  List<Contact> converter() {
    Future<List<Contact>> contacts = getContacts();
    List<Contact> toAdd = [];
    contacts.asStream().forEach((element) {
      for (var element in element) {
        toAdd.add(element);
      }
    });
    return toAdd;
  }

  /// Adds a contact to the full contacts list.
  void addContact(Contact contact) {
    insertContact(contact);
    fullContactsList.add(contact);
    displayedContactsList = fullContactsList;
    notifyView();
  }

  /// Removes a contact from the full contacts list.
  void removeContact(Contact contact) {
    fullContactsList.remove(contact);
  }

  /// Gets the organization style.
  String getOrganizationStyle() {
    return organizationStyle;
  }

  /// Updates the organization style.
  void setOrganizationStyle(String organizationStyle) {
    this.organizationStyle = organizationStyle;
  }

  /// Gets the views.
  List<View> getViews() {
    return views;
  }

  /// Updates the views.
  void setViews(List<View> views) {
    this.views = views;
  }

  /// Adds a view to the list of views.
  void registerView(View view) {
    views.add(view);
  }

  /// Removes a view from the list of views.
  void removeView(View view) {
    views.remove(view);
  }

  /// Notifies the views of a change in the model by calling their update method.
  void notifyView() {
    for (View view in views) {
      view.update();
    }
  }

  /// Gets the list of contacts to display.
  List<Contact> getDisplayedContactsList() {
    return displayedContactsList;
  }

  /// Updates the list of contacts to display.
  void setDisplayedContactsList(List<Contact> displayedContactsList) {
    this.displayedContactsList = displayedContactsList;
  }

  /// Updates displayedContactsList so it contains results for a name search.
  void searchByName() {}

  /// Generates a new ID by taking the most recent ID and incrementing by 1.
  int genID() {
    List<Contact> list = fullContactsList;
    int maxID = -1;
    for (Contact c in fullContactsList) {
      if (c.getID() > maxID) {
        maxID = c.getID();
      }
    }
    if (maxID < 0) {
      return 0;
    }
    return maxID + 1;
  }
}
