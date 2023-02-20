import 'dart:async';
import 'dart:ui';

// import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';

class KatalogAppBar extends StatefulWidget {
  final String title;
  final bool isActiveBack;

  const KatalogAppBar({Key? key, required this.title, required this.isActiveBack})
      : super(key: key);

  @override
  State<KatalogAppBar> createState() => _KatalogAppBarState();
}

class _KatalogAppBarState extends State<KatalogAppBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final viewModel = Provider.of<MainProvider>(context);
    return ClipRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 10.0),
            child: Container(
              width: double.infinity,
              height: size.height * 0.2,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(0, 0),
                    topLeft: Radius.elliptical(0, 0),
                  ),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      widget.title == ""
                          ? const Text(
                              "Kategoriyalar",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
                            )
                          : Text(
                              widget.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 45,
                    margin:
                        const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                    child: !widget.isActiveBack
                        ? AnimatedSearchBar(
                            textController: viewModel.textController,
                            isActive: false,
                          )
                        : Column(
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.arrow_back))
                                ],
                              ))
                            ],
                          ),
                  ),
                ],
              ),
            )));
  }
}

class AnimatedSearchBar extends StatefulWidget {
  TextEditingController textController = TextEditingController();
  bool isActive;

  AnimatedSearchBar(
      {Key? key, required this.textController, required this.isActive})
      : super(key: key);

  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar>
    with TickerProviderStateMixin {
  _initTimer() {
    Timer(const Duration(milliseconds: 400), () {
      _controller.forward();
    });
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      height: size.height * 0.11,
      width: widget.isActive ? size.width : size.width * 0.13,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      duration: const Duration(milliseconds: 350),
      child: Stack(alignment: AlignmentDirectional.center, children: [
        AnimatedContainer(
          width: widget.isActive
              ? MediaQuery.of(context).size.width * 0.7
              : size.width * 0.000000,
          duration: const Duration(milliseconds: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 800),
                      curve: widget.isActive ? Curves.easeInBack : Curves.ease,
                      // curve: Curves.easeInBack,
                      opacity: widget.isActive ? 1.0 : 0,
                      child: TextField(
                        controller: widget.textController,
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: " Nimani izlayapsiz?...",
                          hintStyle: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                        onSubmitted: (value) {},
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: widget.isActive
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.end,
              mainAxisAlignment: widget.isActive
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    widget.textController.clear();
                  },
                  child: RotationTransition(
                      turns: _animation,
                      child: const Icon(
                        Icons.clear,
                      )),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 3),
                  width: size.width * 0.12,
                  height: size.height * 0.0574512,
                  // padding: EdgeInsets.only(left: 10,top: 10,bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        // _controller.forward();

                        !widget.isActive
                            ? _controller.repeat()
                            : _controller.reverse();
                        _initTimer();

                        !widget.isActive
                            ? widget.isActive = true
                            : widget.isActive = false;
                      });
                    },
                    child: !widget.isActive
                        ? const Icon(Icons.search)
                        : const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
