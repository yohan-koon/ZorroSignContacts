import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/core/data/datasources/injection_container.dart'
    as datasource_di;

Future<void>? setup(GetIt di) async {
  datasource_di.setup(di);
}
