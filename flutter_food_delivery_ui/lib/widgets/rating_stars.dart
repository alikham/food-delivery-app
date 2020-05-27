//  RatingStar(int rating) {
//     var star = '⭐ ';
//     for(int i =0; i< rating; i++){

//     }
//   }
import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final int rating;

  RatingStar( this.rating);
  
  @override
  Widget build(BuildContext context) {
    String stars = '';
    for(int i =0; i< rating; i++){
      stars += '⭐ ';
    }

    return Text(stars);
  }
}