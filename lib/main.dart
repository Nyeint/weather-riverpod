import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/service_locator.dart';
import 'package:weather/view/weather_forecast.dart';
import 'package:weather/view/weather_screen.dart';

void main() {
  setupLocator();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WeatherScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'forecast',
          builder: (BuildContext context, GoRouterState state) {
            return const WeatherForecast();
          },
        ),
      ],
    ),
  ],
);
