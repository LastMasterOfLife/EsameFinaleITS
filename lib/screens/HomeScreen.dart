import 'dart:convert';

import 'package:esame_mad_flutter_23_25/colors.dart';
import 'package:esame_mad_flutter_23_25/componets/NeuBox.dart';
import 'package:esame_mad_flutter_23_25/componets/eventsCardComponents.dart';
import 'package:esame_mad_flutter_23_25/componets/searchBarComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/EventModel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  List<Event> _allEvents = [];
  List<Event> _filteredEvents = [];
  bool _noResultsFound = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadEvents();
  }

  DateTime parseDate(String dateStr) {

    final parts = dateStr.split('-');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);
    return DateTime(year, month, day);
  }


  Future<void> _loadEvents() async {
    final String response = await rootBundle.loadString('assets/events.json');
    final data = await json.decode(response);
    List<Event> events = (data['events'] as List).map((e) => Event.fromJson(e)).toList();

    events.sort((a, b) => parseDate(a.date).compareTo(parseDate(b.date)));

    setState(() {
      _allEvents = events;
      _filteredEvents = List.from(events);
      _noResultsFound = false;
    });
  }

  void _filterEvents(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredEvents = _allEvents;
        _noResultsFound = false;
      } else {
        _filteredEvents = _allEvents.where((event) {
          return event.title.toLowerCase().contains(query.toLowerCase()) ||
              event.shortDescription.toLowerCase().contains(query.toLowerCase()) ||
              event.location.toLowerCase().contains(query.toLowerCase());
        }).toList();
        _noResultsFound = _filteredEvents.isEmpty;
      }
      _filteredEvents.sort((a, b) => parseDate(a.date).compareTo(parseDate(b.date)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EVENTI", style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        )),
        backgroundColor: primary,
        centerTitle: true,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Column(
        children: [
          Searchbarcomponent(
            onSearch: _filterEvents,
          ),
          SizedBox(height: 5,),
          Expanded(
            child: _noResultsFound
                ? Center(
              child: Text(
                'Nessun evento trovato. Prova a modificare la tua ricerca.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
                : ListView.builder(
              itemCount: _filteredEvents.length,
              itemBuilder: (context, index) {
                final event = _filteredEvents[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Eventscardcomponents(
                    card: event,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
