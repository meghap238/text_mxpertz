
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_project_mxpertz/bloc/home_bloc/home_bloc.dart';
import 'package:test_project_mxpertz/model/item_model.dart';
import '../model/cart_model.dart';
import '../config/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc bloc = HomeBloc();
  final _controller = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(FetchData());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset('assets/icons/menu-variant.png',
              color: AppColor.blackClr),
          title: Image.asset('assets/icons/logoAppBar.png'),
          centerTitle: true,
          actions: [
            Image.asset('assets/icons/Search.png'),
            SizedBox(width: 15.sp),
            Image.asset('assets/icons/Scan.png'),
            SizedBox(width: 20.sp),
          ],
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<HomeBloc, HomeState>(
            bloc: bloc,
            listener: (context, state) {
              // Handle state changes if needed
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 50.sp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Text(
                      'Hi, ${bloc.displayName}' ?? 'megha',
                      style: TextStyle(
                        color: AppColor.blackClr,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        fontFamily: 'poppins',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Padding(
                    padding: EdgeInsets.only(left: 20.sp, right: 40.sp),
                    child: Text(
                      'What are you looking for today?',
                      style: TextStyle(
                        color: AppColor.blackClr,
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp,
                        fontFamily: 'poppins',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 230.sp,// Height of the PageView
                        child: PageView(
                          controller: _controller,
                          children: const [
                            Image(image: AssetImage('assets/image/productImg.png')),
                            Image(image: AssetImage('assets/image/productImg.png')),
                            Image(image: AssetImage('assets/image/productImg.png')),
                            Image(image: AssetImage('assets/image/productImg.png')),
                          ],
                        ),
                      ),
                       SizedBox(height: 20.sp),
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 4,
                        effect: SlideEffect(
                          activeDotColor: AppColor.titleClr,
                          dotColor: Colors.grey.shade300,
                          dotHeight: 6.sp,
                          dotWidth: 6.sp,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 15.sp),
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    height: 50.sp,
                    child: DefaultTabController(
                      length: 5,
                      initialIndex: 1,

                      child: TabBar(
                        labelStyle: TextStyle(fontFamily: 'poppins',fontSize: 10,fontWeight: FontWeight.w700),

                          indicatorColor:AppColor.titleClr,
                          labelColor: AppColor.blackClr,
                          dividerColor: Colors.transparent,
                          labelPadding: EdgeInsets.all(5),
                          tabs: const [
                        Tab(
                          text: 'recommend',
                        ),Tab(
                          text: 'cell phone',
                        ),Tab(
                          text: 'Car Products',
                        ),Tab(
                          text: 'department store',
                        ),
                        Tab(
                          text: 'computer',
                        ),
                          ]),
                    ),

                  ),
                  SizedBox(height: 15.sp),
                  Padding(
                    padding: EdgeInsets.only(right: 20.sp),
                    child: Text(
                      'See More',
                      style: TextStyle(
                        color: AppColor.titleClr,
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                        fontFamily: 'poppins',
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(height: 15.sp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: GridView.builder(
                      itemCount: teamData.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "${teamData[index].imageUrl}" ?? ''),
                                ),
                                border: Border.all(
                                    width: 1, color: AppColor.borderClr),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 50.sp,
                              width: 50.sp,
                              padding: EdgeInsets.all(4.sp),
                              margin: EdgeInsets.all(2.sp),
                            ),
                            SizedBox(height: 10.sp),
                            Text(
                              teamData[index].title ?? 'megha',
                              style: const TextStyle(
                                color: Color(0xff9098B1),
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                fontFamily: 'poppins',
                              ),
                            ),
                          ],
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.sp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: GridView.builder(
                      itemCount: cartData.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return card(index: index);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 2 / 3,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
            bloc: bloc,
            builder: (context, state) {
              return SizedBox(
                height: 80.sp,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  currentIndex: bloc.selectedIndex,
                  selectedItemColor: AppColor.titleClr,
                  unselectedItemColor: Colors.grey.shade300,
                  onTap: (index) {
                    bloc.add(TabChangeEvent(index: index));
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/home.svg',
                        color: bloc.selectedIndex == 0
                            ? AppColor.titleClr
                            : Colors.grey.shade300,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/category.svg',
                        color: bloc.selectedIndex == 1
                            ? AppColor.titleClr
                            : Colors.grey.shade300,
                      ),
                      label: 'Category',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/Message.svg',
                        color: bloc.selectedIndex == 2
                            ? AppColor.titleClr
                            : Colors.grey.shade300,
                      ),
                      label: 'Message',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/Cart.svg',
                        color: bloc.selectedIndex == 3
                            ? AppColor.titleClr
                            : Colors.grey.shade300,
                      ),
                      label: 'Cart',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/Private.svg',
                        color: bloc.selectedIndex == 4
                            ? AppColor.titleClr
                            : Colors.grey.shade300,
                      ),
                      label: 'Private',
                    ),
                  ],
                ),
              );
            }));
  }
}

Widget card({required int index}) {
  return Card(
    semanticContainer: true,
    //elevation: 8,
    // shadowColor: AppColor.greyShadowCard,
    surfaceTintColor: AppColor.whiteClr,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.sp)),
    child: Padding(
      padding: EdgeInsets.only(
        left: 15.sp,
        right: 10.sp,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(
            flex: 1,
          ),
          Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('${cartData[index].imageUrl}' ?? ''
                            // filteredProductNames[index].productImage
                            ),
                      )),
                      height: 120.sp
                      //.sp,
                      ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartData[index].title ?? 'Lipstik',
                              style: TextStyle(
                                  color: AppColor.blackClr,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  fontFamily: 'poppins'),
                            ),
                            Text(cartData[index].price ?? '\$500',
                                style: TextStyle(
                                    color: AppColor.blackClr,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp,
                                    fontFamily: 'poppins')),
                          ],
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                          decoration: BoxDecoration(
                            color: AppColor.titleClr,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.sp)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icons/cart.png'))),
                                  child: const Image(
                                      image:
                                          AssetImage('assets/icons/cart.png'))),
                              Text(
                                ' Add',
                                style: TextStyle(
                                    color: AppColor.whiteClr,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    fontFamily: 'poppins'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/icons/cart.png'))),
                          child: const Image(
                              image: AssetImage('assets/icons/star.png'))),
                      Text(
                        ' 4.6  86 Reviews',
                        style: TextStyle(
                            color: AppColor.blackClr,
                            fontWeight: FontWeight.w400,
                            fontSize: 10),
                      ),
                      Spacer(),
                      Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/icons/cart.png'))),
                          child: Image(
                              image: AssetImage(
                                  'assets/icons/more-vertical.png'))),
                    ],
                  )
                ],
              ),
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/Favorite@2x.png'))),
              )
            ],
          ),
          // const Spacer(flex: 1,),

          const Spacer(
            flex: 1,
          ),
        ],
      ),
    ),
  );
}
