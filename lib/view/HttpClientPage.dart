import 'package:flutter/material.dart';
import '../components/Book.dart';
import 'dart:convert';
import 'dart:io';

class BookE {
  String bookname;
  String book_info;
  String book_cover;
  String author_name;
  List tag;

  BookE(this.bookname, this.author_name, this.book_info, this.book_cover,
      this.tag);
  BookE.fromJson(Map<String, dynamic> json) {
    this.bookname = json['bookname'];
    this.book_info = json['book_info'];
    this.book_cover = json['book_cover'];
    this.author_name = json['author_name'];
    this.tag = json['tag'];
  }
}

class HttpClientPage extends StatefulWidget {
  @override
  HttpClientState createState() => HttpClientState();
}

class HttpClientState extends State<HttpClientPage> {
  List<BookE> books = [];

  Future<Null> getBooks() async {
    List<BookE> list = [];
    // 创建HttpClient
    HttpClient httpClient = new HttpClient();
    // 打开Http连接
    HttpClientRequest request =
        await httpClient.getUrl(Uri.parse('https://www.apiopen.top/novelApi'));
    // request.headers.add('user-agent', value)
    HttpClientResponse response = await request.close();
    String responseJson = await response.transform(utf8.decoder).join();
    Map responseData = json.decode(responseJson);
    if (responseData['code'] == 200) {
      for (Map book in responseData['data']) {
        list.add(new BookE.fromJson(book));
      }
    }
    setState(() {
      books = list;
    });
  }

  List<Widget> buildBooks(List<BookE> books) {
    List<Widget> bookWidgets = [];
    for (BookE book in books) {
      bookWidgets.add(new Book(
        bookname: book.bookname,
        author_name: book.author_name,
        book_info: book.book_info,
        book_cover: book.book_cover,
      ));
    }
    return bookWidgets;
  }

  @override
  void initState() {
    super.initState();
    getBooks();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http'),
      ),
      body: ListView(
        children: buildBooks(books),
      ),
    );
  }
}
