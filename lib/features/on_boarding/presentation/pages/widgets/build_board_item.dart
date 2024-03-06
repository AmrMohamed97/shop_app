import 'package:flutter/material.dart';
import 'package:project_flutter/features/on_boarding/presentation/pages/on_boarding.dart';

class BuildBoardItem extends StatelessWidget {
  const BuildBoardItem({super.key, required this.board});
  final BoardingModel board;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(
              board.image,
            ),
          ),
        ),
        Text(
          board.title,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          board.body,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
