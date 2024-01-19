import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:chatflutter/chat/screen/chat_screen.dart';
// import 'package:chatflutter/employee/views/employee_screen.dart';
// import 'package:chatflutter/helth/views/helth_screen.dart';
// import 'package:chatflutter/chat/views/chat_screen.dart';
import 'package:chatflutter/user/model/user_model.dart';
import 'package:chatflutter/user/provider/user_me_provider.dart';
import 'package:chatflutter/user/view/login_screen.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider(ref: ref);
});

class AuthProvider extends ChangeNotifier {
  final Ref ref;

  AuthProvider({
    required this.ref,
  }) {
    ref.listen<UserModelBase?>(userMeProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  List<GoRoute> get routes => [
        GoRoute(
          path: '/',
          name: LoginScreen.routeName,
          builder: (_, __) => const LoginScreen(),
        ),
        // GoRoute(
        //   path: '/dash',
        //   name: DashBoard.routeName,
        //   builder: (_, __) => const DashBoard(),
        //   routes: [
        //     GoRoute(
        //       path: 'restaurant/:rid',
        //       name: DashBoard.routeName,
        //       builder: (_, state) => DashBoard(
        //         id: state.pathParameters['id']!,
        //       ),
        //     ),
        //   ],
        // ),
        GoRoute(
          path: '/chat',
          name: ChatScreen.routeName,
          builder: (_, state) => const ChatScreen(),
        ),
        // GoRoute(
        //   path: '/employee',
        //   name: EmployeeScreen.routeName,
        //   builder: (_, state) => const EmployeeScreen(),
        // ),
        // GoRoute(
        //   path: '/helth',
        //   name: HelthScreen.routeName,
        //   builder: (_, __) => const HelthScreen(),
        // ),
        // GoRoute(
        //   path: '/graph',
        //   name: GraphScreen.routeName,
        //   builder: (_, __) => const GraphScreen(),
        // ),
      ];

  logout() {
    ref.read(userMeProvider.notifier).logout();
  }

  String? redirectLogic(GoRouterState state) {
    final UserModelBase? user = ref.read(userMeProvider);
    final logginIn = state.uri.toString() == '/';

    if (user == null) {
      return logginIn ? null : '/';
    }

    if (user is UserModel) {
      // return logginIn || state.location == '/splash' ? '/' : null;
      return logginIn ? '/chat' : null;
    }

    if (user is UserModelError) {
      return !logginIn ? '/' : null;
    }

    return null;
  }
}
