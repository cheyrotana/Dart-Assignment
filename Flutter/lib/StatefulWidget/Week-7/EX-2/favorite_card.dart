import 'package:flutter/material.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    super.key,
    this.isFavorite = false,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
  final bool isFavorite;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  Color get iconColor => isFavorite ? Colors.red : Colors.grey;

  void onPress() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: TextStyle(color: Colors.blue)),
                SizedBox(height: 10),
                Text(widget.description, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          IconButton(
            onPressed: onPress,
            icon: Icon(Icons.favorite, color: iconColor),
          ),
        ],
      ),
    );
  }
}
