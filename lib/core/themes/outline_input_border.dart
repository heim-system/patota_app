part of 'theme.dart';

OutlineInputBorder _buildBorder(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(15),
  );
}
