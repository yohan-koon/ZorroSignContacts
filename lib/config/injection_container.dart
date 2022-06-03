import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/config/data/injection_container.dart'
    as data_di;
import 'package:zorro_sign_contacts/config/constants/injection_container.dart'
    as constant_di;

Future<void>? setup(GetIt di) async {
  data_di.setup(di);
  constant_di.setup(di);
}
