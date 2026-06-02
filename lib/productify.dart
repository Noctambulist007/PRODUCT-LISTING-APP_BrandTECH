import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productify/presentation/theme/notifier/provider.dart';
import 'package:productify/domain/util/routes.dart';
import 'package:zentoast/zentoast.dart';

import 'presentation/theme/app_theme.dart';

class Productify extends ConsumerWidget {
  const Productify({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);

    return ToastProvider.create(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (_, _) => GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp(
            title: 'Productify',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splash,
            onGenerateRoute: AppRouter.onGenerateRoute,
            builder: (context, child) {
              return ToastThemeProvider(
                data: const ToastTheme(
                  gap: 12,
                  viewerPadding: EdgeInsets.all(16),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(child: child ?? const SizedBox()),
                    SafeArea(
                      child: ToastViewer(
                        alignment: Alignment.topRight,
                        delay: const Duration(seconds: 3),
                        visibleCount: 4,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
