import 'dart:async';

import 'package:zorro_sign_contacts/app.dart';
import 'package:zorro_sign_contacts/flavour_config.dart';
import 'package:zorro_sign_contacts/injection_container.dart' as app_di;
import 'package:flutter/material.dart';

void mainCommon(FlavourConfig envConfig) async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await app_di.setup();

    runApp(App(envConfig: envConfig));
  }, (error, stack) => print(error));
}
