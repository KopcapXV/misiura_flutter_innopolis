import 'package:flutter/material.dart';
import 'space_mission_category.dart';

class SpaceMission {
  final int id;
  final String title;
  final String subtitle;
  final MissionCategory category;
  final String? description;
  final List<String> tags;
  final Color coverColor;
  final String? assetPath;

  const SpaceMission({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    this.description,
    required this.tags,
    required this.coverColor,
    this.assetPath,
  });
}