import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:productify/main.dart' as app;
import 'package:productify/presentation/screen/home/widget/product_card.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Helper function to safely pump frames for a given duration in virtual time.
  // This avoids pumpAndSettle() hanging on infinite animations (like progress indicators or shimmers).
  Future<void> safePump(WidgetTester tester, {int steps = 5, Duration duration = const Duration(milliseconds: 500)}) async {
    for (int i = 0; i < steps; i++) {
      await tester.pump(duration);
    }
  }

  group('end-to-end test', () {
    testWidgets('App launch and navigation flow', (tester) async {
      // 1. Launch the app.
      app.main();
      await tester.pump();
      
      // 2. Wait for Splash Screen (1.2s delay + transitions) to complete
      await safePump(tester, steps: 8, duration: const Duration(milliseconds: 500));

      // 3. Since this might be a fresh install, we might be on the Onboarding screen.
      // If we see "Skip", tap it to navigate to Home.
      final skipFinder = find.text('Skip');
      if (skipFinder.evaluate().isNotEmpty) {
        await tester.tap(skipFinder);
        await safePump(tester, steps: 6, duration: const Duration(milliseconds: 500));
      }

      // 4. We should now be on the Home screen.
      // Verify that the BottomNavigationBar is present.
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Wait for fake store API response and shimmer rendering
      await safePump(tester, steps: 6, duration: const Duration(milliseconds: 500));

      // 5. Navigate to Favorites using BottomNavigationBar
      final favoriteTabFinder = find.byIcon(Icons.favorite_rounded).last;
      await tester.tap(favoriteTabFinder);
      await safePump(tester, steps: 4, duration: const Duration(milliseconds: 500));

      // 6. Navigate back to Home
      final homeTabFinder = find.byIcon(Icons.home_rounded).last;
      await tester.tap(homeTabFinder);
      await safePump(tester, steps: 4, duration: const Duration(milliseconds: 500));

      // 7. Tap on the first product card if any exists to go to details
      final productCards = find.byType(ProductCard);
      if (productCards.evaluate().isNotEmpty) {
        // Tap the first product card
        await tester.tap(productCards.first);
        await safePump(tester, steps: 6, duration: const Duration(milliseconds: 500));

        // Verify we are on Product Details by checking back arrow
        expect(find.byIcon(Icons.arrow_back_ios_new_rounded), findsOneWidget);

        // 8. Go back
        await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
        await safePump(tester, steps: 4, duration: const Duration(milliseconds: 500));
      }
    });
  });
}
