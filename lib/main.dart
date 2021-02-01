import 'package:feature_testing/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/tile_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TileBloc(),
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          body: BlocBuilder<TileBloc, TileState>(
            builder: (context, state) {
              if (state is TileInitial)
                return InitialLayout();
              else if (state is TileWithContent) {
                return PopulatedLayout(
                  tiles: state.tiles,
                );
              } else
                return null;
            },
          ),
        ),
      ),
    );
  }
}

class InitialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              child: Icon(
                Icons.circle,
                color: Colors.red,
              ),
              onPressed: () {
                BlocProvider.of<TileBloc>(context).add(
                  AddTileEvent(Colors.red),
                );
              },
            ),
            FloatingActionButton(
              child: Icon(
                Icons.circle,
                color: Colors.green,
              ),
              onPressed: () {
                BlocProvider.of<TileBloc>(context).add(
                  AddTileEvent(Colors.green),
                );
              },
            ),
            FloatingActionButton(
              child: Icon(
                Icons.cancel,
                color: Colors.black,
              ),
              onPressed: () {
                BlocProvider.of<TileBloc>(context).add(
                  ClearEvent(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class PopulatedLayout extends StatelessWidget {
  final List<Tile> tiles;

  const PopulatedLayout({this.tiles});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: tiles.length,
            itemBuilder: (context, index) => Container(
              color: tiles[index].color,
              child: Text('Tile'),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              child: Icon(
                Icons.circle,
                color: Colors.red,
              ),
              onPressed: () {
                BlocProvider.of<TileBloc>(context).add(
                  AddTileEvent(Colors.red),
                );
              },
            ),
            FloatingActionButton(
              child: Icon(
                Icons.circle,
                color: Colors.green,
              ),
              onPressed: () {
                BlocProvider.of<TileBloc>(context).add(
                  AddTileEvent(Colors.green),
                );
              },
            ),
            FloatingActionButton(
              child: Icon(
                Icons.cancel,
                color: Colors.black,
              ),
              onPressed: () {
                BlocProvider.of<TileBloc>(context).add(
                  ClearEvent(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
