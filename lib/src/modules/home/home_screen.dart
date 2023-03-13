import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(alignment: Alignment.topCenter, children: [
            Container(
              height: size.height * 0.5,
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadiusDirectional.vertical(
                  bottom: Radius.circular(
                    25.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.4,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 125,
                      width: 125,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(
                            20.0,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/logo.png",
                        ),
                      ),
                    ),
                    const Text("مناوباتي",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ],
                ),
              ),
            ),
            Column(children: [
              SizedBox(height: size.height * 0.5 - 100),
              SizedBox(
                height: 200,
                width: size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCard(
                        label: "الهيكلية العامة \n لفرق الإسعاف",
                        image: "assets/images/logo.png",
                        onTap: () {}),
                    buildCard(
                        label: "الدليل المركزي \n الموحد للإسعاف",
                        image: "assets/images/guide.png",
                        onTap: () {}),
                    buildCard(
                        label: "أرقام عمليات \n الهلال الاحمر",
                        image: "assets/images/call-center-service.png",
                        onTap: () {}),
                    buildCard(
                        label: "أرقام المستشفيات \n في حمص",
                        image: "assets/images/hospital.png",
                        onTap: () {}),
                    buildCard(
                        label: "أرقام الأطباء \n في حمص",
                        image: "assets/images/medical-team.png",
                        onTap: () {}),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: size.width * 0.8,
                height: 0.18 * size.height,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  shadowColor: Colors.grey,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    autofocus: true,
                    //   onTap: model.navToMap,
                    child: Ink(
                      color: Colors.white,
                      child: Row(children: <Widget>[
                        Expanded(
                          child: Image.asset("assets/images/IMG_4606.png",
                              fit: BoxFit.cover),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 3, bottom: 10),
                child: const Text('مواقع المراكز الفعالة في مدينة حمص',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF535353),
                    )),
              ),
            ]),
          ]),
        ));
  }
}

Widget buildCard(
        {required String label,
        required String image,
        required Function()? onTap}) =>
    Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadowColor: Colors.grey,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            autofocus: true,
            onTap: onTap,
            child: Ink(
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: SizedBox(
                          child: Image.asset(image, fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            label,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color(0xFF535353),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ]),
            ),
          ),
        ));
