import 'package:flutter/material.dart';
import 'package:lookam/customer/home/accueille.dart';
import 'package:lookam/customer/home/sub_home/farm_product/vegetable.dart';
import 'package:lookam/customer/home/sub_home/accueille_sub/topProduc.dart';
import 'package:lookam/customer/select_product.dart';
import 'package:lookam/customer/selection/cloths.dart';
import 'package:lookam/customer/selection/vegaSelect.dart';
import 'package:lookam/ubknwonScreen.dart';
import 'package:lookam/vendor/auth/login.dart';

import 'package:lookam/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lookam/vendor/home/sub_home/add_product.dart';
import 'package:lookam/vendor/home/sub_home/modifier_delete.dart';
import 'package:lookam/vendor/home/sub_home/sub_modefierDeleter/search.dart';

import 'customer/selection/fruit_select.dart';
import 'customer/selection/tuber_selec.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      routes: {
    '/select_product': (context) => const SelectProduct(),
    '/select_vega': (context) => const VegaSelect(),
    '/select_clothes': (context) => const ClothsSelect(),
    '/select_tuber': (context) => const TuberSelect(),
    '/select_fruit': (context) => const FruitSelect(),
  },
  
  onGenerateRoute: (settings) {
    if (settings.name == '/select_product') {
      return MaterialPageRoute(
        builder: (context) => const SelectProduct(),
      );
    }
    // If the route is not "/select_product", return null so that Flutter
    // knows to use the onUnknownRoute callback.
    return null;
  },
  // Define an onUnknownRoute callback to handle routes that are not defined
  // in the app.
  onUnknownRoute: (settings) {
    return MaterialPageRoute(
      builder: (context) => UnknownScreen(),
    );
  },
      home: const Accueille(),
    );
  }
}