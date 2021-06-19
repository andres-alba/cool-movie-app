import 'package:flutter/material.dart';

class MovieWidget extends StatelessWidget {
  final List? popularmovies;

  const MovieWidget({Key? key, this.popularmovies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Movies',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularmovies?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      // color: Colors.green,
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          popularmovies?[index]
                                              ['backdrop_path']),
                                  fit: BoxFit.cover),
                            ),
                            height: 140,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'movie name',
                          ),

//                          Container(
//                            child: modified_text(
//                                size: 15,
//                                text: popularmovies[index]['original_name'] != null
//                                    ? popularmovies[index]['original_name']
//                                    : 'Loading'),
//                          )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
