import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/core/data/datasources/local/injection_container.dart'
    as local_di;
import 'package:zorro_sign_contacts/core/data/datasources/remote/injection_container.dart'
    as remote_di;

Future<void>? setup(GetIt di) async {
  local_di.setup(di);
  remote_di.setup(di);
}
