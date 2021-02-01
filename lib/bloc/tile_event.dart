part of 'tile_bloc.dart';

abstract class TileEvent extends Equatable {}

class AddTileEvent extends TileEvent {
  final Color color;

  AddTileEvent(this.color);

  @override
  List<Object> get props => [color];
}

class ClearEvent extends TileEvent {
  @override
  List<Object> get props => [];
}
