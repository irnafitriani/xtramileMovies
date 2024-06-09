import 'package:flutter/material.dart';
import 'package:xtramile_movies/src/modul/review/model/review_list.dart';

class ReviewTile extends StatelessWidget {
  final Review review;

  const ReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: review.authorDetails.avatarPath != null
                      ? NetworkImage(
                          'https://image.tmdb.org/t/p/w92${review.authorDetails.avatarPath}')
                      : null,
                  child: review.authorDetails.avatarPath == null ? const Icon(Icons.person) : null,
                ),
                const SizedBox(width: 8.0),
                Text(review.author ?? ''),
                const Spacer(),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    ),
                    const SizedBox(width: 4.0),
                    Text('${review.authorDetails.rating}/10'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              review.content ?? '',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
