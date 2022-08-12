import 'package:clean_api_state/src/presenter/riverpod/movies/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/body_movies.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const DrowerMovies(),
        body: const BodyMovies());
  }
}

class DrowerMovies extends HookConsumerWidget {
  const DrowerMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 33, 33, 33),
            ),
            child: Text(
              'M',
              style: TextStyle(color: Colors.white, fontSize: 100),
            ),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              ref.read(moviesNotifierProvider.notifier).getAllMovies('day');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              ref.read(moviesNotifierProvider.notifier).getAllMovies('week');
            },
          ),
        ],
      ),
    );
  }
}
