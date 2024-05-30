import 'package:flutter/material.dart';

class HScroll extends StatelessWidget {
  const HScroll({super.key, required this.itemCount});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: double.minPositive,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFEF456F)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    index == itemCount - 1 ? "+1" : 'Outdoor',
                    style: const TextStyle(
                      color: Color(0xFFEF456F),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // Other content here...
      ],
    );
  }
}
