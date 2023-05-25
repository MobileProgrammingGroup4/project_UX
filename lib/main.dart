import 'package:flutter/material.dart';
import 'package:lookam/customer/home/accueille.dart';
import 'package:lookam/customer/home/sub_home/farm_product/vegetable.dart';
import 'package:lookam/customer/home/sub_home/accueille_sub/topProduc.dart';
import 'package:lookam/vendor/auth/login.dart';

import 'package:lookam/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lookam/vendor/home/sub_home/add_product.dart';
import 'package:lookam/vendor/home/sub_home/modifier_delete.dart';

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
      home: const Accueille(),
    );
  }
}