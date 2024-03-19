class Page<T> {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<T> results;

  Page({
    required this.page,
    required this.totalResults,
    required this.totalPages,
    required this.results,
  });

  factory Page.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJson) {
    return Page(
      page: json['page'],
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
      results: (json['results'] as List).map((e) => fromJson(e)).toList(),
    );
  }

  bool get hasMore => page < totalPages;

  int get nextPage => page + 1;
}
