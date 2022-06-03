import 'package:zorro_sign_contacts/config/network/endpoints.dart';
import 'package:zorro_sign_contacts/flavour_config.dart';
import 'package:zorro_sign_contacts/main_common.dart';

void main() {
  final qaConfig = FlavourConfig()
    ..appTitle = 'ZORRO CONTACTS QA'
    ..serverEndPoints = {
      ServerEndPoints.baseUrl:
          '',
      ServerEndPoints.apiGateway:
          '',
    }
    ..endPoints = EndPoints()
    ..publicRequestHeader = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

  mainCommon(qaConfig);
}
