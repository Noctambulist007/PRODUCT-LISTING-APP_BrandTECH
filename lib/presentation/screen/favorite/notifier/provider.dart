import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productify/presentation/screen/favorite/notifier/favorite_notifier.dart';
import 'package:productify/presentation/screen/favorite/state/favorite_ui_state.dart';

final favoriteNotifierProvider =
    NotifierProvider<FavoriteNotifier, FavoriteUiState>(FavoriteNotifier.new);
