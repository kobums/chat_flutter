import 'package:flutter_riverpod/flutter_riverpod.dart';

class IsDarkModeProvider extends StateNotifier<bool> {
  IsDarkModeProvider(this.ref) : super(false);

  final Ref ref;

  Future<void> changeMode() async {
    state = !state;
  }
}

final isDarkModeProvider =
    StateNotifierProvider<IsDarkModeProvider, bool>((ref) {
  return IsDarkModeProvider(ref);
});
