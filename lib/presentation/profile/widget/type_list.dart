import 'package:flutter/material.dart';
class DropDownTypeList extends StatelessWidget {
  final List<String>? list;
  final fun;
  final double? width;
  final String? value;
  const DropDownTypeList({
    super.key,
    required this.list,
    required this.fun,
    required this.value,
    required this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width!,
      decoration: BoxDecoration(
        border: Border.all(width: .8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(fun.type),
        // value: fun.userType,
        padding: const EdgeInsets.only(left: 20),
        underline: const SizedBox(
          height: 0,
          width: 0,
        ),
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        onChanged: (String? value) {
          fun.typeCubit(value);
        },
        items: list!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}