import 'contact.dart';
import 'view.dart';

/// Represents a model. Holds the data for the Spartan Contacts app.
/// @author Viola Yasuda
/// @version 11/16/2021
class Model {
  List<Contact> fullContactsList = <Contact>[];
  String organizationStyle = "last name";
  List<View> views;
  List<Contact> displayedContactsList = <Contact>[];

  /// Constructs a Model object.
  Model(this.fullContactsList, this.organizationStyle,
      this.displayedContactsList, this.views);

  /// Gets the full contacts list.
  List<Contact> getFullContactsList() {
    return fullContactsList;
  }

  /// Updates the full contacts list.
  void setFullContactsList(List<Contact> fullContactsList) {
    this.fullContactsList = fullContactsList;
    //update displayedContactsList
  }

  /// Adds a contact to the full contacts list.
  void addContact(Contact contact) {
    fullContactsList.add(contact);
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
}
