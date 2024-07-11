import 'package:flutter/material.dart';

import 'package:itunes_assignment/core/constants.dart';

class SearchWidget extends StatelessWidget {
  final void Function() onListpressed;
  final void Function() onGridPressed;
  final void Function(String) onChangedController;
  final TextEditingController searchController;
  final bool isListView;

  const SearchWidget({
    required this.onListpressed,
    required this.onGridPressed,
    required this.searchController,
    super.key,
    required this.onChangedController,
    required this.isListView,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 25),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white70),
            width: MediaQuery.of(context).size.width * .65,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (value) {
                          onChangedController(value);
                        },
                        decoration: InputDecoration(
                          hintText: searchBytrackorArtistText,
                          hintStyle:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.black,
                                  ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      color: isListView ? Colors.white70 : null,
                      child: Icon(
                        Icons.list,
                        color: !isListView ? Colors.white70 : null,
                      )),
                  onTap: () {
                    onListpressed();
                  },
                ),
                GestureDetector(
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      color: !isListView ? Colors.white70 : null,
                      child: Icon(
                        Icons.dashboard,
                        color: isListView ? Colors.white70 : null,
                      )),
                  onTap: () {
                    onGridPressed();
                  },
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
