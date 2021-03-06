part of 'pages.dart';

class DictionarySearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DictionaryController dictioncaryController =
        Get.find<DictionaryController>();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Search'),
                      controller: dictioncaryController.search,
                      onChanged: (text) {
                        dictioncaryController
                            .onSearch(dictioncaryController.search.text);
                      },
                    ),
                  ),
                  (dictioncaryController.isTyping.value)
                      ? IconButton(
                          onPressed: () => dictioncaryController.onTyping(),
                          icon: Icon(Icons.close_rounded, color: Colors.black),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    child: (dictioncaryController.searchList.length == 0 &&
                            dictioncaryController.search.text.isEmpty)
                        ? Column(
                            children: [
                              ...dictioncaryController.dictionaryList
                                  .map((item) {
                                return CustomListCard.dictionaryList(
                                    '${item.istilah}',
                                    '${item.detail}',
                                    context);
                              })
                            ],
                          )
                        : (dictioncaryController.searchList.length != 0)
                            ? Column(
                                children: [
                                  ...dictioncaryController.searchList
                                      .map((item) {
                                    return CustomListCard.dictionaryList(
                                        '${item.istilah}',
                                        '${item.detail}',
                                        context);
                                  })
                                ],
                              )
                            : Padding(
                                padding: EdgeInsets.only(top: height / 4),
                                child: Column(
                                  children: [
                                    CustomListCard.imageItem(
                                      dictioncaryController.empty,
                                      fit: BoxFit.contain,
                                    ),
                                    Text('Data tidak ditemukan'),
                                  ],
                                ),
                              ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
