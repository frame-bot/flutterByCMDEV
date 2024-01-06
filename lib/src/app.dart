import 'package:cmflutter0/src/pages/home/home_page.dart';
import 'package:cmflutter0/src/pages/routes.dart';
import 'package:flutter/material.dart';

import 'pages/login/login_page.dart';

class CMApp extends StatelessWidget {
  const CMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CMApp",
      routes: AppRoute.all,
      home: LoginPage(),
    );
  }
}
