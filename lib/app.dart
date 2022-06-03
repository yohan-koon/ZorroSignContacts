import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:zorro_sign_contacts/flavour_config.dart';
import 'package:zorro_sign_contacts/injection_container.dart';
import 'package:zorro_sign_contacts/routes/router.gr.dart';
import 'package:zorro_sign_contacts/store/environment_store/environmental_store.dart';
import 'package:zorro_sign_contacts/store/language_store/language_store.dart';
import 'package:zorro_sign_contacts/store/theme_store/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatefulWidget {
  //final FlutterI18nDelegate flutterI18nDelegate;
  final FlavourConfig? envConfig;

  const App({
    Key? key,
    required this.envConfig,
    //required this.flutterI18nDelegate
  }) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = di();
  final EnvironmentalStore environmentalStore = di();
  final ThemeStore ts = di();
  final LanguageStore languageStore = di();

  @override
  void initState() {
    super.initState();
    environmentalStore.setFlavourConfig(widget.envConfig);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => ts),
      ],
      child: _buildWithTheme(context, ts),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeStore ts) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return Observer(
          builder: (_) => MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Zorro Sign Contacts',
                theme: ts.tc.theme(languageStore.defaultLanguage),
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],

                supportedLocales: const [
                  Locale('en', ''), // English, no country code
                  Locale('es', ''), // Spanish, no country code
                ],

                // use English as the default locale
                localeResolutionCallback:
                    (Locale? locale, Iterable<Locale> supportedLocales) {
                  return locale;
                },
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),
              ));
    });
  }
}
