import 'package:flutter/material.dart';
import 'package:flutter_reviews/models/reviews.dart';

class ReviewScreen extends StatelessWidget {
  final Review review;
  const ReviewScreen({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("${review.title} (${review.year})",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: List.generate( review.stars,
            (index){
              return const Text("⭐", style: TextStyle(fontSize: 20),);
            },
          ),
        ),
        
        Text( "Data: ${review.date.toString().substring(0, 10)}",),
        Text(review.review),
        
      ],
    )
  );
}
}