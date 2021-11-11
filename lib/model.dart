import 'contact.dart';

class Model {
  List<Contact> fullContactsList = <Contact>[];
  String organizationStyle = "last name";
  //List<View> views;
  List<Contact> displayedContactsList = <Contact>[];

  Model(this.fullContactsList, this.organizationStyle,
      this.displayedContactsList);

  List<Contact> getFullContactsList() {
    return fullContactsList;
  }

  void setFullContactsList(List<Contact> fullContactsList) {
    this.fullContactsList = fullContactsList;
    //update displayedContactsList
  }

  void addContact(Contact contact) {
    fullContactsList.add(contact);
  }

  void removeContact(Contact contact) {
    fullContactsList.remove(contact);
  }

  String getOrganizationStyle() {
    return organizationStyle;
  }

  void setOrganizationStyle(String organizationStyle) {
    this.organizationStyle = organizationStyle;
  }

/*
  List<View> getViews() {
    return views;
  }

  public void setViews(ArrayList<View> views) {
    this.views = views;
  }

  public void registerView(View view) {
    views.add(view);
  }

  public void removeView(View view) {
    views.remove(view);
  }

  public void notifyView(){
    for (View view: views) {
      view.update();
    }
  }
*/
  List<Contact> getDisplayedContactsList() {
    return displayedContactsList;
  }

  void setDisplayedContactsList(List<Contact> displayedContactsList) {
    this.displayedContactsList = displayedContactsList;
  }

  void searchByName() {}
}
