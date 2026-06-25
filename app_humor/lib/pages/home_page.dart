import 'package:flutter/material.dart';
import '../models/humor.dart';
import '../widgets/humor_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HumorData _selectedHumor = feliz;

  void _selectHumor(HumorData humor) {
    setState(() {
      _selectedHumor = humor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final humor = _selectedHumor;

    return Scaffold(
      backgroundColor: humor.backgroundColor.withAlpha((0.1 * 255).round()),
      appBar: AppBar(
        title: const Text('App Humor'),
        centerTitle: true,
        backgroundColor: humor.primaryColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: HumorCard(
                  humor: humor,
                  selectedHumor: _selectedHumor,
                  onHumorSelected: _selectHumor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
