import 'package:flutter/material.dart';
import 'stationery_item.dart';

class DetailPage extends StatefulWidget {
  final StationeryItem stationeryItem;

  const DetailPage({super.key, required this.stationeryItem});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late TextEditingController _quantityController;
  int _currentTotal = 0;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(text: widget.stationeryItem.stock.toString());
    _currentTotal = widget.stationeryItem.totalPrice;
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void _updateTotal(String value) {
    int stock = int.tryParse(value) ?? 0;
    setState(() {
      _currentTotal = stock * widget.stationeryItem.price;
    });
  }

   void _updateStock(String value) {
    int stock = int.tryParse(value) ?? 0;
    setState(() {
      _currentTotal = stock - widget.stationeryItem.stock;
    });
  }

  void _saveOrder() {
    int newQty = int.tryParse(_quantityController.text) ?? 0;
    setState(() {
      widget.stationeryItem.stock = newQty;
    });
    Navigator.pop(context, true);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.stationeryItem.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  widget.stationeryItem.imageUrl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image, size: 250, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.stationeryItem.name,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Rp ${widget.stationeryItem.formattedPrice} / item',
                        style: const TextStyle(fontSize: 14, color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.stationeryItem.description,
                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Jumlah item',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      //  const Text(
                      //   'Deskripsi',
                      //   style: TextStyle(fontSize: 12, color: Colors.grey),
                      // ),
                      //  const Text(
                      //   'Stock',
                      //   style: TextStyle(fontSize: 12, color: Colors.grey),
                      // ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _quantityController,
                        keyboardType: TextInputType.number,
                        onChanged: _updateTotal,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.list),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(
                            'Rp ${formatPrice(_currentTotal)}',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 16),
                      // Center(
                      //   child: Text(
                      //   'Deskripsi ${widget.stationeryItem.name}?',
                      //     textAlign: TextAlign.center,
                      //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _saveOrder,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('SIMPAN PESANAN', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}