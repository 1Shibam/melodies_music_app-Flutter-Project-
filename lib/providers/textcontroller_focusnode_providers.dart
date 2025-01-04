import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Text Controllers to use multiple times
final firstTextControllerProvider = AutoDisposeProvider<TextEditingController>((ref) {
  final textController = TextEditingController();
  ref.onDispose(textController.dispose);
  return textController;
});

final secondTextControllerProvider = AutoDisposeProvider<TextEditingController>((ref) {
  final textController = TextEditingController();
  ref.onDispose(textController.dispose);
  return textController;
});

final thirdTextControllerProvider = AutoDisposeProvider<TextEditingController>((ref) {
  final textController = TextEditingController();
  ref.onDispose(textController.dispose);
  return textController;
});

//Focus nodes to use multiple times
final firstFocusNodeProvider = AutoDisposeProvider<FocusNode>((ref) {
  final focusNode = FocusNode();
  ref.onDispose(focusNode.dispose);
  return focusNode;
});

final secondFocusNodeProvider = AutoDisposeProvider<FocusNode>((ref) {
  final focusNode = FocusNode();
  ref.onDispose(focusNode.dispose);
  return focusNode;
});

final thirdFocusNodeProvider = AutoDisposeProvider<FocusNode>((ref) {
  final focusNode = FocusNode();
  ref.onDispose(focusNode.dispose);
  return focusNode;
});
