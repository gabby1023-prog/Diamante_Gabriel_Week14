import 'package:flutter/material.dart';
import 'app_theme.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: const Text(
          'NEXUS',
          style: TextStyle(
            color: AppTheme.nexusPurple,
            fontWeight: FontWeight.w800,
            fontSize: 22,
            letterSpacing: 0.8,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded, color: Colors.black87),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send_outlined, color: Colors.black87),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_rounded, color: Colors.black87),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stories Row
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildYourStoryItem(),
                  _buildStoryItem('Elon M.'),
                  _buildStoryItem('Osama B.'),
                  _buildStoryItem('James S.'),
                  _buildStoryItem('Mia R.'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Post 1: @Elon_Musk
            _buildPostCard(
              username: '@Elon_Musk',
              timeAgo: '1h ago',
              tag: '# Photography',
              caption: 'Golden hour at the coast never disappoints. Nature',
              likes: '1.1M',
              comments: '1,200',
              badgeLabel: 'Featured Photo',
            ),
            const SizedBox(height: 10),
            // Post 2: @Sarah
            _buildPostCard(
              username: '@Sarah',
              timeAgo: '5h ago',
              tag: '# Technology',
              caption: 'Just finished building my new desk setup.',
              likes: '189',
              comments: '42',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      // Static Bottom Bar matching Figma
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, 'HOME', isActive: true),
            _buildNavItem(Icons.search, 'SEARCH'),
            Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: AppTheme.nexusPurple,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
            _buildNavItem(Icons.people_outline, 'COMMUNITIES'),
            _buildNavItem(Icons.person_outline, 'PROFILE'),
          ],
        ),
      ),
    );
  }

  Widget _buildYourStoryItem() {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.grey.shade200,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/sample.png',
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppTheme.nexusPurple,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(Icons.add, size: 12, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Text(
          'Your Story',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildStoryItem(String name) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.nexusPurple, width: 2),
          ),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey.shade200,
            child: ClipOval(
              child: Image.asset(
                'assets/images/sample.png',
                width: 46,
                height: 46,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: const TextStyle(fontSize: 11, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildPostCard({
    required String username,
    required String timeAgo,
    required String tag,
    required String caption,
    required String likes,
    required String comments,
    String? badgeLabel,
  }) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/sample.png',
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: const TextStyle(fontSize: 11, color: Colors.black45),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz, color: Colors.black45),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.nexusPurple.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              tag,
              style: const TextStyle(
                color: AppTheme.nexusPurple,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            caption,
            style: const TextStyle(fontSize: 13, height: 1.4, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/sample.png',
                  width: double.infinity,
                  height: 185,
                  fit: BoxFit.cover,
                ),
              ),
              if (badgeLabel != null)
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.65),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      badgeLabel,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.favorite_border, size: 20, color: Colors.black54),
              const SizedBox(width: 4),
              Text(likes, style: const TextStyle(fontSize: 12, color: Colors.black54)),
              const SizedBox(width: 16),
              const Icon(Icons.chat_bubble_outline, size: 19, color: Colors.black54),
              const SizedBox(width: 4),
              Text(comments, style: const TextStyle(fontSize: 12, color: Colors.black54)),
              const Spacer(),
              const Icon(Icons.open_in_new, size: 18, color: Colors.black54),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {bool isActive = false}) {
    final color = isActive ? AppTheme.nexusPurple : Colors.black45;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 22, color: color),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 9,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }
}