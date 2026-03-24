import 'package:flutter/material.dart';
import 'package:flutter_reviews/models/reviews.dart';

class ReviewScreen extends StatelessWidget {
  final Review review;
  const ReviewScreen({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${review.title} (${review.year})",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(review.stars, (index) {
                  return const Text("⭐", style: TextStyle(fontSize: 20));
                }),
              ),
          
              Text("Data: ${review.date.toString().substring(0, 16)}"),
              Text(review.review, style: TextStyle(fontSize: 14)),
            ],
          ),
      ),
    );
  }
}
