import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavenda/Views/Tools/mood.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class Journal extends StatefulWidget {
  const Journal({super.key});

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  final quill.QuillController _controller = quill.QuillController(
    document: quill.Document(),
    selection: TextSelection.collapsed(offset: 0),
  );
  //final _titlecontroller = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  AnimatedEmojiData currentMood = AnimatedEmojis.smile; // Default mood
  String dayOfWeek = '';
  String day = '';
  String month = '';
  String year = '';

  @override
  void dispose() {
    _scrollController
        .dispose(); // Dispose of the ScrollController when not needed
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getCurrentDate();
  }

  void _getCurrentDate() {
    DateTime now = DateTime.now();
    setState(() {
      dayOfWeek = DateFormat('EEEE')
          .format(now); // Full name of the day (e.g., "Monday")
      day = DateFormat('dd').format(now); // Day of the month (e.g., "10")
      month = DateFormat('MMMM')
          .format(now); // Full name of the month (e.g., "August")
      year = DateFormat('yyyy').format(now); // Year (e.g., "2024")
    });
  }

  void _showChangeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Feeling something different?'),
          content: Text('Click to change mood that reflects your emotion'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                final selectedMood = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mood()),
                );
                if (selectedMood != null) {
                  setState(() {
                    currentMood = selectedMood;
                  });
                }
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Return'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: //PreferredSize(
            // preferredSize: , // AppBar height
            AppBar(
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/h1.jpg',
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black
                    .withOpacity(0.5), // Optional overlay for text readability
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            'Lavenda',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                print("saved");
              },
              icon: Icon(Icons.save),
              color: Colors.white,
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 162, 130, 218), // Start color
                        Color.fromARGB(255, 202, 120, 216), // End color
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.sp, right: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 16),
                                        child: Text(
                                          '$day',
                                          style: GoogleFonts.patrickHand(
                                            color: Colors.white,
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.sp),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '$month $year',
                                              style: GoogleFonts.patrickHand(
                                                color: Colors.white,
                                                fontSize: 20.sp,
                                              ),
                                            ),
                                            Text(
                                              "$dayOfWeek",
                                              style: GoogleFonts.patrickHand(
                                                color: Colors.white,
                                                fontSize: 20.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: _showChangeDialog,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.sp, right: 15.sp),
                                  child: Container(
                                    width: 40.sp,
                                    height: 40.sp,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(174, 179, 157, 219),
                                      shape: BoxShape
                                          .circle, // Makes the container round
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        AnimatedEmoji(
                                          currentMood,
                                          size: 36
                                              .sp, // Adjust size to fit well within the container
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: SingleChildScrollView(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                        width: 300.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.white
                                                  .withOpacity(0.3)),
                                        ),
                                        child: Column(children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 30, top: 20),
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                hintText: 'Title',
                                                border: InputBorder.none,
                                              ),
                                              style: GoogleFonts.patrickHand(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 27.sp,
                                              ),
                                              autofocus: true,
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 30, top: 10),
                                              child: SizedBox(
                                                height: 30.h,
                                                child: quill.QuillEditor(
                                                  controller: _controller,
                                                  scrollController:
                                                      _scrollController,
                                                  configurations: quill
                                                      .QuillEditorConfigurations(
                                                    padding: EdgeInsets.all(8),
                                                    scrollable: true,
                                                    autoFocus: true,
                                                    expands: true,
                                                    placeholder:
                                                        "Start typing here . . .",
                                                  ),
                                                  focusNode: FocusNode(),
                                                ),
                                              ))
                                        ]))))),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
                child: quill.QuillToolbar.simple(
                    controller: _controller,
                    configurations: quill.QuillSimpleToolbarConfigurations(
                        showBoldButton: true,
                        showRedo: true,
                        showFontFamily: true,
                        showUndo: true,
                        showItalicButton: true,
                        showUnderLineButton: true,
                        showAlignmentButtons: false,
                        showBackgroundColorButton: false,
                        showCenterAlignment: false,
                        showClearFormat: true,
                        showClipboardCopy: false,
                        showClipboardCut: false,
                        showClipboardPaste: false,
                        showCodeBlock: false,
                        showColorButton: false,
                        showDirection: false,
                        showDividers: false,
                        showFontSize: true,
                        showHeaderStyle: false,
                        showIndent: false,
                        showInlineCode: false,
                        showJustifyAlignment: false,
                        showLeftAlignment: false,
                        showLineHeightButton: false,
                        showLink: false,
                        showSearchButton: false,
                        showListBullets: true,
                        showListCheck: false,
                        showListNumbers: false,
                        showQuote: false,
                        showRightAlignment: false,
                        showSmallButton: false,
                        showStrikeThrough: false,
                        showSubscript: false,
                        showSuperscript: false,
                        color: Colors.deepPurple)),
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.format_bold),
                      onPressed: () {
                        print("Bold");
                        final selection = _controller.selection;
                        final length = selection.end - selection.start;
                        if (length > 0) {
                          _controller.formatText(
                              selection.start, length, quill.BoldAttribute());
                        }
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.format_italic),
                      onPressed: () {
                        print("Italic");
                        final selection = _controller.selection;
                        final length = selection.end - selection.start;
                        if (length > 0) {
                          _controller.formatText(
                              selection.start, length, quill.ItalicAttribute());
                        }
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.format_underline),
                      onPressed: () {
                        final selection = _controller.selection;
                        final length = selection.end - selection.start;
                        if (length > 0) {
                          _controller.formatText(selection.start, length,
                              quill.UnderlineAttribute());
                        }
                        print("Underline");
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.undo),
                      onPressed: () {
                        print("Undo");
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.redo),
                      onPressed: () {
                        print("Redo");
                      },
                    ),
                    Expanded(
                        child: Center(
                            child: ValueListenableBuilder(
                      valueListenable: _titlecontroller,
                      builder: (context, text, child) {
                        return Text(
                          _titlecontroller.text,
                        );
                      },
                    ))),
                  ],
                ))*/
              ),
            ],
          ),
        ));
  }
}
