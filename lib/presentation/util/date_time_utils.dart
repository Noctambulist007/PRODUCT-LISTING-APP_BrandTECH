import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTime _parse(String? raw) {
    if (raw == null || raw.isEmpty) return DateTime.now();
    try {
      if (raw.endsWith('Z') || raw.contains('+') || raw.contains('-')) {
        return DateTime.parse(raw).toLocal();
      }
      return DateTime.parse(raw).toUtc().toLocal();
    } catch (_) {
      return DateTime.now();
    }
  }

  static String formatTime(String? raw) {
    if (raw == null || raw.isEmpty) return '--:--';
    try {
      final dt = _parse(raw);
      return DateFormat('hh:mm a').format(dt);
    } catch (_) {
      return '--:--';
    }
  }

  static String formatDate(String? raw) {
    if (raw == null || raw.isEmpty) return '—';
    try {
      final dt = _parse(raw);
      return DateFormat('EEE d MMM').format(dt);
    } catch (_) {
      return raw;
    }
  }

  static String formatDateTime(String? raw) {
    if (raw == null || raw.isEmpty) return '—';
    try {
      final dt = _parse(raw);
      return '${DateFormat('EEE d MMM').format(dt)} · ${DateFormat('hh:mm a').format(dt)}';
    } catch (_) {
      return raw;
    }
  }

  static String formatFullDate(String? raw) {
    if (raw == null || raw.isEmpty) return '—';
    try {
      final dt = _parse(raw);
      return DateFormat('EEEE d MMMM').format(dt).toUpperCase();
    } catch (_) {
      return raw;
    }
  }

  static String getDay(String? raw) {
    if (raw == null || raw.isEmpty) return '--';
    try {
      final dt = _parse(raw);
      return DateFormat('d').format(dt);
    } catch (_) {
      return '--';
    }
  }

  static String getMonth(String? raw) {
    if (raw == null || raw.isEmpty) return '--';
    try {
      final dt = _parse(raw);
      return DateFormat('MMM').format(dt).toUpperCase();
    } catch (_) {
      return '--';
    }
  }

  static String formatWithTimezone(String? raw) {
    if (raw == null || raw.isEmpty) return '—';
    final dt = _parse(raw);
    return '${DateFormat('hh:mm a').format(dt)} ${dt.timeZoneName}';
  }
}