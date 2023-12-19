import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/list_bloc.dart';
import '../model/pokemon.dart';

class ExampleListPage extends StatefulWidget {
  const ExampleListPage({super.key});

  @override
  State<ExampleListPage> createState() => _ExampleListPageState();
}

class _ExampleListPageState extends State<ExampleListPage> {
  late ListBloc listBloc;
  List<PokemonResult> exampleList = [];

  @override
  void initState() {
    listBloc = ListBloc();
    listBloc.add(FetchedListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder(
        bloc: listBloc,
        builder: (context, state) {
          if (state is LoadingListState) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            );
          }
          if (state is LoadedListState) {
            exampleList = state.pokemonListResponse.results;
            return Center(
              child: SingleChildScrollView(
                child: buildBody(),
              ),
            );
          }
          if (state is FailureProfileState) {
            String error = state.e;
            return Center(
              child: Text(error),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget buildBody() {
    List<Widget> children = [];
    final random = Random();

    for (var item in exampleList) {
      // Генерация случайного цвета
      Color cardColor = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1.0,
      );

      // Генерация случайной формы (для примера, можно настроить по своему вкусу)

      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.white),
      );

      children.add(
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: cardColor,
          ),
          height: 100,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.name.toString()}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Some information',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Center(
      child: SingleChildScrollView(
        child: Column(children: children),
      ),
    );
  }
}
