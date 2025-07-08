import 'package:esame_mad_flutter_23_25/colors.dart';
import 'package:flutter/material.dart';

import 'NeuBox.dart';

class Searchbarcomponent extends StatefulWidget {
  final Function(String) onSearch;

  const Searchbarcomponent({super.key, required this.onSearch});

  @override
  State<Searchbarcomponent> createState() => _SearchbarcomponentState();
}

class _SearchbarcomponentState extends State<Searchbarcomponent> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: NeuBox(
        child: TextField(
          controller: _controller,
          onChanged: (value) {
            widget.onSearch(value);
          },
          decoration: InputDecoration(
            hintText: "Cerca eventi...",
            prefixIcon: Icon(Icons.search, color: primary),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
          ),
        ),
      ),
    );
  }
}
