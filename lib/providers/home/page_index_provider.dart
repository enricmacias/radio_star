import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_index_provider.g.dart';

@riverpod
class PageIndex extends _$PageIndex {
  @override
  int build() => 0;

  void onDestinationSelected(int index) {
    state = index;
  }
}
