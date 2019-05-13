import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  String bookname;
  String book_info;
  String book_cover;
  String author_name;
  List<String> tag;

  Book(
      {Key key,
      this.bookname = '八极武神',
      this.author_name = '血刃',
      this.book_info =
          '本已拳及巅峰，破碎虚空，却残遭横祸，异界重生。在华夏，八极拳之强，已被冠以‘武有八极定乾坤’之美誉，而他乃是华夏大地之上震古烁今的八极拳第一人。他身怀八极拳降临异界，并继承战王族的强大血脉，二者结合将会塑造出一段怎样的传奇？","book_info":"    本已拳及巅峰，破碎虚空，却残遭横祸，异界重生。在华夏，八极拳之强，已被冠以‘武有八极定乾坤’之美誉，而他乃是华夏大地之上震古烁今的八极拳第一人。他身怀八极拳降临异界，并继承战王族的强大血脉，二者结合将会塑造出一段怎样的传奇？',
      this.book_cover = 'http://img-tailor.11222.cn/bcv/big/1106566845348.jpg',
      this.tag = const ['热血', '玄幻', '战神']})
      : super(key: key);

  List<Widget> buildTags(String author_name, List<String> tags) {
    List<Widget> tagWidgets = [
      Row(
        children: <Widget>[
          Icon(Icons.person_outline),
          Text(author_name),
        ],
      )
    ];
    for (int i = 0; i < tags.length; i++) {
      tagWidgets.add(CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(tags[i]),
      ));
    }
    return tagWidgets;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tagWidgets = buildTags(author_name, tag);
    return DefaultTextStyle(
      style: TextStyle(
          fontSize: 18, decoration: TextDecoration.none, color: Colors.black),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image.network(book_cover),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bookname,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        book_info,
                        softWrap: false,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: tagWidgets,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
