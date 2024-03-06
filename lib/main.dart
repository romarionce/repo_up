import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:repo_up/app/services/api_service.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> initServices() async {
  await Get.putAsync(() => ApiService().init());
}
