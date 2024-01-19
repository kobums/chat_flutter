import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chatflutter/user/model/user_model.dart';
import 'package:chatflutter/user/params/user_params.dart';
import 'package:chatflutter/user/repository/user_repository.dart';

final userProvider =
    StateNotifierProvider<UserProvider, List<UserModel>>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return UserProvider(repository: repository);
});

class UserProvider extends StateNotifier<List<UserModel>> {
  final UserRepository repository;

  UserProvider({
    required this.repository,
  }) : super([]) {
    getUser(const UserParams());
  }

  Future<void> getUser(UserParams user) async {
    final res = await repository.getUser(userParams: user);
    state = res.items;
  }
}
