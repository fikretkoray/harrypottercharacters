extension StringCasingExtension on String? {
  String capitalizeFirst() {
    if (this == null || this!.isEmpty) return 'Unknown';
    return this![0].toUpperCase() + this!.substring(1);
  }
}
