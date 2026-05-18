import 'package:flutter/material.dart';
import 'package:zentoast/zentoast.dart';

class Toaster {
  static void _show({
    required BuildContext context,
    required String title,
    required String message,
    required Color color,
    required IconData icon,
  }) {
    Toast(
      height: 100,
      builder: (toast) => Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(6, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 22,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      message,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              IconButton(
                onPressed: () => toast.hide(context),
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    ).show(context);
  }

  static void showSuccess(BuildContext context, String message) {
    _show(
      context: context,
      title: "Success",
      message: message,
      color: const Color(0xFF95FF8A),
      icon: Icons.check,
    );
  }

  static void showError(BuildContext context, String message) {
    _show(
      context: context,
      title: "Error",
      message: message,
      color: const Color(0xFFFF8A8A),
      icon: Icons.close,
    );
  }

  static void showWarning(BuildContext context, String message) {
    _show(
      context: context,
      title: "Warning",
      message: message,
      color: const Color(0xFFFFD36E),
      icon: Icons.warning_rounded,
    );
  }

  static void showInfo(BuildContext context, String message) {
    _show(
      context: context,
      title: "Info",
      message: message,
      color: const Color(0xFF8AD8FF),
      icon: Icons.info,
    );
  }
}