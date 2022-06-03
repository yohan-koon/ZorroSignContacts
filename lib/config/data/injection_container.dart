import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/config/data/local/injection_container.dart'
    as local_di;

Future<void>? setup(GetIt di) async {
  local_di.setup(di);
}
