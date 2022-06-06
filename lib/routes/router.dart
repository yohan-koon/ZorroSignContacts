import 'package:auto_route/auto_route.dart';
import 'package:zorro_sign_contacts/features/add_participants/presentation/pages/add_participants_page.dart';
import 'package:zorro_sign_contacts/features/contact_form/presentation/pages/contact_form_page.dart';
import 'package:zorro_sign_contacts/features/group_form/presentation/pages/group_form_page.dart';
import 'package:zorro_sign_contacts/features/landing/presentation/pages/landing_page.dart';

//  flutter packages pub run build_runner watch
//  flutter packages pub run build_runner build
// flutter packages pub run build_runner build --delete-conflicting-outputs
@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(
    page: LandingPage,
    initial: true,
  ),
  AutoRoute(page: GroupFormPage),
  AutoRoute(page: ContactFormPage),
  AutoRoute(page: AddParticipantsPage)
])
class $AppRouter {}
