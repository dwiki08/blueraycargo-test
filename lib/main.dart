import 'package:blueraycargo/provider/address_provider.dart';
import 'package:blueraycargo/provider/auth_provider.dart';
import 'package:blueraycargo/provider/file_picker_provider.dart';
import 'package:blueraycargo/provider/page_provider.dart';
import 'package:blueraycargo/provider/sub_district_provider.dart';
import 'package:blueraycargo/provider/update_address_provider.dart';
import 'package:blueraycargo/screen/address/form_address_screen.dart';
import 'package:blueraycargo/screen/dashboard/dahsboard_screen.dart';
import 'package:blueraycargo/screen/login/login_screen.dart';
import 'package:blueraycargo/screen/map/location_picker.dart';
import 'package:blueraycargo/screen/register/register_password_screen.dart';
import 'package:blueraycargo/screen/register/register_profile_screen.dart';
import 'package:blueraycargo/screen/register/register_screen.dart';
import 'package:blueraycargo/screen/register/register_verification_screen.dart';
import 'package:blueraycargo/utils/injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/constants.dart';
import 'common/theme.dart';
import 'data/local/local_data_source.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjection();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_) => UpdateAddressProvider()),
        ChangeNotifierProvider(create: (_) => FilePickerProvider()),
        ChangeNotifierProvider(create: (_) => PageManagerProvider()),
        ChangeNotifierProvider(create: (_) => SubDistrictProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  Future<void> checkAuth() async {
    LocalDataSource localDataSource = LocalDataSource();
    isLoggedIn = (await localDataSource.getAuthToken())?.isNotEmpty == true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        colorScheme: colorScheme(context),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: primaryBlue.withValues(alpha: 0.7),
          titleTextStyle: textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontSize: 20,
          ),
          actionsIconTheme: const IconThemeData(color: Colors.white),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) {
          if (isLoggedIn) {
            return DashboardScreen();
          } else {
            return LoginScreen();
          }
        },
        LoginScreen.routeName: (_) => LoginScreen(),
        DashboardScreen.routeName: (_) => DashboardScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        RegisterVerificationScreen.routeName:
            (_) => RegisterVerificationScreen(),
        RegisterPasswordScreen.routeName: (_) => RegisterPasswordScreen(),
        RegisterProfileScreen.routeName: (_) => RegisterProfileScreen(),
        FormAddressScreen.routeName: (_) => FormAddressScreen(),
        LocationPickerScreen.routeName: (_) => LocationPickerScreen(),
      },
    );
  }
}
