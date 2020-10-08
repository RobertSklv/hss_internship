import 'package:flutter/material.dart';

void main() {
  runApp(HSS());
}

class HSS extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HSS',

        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,

        ),

        home: SuccessPage(
            title: 'Success!',
            text: 'Check your email, and click on the confirmation link.',
            checkEmailButtonText: 'Check email',
            onCheckEmailPressed: () => print('Check email pressed...')
        )
    );
  }
}

class SuccessPage extends StatefulWidget {

  SuccessPage(
      {Key key,
      this.title,
      this.text,
      this.onCheckEmailPressed,
      this.checkEmailButtonText,
      this.contentWidth = 0.85})
      : super(key: key);

  final String title;
  final String text;
  final String checkEmailButtonText;
  final Function onCheckEmailPressed;
  final double contentWidth;

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * widget.contentWidth;

    return Scaffold(
      resizeToAvoidBottomPadding: false,

      appBar: AppBar(
        toolbarHeight: 0,
      ),

      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover
              )
          ),

          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container(), flex: 10),

              Container(
                  alignment: Alignment.centerLeft,
                  width: width,
                  child: Text(widget.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      )
                  )
              ),

              Container(
                  alignment: Alignment.centerLeft,
                  width: width,
                  child: Text(widget.text,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )
                  )
              ),

              Expanded(child: Container(), flex: 9),

              Container(
                width: width,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  color: Colors.white,
                  child: Text(
                    widget.checkEmailButtonText,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: widget.onCheckEmailPressed,
                ),
              ),

              SizedBox(height: 2)
            ],
          )
        )
      ),
    );
  }
}
