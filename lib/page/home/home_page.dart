import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:shop_pet/core/const.dart';
import 'package:shop_pet/core/custom_method.dart';

import 'detail_animal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> Categories = Categorie;
  String _indexSelected = Categorie[0];
  bool isPlaying = false;
  final _confettiController = ConfettiController();
//Data
  final cat_data = FirebaseFirestore.instance.collection('cat');
  final dog_data = FirebaseFirestore.instance.collection('dog');
  final chim_data = FirebaseFirestore.instance.collection('chim');
  final soc_data = FirebaseFirestore.instance.collection('soc');
  void confetti() {}
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            HeaderHome(size: size),
            const SizedBox(
              height: 20,
            ),
            HeaderHome2(),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    Categories.length,
                    (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _indexSelected = Categories[index];
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: size.height * .05,
                              width: size.width * .2,
                              decoration: BoxDecoration(
                                color: Categories[index] == _indexSelected
                                    ? Colors.purple
                                    : white,
                                // border: Border.all(color: green),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 3),
                                      color: Categories[index] == _indexSelected
                                          ? Colors.purple
                                          : white,
                                      blurRadius: 6),
                                ],
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: CusText(
                                  txt: Categories[index],
                                  color: Categories[index] == _indexSelected
                                      ? white
                                      : black,
                                ),
                              ),
                            ),
                          ),
                        )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _indexSelected == Categories[0]
                ? AniamlItem(size: size, animalData: cat_data)
                : _indexSelected == Categories[1]
                    ? AniamlItem(size: size, animalData: dog_data)
                    : _indexSelected == Categories[2]
                        ? AniamlItem(size: size, animalData: chim_data)
                        : AniamlItem(size: size, animalData: soc_data)
          ],
        ),
      ),
    );
  }
}

//Cat
class AniamlItem extends StatelessWidget {
  const AniamlItem({
    Key? key,
    required this.size,
    required this.animalData,
  }) : super(key: key);

  final Size size;
  final CollectionReference<Map<String, dynamic>> animalData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .35,
      width: size.width,
      child: StreamBuilder(
          stream: animalData.snapshots(),
          builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    final DocumentSnapshot doc = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        height: size.height,
                        width: 250,
                        decoration: BoxDecoration(
                          color: listColor[doc['color']],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          child: Stack(
                            children: [
                              Positioned(child: Image.asset(foot2Img)),
                              Positioned(
                                top: 2,
                                right: 2,
                                child: Container(
                                  height: 180,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(doc["image"]),
                                        fit: BoxFit.fitHeight,
                                      )),
                                ),
                              ),
                              Positioned(
                                  left: 10,
                                  bottom: 40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CusText(
                                        txt: doc['name'],
                                        fontWeight: FontWeight.bold,
                                        color: white,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      CusText(
                                        txt: "Giá : ${doc['price']} VND",
                                        color: white,
                                        fontWeight: FontWeight.w600,
                                      )
                                    ],
                                  )),
                              Positioned(
                                  bottom: 30,
                                  right: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailAnimal(
                                                    animal: doc,
                                                  )));
                                    },
                                    child: Container(
                                        height: 40,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(159, 21, 193, 176),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 1),
                                                color: Color.fromARGB(
                                                    255, 54, 89, 244),
                                                blurRadius: 17),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: CusText(
                                            txt: "Mua",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                                  )),
                              Positioned(
                                  top: 15,
                                  left: 3,
                                  child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: black, shape: BoxShape.circle),
                                      child: LikeButton(
                                        size: 30,
                                        likeCount: new Random().nextInt(300),
                                      )))
                            ],
                          ),
                        ),
                      ),
                    );
                  }));
            } else if (snapshot.hasError) {
              return Center(
                child: CusText(
                  txt: "Đã có lỗi xảy ra",
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    );
  }
}

class HeaderHome2 extends StatelessWidget {
  const HeaderHome2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CusText(
            txt: "Sản phẩm",
            size: 20,
            fontWeight: FontWeight.bold,
          ),
          Row(
            children: [
              CusText(
                txt: "Tất cả",
                size: 18,
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.diamond,
                color: Colors.orange,
              )
            ],
          )
        ],
      ),
    );
  }
}

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: size.height * .2,
        width: size.width,
        decoration: BoxDecoration(
          color: listColor[new Random().nextInt(listColor.length)],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Positioned(
                right: 0,
                child: Image.asset(
                  foot2Img,
                  height: size.height * .2,
                )),
            Positioned(
                left: 0,
                child: Image.asset(
                  loveImg,
                  height: size.height * .2,
                )),
            Positioned(
                right: 0,
                child: Image.asset(
                  "assets/img/200 (1).webp",
                  height: size.height * .2,
                )),
            Positioned(
                left: 10,
                top: 30,
                child: CusText(
                  txt: "Chào mừng bạn đến với\nthế giới đáng yêu...",
                  fontWeight: FontWeight.bold,
                  size: 20,
                  color: white,
                )),
            Positioned(
                left: 10,
                bottom: 30,
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.phone,
                      color: red,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CusText(
                      txt: "0383892964",
                      fontWeight: FontWeight.bold,
                      size: 20,
                      color: white,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
