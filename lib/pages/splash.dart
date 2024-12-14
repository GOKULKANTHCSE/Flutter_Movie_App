import 'dart:convert';

// packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

// pages
import 'package:movie_app/Model/app_config.dart';

// services
import 'package:movie_app/services/http_services.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback OnInitializationComplete;

  const SplashPage({super.key, required this.OnInitializationComplete});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2)).then(
      (_) => _setup(context).then(
        (_) => widget.OnInitializationComplete(),
      ),
    );
  }

  Future<void> _setup(BuildContext _context) async {
    final getit = GetIt.instance;

    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);

    getit.registerSingleton<AppConfig>(
      AppConfig(
          BASE_API_URL: configData['BASE_API_URL'],
          BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL'],
          API_KEY: configData['API_KEY']),
    );

    getit.registerSingleton<HTTPServices>(
      HTTPServices(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.contain)),
        ),
      ),
    );
  }
}
