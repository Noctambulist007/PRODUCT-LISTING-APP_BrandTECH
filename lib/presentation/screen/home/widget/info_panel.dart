import 'package:flutter/material.dart';
import 'package:productify/presentation/screen/home/widget/bone.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Bone(width: 68, height: 18, radius: 20),

            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Bone(width: double.infinity, height: 11, radius: 4),
                SizedBox(height: 6),
                Bone(width: 110, height: 11, radius: 4),
              ],
            ),

            const Bone(width: 88, height: 10, radius: 4),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Bone(width: 54, height: 16, radius: 4),
                Bone(width: 30, height: 30, radius: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
