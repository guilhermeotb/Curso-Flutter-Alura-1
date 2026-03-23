import 'package:flutter/material.dart';
import 'package:flutter_reviews/helpers/my_review.dart';
import 'package:flutter_reviews/ui/review_screen.dart ';

void main() {
  runApp(const ReviewApp());
}

class ReviewApp extends StatelessWidget {
  const ReviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReviewScreen(
        review: getRandomReview(),
      ),
    );
  }
}
