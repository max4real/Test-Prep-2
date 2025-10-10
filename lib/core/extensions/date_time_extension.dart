import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  toDateString() {
    return "$day-$month-$year";
  }

  String toDMMMY() {
    return DateFormat("d MMM, y").format(this);
  }

  String toMY() {
    return DateFormat("MMMM, y").format(this);
  }

  String toTimeAgo({bool useAbbreviation = false, bool addAgo = true}) {
    final Duration difference = DateTime.now().difference(this);

    String suffix = addAgo ? ' ago' : '';
    String pluralize(int count, String singular, String abbr) {
      if (useAbbreviation) return '$count$abbr$suffix';
      return '$count $singular${count > 1 ? 's' : ''}$suffix';
    }

    if (difference.inSeconds < 60) {
      return useAbbreviation ? 'now' : 'Just now';
    } else if (difference.inMinutes < 60) {
      return pluralize(difference.inMinutes, 'Minute', 'm');
    } else if (difference.inHours < 24) {
      return pluralize(difference.inHours, 'Hour', 'h');
    } else if (difference.inDays < 7) {
      return pluralize(difference.inDays, 'Day', 'd');
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return pluralize(weeks, 'Week', 'w');
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return pluralize(months, 'Month', 'mo');
    } else {
      final years = (difference.inDays / 365).floor();
      return pluralize(years, 'Year', 'y');
    }
  }

  String dateAtHour() {
    final dayMonth = DateFormat('d MMM').format(this); // e.g., "27 Apr"
    final time = DateFormat('h:mm a').format(this); // e.g., "6:31 PM"
    return '$dayMonth at $time';
  }
}
