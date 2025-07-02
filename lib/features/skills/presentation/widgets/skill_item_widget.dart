import 'package:flutter/material.dart';

class SkillItemWidget extends StatelessWidget {
  final String skill;
  final VoidCallback onTap;

  const SkillItemWidget({super.key, required this.skill, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(skill),
      deleteIcon: const Icon(Icons.close_rounded),
      onDeleted: onTap,
    );
  }
}
