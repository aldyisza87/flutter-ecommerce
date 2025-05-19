import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/common/currency_format_ext.dart';
import 'package:flutter_ecommerce/data/bloc/get_products/get_products_bloc.dart';

class ListProductWidget extends StatefulWidget {
  const ListProductWidget({super.key});

  @override
  State<ListProductWidget> createState() => _ListProductWidgetState();
}

class _ListProductWidgetState extends State<ListProductWidget> {
  bool _hasFetched = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasFetched) {
      context.read<GetProductsBloc>().add(DoGetProductsEvent());
      _hasFetched = true;
    }
  }

  Future _onRefresh() async {
    context.read<GetProductsBloc>().add(DoGetProductsEvent());
    await Future.delayed(Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsBloc, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsError) {
          return const Center(
            child: Text('Data Erorr'),
          );
        }
        if (state is GetProductsLoaded) {
          if (state.data.data!.isEmpty) {
            return Center(
              child: Text('No Data Available'),
            );
          }
          return RefreshIndicator(
            color: Colors.deepOrangeAccent,
            onRefresh: () async {
              await Future.delayed(
                Duration(milliseconds: 300),
              );
              _onRefresh;
            },
            child: GridView.builder(
              physics: const ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemCount: state.data.data!.length,
              itemBuilder: (context, index) {
                final product = state.data.data![index];
                final attrs = product.attributes!;

                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gambar Produk
                      AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Hero(
                            tag: attrs.image!,
                            child: Image.network(
                              attrs.image!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.broken_image, size: 40),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Nama dan Harga Produk
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              attrs.name ?? 'No name',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              CurrencyFormatExt.convertToIdr(
                                  attrs.price ?? 0, 0),
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),

                            // Tombol Beli
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.shopping_bag_outlined,
                                      size: 20, color: Colors.white),
                                  onPressed: () {
                                    // aksi beli
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
