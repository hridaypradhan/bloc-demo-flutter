import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/tile_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) => TileBloc(),
        child: MyHomePage(
          context: context,
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final BuildContext context;

  const MyHomePage({this.context});
  void _addRed(BuildContext context) =>
      BlocProvider.of<TileBloc>(context).add(AddTileEvent(Colors.red));

  void _addGreen(BuildContext context) =>
      BlocProvider.of<TileBloc>(context).add(AddTileEvent(Colors.green));

  void _clear(BuildContext context) =>
      BlocProvider.of<TileBloc>(context).add(ClearEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            child: Icon(
              Icons.circle,
              color: Colors.red,
            ),
            onPressed: () {
              _addRed(context);
            },
          ),
          FloatingActionButton(
            child: Icon(
              Icons.circle,
              color: Colors.green,
            ),
            onPressed: () {
              {
                _addGreen(context);
              }
            },
          ),
          FloatingActionButton(
            child: Icon(
              Icons.cancel,
              color: Colors.black,
            ),
            onPressed: () {
              _clear(context);
            },
          ),
        ],
      ),
      body: BlocBuilder<TileBloc, TileState>(
        builder: (context, state) {
          if (state is TileInitial)
            return Center(
              child: Text(
                'Empty',
              ),
            );
          else if (state is TileWithContent) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.tiles.length,
                    itemBuilder: (context, index) => Container(
                      color: state.tiles[index].color,
                      child: Text('Tile'),
                    ),
                  ),
                ),
              ],
            );
          } else
            return null;
        },
      ),
    );
  }
}
