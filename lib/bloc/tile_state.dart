part of 'tile_bloc.dart';

abstract class TileState {}

class TileWithContent extends TileState {
  final List<Tile> tiles;

  TileWithContent(this.tiles);
}

class TileInitial extends TileState {}
