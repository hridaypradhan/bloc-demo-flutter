import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:feature_testing/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

part 'tile_event.dart';
part 'tile_state.dart';

class TileBloc extends Bloc<TileEvent, TileState> {
  TileBloc() : super(TileInitial());

  List<Tile> tiles = [];

  @override
  Stream<TileState> mapEventToState(
    TileEvent event,
  ) async* {
    if (event is AddTileEvent) {
      tiles.add(
        Tile(
          color: event.color,
        ),
      );
      yield TileWithContent(tiles);
    } else if (event is ClearEvent) {
      tiles.clear();
      yield TileInitial();
    }
  }
}
