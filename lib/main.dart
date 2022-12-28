import 'package:deliveryapp/modules/authentication/forgot_password/forgot_password.dart';
import 'package:deliveryapp/modules/authentication/login/login.dart';
import 'package:deliveryapp/modules/chat/chat.dart';
import 'package:deliveryapp/modules/chat/get_help.dart';
import 'package:deliveryapp/modules/chat/search_page.dart';
import 'package:deliveryapp/modules/introduction_pages/introduction_page.dart';
import 'package:deliveryapp/modules/new_order/new_order.dart';
import 'package:deliveryapp/modules/new_order/widgets/address_selection_page.dart';
import 'package:deliveryapp/modules/new_order/widgets/map_screen.dart';
import 'package:deliveryapp/modules/orders/orders.dart';
import 'package:deliveryapp/modules/profile/profile.dart';
import 'package:deliveryapp/modules/startup_pages/city_selection_page.dart';
import 'package:deliveryapp/modules/startup_pages/country_list.dart';
import 'package:deliveryapp/modules/startup_pages/nationality_selection_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NunitoSans'),
      debugShowCheckedModeBanner: false,
      title: 'Borzo Courier',
      initialRoute: 'nationalitySelectionScreen',
      routes: {
        'orderScreen': (context) => Orders(),
        'newOrderScreen': (context) => NewOrder(),
        'chatScreen': (context) => Chat(),
        'profileScreen': (context) => Profile(),
        'addressSelectionScreen': (context) => AddressSelection(
              locationPassed: '',
            ),
        'mapScreen': (context) => MapScreen(),
        'getHelp': (context) => GetHelp(),
        'searchScreen': (context) => SearchPage(),
        'loginScreen': (context) => LoginPage(),
        'forgotPasswordScreen': (context) => ForgotPassword(),
        'nationalitySelectionScreen': (context) => NationalitySelectionPage(),
        'countryListScreen': (context) => CountryList(),
        'citySelectionScreen': (context) => CitySelectionPage(),
        'introductionScreen': (context) => IntroductionPage(),
      },
      // home: Orders(),
    );
  }
}
