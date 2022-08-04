import 'package:flutter/material.dart';

class AttributesRow extends StatefulWidget {
  List<String> items;
  final String type;

  AttributesRow({Key? key, required this.items, required this.type})
      : super(key: key);

  @override
  State<AttributesRow> createState() => _AttributesRowState();
}

class _AttributesRowState extends State<AttributesRow> {
  List<int> _selectedItems = <int>[];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              if(! _selectedItems.contains(index)){

                setState(() {
                  _selectedItems.add(index);
                });
              } else {
                setState(() {
                  _selectedItems.removeWhere((val) => val == index);
                });
              }
            },
            child: Container(
              width: 95,
              decoration: BoxDecoration(
                color: (_selectedItems.contains(index)) ? Color(0xFFEFFB0E).withOpacity(0.4) : Colors.transparent,
                image: DecorationImage(
                    image: AssetImage("assets/images/png/items/${widget.type}/${widget.items[index]}.png")),
                borderRadius: BorderRadius.circular(50.0),
              ),
            )
          ),
        );
      },
    );
  }
}
