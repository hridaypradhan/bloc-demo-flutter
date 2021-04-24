part of 'tile_bloc.dart';

abstract class TileEvent {}

class AddTileEvent extends TileEvent {
  final Color color;

  AddTileEvent(this.color);
}

class ClearEvent extends TileEvent {}
