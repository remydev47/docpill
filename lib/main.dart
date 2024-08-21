import 'package:docpill/commons/utils/app_routes.dart';
import 'package:docpill/commons/utils/environment.dart';
import 'package:docpill/commons/utils/kstrings.dart';
import 'package:docpill/src/onboarding/views/controllers/onboarding_notifier.dart';
import 'package:docpill/src/pages/cart/services/cart_services.dart';
import 'package:docpill/src/splashscreen/views/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'src/entrypoint/controllers/bottom_tab_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //load the coreect environment
  await dotenv.load(
    fileName: Environment.fileName,
  );

  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingNotifier()),
        ChangeNotifierProvider(create: (_) => TabIndexNotifier()),
        ChangeNotifierProvider(create: (_) => CartService()),
        // ChangeNotifierProvider(create: (_) => UserState()),
        // ChangeNotifierProvider(create: (_) => ThemeState()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppText.kAppName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,
        );
      },
      child: Splashscreen(),
    );
  }
}
