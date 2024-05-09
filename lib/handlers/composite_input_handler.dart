import 'package:flutter/material.dart';

import 'input_handler.dart';

class CompositeInputHandler implements InputHandler {
  final List<InputHandler> handlers;

  CompositeInputHandler(this.handlers);

  @override
  void handleInput(String input, BuildContext context) {
    for (var handler in handlers) {
      handler.handleInput(input, context);
    }
  }
}
