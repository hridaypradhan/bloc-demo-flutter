part of 'tile_bloc.dart';

abstract class TileState extends Equatable {}

class TileWithContent extends TileState {
  final List<Tile> tiles;

  TileWithContent(this.tiles);

  @override
  List<Object> get props => [tiles];
}

class TileInitial extends TileState {
  @override
  List<Object> get props => [];
}
