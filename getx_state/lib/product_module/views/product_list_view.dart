import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/common_module/AppColor.dart';
import 'package:getx_state/common_module/AppString.dart';
import 'package:getx_state/product_module/controllers/product_controller.dart';

class ProductListView extends StatelessWidget {
  ProductListView({super.key});
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppString.fetchApiData)),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColor.purpleColor,
          ));
        } else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        margin: const EdgeInsets.fromLTRB(
                          16,
                          8,
                          8,
                          8,
                        ),
                        child: ClipRect(
                            child: Image.network(
                          productController.productList[index].imageLink,
                          width: 150,
                          height: 100,
                          fit: BoxFit.fill,
                          color: AppColor.purpleColor,
                          colorBlendMode: BlendMode.color,
                        )),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(productController.productList[index].brand),
                    ],
                  )
                ],
              );
            },
          );
        }
      }),
    );
  }
}
