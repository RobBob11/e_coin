import 'package:e_coin/pages/navigation.dart';
import 'package:e_coin/services/chart_data.dart';
import 'package:e_coin/theme/theme_provider.dart';
import 'package:e_coin/widgets/pre_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeNotifier()),
          ChangeNotifierProvider(create: (_) => ChartService()),
        ],
        child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier themeNotifier, child) {
            return (themeNotifier.isLoading!)
                ? const LoadingTheme()
                : MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: "E-coin",
                    theme: themeNotifier.darkTheme! ? dark : light,
                    home: Navigation(),
                  );
          },
        ));
  }
}
