import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 50.0,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 16.0),
                            child: Container(
                              width: 220,
                              height: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 16.0),
                            child: Container(
                              width: 180,
                              height: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              width: 1, color: Colors.grey.withOpacity(0.2)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 0,
                              offset: const Offset(
                                  1, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: null,
                      ),
                      Positioned(
                        top: -8,
                        right: -1,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 212, 10, 10),
                          radius: 10,
                          child: Text(
                            "",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  color: Colors.white,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GridView.builder(
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable scrolling
                  shrinkWrap: true, // Adjust size to fit the content
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 37.0,
                      crossAxisSpacing: 4.0),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Wrap(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 100.0,
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 10.0,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 10.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 6.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 50.0,
                      color: Colors.white,
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 6.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 50.0,
                      color: Colors.white,
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 10.0,
                  color: Colors.white,
                )),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 10.0,
                    color: Colors.white,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
