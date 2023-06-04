// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lets_do_laces_together/Screens/Customer%20Panel/Custommer%20Nav%20Bar/custom_nav_bar.dart';
import 'package:lets_do_laces_together/Screens/Customer%20Panel/customer_login_new.dart';
import 'package:lets_do_laces_together/Screens/brand_panel/add_brand.dart';
import 'package:lets_do_laces_together/Screens/brand_panel/brands.dart';
import 'Screens/Admin Panel/admin_login_screen.dart';
import 'Screens/Customer Panel/customer_signup.dart';
import 'Screens/Customer Panel/tailor_list.dart/measurement_form.dart';
import 'Screens/Tailor Panel/Model/controller/controller.dart';
import 'Screens/Tailor Panel/notification.dart';
import 'Screens/Tailor Panel/orderLists/order_notification.dart';
// import 'Views/Admin Panel/admin_login_screen.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(LadiesCardController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Lets do Laces Together',

          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: 
      // AddBrandPage()
      // BrandScreen()
      const SplashScreen(),
    );
  }
}
