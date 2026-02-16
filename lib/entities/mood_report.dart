import 'package:flutter/material.dart';

class MoodReport {
  final String label;
  final String message;
  final String emoji;
  final Color color;

  MoodReport({
    required this.label,
    required this.message,
    required this.emoji,
    required this.color,
  });

  //Estado por defecto cuando no hay análisis
  factory MoodReport.initial() {
    return MoodReport(
      label: "Sin analizar",
      message: "Escribe algo para detectar tu estado emocional.",
      emoji: "🤔",
      color: Colors.grey.shade300,
    );
  }
}
