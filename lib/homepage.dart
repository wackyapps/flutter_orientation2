import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Color(0xffffffff),
            ),
            onPressed: () {
              //
            }),
        title: Text(
          "Nike",
          style: TextStyle(
            color: Color(0xffffffff),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.cartPlus),
              onPressed: () {
                //
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //
        },
        icon: const Icon(Icons.add),
        label: const Text("Add to Cart"),
        elevation: 4.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.palette,
                  color: Color(0xff1b76d8),
                ),
                onPressed: () {
                  showColorMenu();
                }),
            IconButton(
                icon: Icon(
                  _isFavorite
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    if (_isFavorite)
                      _isFavorite = false;
                    else
                      _isFavorite = true;
                  });
                })
          ],
        ),
      ),
      body: _layoutDetails(),
    );
  }

  Widget _layoutDetails() {
    Orientation orientation = MediaQuery.of(context).orientation;

    // check orientation of device
    if (orientation == Orientation.portrait) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _pictureSectionPortrait(),
            _productSection(),
            _sizeSection(),
            _instructionSection(),
            _productDetailsSection(),
          ],
        ),
      );
    } else {
      return Row(
        children: <Widget>[
          _pictureSectionLandscape(),
          Container(
            width: MediaQuery.of(context).size.width / 1.8,
            height: MediaQuery.of(context).size.height,
            child: _landscapeDetailsSection(),
          )
        ],
      );
    }
  }

  Widget _pictureSectionPortrait() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
          image: new DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"),
              fit: BoxFit.cover)),
    );
  }

  Widget _pictureSectionLandscape() {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget _landscapeDetailsSection() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _productSection(),
          _sizeSection(),
          _instructionSection(),
          _productDetailsSection(),
        ],
      ),
    );
  }

  Widget _productSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              'Nike Free Sole',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 8.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    '\u00A375',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Container(
                  child: Text(
                    "35%",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Grey chips
  Container myChips(String chipName) {
    return Container(
      child: RaisedButton(
        onPressed: () {},
        color: Color(0xffededed),
        child: Text(
          chipName,
          style: TextStyle(
            color: new Color(0xff1b76d8),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  Widget _sizeSection() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'AVAILABLE SIZES',
            style: TextStyle(fontSize: 18.0, color: Color(0xff1b76d8)),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 5.0,
            runSpacing: 5.0,
            children: <Widget>[
              myChips("UK7"),
              myChips("UK8"),
              myChips("UK9"),
              myChips("UK10"),
            ],
          ),
        )
      ],
    );
  }

  Widget _instructionSection() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, bottom: 25.0, right: 5.0, left: 5.0),
      child: Material(
        color: Colors.white,
        elevation: 14.0,
        borderRadius: BorderRadius.circular(10.0),
        shadowColor: Color(0x802196F3),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'ORDERING & SHIPPING',
                  style: TextStyle(fontSize: 18.0, color: Color(0xff1b76d8)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: _bulletDetails(),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      child: Text(
                        'COD available & VISA, MASTERCARD.',
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: _bulletDetails(),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      child: Text(
                        'Return shipment within 30 days from purchase',
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
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

  Widget _productDetailsSection() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, bottom: 25.0, right: 5.0, left: 5.0),
      child: Material(
        color: Colors.white,
        elevation: 14.0,
        borderRadius: BorderRadius.circular(10.0),
        shadowColor: Color(0x802196F3),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'PRODUCT DETAILS',
                  style: TextStyle(fontSize: 18.0, color: Color(0xff1b76d8)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: _bulletDetails(),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      child: Text(
                        'Full-rbs carbon fiber waffle sole',
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: _bulletDetails(),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      child: Text(
                        'Phylon forefront provides a great toe-off design',
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: _bulletDetails(),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      child: Text(
                        'Breathable mesh upper, syntheic overlay wentilation',
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
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

  Widget _bulletDetails() {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        color: Color(0xff1bb76d8),
        shape: BoxShape.circle,
      ),
    );
  }

  showColorMenu() {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: Color.fromRGBO(129, 67, 67, .8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 36,
                ),
                SizedBox(
                    height: (56 * 6).toDouble(),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Color.fromRGBO(201, 16, 16, 1),
                        ),
                        child: Stack(
                          alignment: Alignment(0, 0),
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              top: -36,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        color: Color(0xff232f34), width: 10)),
                                child: Center(
                                  child: ClipOval(
                                    child: Image.network(
                                      "https://i.stack.imgur.com/S11YG.jpg?s=64&g=1",
                                      fit: BoxFit.cover,
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      "Inbox",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.inbox,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "RED",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.color_lens,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Sent",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Trash",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.delete_outline,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Spam",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.error,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Drafts",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: Icon(
                                      Icons.mail_outline,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))),
              ],
            ),
          );
        });
  }
}
