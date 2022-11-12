import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_pet/core/const.dart';
import 'package:shop_pet/core/custom_method.dart';

class DetailAnimal extends StatefulWidget {
  final animal;
  DetailAnimal({super.key, required this.animal});

  @override
  State<DetailAnimal> createState() => _DetailAnimalState(animal: animal);
}

class _DetailAnimalState extends State<DetailAnimal> {
  final animal;
  _message() {}
  _phone() {}
  _DetailAnimalState({required this.animal});
  bool isLove = false;
  int loveNumber = Random().nextInt(100);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * .5,
                width: size.width,
                decoration: BoxDecoration(
                  color: listColor[animal['color']],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  child: Stack(
                    children: [
                      Positioned(
                          top: 40,
                          left: 20,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 3, 3, 3),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: CusText(
                              txt: "SHOP THÚ CƯNG",
                              fontWeight: FontWeight.bold,
                              size: 20,
                            ),
                          )),
                      Positioned(
                          bottom: 30,
                          left: -1,
                          child: Transform.rotate(
                              angle: 8,
                              child: Image.asset("assets/img/footimage.webp"))),
                      Positioned(
                        height: 300,
                        width: 300,
                        bottom: 10,
                        right: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.purple,
                                strokeAlign: StrokeAlign.outside,
                                width: 5,
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(animal['image']),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CusText(
                              txt: "${animal['name'].toString().toUpperCase()}",
                              size: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text.rich(
                              TextSpan(
                                style: bungee.copyWith(
                                    color: listColor[
                                        new Random().nextInt(listColor.length)],
                                    fontSize: 19),
                                children: [
                                  TextSpan(
                                    text: 'Giá: ',
                                    style: bungee.copyWith(color: Colors.green),
                                  ),
                                  TextSpan(
                                    text: animal['price'],
                                  ),
                                  TextSpan(
                                    text: "  🪙",
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLove = !isLove;
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 123, 87, 221),
                                  shape: BoxShape.circle),
                              child: Column(
                                children: [
                                  isLove
                                      ? Icon(
                                          Icons.favorite,
                                          color: red,
                                          size: 30,
                                        )
                                      : Icon(
                                          Icons.favorite_border_outlined,
                                          color: red,
                                          size: 30,
                                        ),
                                  CusText(
                                      txt: isLove
                                          ? "${loveNumber++}"
                                          : "${loveNumber--}")
                                ],
                              )),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(urlImagAd),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text.rich(
                              TextSpan(
                                style: poppins.copyWith(
                                    color: listColor[
                                        new Random().nextInt(listColor.length)],
                                    fontSize: 18),
                                children: [
                                  TextSpan(text: 'Trần Thới Long'),
                                  TextSpan(
                                    text: '\nQuận 7, TPHCM ',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: _message,
                              child: Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(1, 1),
                                        color: white,
                                        blurRadius: 10)
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  Icons.message_rounded,
                                  color: blue,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: _phone,
                              child: Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(1, 1),
                                        color: white,
                                        blurRadius: 10)
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  Icons.phone,
                                  color: red,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    //Con tent
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      animal['information'],
                      softWrap: true,
                      style: dancingScript.copyWith(
                          color: listColor[animal['color']],
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
