import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/video_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            leadingWidth: 100.0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Row(
                children: [
                  const Icon(Icons.play_circle_fill, color: Colors.red, size: 28),
                  const SizedBox(width: 4),
                  const Text(
                    'YouTube',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.0,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.cast),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CircleAvatar(
                  radius: 14.0,
                  backgroundImage: NetworkImage(mockVideos[0].channelAvatarUrl),
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final video = mockVideos[index];
                return VideoCard(
                  video: video,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/video',
                      arguments: video,
                    );
                  },
                );
              },
              childCount: mockVideos.length,
            ),
          ),
        ],
      ),
    );
  }
}
