import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text('MART Drive App is Working!', style: TextStyle(fontSize: 20)),
        ),
      ),
    ),
  ],
);

class MartDriveApp extends StatelessWidget {
  const MartDriveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MART Drive',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF163A5F)),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
