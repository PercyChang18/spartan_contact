/// Not implemented in final draft.
/// @author Vikranthreddy Jakamukala
/// @version 12/12/2021
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  SharedPreferencesPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
