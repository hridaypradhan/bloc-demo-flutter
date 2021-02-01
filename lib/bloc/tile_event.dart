part of 'tile_bloc.dart';

abstract class TileEvent extends Equatable {
  const TileEvent();

  @override
  List<Object> get props => [];
}

class AddTileEvent extends TileEvent{
  final Color color;

  AddTileEvent(this.color);
}

class ClearEvent extends TileEvent{
  
}