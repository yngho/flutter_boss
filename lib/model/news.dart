class News {
  final String uniquekey;
  final String title;
  final String date;
  final String category;
  final String authorName;
  final String url;
  final String thumbnailPic1;
  // final String thumbnailPic2;
  // final String thumbnailPic3;
  News({
    this.uniquekey,
    this.title,
    this.date,
    this.category,
    this.authorName,
    this.url,
    this.thumbnailPic1,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      uniquekey: json["uniquekey"],
      title: json["title"],
      date: json["date"],
      category: json["category"],
      authorName: json["author_name"],
      url: json["url"],
      thumbnailPic1: json["thumbnail_pic_s"],
    );
  }
}