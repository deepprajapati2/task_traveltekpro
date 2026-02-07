import 'package:deep_practical_traveltekpro/core/constants/app_assets.dart';
import 'package:deep_practical_traveltekpro/core/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_colors.dart';

import 'home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _HeaderSection(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.sw(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.sh(14)),
                        Text('Recent Search', style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700), ),
                        SizedBox(height: context.sh(12)),
                        SizedBox(
                          height: 120,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                              return _RecentCard(title: 'Hotels', subtitle: 'Dubai', date: '12 Aug - 25 Aug', meta: '1 Room • 2 travelers');
                            },
                            separatorBuilder:  (context, index) {
                              return SizedBox(width: context.sw(12));
                            },

                            itemCount: 4,
                          ),
                        ),
                        SizedBox(height: context.sh(20)),
                        Text('Hot & Trending', style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700)),
                        SizedBox(height: context.sh(4)),
                        Text(
                          'We bring exclusive offers for The Club members, daily.',
                          style: textTheme.bodySmall,
                        ),
                        SizedBox(height: context.sh(10)),
                        _HotTabs(),
                        SizedBox(height: context.sh(12)),
                        SizedBox(
                          height: context.sh(230),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => _TrendingCard(index: index),
                            separatorBuilder: (context, index) => SizedBox(width: context.sw(14)),
                            itemCount: 3,
                          ),
                        ),
                        SizedBox(height: context.sh(20)),
                        Text('Life Experience®', style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700)),
                        SizedBox(height: context.sh(4)),
                        Text('Discover the magic of a Life Experience.', style: textTheme.bodySmall),
                        SizedBox(height: context.sh(12)),
                        SizedBox(
                          height: context.sh(270),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => _ExperienceCard(index: index),
                            separatorBuilder: (context, index) => SizedBox(width: context.sw(14)),
                            itemCount: 3,
                          ),
                        ),
                        SizedBox(height: context.sh(16)),
                        _OutlineButton(label: 'Explore more', onTap: () {}),
                        SizedBox(height: context.sh(18)),
                        _FlashDealCard(),
                        SizedBox(height: context.sh(16)),
                        _VisaCard(),
                        SizedBox(height: context.sh(16)),
                        _EsimCard(),
                        SizedBox(height: context.sh(140)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _HomeBottomNav(),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          // clipper: _HeaderClipper(),
          child: Container(
            height: context.sh(100),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF19A9CB),
                  Color(0xFF5C3FD6),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: context.sw(-10),
          top: context.sh(40),
          child: Opacity(
            opacity: 0.25,
            child: SvgPicture.asset(AppAssets.splashImgSvg, height: context.sw(150),),
          ),
        ),
        Positioned(
          left: context.sw(20),
          top: context.sh(70),
          child: Opacity(
            opacity: 0.15,
            child: Icon(Icons.beach_access, size: context.sw(120), color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: context.sh(110)),
          child: Container(
            margin: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 16,
                  offset: Offset(0, 10),
                )
              ],
            ),
            child: Column(
              children: [
                _TopTabs(),
                SizedBox(height: context.sh(4)),
                const _SearchCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TopTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      _TabItemData(AppAssets.hotelSvg, 'Hotels'),
      _TabItemData(AppAssets.flightSvg, 'Flights'),
      _TabItemData(AppAssets.lifeExperienceSvg, 'Life\nExperience®'),
      _TabItemData(AppAssets.carsSvg, 'Cars'),
      _TabItemData(AppAssets.cruisesSvg, 'Cruises'),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.sw(10)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: context.sh(10), horizontal: context.sw(8)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          // boxShadow: const [
          //   BoxShadow(
          //     color: AppColors.shadow,
          //     blurRadius: 18,
          //     offset: Offset(0, 10),
          //   )
          // ],
        ),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(items.length, (index) {
                final item = items[index];
                final selected = state.selectedTab == index;
                return GestureDetector(
                  onTap: () => context.read<HomeCubit>().selectTab(index),
                  child: Container(
                    padding: EdgeInsets.all(context.sw(8)),
                    decoration: BoxDecoration(
                      color: selected ? const Color(0xFFF2F5FF) : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selected ? const Color(0xFFBFCBFF) : Colors.transparent,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(item.iconSvg, height: context.sw(18), ),
                        SizedBox(height: context.sh(6)),
                        Text(
                          item.label,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: context.sp(11),
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}

class _TabItemData {
  _TabItemData(this.iconSvg, this.label);
  final String iconSvg;
  final String label;
}

class _SearchCard extends StatelessWidget {
  const _SearchCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.sw(14)),
      child: Column(
        children: [
          _InputRow(icon: Icons.place_outlined, label: 'Destination', value: 'Dubai, United Arab Emirates'),
          SizedBox(height: context.sh(10)),
          _InputRow(icon: Icons.calendar_today_outlined, label: 'Date', value: '1 July - 3 July'),
          SizedBox(height: context.sh(10)),
          _InputRow(icon: Icons.person_outline, label: 'Travelers', value: '2 Travelers - 1 room'),
          SizedBox(height: context.sh(14)),
          Container(
            width: double.infinity,
            height: context.sh(44),
            decoration: BoxDecoration(
              gradient: AppColors.buttonGradient,
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: Text(
              'Search',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: context.sp(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InputRow extends StatelessWidget {
  const _InputRow({required this.icon, required this.label, required this.value});

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.sw(12), vertical: context.sh(10)),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: context.sw(18), color: AppColors.textMuted),
          SizedBox(width: context.sw(10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: context.sp(11), color: AppColors.textMuted)),
              SizedBox(height: context.sh(2)),
              Text(value, style: TextStyle(fontSize: context.sp(13), fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}

class _RecentCard extends StatelessWidget {
  const _RecentCard({required this.title, required this.subtitle, required this.date, required this.meta});

  final String title;
  final String subtitle;
  final String date;
  final String meta;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.sw(12)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toUpperCase(), style: TextStyle(fontSize: context.sp(10), color: AppColors.chipBlue, fontWeight: FontWeight.w600)),
          SizedBox(height: context.sh(6)),
          Text(subtitle, style: TextStyle(fontSize: context.sp(12), fontWeight: FontWeight.w600)),
          SizedBox(height: context.sh(6)),
          Text(date, style: TextStyle(fontSize: context.sp(10), color: AppColors.textMuted)),
          Text(meta, style: TextStyle(fontSize: context.sp(10), color: AppColors.textMuted)),
        ],
      ),
    );
  }
}

class _HotTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabs = ['The Club Select', 'The Club Hotel'];
    return Row(
      children: List.generate(tabs.length, (index) {
        final selected = index == 0;
        return Padding(
          padding: EdgeInsets.only(right: context.sw(16)),
          child: Text(
            tabs[index],
            style: TextStyle(
              fontSize: context.sp(12),
              color: selected ? AppColors.primaryIndigo : AppColors.textMuted,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              decoration: selected ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        );
      }),
    );
  }
}

class _TrendingCard extends StatelessWidget {
  const _TrendingCard({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.of(context).pushNamed(
      //   AppRoutes.details,
      //   arguments: DetailsArgs(
      //     title: 'Bali Seascape Beach\nClub-Rental',
      //     location: 'Candiclasa, Indonesia',
      //     price: 699,
      //     imageUrl: _images[index % _images.length],
      //   ),
      // ),
      child: Container(
        width: context.sw(180),
        // padding: EdgeInsets.all(context.sw(10)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
              child: Image.network(
                _images[index % _images.length],
                height: context.sh(95),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // SizedBox(height: context.sh(8)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: context.sw(8), vertical: context.sh(4)),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9F0FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Use Maximum Loyalty Points',
                      style: TextStyle(fontSize: context.sp(9), color: AppColors.primaryIndigo),
                    ),
                  ),
                  SizedBox(height: context.sh(8)),
                  Text(
                    'Bali Seascape Beach\nClub-Rental',
                    style: TextStyle(fontSize: context.sp(12), fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: context.sh(4)),
                  Text('Candiclasa, Indonesia', style: TextStyle(fontSize: context.sp(10), color: AppColors.textMuted)),
                  SizedBox(height: context.sh(6)),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.orange),
                      SizedBox(width: context.sw(4)),
                      Text('4.5', style: TextStyle(fontSize: context.sp(10))),
                      const Spacer(),
                      Image.asset(AppAssets.loyaltyPointsStackedPng, height: 30,)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final heroTag = 'experience-$index';
    return GestureDetector(
      // onTap: () => Navigator.of(context).pushNamed(
      //   AppRoutes.details,
      //   arguments: DetailsArgs(
      //     title: 'Mediterranean Cruise Experience',
      //     location: 'Mediterranean Sea',
      //     price: 699,
      //     imageUrl: _cruiseImages[index % _cruiseImages.length],
      //     heroTag: heroTag,
      //   ),
      // ),
      child: Container(
        width: context.sw(290),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Hero(
                tag: heroTag,
                child: Image.network(
                  _cruiseImages[index % _cruiseImages.length],
                  height: context.sh(130),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(context.sw(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mediterranean Cruise\nExperience', style: TextStyle(fontSize: context.sp(12), fontWeight: FontWeight.w600)),
                  SizedBox(height: context.sh(6)),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.clockSvg, height: 20,),
                      SizedBox(width: context.sw(4)),
                      Text('Starts 2nd Nov 2025', style: TextStyle(fontSize: context.sp(10), color: AppColors.textMuted)),
                    ],
                  ),
                  SizedBox(height: context.sh(4)),
                  Text('8 Days 7 Nights', style: TextStyle(fontSize: context.sp(10), color: AppColors.textMuted)),
                  SizedBox(height: context.sh(10)),
                  Text('\$699', style: TextStyle(fontSize: context.sp(16), fontWeight: FontWeight.w700, color: AppColors.textDark)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  const _OutlineButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.sh(44),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.primaryIndigo),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(fontSize: context.sp(13), color: AppColors.primaryIndigo, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _FlashDealCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1505691938895-1758d7feb511?auto=format&fit=crop&w=900&q=80'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(context.sw(16)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.black.withValues(alpha: 0.6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flash Deals', style: TextStyle(fontSize: context.sp(16), fontWeight: FontWeight.w600, color: Colors.white)),
            SizedBox(height: context.sh(4)),
            Text('Every day, we bring you 3 world-class\nunbeatable hotel offers!', style: TextStyle(fontSize: context.sp(11), color: Colors.white70)),
            SizedBox(height: context.sh(10)),

            SizedBox(
              height: 350,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return SizedBox(
                    width: context.sh(270),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: context.sh(170),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              image: NetworkImage('https://images.unsplash.com/photo-1505691938895-1758d7feb511?auto=format&fit=crop&w=800&q=80'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: context.sh(8)),
                        Text('Millennium Plaza Downtown\nHotel, Dubai', style: TextStyle(fontSize: context.sp(12), fontWeight: FontWeight.w600, color: Colors.white)),
                        SizedBox(height: context.sh(4)),
                        Text('Dubai, United Arab Emirates', style: TextStyle(fontSize: context.sp(10), color: Colors.white70)),
                        SizedBox(height: context.sh(6)),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 14, color: Colors.orange),
                            SizedBox(width: context.sw(4)),
                            Text('4.5', style: TextStyle(fontSize: context.sp(10), color: Colors.white)),
                          ],
                        ),
                        SizedBox(height: context.sh(6)),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: context.sw(10), vertical: context.sh(6)),
                          decoration: BoxDecoration(
                              color: const Color(0xFF3B63FF),
                              borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(colors: [
                                AppColors.primaryBlue,
                                AppColors.primaryIndigo,
                              ])
                          ),
                          child: Text('Book now!', style: TextStyle(fontSize: context.sp(10), color: Colors.white, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder:  (context, index) {
                  return SizedBox(width: context.sw(12));
                },

                itemCount: 4,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class _VisaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.sw(12)),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F7FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: context.sh(50),
            width: context.sw(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(AppAssets.travelVisaPng,),
          ),
          SizedBox(width: context.sw(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Apply for your', style: TextStyle(fontSize: context.sp(10), color: AppColors.textMuted)),
                Text('Travel visa today', style: TextStyle(fontSize: context.sp(13), fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: context.sw(12), vertical: context.sh(8)),
            decoration: BoxDecoration(
              gradient: AppColors.buttonGradient,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text('Get Started', style: TextStyle(fontSize: context.sp(10), color: Colors.white, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}

class _EsimCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEAF8F0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(context.sw(14)),
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('GET YOUR', style: TextStyle(fontSize: context.sp(10), color: AppColors.successGreen, fontWeight: FontWeight.w600)),
                      Text('eSIM', style: TextStyle(fontSize: context.sp(46), fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Image.asset(AppAssets.esimPng, height: 100,),
          ),
        ],
      ),
    );
  }
}


class _HomeBottomNav extends StatelessWidget {
  const _HomeBottomNav();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: BottomAppBar(
                // shape: const CircularNotchedRectangle(),
                color: AppColors.white,
                elevation: 1,
                shadowColor: Colors.grey,
                notchMargin: 8,
                child: Container(
                  color: AppColors.white,
                  height: context.sh(64),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _NavItem(iconSvg: AppAssets.homeSvg, label: 'Home', selected: state.selectedNav == 0, onTap: () => context.read<HomeCubit>().selectNav(0)),
                      _NavItem(iconSvg: AppAssets.myTripSvg, label: 'My Trips', selected: state.selectedNav == 1, onTap: () => context.read<HomeCubit>().selectNav(1)),
                      SizedBox(width: context.sw(40)),
                      _NavItem(iconSvg: AppAssets.wishlistSvg, label: 'Wishlist', selected: state.selectedNav == 2, onTap: () => context.read<HomeCubit>().selectNav(2)),
                      _NavItem(iconSvg: AppAssets.accountSvg, label: 'Account', selected: state.selectedNav == 3, onTap: () => context.read<HomeCubit>().selectNav(3)),
                    ],
                  ),
                ),
              ),
            ),
            Image.asset(AppAssets.primaryButtonPng, height: 100,)
          ],
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.iconSvg, required this.label, required this.selected, required this.onTap});

  final String iconSvg;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primaryIndigo : AppColors.textMuted;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(iconSvg, height: context.sw(20), colorFilter: ColorFilter.mode(color, BlendMode.srcIn),),
          // Icon(icon, size: context.sw(20), color: color),
          SizedBox(height: context.sh(2)),
          Text(label, style: TextStyle(fontSize: context.sp(10), color: color)),
        ],
      ),
    );
  }
}

class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.5, size.height, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

final List<String> _images = [
  'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=800&q=80',
];

final List<String> _cruiseImages = [
  'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=900&q=80',
  'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=900&q=80',
  'https://images.unsplash.com/photo-1473186578172-c141e6798cf4?auto=format&fit=crop&w=900&q=80',
];
