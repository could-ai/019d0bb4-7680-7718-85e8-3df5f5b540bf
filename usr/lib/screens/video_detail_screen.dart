import 'package:flutter/material.dart';
import '../models/video.dart';
import '../data/mock_data.dart';
import '../widgets/video_card.dart';

class VideoDetailScreen extends StatelessWidget {
  const VideoDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the video passed via arguments
    final video = ModalRoute.of(context)!.settings.arguments as Video;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Mock Video Player
            Container(
              width: double.infinity,
              height: 220.0,
              color: Colors.black,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    video.thumbnailUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black45,
                  ),
                  IconButton(
                    iconSize: 60,
                    icon: const Icon(Icons.play_circle_fill, color: Colors.white),
                    onPressed: () {},
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 30),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
            
            // Video Details and Suggested Videos
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            video.title,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '${video.viewCount} مشاهدة • ${video.publishedAt}',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 13.0,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          
                          // Action Buttons
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildAction(context, Icons.thumb_up_outlined, video.likes),
                                _buildAction(context, Icons.thumb_down_outlined, 'لم يعجبني'),
                                _buildAction(context, Icons.reply_outlined, 'مشاركة'),
                                _buildAction(context, Icons.download_outlined, 'تنزيل'),
                                _buildAction(context, Icons.library_add_outlined, 'حفظ'),
                              ],
                            ),
                          ),
                          
                          const Divider(height: 32.0, color: Colors.grey),
                          
                          // Channel Info
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(video.channelAvatarUrl),
                                radius: 20.0,
                              ),
                              const SizedBox(width: 12.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      video.channelName,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${video.subscriberCount} مشترك',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.red,
                                ),
                                child: const Text(
                                  'اشتراك',
                                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: 32.0, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  
                  // Suggested Videos
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final suggestedVideo = mockVideos[index];
                        // Don't show the exact same video in suggestions
                        if (suggestedVideo.id == video.id) return const SizedBox.shrink();
                        
                        return VideoCard(
                          video: suggestedVideo,
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/video',
                              arguments: suggestedVideo,
                            );
                          },
                        );
                      },
                      childCount: mockVideos.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 6.0),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
