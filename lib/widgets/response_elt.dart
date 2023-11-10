// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_ifm/utils/color.dart';

class ResponseElt extends StatelessWidget {
  const ResponseElt({
    super.key,
    required this.name,
    required this.onTap,
    this.isSelected = false,
    this.isTrue = false,
    this.isFalse = false,
  });

  final String? name;
  final bool isTrue;
  final bool isFalse;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: isSelected
            ? Border.all(color: AppColor.purple)
            : isTrue
                ? Border.all(color: Colors.green)
                : isFalse
                    ? Border.all(color: Colors.red)
                    : null,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Container(
                  width: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        child: Text(
                          name ?? "INCONNU",
                          softWrap: true,
                          style: const TextStyle(
                            color: AppColor.textColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: isSelected
                ? const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      CupertinoIcons.checkmark_alt_circle_fill,
                      color: AppColor.purple,
                    ),
                  )
                : isTrue
                    ? const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          CupertinoIcons.checkmark_alt_circle_fill,
                          color: Colors.green,
                        ),
                      )
                    : isFalse
                        ? const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              CupertinoIcons.xmark_circle_fill,
                              color: Colors.red,
                            ),
                          )
                        : const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              CupertinoIcons.circle,
                              color: AppColor.purple,
                            ),
                          ),
          )
        ],
      ),
    );
  }
}
