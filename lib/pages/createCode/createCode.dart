import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../local_modules/px.dart';
import '../../components/title.dart';
import '../../components/button.dart';

class CreateCode extends StatefulWidget {
  @override
  _CreateCode createState() => _CreateCode();
}

class _CreateCode extends State<CreateCode>
    with TickerProviderStateMixin<CreateCode> {
  final textareaValue = TextEditingController();
  bool isShow = false;

  Widget appBarWidget() {
    return AppBar(
      backgroundColor: Color(0xFFF4F4F3),
      elevation: 0,
      leading: IconButton(
        icon: Image.asset(
          "images/out.png",
          height: Px.px(60),
          fit: BoxFit.contain,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget textarea() {
    return !isShow
        ? Container(
            width: Px.px(690),
            height: Px.px(400),
            padding: EdgeInsets.all(Px.px(20)),
            margin: EdgeInsets.fromLTRB(0, 0, 0, Px.px(60)),
            decoration: new BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: new BorderRadius.circular(Px.px(30))),
            child: TextField(
                controller: textareaValue,
                cursorColor: const Color(0xFF3A4049),
                maxLines: null,
                style: TextStyle(
                  color: Color(0xFF3A4049),
                  fontSize: Px.px(40),
                ),
                decoration: InputDecoration(
                  hintText: '请输入或粘贴内容',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                  ),
                )),
          )
        : Container();
  }

  Widget qrCode() {
    return isShow
        ? Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, Px.px(60)),
            child: QrImage(
              data: textareaValue.text,
              version: QrVersions.auto,
              size: Px.px(400),
            ))
        : Container();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF4F4F3),
        appBar: appBarWidget(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all((30)),
              child: Column(
                children: [
                  AppTitle('二维码生成'),
                  textarea(),
                  qrCode(),
                  Button(
                      text: isShow ? '保存相册' : '生成',
                      leftText: isShow ? '清除' : '',
                      callback: () {
                        if (!isShow) {
                          setState(() {
                            isShow = true;
                          });
                        } else {}
                      },
                      leftCallback: () {
                        textareaValue.clear();
                        setState(() {
                          isShow = false;
                        });
                      }),
                ],
              ),
            )
          ],
        ));
  }
}
