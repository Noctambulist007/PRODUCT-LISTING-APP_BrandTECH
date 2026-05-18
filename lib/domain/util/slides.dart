import 'package:flutter/material.dart';
import 'package:productify/domain/model/onboarding/slide_data.dart';

const slides = [
  SlideData(
    image: 'assets/images/discover-product.png',
    title: 'Discover Products\nYou\'ll Love',
    subtitle:
        'Browse thousands of curated products across every category — fashion, electronics, home, and more.',
    tag: '01',
  ),
  SlideData(
    image: 'assets/images/filter-search.png',
    title: 'Filter, Sort &\nFind Instantly',
    subtitle:
        'Powerful search with category filters and smart sort options — find exactly what you want in seconds.',
    tag: '02',
  ),
  SlideData(
    image: 'assets/images/leave-a-review.png',
    title: 'Real Ratings,\nReal Reviews',
    subtitle:
        'Every product backed by verified ratings and review counts so you shop with total confidence.',
    tag: '03',
  ),
  SlideData(
    image: 'assets/images/shopping-bags.png',
    title: 'Shop Smarter,\nLive Better',
    subtitle:
        'Add to cart, save favourites, and checkout faster than ever. Your perfect shopping experience starts here.',
    tag: '04',
  ),
];
