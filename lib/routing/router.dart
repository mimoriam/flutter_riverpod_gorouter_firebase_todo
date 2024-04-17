import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_gorouter_firebase_todo/features/auth/screens/sign_in_screen.dart';
import 'package:flutter_riverpod_gorouter_firebase_todo/features/home/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  signIn,
  createAccount,
  home,
  addTodo,

  editTodo
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: false,
      redirect: (context, state) async {
        final user = true;
        final isLoggedIn = user != null;
        final path = state.uri.path;
        if (isLoggedIn) {
          // * Shouldn't be able to visit signIn when logged in:
          if (path == '/signIn') {
            return '/';
          }
          final isAdmin = false;
          // * Prevent non-admin users to navigate to any of the admin pages
          if (!isAdmin && path.startsWith('/admin')) {
            return '/';
          }
        } else {
          // * Shouldn't be able to visit routes that require logging in:
          if (path == '/addTodo' || path == '/editTodo') {
            return '/';
          }
          //* Prevent non signed-in users to navigate to any of the admin pages
          if (path.startsWith('/admin')) {
            return '/';
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          path: '/',
          name: Routes.home.name,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/signIn',
          name: Routes.signIn.name,
          builder: (context, state) => const SignInScreen(),
        )
      ],
      errorBuilder: (context, state) => const Text("Not Found"));
});
