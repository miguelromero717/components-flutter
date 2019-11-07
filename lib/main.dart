import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:components/src/routes/routes.dart';
import 'package:components/src/pages/alert_page.dart';
 
void main() => runApp(ComponentsApp());
 
class ComponentsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components APP',
      initialRoute: '/',
      routes: getAppRoutes(),
      onGenerateRoute: ( RouteSettings settings) {
        print('RouteSettings ${settings.name}');

        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es', 'ES'),
      ],
    );
  }
}