part of 'routes.dart';

class Pages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
        name: Routes.login,
        page: () => const LoginScreen(),
        binding: LoginBindings()),
    GetPage(
      name: Routes.upsertBatch,
      page: () => const UpsertBatchScreen(),
      binding: UpsertBatchBidings(),
    ),
  ];
}
