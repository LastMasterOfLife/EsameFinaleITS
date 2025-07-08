import 'package:esame_mad_flutter_23_25/colors.dart';
import 'package:flutter/material.dart';
import '../models/EventModel.dart';

class Detailscreen extends StatefulWidget {
  final Event card;

  const Detailscreen({super.key, required this.card});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bianco,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Container(
                height: 380,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.card.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 10,  
                child: CircleAvatar(
                  backgroundColor: Colors.black45.withOpacity(0.05),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: bianco),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.card.date,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w200,
                        color: nero,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.card.time,
                      style: TextStyle(
                        fontSize: 18,
                        color: nero,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  widget.card.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  widget.card.longDescription,
                  style: const TextStyle(
                    fontSize: 14,
                    color: nero,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.card.location,
                  style: TextStyle(
                    fontSize: 14,
                    color: primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
