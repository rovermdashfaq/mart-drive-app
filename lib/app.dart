import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'all_files_screen.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AllFilesScreen(),
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
