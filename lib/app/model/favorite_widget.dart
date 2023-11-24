import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget(
      {Key? key, required this.onPressed, required this.isFavorited})
      : super(key: key);

  final VoidCallback onPressed;
  final bool isFavorited;

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.isFavorited ? Icons.star : Icons.star_border,
        color: Colors.red[500],
      ),
      onPressed: () {
        widget.onPressed(); // Notificar al padre cuando se presiona el ícono
      },
    );
  }
}
