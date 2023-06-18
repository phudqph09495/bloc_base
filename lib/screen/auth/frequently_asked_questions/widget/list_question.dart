import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../styles/colors.dart';
import '../../../../styles/styles.dart';

class ListQuestion extends StatelessWidget {
  const ListQuestion({
    super.key,
    required this.listTile,
    required this.listIndex,
    required this.description,
    required this.onTap,
  });

  final List<String> listTile;
  final List<int> listIndex;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: ColorApp.darkGreen,
                  child: Text((index + 1).toString(),
                      style: StyleApp.styleGilroy700(
                        color: ColorApp.whiteF0,
                        fontSize: 12,
                      )),
                ),
                const Gap(10),
                Expanded(
                  child: Text(listTile[index],
                      style: StyleApp.styleGilroy700(
                        color: ColorApp.dark252525,
                      )),
                ),
                InkWell(
                  onTap: () {
                    if (listIndex.contains(index)) {
                      listIndex.remove(index);
                    } else {
                      listIndex.add(index);
                    }
                    onTap.call();
                  },
                  child: Icon(
                    listIndex.contains(index) ? Icons.remove : Icons.add,
                  ),
                ),
              ],
            ),
            listIndex.contains(index)
                ? Text(
                    description,
                    style: StyleApp.textStyle500(color: ColorApp.dark500),
                  )
                : const SizedBox(),
          ],
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: listTile.length,
      shrinkWrap: true,
    );
  }
}
