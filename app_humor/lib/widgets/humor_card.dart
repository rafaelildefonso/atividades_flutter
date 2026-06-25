import 'package:flutter/material.dart';
import '../models/humor.dart';

class HumorCard extends StatelessWidget {
  const HumorCard({
    super.key,
    required this.humor,
    required this.selectedHumor,
    required this.onHumorSelected,
  });

  final HumorData humor;
  final HumorData selectedHumor;
  final void Function(HumorData) onHumorSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: AnimatedContainer(
            width: humor.cardWidth,
            height: 500,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: humor.primaryColor,
              borderRadius: BorderRadius.circular(humor.borderRadius),
              boxShadow: [
                BoxShadow(
                  color: humor.primaryColor.withAlpha((0.28 * 255).round()),
                  blurRadius: 20,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 600),
                          opacity: 1,
                          child: Stack(
                            children: humor.sceneWidgets,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeOutBack,
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha((0.18 * 255).round()),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              humor.icon,
                              size: 72,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            humor.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            humor.description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 18),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: 1,
                            child: Text(
                              humor.message,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: humorList.map((item) {
            final isSelected = item == selectedHumor;
            return ElevatedButton(
              onPressed: () => onHumorSelected(item),
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? item.primaryColor : Colors.grey[200],
                foregroundColor: isSelected ? Colors.white : Colors.black87,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(item.name),
            );
          }).toList(),
        ),
      ],
    );
  }
}
