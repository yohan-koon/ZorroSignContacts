import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/core/domain/repositories/injection_container.dart'
    as repository_di;
import 'package:zorro_sign_contacts/core/domain/common_usecases/injection_container.dart'
    as usecases_di;

Future<void>? setup(GetIt di) async {
  repository_di.setup(di);
  usecases_di.setup(di);
}
