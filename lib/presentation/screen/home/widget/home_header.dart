import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/presentation/screen/home/widget/header_action.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';
import 'package:productify/presentation/theme/notifier/provider.dart';
import 'package:productify/domain/util/routes.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key, required this.t});

  final AppThemeExtension t;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: t.textPrimary,
                    letterSpacing: -0.5,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Find what you love',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: t.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          HeaderAction(
            icon: isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            t: t,
            onTap: () => ref.read(themeNotifierProvider.notifier).toggle(),
          ),
          const SizedBox(width: 10),
          HeaderAction(
            icon: Icons.favorite_border_rounded,
            t: t,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.favorite);
            },
          ),
        ],
      ),
    );
  }
}
