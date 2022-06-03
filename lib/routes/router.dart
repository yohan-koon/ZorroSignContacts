import 'package:auto_route/auto_route.dart';
import 'package:zorro_sign_contacts/features/contacts/presentation/contacts_page.dart';

//  flutter packages pub run build_runner watch
//  flutter packages pub run build_runner build
// flutter packages pub run build_runner build --delete-conflicting-outputs
@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(
    page: ContactsPage,
    initial: true,
  ),
])
class $AppRouter {}
