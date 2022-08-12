import 'package:flutter/material.dart';

import '../../../../../shread/utils/format_date.dart';
import '../../../../domain/entities/movie_entity.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  fit: BoxFit.fill,
                  scale: 3.5,
                  'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                ),
              ),
            ],
          ),
          Positioned(
              left: 10,
              top: 196,
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: movie.voteAverage / 10),
                duration: const Duration(seconds: 4),
                builder: (context, double value, child) {
                  return CircleAvatar(
                    backgroundColor: Colors.black,
                    child: CircularProgressIndicator(value: value),
                  );
                },
              )),
          Positioned(
              left: 19,
              top: 205,
              child: Text(
                (movie.voteAverage * 10).toStringAsFixed(0),
                style: TextStyle(color: Colors.white),
              )),
          Positioned(
            left: 10,
            top: 240,
            child: SizedBox(
              height: 50,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(formatDate(movie.releaseDate)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
