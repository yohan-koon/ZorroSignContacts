import 'package:zorro_sign_contacts/config/network/endpoints.dart';
import 'package:zorro_sign_contacts/flavour_config.dart';
import 'package:zorro_sign_contacts/main_common.dart';

void main() {
  final uatConfig = FlavourConfig()
    ..appTitle = 'ZORRO CONTACTS UAT'
    ..serverEndPoints = {
      ServerEndPoints.baseUrl: '',
      ServerEndPoints.apiGateway: '',
    }
    ..endPoints = EndPoints()
    ..publicRequestHeader = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

  mainCommon(uatConfig);
}
