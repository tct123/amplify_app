// lib/screens/matches_page.dart

import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import '../models/ModelProvider.dart';
import '../pages/call_page.dart';
import '../services/match_service.dart';

class MatchesPage extends StatefulWidget {
  @override
  _MatchesPageState createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  late Future<List<User>> _matchesFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the future immediately
    _matchesFuture = _loadMatches();
  }

  Future<List<User>> _loadMatches() async {
    final authUser = await Amplify.Auth.getCurrentUser();
    return MatchService().fetchMatches(authUser.userId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<User>>(
        future: _matchesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading matches'),
            );
          }

          final users = snapshot.data ?? [];
          if (users.isEmpty) {
            return Center(
              child: Text('No matches yet'),
            );
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: user.profile_picture != null
                      ? NetworkImage(user.profile_picture!)
                      : null,
                  child: user.profile_picture == null
                      ? Text(user.name?.substring(0, 1) ?? '?')
                      : null,
                ),
                title: Text(user.name ?? 'Unknown'),
                trailing: IconButton(
                  icon: Icon(
                    Icons.call,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CallPage(),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

