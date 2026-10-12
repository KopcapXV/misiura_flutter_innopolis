import 'package:flutter/material.dart';
import '../../domain/entities/space_mission.dart';

class SpaceMissionCard extends StatelessWidget {
  final SpaceMission mission;
  final bool isLiked;
  final VoidCallback onLikeTap;

  const SpaceMissionCard({
    super.key,
    required this.mission,
    required this.isLiked,
    required this.onLikeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCover(),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mission.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E212D),
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  mission.subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    _buildCategoryBadge(mission.category.label),
                    ...mission.tags.map((tag) => _buildTag(tag)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCover() {
    final String firstLetter =
        mission.title.isNotEmpty ? mission.title[0].toUpperCase() : '';

    return SizedBox(
      width: 82,
      height: 98,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: mission.assetPath != null
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          mission.assetPath!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(color: mission.coverColor),
                        ),
                        Container(color: Colors.black.withOpacity(0.28)),
                      ],
                    )
                  : Container(color: mission.coverColor),
            ),
          ),

          Center(
            child: Text(
              firstLetter,
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.85),
                shadows: const [
                  Shadow(
                    color: Colors.black54,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 6,
            right: 6,
            child: GestureDetector(
              onTap: onLikeTap,
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  size: 16,
                  color: isLiked ? Colors.red : Colors.grey.shade600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFE3EDFA),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1E56A0),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFEBF1F6),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2B4C6F),
        ),
      ),
    );
  }
}