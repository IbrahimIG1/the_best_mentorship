import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/services/di.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/cubit/order_cubit.dart';
import 'package:omar_ahmed_mentor_ship/ahwa_app/ui/ahwa_manager_app.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/di/di.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/helper/extension.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/local/secure_storage_helper.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/core/local/shared_prefrence.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/gender_choose_screen/gender_choose_screen.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/home_screen/ui/home_screen.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/login_screen/ui/login_screen.dart';

//* Ahwa App
// void main() {
//   setupLocator();
//   runApp(
//     BlocProvider(
//       create: (_) => getIt<OrderCubit>(),
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: AhwaManagerApp(),
//       ),
//     ),
//   );
// }

//* Ecommerce App
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setAllDependencies();
 token = await AppSecureStorageHelper.getToken(SharedPrefKeys.token);
  runApp(MyApp());
}
String token="";
final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        title: 'Laza App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home:token.isNullOrEmpty() ? const ChooseGenderScreen() : const HomeScreen(),
      ),
    );
  }
}
