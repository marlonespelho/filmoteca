import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tmdb/modules/catalog/test/commom.dart';
import 'package:tmdb/modules/catalog/views/movie_search_screen/main.dart';
import 'package:tmdb/modules/catalog/widgets/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Should render Movie Detail Screen', (tester) async {
    await startApp();
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('homeAppBar')), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(CategoryMovieList), findsNWidgets(5));
    expect(find.byType(MovieCard), findsWidgets);
    await tester.tap(find.byKey(Key('searchButton')).first);
    await tester.pumpAndSettle();
    expect(find.byType(MovieSearchScreen), findsOne);
    await tester.enterText(find.byKey(Key('searchInput')), 'kung');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(Duration(seconds: 3));
    expect(find.byType(MovieCard), findsWidgets);
  });

  testWidgets('Should render Movie Detail Screen without movies', (tester) async {
    await startApp();
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('homeAppBar')), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(CategoryMovieList), findsNWidgets(5));
    expect(find.byType(MovieCard), findsWidgets);
    await tester.tap(find.byKey(Key('searchButton')).first);
    await tester.pumpAndSettle();
    expect(find.byType(MovieSearchScreen), findsOne);
    await tester.enterText(find.byKey(Key('searchInput')), 'aeshuiuhi asihujdsauihdas asdiuhsadhiudsa');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(Duration(seconds: 3));
    expect(find.byType(MovieCard), findsNothing);
  });
}
