part of '../search_tab_screen.dart';

class CardServiceItem extends StatelessWidget {
  const CardServiceItem({
    super.key,
    required this.index,
    this.isFavorite = true,
    required this.state,
  });

  final int index;
  final bool isFavorite;
  final ServiceModel state;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouterName.infoSpaScreen);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorApp.background),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  state.data![index].imageUrl ?? "",
                  fit: BoxFit.cover,
                  height: Const.sizeHeight(context, 88),
                  width: Const.sizeWidth(context, 100),
                ),
              ),
              const Gap(15),
              Expanded(
                  child: SizedBox(
                    height: Const.sizeHeight(context, 88),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.data![index].title ?? "",
                              style: StyleApp.textStyle600(
                                color: ColorApp.dark252525,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                state.data![index].salePrice != null? Text(
                                  'đ ${Const.ConvertPrice.format(state.data![index].salePrice)  } ',
                                  style: StyleApp.textStyle700(
                                    fontSize: 12,
                                      color: ColorApp.dark500,
                                      decoration: TextDecoration.lineThrough),
                                ):const SizedBox(),
                                Text(
                                  '${Const.ConvertPrice.format(state.data![index].price)} đ',
                                  style: StyleApp.textStyle700(
                                      color: ColorApp.dark252525,
                                      decoration: TextDecoration.none),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 16,
                                  color: ColorApp.yellow,
                                ),
                                Text(
                                  state.data![index].star.toString(),
                                  style: StyleApp.textStyle700(
                                    color: ColorApp.yellow,
                                  ),
                                ),
                                const Gap(6),
                                Text(
                                  '(${state.data![index].comment.toString()})',
                                  style: StyleApp.textStyle700(
                                    color: ColorApp.greyAD,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.home,
                                  size: 14,
                                  color: ColorApp.darkGreen,
                                ),
                                const Gap(6),
                                Text(
                                  state.data![index].description ?? "",
                                  style: StyleApp.textStyle500(
                                    color: ColorApp.darkGreen,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                isFavorite
                                    ? Icon(
                                  Icons.favorite,
                                  size: 16,
                                  color: index % 2 == 1
                                      ? ColorApp.whiteF0.withOpacity(0.5)
                                      : ColorApp.yellow,
                                )
                                    : const Icon(
                                  Icons.close,
                                  color: ColorApp.dark500,
                                  size: 16,
                                ),
                               const Gap(10),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.watch_later_rounded,
                                      color: ColorApp.greyAD,
                                      size: 12,
                                    ),
                                    const Gap(3),
                                    Text(
                                      ' ${state.data![index].time.toString()} phút',
                                      style: StyleApp.textStyle500(
                                          color: ColorApp.greyAD,
                                          fontSize: 13,
                                          decoration: TextDecoration.none),
                                    ),
                                  ],
                                ),
                               const Gap(5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: ColorApp.greyAD,
                                      size: 12,
                                    ),
                                    Text(
                                      ' ${state.data![index].km.toString()} km',
                                      style: StyleApp.textStyle500(
                                          color: ColorApp.greyAD,
                                          fontSize: 12,
                                          decoration: TextDecoration.none),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}