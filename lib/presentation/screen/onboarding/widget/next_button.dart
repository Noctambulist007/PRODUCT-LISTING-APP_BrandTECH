import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
    required this.isLast,
  });

  final String label;
  final Color color;
  final VoidCallback onPressed;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32, right: 24),
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.symmetric(
            horizontal: isLast ? 22 : 18,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.3),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  letterSpacing: 0.2,
                ),
              ),
              if (!isLast) ...[
                const SizedBox(width: 6),
                const Icon(
                  Icons.arrow_downward_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
