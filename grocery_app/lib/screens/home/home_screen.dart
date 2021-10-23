import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/controller/home_controller.dart';
import 'package:grocery_app/models/Product.dart';
import 'package:grocery_app/screens/detail/details_screen.dart';
import 'package:grocery_app/screens/home/components/card_details_view.dart';
import 'package:grocery_app/screens/home/components/cart_short_view.dart';
import 'package:grocery_app/screens/home/components/header.dart';
import 'package:grocery_app/screens/home/components/product_card.dart';

class HomeScreen extends StatelessWidget {
  final controller = HomeController();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
            color: Color(0xffeaeaea),
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                    return Stack(
                      children: [
                        AnimatedPositioned(
                          top: controller.homeState == HomeState.normal
                              ? headerHeidht
                              : -(constraints.maxHeight -
                                  cartBarHeight * 2 -
                                  headerHeidht),
                          left: 0,
                          right: 0,
                          height: constraints.maxHeight -
                              headerHeidht -
                              cartBarHeight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft:
                                        Radius.circular(defaultPadding * 1.5),
                                    bottomRight:
                                        Radius.circular(defaultPadding * 1.5))),
                            child: GridView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: demo_products.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                mainAxisSpacing: defaultPadding,
                                crossAxisSpacing: defaultPadding,
                              ),
                              itemBuilder: (context, index) => ProductCard(
                                  product: demo_products[index],
                                  press: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            FadeTransition(
                                          opacity: animation,
                                          child: DetailsScreen(
                                            product: demo_products[index],
                                            onProductAdd: () {
                                              controller.addProductToCart(
                                                  demo_products[index]);
                                            },
                                          ),
                                        ),
                                        transitionDuration:
                                            const Duration(milliseconds: 500),
                                        reverseTransitionDuration:
                                            const Duration(milliseconds: 500),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          duration: panelTransition,
                        ),
                        AnimatedPositioned(
                          duration: panelTransition,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: controller.homeState == HomeState.normal
                              ? cartBarHeight
                              : (constraints.maxHeight - cartBarHeight),
                          child: GestureDetector(
                            onVerticalDragUpdate: _onVerticalGesture,
                            child: Container(
                              padding: const EdgeInsets.all(defaultPadding),
                              color: Color(0xffeaeaea),
                              alignment: Alignment.topLeft,
                              child: AnimatedSwitcher(
                                duration: panelTransition,
                                child: controller.homeState == HomeState.normal
                                    ? CardShortView(controller: controller)
                                    : CartDetailsView(
                                        controller: controller,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          child: HomeHeader(),
                          duration: panelTransition,
                          top: controller.homeState == HomeState.normal
                              ? 0
                              : -headerHeidht,
                          right: 0,
                          left: 0,
                          height: headerHeidht,
                        )
                      ],
                    );
                  },
                );
              },
            )),
      ),
    );
  }
}
