import 'package:flutter/material.dart';

import '../../handlers/input_handler.dart';

class HomeScreen extends StatefulWidget {
  final InputHandler inputHandler;

  HomeScreen({Key? key, required this.inputHandler}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _inputController = TextEditingController();

  void _submitInput() {
    final input = _inputController.text.trim();
    if (input.isNotEmpty) {
      widget.inputHandler.handleInput(input, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                labelText: 'Enter a city name or zip code',
                hintText: 'e.g., New York',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _submitInput(),
                ),
              ),
              onSubmitted: (_) => _submitInput(),
            ),
          ],
        ),
      ),
    );
  }
}
