import 'package:flutter/material.dart';
import 'package:movie/core/resources/app_strings.dart';
import 'package:movie/core/theme/light_theme.dart';
import 'package:movie/features/search/presentation/views/search_view.dart';

import 'core/network/dio_helper.dart';
import 'core/services/servies_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initilization();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: LightTheme.lightTheme,
      home: const SearchView(),
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
    );
  }
}

Future<void> initilization() async {
  await DioHelper.init();
  ServiceLocator().init();
}
