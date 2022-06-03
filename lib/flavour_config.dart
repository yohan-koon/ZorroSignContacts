import 'package:zorro_sign_contacts/config/network/endpoints.dart';

enum ServerEndPoints { baseUrl, apiGateway }

class FlavourConfig {
  String? appTitle;

  //End points
  Map<ServerEndPoints, String>? serverEndPoints;
  EndPoints? endPoints;

  //Request Headers
  Map<String, String>? publicRequestHeader;

  FlavourConfig();
}
