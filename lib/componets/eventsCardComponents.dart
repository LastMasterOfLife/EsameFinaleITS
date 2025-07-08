import 'package:esame_mad_flutter_23_25/colors.dart';
import 'package:esame_mad_flutter_23_25/componets/NeuBox.dart';
import 'package:esame_mad_flutter_23_25/screens/DetailScreen.dart';
import 'package:flutter/material.dart';

import '../models/EventModel.dart';

class Eventscardcomponents extends StatefulWidget {

  final Event card;

  const Eventscardcomponents({super.key, required this.card});

  @override
  State<Eventscardcomponents> createState() => _EventscardcomponentsState();
}

class _EventscardcomponentsState extends State<Eventscardcomponents> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Detailscreen(card: Event(
          date: widget.card.date,
          title: widget.card.title,
          longDescription: widget.card.longDescription,
          image: widget.card.image,
          time: widget.card.time,
          id: widget.card.id,
          shortDescription: widget.card.shortDescription,
          location: widget.card.location,
        ),))),
      },
      child: NeuBox(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.card.date,
                style: TextStyle(
                  fontSize: 14,
                  color: primary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.card.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: nero
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.card.shortDescription,
                style: TextStyle(
                  fontSize: 14,
                  color: grigio,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
