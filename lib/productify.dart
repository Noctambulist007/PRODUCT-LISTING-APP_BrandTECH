import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productify/presentation/theme/app_theme.dart';
import 'package:productify/presentation/util/routes.dart';
import 'package:zentoast/zentoast.dart';

class Productify extends StatelessWidget {
  const Productify({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastProvider.create(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (_, __) => GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp(
            title: 'Productify',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splash,
            onGenerateRoute: Routes.generateRoutes,

            builder: (context, child) {
              return ToastThemeProvider(
                data: const ToastTheme(
                  gap: 12,
                  viewerPadding: EdgeInsets.all(16),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: child ?? const SizedBox(),
                    ),

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