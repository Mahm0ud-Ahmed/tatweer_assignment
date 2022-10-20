import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oranos_assessment/src/presentation/controller/data_bloc/api_data_bloc.dart';

import 'src/core/config/injector.dart';
import 'src/core/config/l10n/generated/l10n.dart';
import 'src/core/config/routes/app_route.dart';
import 'src/core/config/themes/theme_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const OranosApp());
}

class OranosApp extends StatelessWidget {
  const OranosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ApiDataBloc>(
            create: (context) => injector(),
          ),
        ],
        child: MaterialApp(
        title: S().app_name,
        debugShowCheckedModeBanner: false,
        theme: ThemeManager().myTheme,
        darkTheme: ThemeManager().myTheme,
        themeMode: ThemeMode.light,
        onGenerateRoute: AppRoute.generateRoute,
        locale: const Locale('en'),
        localizationsDelegates: const [
          S.delegate,
          AppLocalizationDelegate(),
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
