import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_car_concept/provider/favorites_provider.dart';
import 'package:rent_car_concept/provider/location_provider.dart';
import 'package:rent_car_concept/router/app_router.dart' as router;
import 'package:rent_car_concept/services/sqflite_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SqfliteService().database;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final router.AppRouter _router;

  @override
  void initState() {
    _router = router.AppRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: _router.defaultRouteParser(),
        routerDelegate: _router.delegate(
          navigatorObservers: () => [],
        ),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        //home: const OnboardingPage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  void createUser() {
    final user = {
      'firstName': 'John Doe',
      'lastName': 'Doe',
    };
    firebase.collection('users').add(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
                onPressed: () => createUser(), child: const Text('')),
          ],
        ),
      ),
    );
  }
}
