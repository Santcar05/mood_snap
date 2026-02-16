import 'package:flutter/material.dart';
import '../entities/mood_report.dart';

class MoodService {
  MoodReport analyzeMood(String text) {
    final input = text.toLowerCase();

    if (input.contains("feliz") ||
        input.contains("genial") ||
        input.contains("contento")) {
      return MoodReport(
        label: "Feliz",
        emoji: "😄",
        message: "¡Sigue así! Aprovecha tu energía positiva.",
        color: Colors.green.shade200,
      );
    } else if (input.contains("triste") ||
        input.contains("mal") ||
        input.contains("solo")) {
      return MoodReport(
        label: "Triste",
        emoji: "😢",
        message: "Respira. Hablar con alguien puede ayudarte.",
        color: Colors.blue.shade200,
      );
    } else if (input.contains("estresado") ||
        input.contains("ansioso") ||
        input.contains("agotado")) {
      return MoodReport(
        label: "Estrés",
        emoji: "😰",
        message: "Tómate un descanso. Un paseo corto puede ayudarte.",
        color: Colors.orange.shade200,
      );
    } else if (input.contains("motivado") ||
        input.contains("meta") ||
        input.contains("lograr")) {
      return MoodReport(
        label: "Motivado",
        emoji: "🔥",
        message: "¡Excelente! Mantén el enfoque y sigue avanzando.",
        color: Colors.red.shade200,
      );
    } else {
      return MoodReport(
        label: "Neutral",
        emoji: "😐",
        message: "No se detectó una emoción clara. Intenta escribir más.",
        color: Colors.grey.shade300,
      );
    }
  }
}
