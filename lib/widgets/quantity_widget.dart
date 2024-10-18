import 'package:flutter/material.dart';

class QuantityInput extends StatefulWidget {
  final Function(int) onChanged;
  final int initialValue;

  const QuantityInput({
    super.key,
    required this.onChanged,
    this.initialValue = 1,
  });

  @override
  _QuantityInputState createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  late TextEditingController _controller;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialValue;
    _controller = TextEditingController(text: _quantity.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _increment() {
    setState(() {
      _quantity++;
      _controller.text = _quantity.toString();
    });
    widget.onChanged(_quantity);
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        _controller.text = _quantity.toString();
      });
      widget.onChanged(_quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: _decrement,
        ),
        SizedBox(
          width: 40,
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: (value) {
              int? newValue = int.tryParse(value);
              if (newValue != null && newValue > 0) {
                setState(() {
                  _quantity = newValue;
                });
                widget.onChanged(_quantity);
              }
            },
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _increment,
        ),
      ],
    );
  }
}