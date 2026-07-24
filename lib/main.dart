import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/route/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      
      builder: (_ , child){ return
       MaterialApp.router( routerConfig: AppRouter.router,debugShowCheckedModeBanner: false,)
       
      ;},
);
  }
}
