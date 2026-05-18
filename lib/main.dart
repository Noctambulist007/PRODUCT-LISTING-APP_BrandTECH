import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productify/injection_container.dart' as di;
import 'package:productify/productify.dart';
import 'package:zentoast/zentoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.setup();
  await ScreenUtil.ensureScreenSize();

  runApp(ProviderScope(child: ToastProvider.create(child: const Productify())));
}
