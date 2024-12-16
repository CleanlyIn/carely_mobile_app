import 'package:cleanly/pages/home/services/sub_childrenList.dart';
import 'package:cleanly/pages/home/services/subcategory_view.dart';
import 'package:cleanly/providers/home/service/cleaning_provider.dart';
import 'package:cleanly/providers/searchProvider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final servicesProvider = Provider.of<CleaningProvider>(context);
    if (!servicesProvider.services.isNotEmpty) {
      servicesProvider.fetchServices();
    }

    final service1 = servicesProvider.services;
    return ChangeNotifierProvider(
        create: (_) => SearchProvider(),
        child: Center(child:
            Consumer<SearchProvider>(builder: (context, searchProvider, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppStyles.green,
              toolbarHeight: 90.0,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Container(
                    height:
                        50, // Fix the height of the header to avoid half sticking issue
                    // Add padding for better appearance
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 1,
                          offset: const Offset(1, 2), // Shadow position
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: searchProvider.searchController,
                      onChanged: (value) {
                        context.read<SearchProvider>().filteredSearches;
                        searchProvider.fetchServices(searchProvider.searchController.text);
                      },
                      onTap: () {
                        // Optionally handle onTap if you want specific actions when the field is tapped
                      },
                      readOnly: false,
                      decoration: InputDecoration(
                          hintText: "looking for search",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 14,
                          ),
                          prefixIcon: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Color.fromARGB(255, 114, 116, 119),
                              size: 22,
                            ),
                          ),
                          suffixIcon: InkWell(
                              onTap: () {
                                searchProvider.searchController.clear();
                              },
                              child: Icon(Icons.cancel))),
                    )),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Consumer<SearchProvider>(
                builder: (context, searchProvider, child) {
                  return Column(
                    children: [
                      // Trending Searches label
                      searchProvider.services.isNotEmpty
                          ? const SizedBox()
                          : searchProvider.isLoading
                              ? const SizedBox()
                              : const Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 10, top: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Trending Searches:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                      const SizedBox(height: 10),

                      // Show loading indicator or filtered search list
                      searchProvider.isLoading
                          ? const LinearProgressIndicator() // Show loading indicator
                          : searchProvider.services.isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: searchProvider.services.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              for (int i = 0;
                                                  i < service1.length;
                                                  i++) {
                                                // Check if the parent service's route matches
                                                if (service1[i]
                                                        .route
                                                        .toString() ==
                                                    searchProvider
                                                        .services[index].route
                                                        .toString()) {
                                                  print(
                                                      "Parent Service Matched: ${service1[i].route.toString()}");
                                                  Provider.of<SearchProvider>(
                                                          context,
                                                          listen: false)
                                                      .setSelectedSubChildId(
                                                          searchProvider
                                                              .services[index]
                                                              .id
                                                              .toString());
                                                  Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                      pageBuilder: (context,
                                                              animation,
                                                              secondaryAnimation) =>
                                                          SubCategoryViewDetaisScreen(
                                                        service: service1[i],
                                                        matchingId: searchProvider
                                                            .services[index].id
                                                            .toString(), // Navigate to parent service screen
                                                      ),
                                                      transitionsBuilder:
                                                          (context,
                                                              animation,
                                                              secondaryAnimation,
                                                              child) {
                                                        const begin = Offset(
                                                            1.0,
                                                            0.0); // Start from the right
                                                        const end = Offset.zero;
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
                                                    ),
                                                  );
                                                  break; // Exit the loop if parent match is found
                                                } else {
                                                  // If parent service doesn't match, check the children
                                                  final service2 = service1[i];

                                                  if (service2.children !=
                                                          null &&
                                                      service2.children!
                                                          .isNotEmpty) {
                                                    for (int j = 0;
                                                        j <
                                                            service2.children!
                                                                .length;
                                                        j++) {
                                                      // Check if child service's route matches
                                                      if (service2.children![j]
                                                              .route
                                                              .toString() ==
                                                          searchProvider
                                                              .services[index]
                                                              .route
                                                              .toString()) {
                                                        print(
                                                            "Child Service Matched: ${service2.children![j].route.toString()}");
                                                        Provider.of<SearchProvider>(
                                                                context,
                                                                listen: false)
                                                            .setSelectedSubChildId(
                                                                searchProvider
                                                                    .services[
                                                                        index]
                                                                    .id
                                                                    .toString());

                                                        Navigator.push(
                                                          context,
                                                          PageRouteBuilder(
                                                            pageBuilder: (context,
                                                                    animation,
                                                                    secondaryAnimation) =>
                                                                SubChildrenScreen(
                                                              service: service2
                                                                      .children![
                                                                  j], // Parent service
                                                              service1:
                                                                  service1[i],
                                                              matchingId:
                                                                  searchProvider
                                                                      .services[
                                                                          index]
                                                                      .id
                                                                      .toString(), // Child service
                                                              // Subchild service
                                                            ),
                                                            transitionsBuilder:
                                                                (context,
                                                                    animation,
                                                                    secondaryAnimation,
                                                                    child) {
                                                              const begin = Offset(
                                                                  1.0,
                                                                  0.0); // Start from the right
                                                              const end =
                                                                  Offset.zero;
                                                              const curve =
                                                                  Curves
                                                                      .easeInOut;

                                                              var tween = Tween(
                                                                      begin:
                                                                          begin,
                                                                      end: end)
                                                                  .chain(CurveTween(
                                                                      curve:
                                                                          curve));

                                                              return SlideTransition(
                                                                position: animation
                                                                    .drive(
                                                                        tween),
                                                                child: child,
                                                              );
                                                            },
                                                          ),
                                                        );
                                                        break; // Exit the loop if child match is found
                                                      } else {
                                                        // Check if subchildren exist under the current child
                                                        final service3 =
                                                            service2
                                                                .children![j];

                                                        if (service3.subChildren !=
                                                                null &&
                                                            service3
                                                                .subChildren!
                                                                .isNotEmpty) {
                                                          for (int k = 0;
                                                              k <
                                                                  service3
                                                                      .subChildren!
                                                                      .length;
                                                              k++) {
                                                            // Check if subchild service's route matches
                                                            if (service3
                                                                    .subChildren![
                                                                        k]
                                                                    .route
                                                                    .toString() ==
                                                                searchProvider
                                                                    .services[
                                                                        index]
                                                                    .route
                                                                    .toString()) {
                                                              print(
                                                                  "SubChild Service Matched: ${service3.subChildren![k].route.toString()}");
                                                              Provider.of<SearchProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .setSelectedSubChildId(searchProvider
                                                                      .services[
                                                                          index]
                                                                      .id
                                                                      .toString());
                                                              Navigator.push(
                                                                context,
                                                                PageRouteBuilder(
                                                                  pageBuilder: (context,
                                                                          animation,
                                                                          secondaryAnimation) =>
                                                                      SubChildrenScreen(
                                                                    service: service2
                                                                            .children![
                                                                        j], // Parent service
                                                                    service1:
                                                                        service1[
                                                                            i],
                                                                    matchingId: searchProvider
                                                                        .services[
                                                                            index]
                                                                        .id
                                                                        .toString(), // Child service
                                                                    // Subchild service
                                                                  ),
                                                                  transitionsBuilder: (context,
                                                                      animation,
                                                                      secondaryAnimation,
                                                                      child) {
                                                                    const begin =
                                                                        Offset(
                                                                            1.0,
                                                                            0.0); // Start from the right
                                                                    const end =
                                                                        Offset
                                                                            .zero;
                                                                    const curve =
                                                                        Curves
                                                                            .easeInOut;

                                                                    var tween = Tween(
                                                                            begin:
                                                                                begin,
                                                                            end:
                                                                                end)
                                                                        .chain(CurveTween(
                                                                            curve:
                                                                                curve));

                                                                    return SlideTransition(
                                                                      position:
                                                                          animation
                                                                              .drive(tween),
                                                                      child:
                                                                          child,
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                              break; // Exit the loop if subchild match is found
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            },
                                            child: Container(
                                              clipBehavior: Clip.none,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceEvenly, // Use min to make Row wrap content

                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          searchProvider
                                                              .services[index]
                                                              .imageUrl
                                                              .toString()),
                                                      height: 100,
                                                      width: 80,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      //                     print(">>>>>>>>>>>>>>${AppRoutes.kitchencleaningservices}");
                                                      //  // Dynamically navigate using 'route'
                                                      //                                   String routeName =searchProvider.services[index].route.toString();
                                                      //                                   Provider.of<SearchProvider>(context, listen: false)
                                                      //                                       .updateRoute(routeName);
                                                      //                                   Navigator.pushNamed(
                                                      //                                     context,
                                                      //                                    AppRoutes.kitchencleaningservices, // Default route for all detail pages
                                                      //                                     arguments: searchProvider.services[index].route,
                                                      //                                   );

                                                      //                     if("/${searchProvider.services[index].route.toString()}"==AppRoutes.kitchencleaningservices){
                                                      //            Navigator.pushNamed(
                                                      //   context,
                                                      //   AppRoutes.kitchencleaningservices,
                                                      //   arguments: ServiceArguments(index ?? 1, searchProvider.services[index ?? 1]),
                                                      // );

                                                      //                     }

                                                      //handleNavigation(context, searchProvider, index);
                                                    },
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                      child: Text(
                                                        searchProvider
                                                            .services[index]
                                                            .name
                                                            .toString(),
                                                        softWrap: true,
                                                        textAlign: TextAlign
                                                            .start, // Align text to the start
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider()
                                        ],
                                      );
                                    },
                                  ),
                                )
                              : Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        searchProvider.filteredSearches.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 4.0,
                                                bottom: 4.0,
                                                left: 10,
                                                right: 10),
                                            child: Container(
                                              clipBehavior: Clip.none,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.grey
                                                        .withOpacity(0.2)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    spreadRadius: 0,
                                                    blurRadius: 1,
                                                    offset: const Offset(1,
                                                        2), // Shadow position
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize
                                                      .min, // Use min to make Row wrap content

                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Icon(
                                                          Icons.trending_down),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // Handle tap on search item (optional)
                                                        print(
                                                            'Selected: ${searchProvider.filteredSearches[index]}');
                                                        searchProvider
                                                            .searchController
                                                            .text = searchProvider
                                                                .filteredSearches[
                                                            index];
                                                        searchProvider
                                                            .fetchServices(searchProvider.searchController.text);
                                                        searchProvider
                                                                .isLoading ==
                                                            true;
                                                      },
                                                      child: Text(
                                                        searchProvider
                                                                .filteredSearches[
                                                            index],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign: TextAlign
                                                            .start, // Align text to the start
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                    ],
                  );
                },
              ),
            ),
          );
        })));
  }
}
