import 'package:flutter/material.dart';
import '../../services/mood_service.dart';
import '../../entities/mood_report.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final MoodService _moodService = MoodService();

  // Nuestra entidad inicializada por defecto
  MoodReport _currentReport = MoodReport.initial();

  void _onAnalyze() {
    setState(() {
      _currentReport = _moodService.analyzeMood(_controller.text);
    });
  }

  void _onClear() {
    setState(() {
      _controller.clear();
      _currentReport = MoodReport.initial();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MoodSnap", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF009deb),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Escribe cómo te sientes hoy:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _controller,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Ej: Hoy me siento estresado por la universidad...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _onAnalyze,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF009deb),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text("Analizar"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _onClear,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text("Limpiar"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Widget de resultado basado en la Entidad
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: _currentReport.color,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Text(
                      _currentReport.emoji,
                      style: const TextStyle(fontSize: 55),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _currentReport.label,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _currentReport.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
