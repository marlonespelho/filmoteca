import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tmdb/modules/catalog/test/commom.dart';
import 'package:tmdb/modules/catalog/views/catalog_detail_screen/main.dart';
import 'package:tmdb/modules/catalog/widgets/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Should render Category Movie Screen and open Detail Screen', (tester) async {
    await startApp();

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('homeAppBar')), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    expect(find.byType(CategoryMovieList), findsNWidgets(5));
    expect(find.byType(MovieCard), findsWidgets);
    await tester.tap(find.byKey(const Key('showMoreButton')).first);
    await tester.pumpAndSettle();
    expect(find.byType(CatalogDetailScreen), findsOne);
  });
}
