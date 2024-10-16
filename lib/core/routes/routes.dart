import 'package:bloc_clean_architecture/features/note/presentation/pages/note_page.dart';
import 'package:go_router/go_router.dart';

String initRoute = "/";

final router = GoRouter(
  routes: [
    GoRoute(
      path: initRoute,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
