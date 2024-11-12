import 'package:counter_getx/app_translation.dart';
import 'package:counter_getx/bindings.dart';
import 'package:counter_getx/my_home.dart';
import 'package:counter_getx/search.dart';
import 'package:counter_getx/sec_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      title: 'Flutter Demo',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      translationsKeys: AppTranslation.translationsKeys,
      locale: const Locale('en', 'US'),
      fallbackLocale: Get.deviceLocale,
      getPages: [
        GetPage(
          name: '/',
          page: () => const MyHomePage(title: "Home page"),
        ),
        GetPage(
          name: '/sec',
          page: () => SecPage(),
        ),
        GetPage(
          name: '/search',
          page: () => const SearchPage(),
        ),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
