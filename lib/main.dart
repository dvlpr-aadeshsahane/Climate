import 'package:clima/consts/typo.dart';
import 'package:clima/services/location_service.dart';
import 'package:clima/views/home_screen.dart';
import 'package:clima/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';

final navigatorKey = GlobalKey<NavigatorState>();
get appContext => navigatorKey.currentState!.context;
final logger = Logger();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Clima());
}

class Clima extends StatelessWidget {
  Clima({super.key});

  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: SplashScreen.id,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        name: HomeScreen.id,
        builder: (context, state) => const HomeScreen(),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: Typo.regular,
            bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.transparent)),
        routerConfig: router,
      ),
    );
  }
}
