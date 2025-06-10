import 'package:radio_star/models/radio_station.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_providers.g.dart';

@Riverpod(keepAlive: true)
class FavoriteStations extends _$FavoriteStations {
  @override
  List<RadioStation> build() {
    _loadFavorites();
    return [];
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList('favoriteStations') ?? [];
    state = favs.map((s) => RadioStation.fromJson(jsonDecode(s))).toList();
  }

  Future<void> addFavorite(RadioStation station) async {
    if (state.any((s) => s.url == station.url)) return;
    final updated = [...state, station];
    state = updated;
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'favoriteStations',
      updated.map((s) => jsonEncode(s.toJson())).toList(),
    );
    // Invalidate favoritesListProvider to refresh listeners
    ref.invalidate(favoritesListProvider);
  }

  Future<void> removeFavorite(RadioStation station) async {
    final updated = state.where((s) => s.url != station.url).toList();
    state = updated;
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'favoriteStations',
      updated.map((s) => jsonEncode(s.toJson())).toList(),
    );
    // Invalidate favoritesListProvider to refresh listeners
    ref.invalidate(favoritesListProvider);
  }
}

@Riverpod(keepAlive: true)
Future<List<RadioStation>> favoritesList(Ref ref) async {
  final prefs = await SharedPreferences.getInstance();
  final favs = prefs.getStringList('favoriteStations') ?? [];
  return favs.map((s) => RadioStation.fromJson(jsonDecode(s))).toList();
}
