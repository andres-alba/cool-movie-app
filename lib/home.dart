import 'package:cool_movie_app/movie.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final String apiKey = '92640a358d76cabd1edf42149b34bf17';

  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MjY0MGEzNThkNzZjYWJkMWVkZjQyMTQ5YjM0YmYxNyIsInN1YiI6IjYwY2UwYjI2ZDM5OWU2MDAyYTdhNmJkOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vcpFD1Et0Oc5-Jo8XpHBQsdd1x6US52WAfmC9ke7Lig';

  List popularmovies = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readaccesstoken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );

    //print(await tmdbWithCustomLogs.v3.movies.getPouplar());

    Map popularmoviesresult = await tmdbWithCustomLogs.v3.movies.getPouplar();

    setState(() {
      popularmovies = popularmoviesresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool Movie App'),
      ),
      body: ListView(
        children: [
          MovieWidget(
            popularmovies: popularmovies,
          )
        ],
      ),
    );
  }
}
