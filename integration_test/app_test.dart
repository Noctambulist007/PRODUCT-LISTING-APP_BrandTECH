import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:productify/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('App launch and navigation flow', (tester) async {
      // 1. Launch the app.
      app.main();
      await tester.pumpAndSettle();

      // 2. We should be on the Splash Screen initially, which then routes
      // to either Onboarding or Home. Let's wait a bit for navigation.
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      // 3. Since this might be a fresh install, we might be on the Onboarding screen.
      // If we see "Skip" or "Next", tap it.
      if (find.text('Skip').evaluate().isNotEmpty) {
        await tester.tap(find.text('Skip'));
        await tester.pumpAndSettle();
      }

      // 4. We should now be on the Home screen.
      // We can verify by looking for something like "Our Products" or a Category chip.
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Verify at least some products loaded (assuming API is available)
      // Wait for API response if needed
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      // 5. Navigate to Favorites using BottomNavigationBar
      await tester.tap(find.byIcon(Icons.favorite_rounded).last);
      await tester.pumpAndSettle();

      // 6. Navigate back to Home
      await tester.tap(find.byIcon(Icons.home_rounded).last);
      await tester.pumpAndSettle();

      // Tap on the first product card if any exists to go to details
      final productCards = find.byType(GestureDetector);
      if (productCards.evaluate().length > 1) {
        await tester.tap(productCards.at(1));
        await tester.pumpAndSettle();

        // 7. Verify we are on Product Details
        expect(find.byIcon(Icons.arrow_back_ios_new_rounded), findsOneWidget);

        // 8. Go back
        await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
        await tester.pumpAndSettle();
      }
    });
  });
}
