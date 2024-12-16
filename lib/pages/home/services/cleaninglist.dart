import 'package:cleanly/pages/home/services/sub_childrenList.dart';
import 'package:cleanly/pages/home/services/subcategory_view.dart';
import 'package:cleanly/providers/home/service/cleaning_provider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomServicesListView extends StatelessWidget {
  const CustomServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final servicesProvider = Provider.of<CleaningProvider>(context);
    if (!servicesProvider.services.isNotEmpty) {
      servicesProvider.fetchServices();
    }

    final service = servicesProvider.services;
    
    return Column(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(), // Disable scrolling
          shrinkWrap: true, // Adjust size to fit the content
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 50.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 16 / 12,
          ),
          itemCount: servicesProvider.services.length > 6
              ? 6
              : servicesProvider.services.length,
          itemBuilder: (context, index) {
            // Assign different colors based on the index or any other condition
            Color itemColor;
            if (index % 2 == 0) {
              itemColor = Colors.grey;
            } else if (index % 3 == 1) {
              itemColor = Colors.blue;
            } else if (index % 4 == 0) {
              itemColor = AppStyles.green;
            } else {
              itemColor = AppStyles.green;
            }

            return GestureDetector(
              onTap: () {
                if (servicesProvider.services[index].children != null) {
                  // Case 1: children is empty
                  if (servicesProvider.services[index].children!.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return Stack(
                            children: [
                              Positioned(
                                top: -110,
                                right: 30,
                                bottom: 0.0,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 2.0,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                      Icons.cancel,
                                      color: AppStyles.white,
                                      size: MediaQuery.of(context).size.height *
                                          0.05,
                                    ),
                                  ),
                                ),
                              ),
                              AlertDialog(
                                title: Center(
                                    child: Text(
                                  "No Services Available?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w700),
                                )),
                              ),
                            ],
                          );
                        });

                    print('No services found');
                  }

                  // Case 2: children has data
                  else {
                    // Get the first child
                    var child = servicesProvider.services[index].children![0];

                    // Check if subChildren is not null
                    if (child.subChildren != null) {
                      // Case 2a: subChildren is empty
                      if (child.subChildren!.isEmpty) {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      SubCategoryViewDetaisScreen(
                                service: servicesProvider.services[index],
                                matchingId: '',
                              ),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(
                                    1.0, 0.0); // Start from the right side
                                const end = Offset.zero; // End at the center
                                const curve = Curves.easeInOut;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ));

                        print('Children available, but no SubChildren');
                      }

                      // Case 2b: subChildren has data
                      else {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          clipBehavior: Clip.none,
                          context: context,
                          builder: (BuildContext context) {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  right: 0,
                                  top: -70,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        shadows: [
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            blurRadius: 2.0,
                                            offset: const Offset(0, 1),
                                          ),
                                        ],
                                        Icons.cancel,
                                        color: AppStyles.white,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      top: 20,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.1),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Select Services ",
                                          style: TextStyle(
                                            color: AppStyles.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                          ),
                                        ),
                                      ),
                                      GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 37.0,
                                          crossAxisSpacing: 4.0,
                                          childAspectRatio: 1,
                                        ),
                                        itemCount: servicesProvider
                                            .services[index].children!.length,
                                        itemBuilder: (context, index1) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                    pageBuilder: (context,
                                                            animation,
                                                            secondaryAnimation) =>
                                                        SubChildrenScreen(
                                                      service: servicesProvider
                                                          .services[index]
                                                          .children![index1],
                                                      service1: servicesProvider
                                                          .services[index],
                                                      matchingId: '',
                                                    ),
                                                    transitionsBuilder:
                                                        (context,
                                                            animation,
                                                            secondaryAnimation,
                                                            child) {
                                                      const begin = Offset(1.0,
                                                          0.0); // Start from the right side
                                                      const end = Offset
                                                          .zero; // End at the center
                                                      const curve =
                                                          Curves.easeInOut;

                                                      var tween = Tween(
                                                              begin: begin,
                                                              end: end)
                                                          .chain(CurveTween(
                                                              curve: curve));

                                                      return SlideTransition(
                                                        position: animation
                                                            .drive(tween),
                                                        child: child,
                                                      );
                                                    },
                                                  ));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Wrap(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color
                                                          .fromARGB(26, 10, 188,
                                                          138), // Converted color
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.1),
                                                          spreadRadius: 5,
                                                          blurRadius: 7,
                                                          offset: const Offset(
                                                              0,
                                                              3), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              18.0),
                                                      child: Image(
                                                          image: NetworkImage(
                                                              servicesProvider
                                                                  .services[
                                                                      index]
                                                                  .children![
                                                                      index1]
                                                                  .imageUrl
                                                                  .toString())),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      servicesProvider
                                                          .services[index]
                                                          .children![index1]
                                                          .name
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontFamily:
                                                              GoogleFonts.lato()
                                                                  .fontFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );

                        print('Children and SubChildren are available');
                      }
                    }
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Wrap(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            26, 10, 188, 138), // Converted color
                        borderRadius: BorderRadius.circular(05),
                        // border: Border.all(color: itemColor, width: 0.4),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: itemColor.withOpacity(0.1),
                        //     spreadRadius: 5,
                        //     blurRadius: 7,
                        //     offset: const Offset(
                        //         0, 3), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image(
                          image:
                              NetworkImage(service[index].imageUrl.toString()),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        service[index].name.toString(),
                        style: TextStyle(
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            );
            //}
          },
        ),
         SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        if (servicesProvider.services.length > 6)
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            shrinkWrap: true, // Adjust size to fit the content
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 50.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 16 / 8,
            ),
            itemCount: servicesProvider.services.length >= 2
                ? 2
                : servicesProvider.services.length,
            itemBuilder: (context, index) {
              final actualIndex = servicesProvider.services.length - 2 + index;
              final service = servicesProvider.services[actualIndex];

              // Assign different colors based on the index or any other condition
              Color itemColor;
              if (index % 2 == 0) {
                itemColor = Colors.grey;
              } else if (index % 3 == 1) {
                itemColor = Colors.blue;
              } else if (index % 4 == 0) {
                itemColor = AppStyles.green;
              } else {
                itemColor = AppStyles.green;
              }

              return GestureDetector(
                onTap: () {
                  if (service.children != null) {
                    // Case 1: children is empty
                    if (service.children!.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return Stack(
                              children: [
                                Positioned(
                                  top: -110,
                                  right: 30,
                                  bottom: 0.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(
                                        shadows: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            blurRadius: 2.0,
                                            offset: const Offset(0, 1),
                                          ),
                                        ],
                                        Icons.cancel,
                                        color: AppStyles.white,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                      ),
                                    ),
                                  ),
                                ),
                                AlertDialog(
                                  title: Center(
                                      child: Text(
                                    "No Services Available?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w700),
                                  )),
                                ),
                              ],
                            );
                          });
                      print('No services found');
                    }

                    // Case 2: children has data
                    else {
                      // Get the first child
                      var child = service.children![0];

                      // Check if subChildren is not null
                      if (child.subChildren != null) {
                        // Case 2a: subChildren is empty
                        if (child.subChildren!.isEmpty) {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        SubCategoryViewDetaisScreen(
                                  service: service,
                                  matchingId: '',
                                ),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(
                                      1.0, 0.0); // Start from the right side
                                  const end = Offset.zero; // End at the center
                                  const curve = Curves.easeInOut;

                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));

                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ));

                          print('Children available, but no SubChildren');
                        }

                        // Case 2b: subChildren has data
                        else {
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            clipBehavior: Clip.none,
                            context: context,
                            builder: (BuildContext context) {
                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    right: 0,
                                    top: -70,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          shadows: [
                                            BoxShadow(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              blurRadius: 2.0,
                                              offset: const Offset(0, 1),
                                            ),
                                          ],
                                          Icons.cancel,
                                          color: AppStyles.white,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 20,
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.1),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Select Services ",
                                            style: TextStyle(
                                              color: AppStyles.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                            ),
                                          ),
                                        ),
                                        GridView.builder(
                                          shrinkWrap: true,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisSpacing: 37.0,
                                            crossAxisSpacing: 4.0,
                                            childAspectRatio: 1,
                                          ),
                                          itemCount: service.children!.length,
                                          itemBuilder: (context, index1) {
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                      pageBuilder: (context,
                                                              animation,
                                                              secondaryAnimation) =>
                                                          SubChildrenScreen(
                                                        service: service
                                                            .children![index1],
                                                        service1:
                                                            servicesProvider
                                                                    .services[
                                                                index],
                                                        matchingId: '',
                                                      ),
                                                      transitionsBuilder:
                                                          (context,
                                                              animation,
                                                              secondaryAnimation,
                                                              child) {
                                                        const begin = Offset(
                                                            1.0,
                                                            0.0); // Start from the right side
                                                        const end = Offset
                                                            .zero; // End at the center
                                                        const curve =
                                                            Curves.easeInOut;

                                                        var tween = Tween(
                                                                begin: begin,
                                                                end: end)
                                                            .chain(CurveTween(
                                                                curve: curve));

                                                        return SlideTransition(
                                                          position: animation
                                                              .drive(tween),
                                                          child: child,
                                                        );
                                                      },
                                                    ));
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Wrap(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            26,
                                                            10,
                                                            188,
                                                            138), // Converted color
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.1),
                                                            spreadRadius: 5,
                                                            blurRadius: 7,
                                                            offset: const Offset(
                                                                0,
                                                                3), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(18.0),
                                                        child: Image(
                                                            image: NetworkImage(
                                                                service
                                                                    .children![
                                                                        index1]
                                                                    .imageUrl
                                                                    .toString())),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        service
                                                            .children![index1]
                                                            .name
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontFamily:
                                                                GoogleFonts
                                                                        .lato()
                                                                    .fontFamily,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 12),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                          print('Children and SubChildren are available');
                        }
                      }
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Wrap(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              26, 10, 188, 138), // Converted color
                          borderRadius: BorderRadius.circular(05),
                          // border: Border.all(color: itemColor, width: 0.4),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: itemColor.withOpacity(0.1),
                          //     spreadRadius: 5,
                          //     blurRadius: 7,
                          //     offset: const Offset(
                          //         0, 3), // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0, left: 4.0),
                                child: Text(
                                  service.name.toString(),
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, bottom: 8.0, right: 4.0),
                              child: Image(
                                image:
                                    NetworkImage(service.imageUrl.toString()),
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
              //}
            },
          ),
      ],
    );
  }
}
