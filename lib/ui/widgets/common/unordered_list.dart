import 'package:flutter/material.dart';

class UnorderedList extends StatelessWidget {
  final List<String> texts;
  final TextStyle? textsStyle;
  final EdgeInsetsGeometry? textsPadding;

  const UnorderedList(
    this.texts, {
    super.key,
    this.textsStyle,
    this.textsPadding,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          for (final text in texts)
            Padding(
              padding: textsPadding ?? const EdgeInsets.only(bottom: 10.0),
              child: UnorderedListItem(text),
            )
        ],
      );
}

class UnorderedListItem extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const UnorderedListItem(this.text, {super.key, this.textStyle});

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '• ',
            style: textStyle,
          ),
          Expanded(
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ],
      );
}
