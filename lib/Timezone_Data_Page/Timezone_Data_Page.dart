import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TimeZoneSearch extends StatefulWidget {
  @override
  _TimeZoneSearchState createState() => _TimeZoneSearchState();
}

class _TimeZoneSearchState extends State<TimeZoneSearch> {
  String _currentTime = 'Loading...';
  TextEditingController _searchController = TextEditingController();

  Future<void> fetchTime(String timeZone) async {
    try {
      final response = await http.get(Uri.parse(
          'https://timeapi.io/api/Time/current/zone?timeZone=$timeZone'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _currentTime = data['dateTime'];
        });
      } else {
        setState(() {
          _currentTime = 'Failed to fetch time';
        });
      }
    } catch (error) {
      setState(() {
        _currentTime = 'Error: $error';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTime('Zulu'); // Default to Zulu time on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Zone Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Enter time zone',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    fetchTime(_searchController.text);
                  },
                ),
                // Output decoration
                border: OutlineInputBorder(), // Adds border around the text field
                hintText: 'e.g., zulu,egypt', // Placeholder text
                hintStyle: TextStyle(color: Colors.grey), // Style for placeholder text
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(_currentTime),
            ),
          ),
        ],
      ),
    );
  }
}
