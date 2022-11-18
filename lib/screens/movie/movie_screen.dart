import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_movie_app/models/cast.dart';
import 'package:my_movie_app/models/movie.dart';
import 'package:my_movie_app/service/movie_api.dart';
import 'package:my_movie_app/widget/flight_shuttle.dart';
import 'package:my_movie_app/widget/top_section.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;
  final int movieId;
  const MovieScreen({
    Key? key,
    required this.movie,
    required this.movieId,
  }) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  List<Cast> cast = [];

  Future<void> fetchCast(int movieId) async {
    final response = await MovieApi.fetchCast(movieId);
    print(response[0].name);
    setState(() {
      cast = response;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCast(widget.movieId);
  }

  Widget top5CastList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cast.length,
        itemBuilder: (context, index) {
          return Text('${cast[index].name} - ${cast[index].character}');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final posterUrl =
        'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}';
    final backdropUrl =
        'https://image.tmdb.org/t/p/w500${widget.movie.backdropPath}';
    final title = widget.movie.title;
    final description = widget.movie.overview;
    final movieId = widget.movie.id;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: ListView(
        children: [
          TopSection(
            backdropUrl: backdropUrl,
            posterUrl: posterUrl,
            title: title,
            id: movieId,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: 'description-$movieId',
              flightShuttleBuilder: flightShuttleBuilder,
              child: Text(
                description,
                style: const TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Text(
                  'Cast:',
                  style: TextStyle(
                    height: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SafeArea(
                child: top5CastList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
