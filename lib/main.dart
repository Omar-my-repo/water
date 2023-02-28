import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:water/providers/main_providers/language_provider.dart';
import 'package:water/providers/main_providers/theme_provider.dart';
import 'package:water/screens/check_out/check_out_screen.dart';
import 'package:water/screens/check_out_address/check_out_address.dart';
import 'package:water/screens/layout/home_layout.dart';
import 'package:water/screens/login/login_screen.dart';
import 'package:water/screens/orders/sucess_order.dart';
import 'package:water/screens/product_details/product_details.dart';
import 'package:water/screens/profile/settings_sections/messages/messages_screen.dart';
import 'package:water/screens/register/register_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Water',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      theme: themeProvider.mode,
      routes: {
        HomeLayout.routeName: (_) => HomeLayout(),
        ProductDetails.routeName: (_) => ProductDetails(),
        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        CheckOutScreen.routeName: (_) => CheckOutScreen(),
        CheckOutAddress.routeName: (_) => CheckOutAddress(),
        SuccessOrder.routeName: (_) => SuccessOrder(),
        MessagesScreen.routeName: (_) => MessagesScreen(),
      },
      locale: Locale(languageProvider.language),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
