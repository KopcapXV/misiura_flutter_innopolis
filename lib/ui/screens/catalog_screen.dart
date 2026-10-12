import 'package:flutter/material.dart';
import '../../domain/entities/space_mission.dart';
import '../../domain/entities/space_mission_category.dart';
import '../widgets/space_mission_card.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final Set<int> _likedIds = {1, 2, 3, 6, 9};

  bool _onlyFavorites = false;

  static const List<SpaceMission> _missions = [
    SpaceMission(
      id: 1,
      title: 'Джеймс Уэбб (JWST)',
      subtitle: 'NASA / ESA / CSA · 2021',
      category: MissionCategory.telescope,
      description: 'Орбитальная инфракрасная обсерватория нового поколения.',
      tags: ['Инфракрасный'],
      coverColor: Color(0xFF23395B),
      assetPath: 'assets/images/webb.jpg',
    ),
    SpaceMission(
      id: 2,
      title: 'Марсоход Perseverance и вертолёт Ingenuity',
      subtitle: 'NASA · 2020',
      category: MissionCategory.rover,
      description: 'Исследование кратера Езеро и поиск следов жизни.',
      tags: ['Марс', 'Астробиология'],
      coverColor: Color(0xFFB84A39),
      assetPath: 'assets/images/mars.jpg',
    ),
    SpaceMission(
      id: 3,
      title: 'Международная космическая станция (МКС)',
      subtitle: 'Роскосмос / NASA / ESA · 1998',
      category: MissionCategory.station,
      description: 'Крупнейшая обитаемая исследовательская лаборатория на орбите.',
      tags: ['Орбита'],
      coverColor: Color(0xFF1D5A6C),
      assetPath: 'assets/images/iss.jpg',
    ),
    SpaceMission(
      id: 4,
      title: 'Вояджер-1',
      subtitle: 'Межзвёздная миссия NASA · 1977',
      category: MissionCategory.probe,
      description: 'Самый удалённый от Земли рукотворный объект.',
      tags: ['Дальний космос'],
      coverColor: Color(0xFF4A4E69),
    ),
    SpaceMission(
      id: 5,
      title: 'Космический телескоп «Хаббл»',
      subtitle: 'NASA / ESA · 1990',
      category: MissionCategory.telescope,
      description: 'Легендарный оптический телескоп на околоземной орбите.',
      tags: ['Астрофизика'],
      coverColor: Color(0xFF22577A),
    ),
    SpaceMission(
      id: 6,
      title: 'Кассини-Гюйгенс',
      subtitle: 'NASA / ESA / ASI · 1997',
      category: MissionCategory.probe,
      description: 'Исследование Сатурна, его колец и спутника Титан.',
      tags: ['Сатурн'],
      coverColor: Color(0xFF9C6644),
    ),
    SpaceMission(
      id: 7,
      title: 'Аполлон-11',
      subtitle: 'Историческая высадка на Луну · 1969',
      category: MissionCategory.crewed,
      description: 'Первая высадка людей на поверхность другого небесного тела.',
      tags: ['Луна'],
      coverColor: Color(0xFF5C677D),
    ),
    SpaceMission(
      id: 8,
      title: 'Новые горизонты (New Horizons)',
      subtitle: 'NASA · 2006',
      category: MissionCategory.probe,
      description: 'Первый аппарат, исследовавший карликовую планету Плутон.',
      tags: ['Плутон'],
      coverColor: Color(0xFF5B3758),
    ),
    SpaceMission(
      id: 9,
      title: 'Паркер (Parker Solar Probe)',
      subtitle: 'NASA · 2018',
      category: MissionCategory.probe,
      description: 'Зонд для погружения во внешнюю корону Солнца.',
      tags: ['Солнце'],
      coverColor: Color(0xFFC77D18),
    ),
    SpaceMission(
      id: 10,
      title: 'Чанъэ-5 (Chang\'e 5)',
      subtitle: 'CNSA · 2020',
      category: MissionCategory.probe,
      description: 'Автоматическая станция для забора и доставки лунного грунта.',
      tags: ['Луна'],
      coverColor: Color(0xFF2E6565),
    ),
  ];

  void _toggleLike(int id) {
    setState(() {
      if (_likedIds.contains(id)) {
        _likedIds.remove(id);
      } else {
        _likedIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<SpaceMission> displayedMissions = _onlyFavorites
        ? _missions.where((mission) => _likedIds.contains(mission.id)).toList()
        : _missions;

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
              'В избранном: ${_likedIds.length}',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                child: FilterChip(
                  label: const Text('Только избранные'),
                  selected: _onlyFavorites,
                  selectedColor: const Color(0xFFE3EDFA),
                  checkmarkColor: const Color(0xFF1E56A0),
                  labelStyle: TextStyle(
                    color: _onlyFavorites
                        ? const Color(0xFF1E56A0)
                        : Colors.black87,
                    fontWeight: _onlyFavorites
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                  onSelected: (selected) {
                    setState(() {
                      _onlyFavorites = selected;
                    });
                  },
                ),
              ),

              Expanded(
                child: displayedMissions.isEmpty
                    ? const Center(
                        child: Text(
                          'Ничего не нашлось',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        itemCount: displayedMissions.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final mission = displayedMissions[index];
                          return SpaceMissionCard(
                            mission: mission,
                            isLiked: _likedIds.contains(mission.id),
                            onLikeTap: () => _toggleLike(mission.id),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}