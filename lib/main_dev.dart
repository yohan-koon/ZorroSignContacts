import 'package:zorro_sign_contacts/config/network/endpoints.dart';
import 'package:zorro_sign_contacts/flavour_config.dart';
import 'package:zorro_sign_contacts/main_common.dart';

void main() {
  final devConfig = FlavourConfig()
    ..appTitle = 'ZORRO CONTACTS DEV'
    ..serverEndPoints = {
      ServerEndPoints.baseUrl:
          'https://happyexam.net:8081',
      ServerEndPoints.apiGateway:
          'https://happyexam.net:8081/api'
    }
    ..endPoints = EndPoints()
    ..publicRequestHeader = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }
    ..formSubmissionRequestHeader = {
      'Accept': 'application/json',
      'Content-Type': 'application/json-patch+json'
    };

  mainCommon(devConfig);
}
