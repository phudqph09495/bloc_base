part of '../search_tab_screen.dart';

class GridServiceItem extends StatelessWidget {
  const GridServiceItem({
    super.key,
    required this.index,
    required this.state,
  });
  final int index;
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
          padding: EdgeInsets.only(
              top: Const.sizeWidth(context, 10),
              left: Const.sizeWidth(context, 10),
              right: Const.sizeWidth(context, 10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      state.data![index].imageUrl ?? "",
                      fit: BoxFit.cover,
                      height: Const.sizeHeight(context, 105),
                      width: (Const.size(context).width - 18 * 2 - 10 * 2) / 2,
                    ),
                  ),
                  Positioned(
                      right: 5,
                      top: 5,
                      child: Icon(Icons.favorite,
                          size: 16,
                          color: index % 2 == 1
                              ? ColorApp.background.withOpacity(0.5)
                              : ColorApp.yellow)),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorApp.dark252525.withOpacity(.75),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: ColorApp.yellow,
                              size: 12,
                            ),
                            const Gap(3),
                            Text(
                              state.data![index].star.toString()??'',
                              style: StyleApp.textStyle500(
                                  color: ColorApp.yellow, fontSize: 12),
                            ),
                            const Gap(3),
                            Text(
                              '(${state.data![index].comment.toString()})',
                              style: StyleApp.textStyle500(
                                  color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                state.data![index].title ?? "",
                style: StyleApp.textStyle600(color: ColorApp.dark252525),
              ),
              Row(
                children: [
                  state.data![index].salePrice != null ? Text(
                    '₫ ${Const.ConvertPrice.format(state.data![index].salePrice)} ',
                    style: StyleApp.textStyle600(
                        color: ColorApp.dark500,
                        decoration: TextDecoration.lineThrough),
                  ): const SizedBox(),
                  Expanded(
                    child: Text(
                      '${Const.ConvertPrice.format(state.data![index].price)} ₫',
                      overflow: TextOverflow.ellipsis,
                      style: StyleApp.textStyle700(
                          color: ColorApp.dark252525,
                          decoration: TextDecoration.none),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.home,
                    color: ColorApp.darkGreen,
                    size: 14,
                  ),
                  const Gap(3),
                  Text(
                    state.data![index].description ?? "",
                    style: StyleApp.textStyle600(
                      color: ColorApp.darkGreen,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: ColorApp.greyAD,
                          size: 11,
                        ),
                        Text(
                          state.data![index].km.toString()??"",
                          style: StyleApp.textStyle500(
                              color: ColorApp.greyAD, fontSize: 13),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.watch_later_rounded,
                          color: ColorApp.greyAD,
                          size: 11,
                        ),
                        Text(
                          ' ${state.data![index].time.toString()} phút',
                          style: StyleApp.textStyle500(
                              color: ColorApp.greyAD, fontSize: 13),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}