enum ProductSort {
  none,
  priceLowToHigh,
  priceHighToLow,
  topRated,
  nameAZ,
  nameZA;

  String get label => switch (this) {
    ProductSort.none => 'Default',
    ProductSort.priceLowToHigh => 'Price: Low to High',
    ProductSort.priceHighToLow => 'Price: High to Low',
    ProductSort.topRated => 'Top Rated',
    ProductSort.nameAZ => 'Name: A → Z',
    ProductSort.nameZA => 'Name: Z → A',
  };

  String get shortLabel => switch (this) {
    ProductSort.none => 'Sort',
    ProductSort.priceLowToHigh => 'Low → High',
    ProductSort.priceHighToLow => 'High → Low',
    ProductSort.topRated => 'Top Rated',
    ProductSort.nameAZ => 'A → Z',
    ProductSort.nameZA => 'Z → A',
  };
}
