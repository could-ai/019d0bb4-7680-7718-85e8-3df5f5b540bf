class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelName;
  final String channelAvatarUrl;
  final String viewCount;
  final String publishedAt;
  final String duration;
  final String subscriberCount;
  final String likes;

  const Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.channelName,
    required this.channelAvatarUrl,
    required this.viewCount,
    required this.publishedAt,
    required this.duration,
    this.subscriberCount = '0',
    this.likes = '0',
  });
}
