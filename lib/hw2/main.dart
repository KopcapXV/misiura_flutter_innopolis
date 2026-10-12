import 'package:flutter/material.dart';

void main() {
  runApp(const SpaceCatalogApp());
}

class SpaceMissionItem {
  final String title;
  final String agencyAndYear;
  final List<String> tags;
  final Color coverColor;
  final bool isFavorite;
  final String? assetPath;

  const SpaceMissionItem({
    required this.title,
    required this.agencyAndYear,
    required this.tags,
    required this.coverColor,
    required this.isFavorite,
    this.assetPath,
  });
}

class SpaceCatalogApp extends StatelessWidget {
  const SpaceCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Космический каталог',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F5F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0.5,
          centerTitle: false,
        ),
      ),
      home: const CatalogScreen(),
    );
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  final List<SpaceMissionItem> missions = const [
    SpaceMissionItem(
      title: 'Джеймс Уэбб (JWST)',
      agencyAndYear: 'NASA / ESA / CSA · 2021',
      tags: ['Телескоп', 'Инфракрасный'],
      coverColor: Color(0xFF23395B),
      isFavorite: true,
      assetPath: 'assets/images/webb.jpg',
    ),

    SpaceMissionItem(
      title: 'Марсоход Perseverance и вертолёт Ingenuity',
      agencyAndYear: 'NASA · 2020',
      tags: ['Марс', 'Астробиология'],
      coverColor: Color(0xFFB84A39),
      isFavorite: true,
      assetPath: 'assets/images/mars.jpg',
    ),

    SpaceMissionItem(
      title: 'Международная космическая станция (МКС)',
      agencyAndYear: 'Роскосмос / NASA / ESA · 1998',
      tags: ['Пилотируемая', 'Орбита'],
      coverColor: Color(0xFF1D5A6C),
      isFavorite: true,
      assetPath: 'assets/images/iss.jpg',
    ),

    SpaceMissionItem(
      title: 'Вояджер-1',
      agencyAndYear: 'Межзвёздная миссия NASA · 1977',
      tags: ['Дальний космос', 'Зонд'],
      coverColor: Color(0xFF4A4E69),
      isFavorite: false,
    ),

    SpaceMissionItem(
      title: 'Космический телескоп «Хаббл»',
      agencyAndYear: 'NASA / ESA · 1990',
      tags: ['Телескоп', 'Астрофизика'],
      coverColor: Color(0xFF22577A),
      isFavorite: false,
    ),

    SpaceMissionItem(
      title: 'Кассини-Гюйгенс',
      agencyAndYear: 'NASA / ESA / ASI · 1997',
      tags: ['Сатурн', 'Исследования'],
      coverColor: Color(0xFF9C6644),
      isFavorite: true,
    ),

    SpaceMissionItem(
      title: 'Аполлон-11',
      agencyAndYear: 'Историческая высадка на Луну · 1969',
      tags: ['Луна', 'Пилотируемая'],
      coverColor: Color(0xFF5C677D),
      isFavorite: false,
    ),

    SpaceMissionItem(
      title: 'Новые горизонты (New Horizons)',
      agencyAndYear: 'NASA · 2006',
      tags: ['Плутон', 'Пояс Койпера'],
      coverColor: Color(0xFF5B3758),
      isFavorite: false,
    ),
    
    SpaceMissionItem(
      title: 'Паркер (Parker Solar Probe)',
      agencyAndYear: 'NASA · 2018',
      tags: ['Солнце', 'Гелиосфера'],
      coverColor: Color(0xFFC77D18),
      isFavorite: true,
    ),

    SpaceMissionItem(
      title: 'Чанъэ-5 (Chang\'e 5)',
      agencyAndYear: 'CNSA · 2020',
      tags: ['Луна', 'Доставка грунта'],
      coverColor: Color(0xFF2E6565),
      isFavorite: false,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Космические миссии',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              '${missions.length} артиклей в каталоге',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            itemCount: missions.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return SpaceCard(mission: missions[index]);
            },
          ),
        ),
      ),
    );
  }
}

class SpaceCard extends StatelessWidget {
  final SpaceMissionItem mission;

  const SpaceCard({super.key, required this.mission});

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
                  mission.agencyAndYear,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: mission.tags.map((tag) => _buildTag(tag)).toList(),
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
            child: Container(
              width: 26,
              height: 26,
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
                mission.isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 15,
                color: mission.isFavorite ? Colors.red : Colors.grey.shade600,
              ),
            ),
          ),
        ],
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