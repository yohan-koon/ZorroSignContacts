import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/core/components/injection_container.dart'
    as components_di;
import 'package:zorro_sign_contacts/core/domain/injection_container.dart'
    as domain_di;

import 'package:zorro_sign_contacts/core/data/injection_container.dart'
    as data_di;

Future<void>? setup(GetIt di) async {
  components_di.setup(di);
  domain_di.setup(di);
  data_di.setup(di);
}
