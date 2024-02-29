import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category_model.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      appBar: createAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [searchField(), categoriesSection()],
      ),
    );
  }

  Column categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => const SizedBox(
                    width: 25,
                  ),
              itemBuilder: (context, index) {
                return categoryBox(categories[index]);
              }),
        ),
      ],
    );
  }

  Container categoryBox(CategoryModel category) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: category.boxColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(category.iconPath),
            ),
          ),
          Text(
            category.name,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 14
            )
          )
        ],
      ),
    );
  }

  Column searchField() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color(0x201D1617), blurRadius: 40, spreadRadius: 0.0)
          ]),
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Search Pancake',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: searchMagnifierIcon(),
                suffixIcon: searchFiltersIcon(),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none)),
          ),
        )
      ],
    );
  }

  Padding searchMagnifierIcon() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SvgPicture.asset('assets/icons/Search.svg'),
    );
  }

  SizedBox searchFiltersIcon() {
    return SizedBox(
      width: 52,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const VerticalDivider(
              color: Color(0xFFBBB8B8),
              thickness: 0.1,
              indent: 5,
              endIndent: 5,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 4, right: 12),
                child: SvgPicture.asset('assets/icons/Filter.svg')),
          ],
        ),
      ),
    );
  }

  AppBar createAppBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      leading: createBackButton(),
      actions: [createMenuButton()],
    );
  }

  GestureDetector createMenuButton() {
    return GestureDetector(
        onTap: () {
          print("Tap Menu");
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 37,
          decoration: BoxDecoration(
              color: const Color(0xFFE2E3E3),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset('assets/icons/dots.svg', width: 5, height: 5),
        ));
  }

  GestureDetector createBackButton() {
    return GestureDetector(
        onTap: () {
          print("Tap Back");
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xFFE2E3E3),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg',
              width: 26, height: 26),
        ));
  }
}
