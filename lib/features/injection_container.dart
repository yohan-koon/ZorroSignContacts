import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/features/landing/injection_container.dart'
    as landing_di;
import 'package:zorro_sign_contacts/features/contact_list/injection_container.dart'
    as contact_list_di;
import 'package:zorro_sign_contacts/features/group_list/injection_container.dart'
    as group_list_di;
import 'package:zorro_sign_contacts/features/contact_form/injection_container.dart'
    as contacts_form_di;
import 'package:zorro_sign_contacts/features/group_form/injection_container.dart'
    as group_form_di;
import 'package:zorro_sign_contacts/features/add_participants/injection_container.dart'
    as add_participants_di;

Future<void>? setup(GetIt di) async {
  landing_di.setup(di);
  contact_list_di.setup(di);
  group_list_di.setup(di);
  contacts_form_di.setup(di);
  group_form_di.setup(di);
  add_participants_di.setup(di);
}
