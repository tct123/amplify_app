import 'package:flutter/material.dart';

class MatchesPage extends StatelessWidget {
  final List<String> matches = ['Alice', 'Bob', 'Charlie', 'Dana'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final name = matches[index];
          return ListTile(
            leading: CircleAvatar(child: Text(name[0])),
            title: Text(name),
            trailing: IconButton(
              icon: Icon(Icons.call),
              onPressed: () {
                // TODO: Integrate phone call to this match
              },
            ),
          );
        },
      ),
    );
  }
}
