import 'package:fitmemax/Services/apiProvider.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Blog extends StatefulWidget {
  final String blogId;

  const Blog({Key key, this.blogId}) : super(key: key);
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
//   var htmlData = """
// <h1>Header 1</h1>
// <h2>Header 2</h2>
// <h3>Header 3</h3>
// <h4>Header 4</h4>
// <h5>Header 5</h5>
// <h6>Header 6</h6>
// <h3>Ruby Support:</h3>
//       <p>
//         <ruby>
//           漢<rt>かん</rt>
//           字<rt>じ</rt>
//         </ruby>
//         &nbsp;is Japanese Kanji.
//       </p>
//       <h3>Support for <code>sub</code>/<code>sup</code></h3>
//       Solve for <var>x<sub>n</sub></var>: log<sub>2</sub>(<var>x</var><sup>2</sup>+<var>n</var>) = 9<sup>3</sup>
//       <p>One of the most <span>common</span> equations in all of physics is <br /><var>E</var>=<var>m</var><var>c</var><sup>2</sup>.</p>
//       <h3>Inline Styles:</h3>
//       <p>The should be <span style='color: blue;'>BLUE style='color: blue;'</span></p>
//       <p>The should be <span style='color: red;'>RED style='color: red;'</span></p>
//       <p>The should be <span style='color: rgba(0, 0, 0, 0.10);'>BLACK with 10% alpha style='color: rgba(0, 0, 0, 0.10);</span></p>
//       <p>The should be <span style='color: rgb(0, 97, 0);'>GREEN style='color: rgb(0, 97, 0);</span></p>
//       <p>The should be <span style='background-color: red; color: rgb(0, 97, 0);'>GREEN style='color: rgb(0, 97, 0);</span></p>
//       <p style="text-align: center;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
//       <p style="text-align: right;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
//       <p style="text-align: justify;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
//       <p style="text-align: center;"><span style="color: rgba(0, 0, 0, 0.95);">blasdafjklasdlkjfkl</span></p>
//       <h3>Table support (with custom styling!):</h3>
//       <p>
//       <q>Famous quote...</q>
//       </p>
//       <table>
//       <colgroup>
//         <col width="50%" />
//         <col width="25%" />
//         <col width="25%" />
//       </colgroup>
//       <thead>
//       <tr><th>One</th><th>Two</th><th>Three</th></tr>
//       </thead>
//       <tbody>
//       <tr>
//         <td>Data</td><td>Data</td><td>Data</td>
//       </tr>
//       <tr>
//         <td>Data</td><td>Data</td><td>Data</td>
//       </tr>
//       </tbody>
//       <tfoot>
//       <tr><td>fData</td><td>fData</td><td>fData</td></tr>
//       </tfoot>
//       </table>
//       <h3>Custom Element Support:</h3>
//       <flutter></flutter>
//       <flutter horizontal></flutter>
//       <h3>SVG support:</h3>
//       <svg id='svg1' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'>
//             <circle r="32" cx="35" cy="65" fill="#F00" opacity="0.5"/>
//             <circle r="32" cx="65" cy="65" fill="#0F0" opacity="0.5"/>
//             <circle r="32" cx="50" cy="35" fill="#00F" opacity="0.5"/>
//       </svg>
//       <h3>List support:</h3>
//       <ol>
//             <li>This</li>
//             <li><p>is</p></li>
//             <li>an</li>
//             <li>
//             ordered
//             <ul>
//             <li>With<br /><br />...</li>
//             <li>a</li>
//             <li>nested</li>
//             <li>unordered
//             <ol>
//             <li>With a nested</li>
//             <li>ordered list.</li>
//             </ol>
//             </li>
//             <li>list</li>
//             </ul>
//             </li>
//             <li>list! Lorem ipsum dolor sit amet.</li>
//             <li><h2>Header 2</h2></li>
//             <h2><li>Header 2</li></h2>
//       </ol>
//       <h3>Link support:</h3>
//       <p>
//         Linking to <a href='https://github.com'>websites</a> has never been easier.
//       </p>
//       <h3>Image support:</h3>
//       <p>
//         <img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' />
//         <a href='https://google.com'><img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' /></a>
//         <img alt='Alt Text of an intentionally broken image' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30d' />
//       </p>
//       <h3>Video support:</h3>
//       <video controls>
//         <source src="https://www.w3schools.com/html/mov_bbb.mp4" />
//       </video>
//       <h3>Audio support:</h3>
//       <audio controls>
//         <source src="https://www.w3schools.com/html/mov_bbb.mp4" />
//       </audio>
//       <h3>IFrame support:</h3>
//       <iframe src="https://google.com"></iframe>
// """;
  bool isLoading = false;
  var blogs;

  getBlogDetail() async {
    try {
      setState(() {
        isLoading = true;
      });
      blogs = await ApiProvider().getBlogDetail(widget.blogId);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getBlogDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        brightness: Brightness.light,
        centerTitle: false,
        title: Text(
          "Blogs",
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        progressIndicator: SpinKitCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Palette.x1Color,
              ),
            );
          },
        ),
        child: blogs != null && blogs != ""
            ? ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.network(
                              blogs["data"]["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Title",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          blogs["data"]["title"],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Category Name",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          blogs["data"]["category_name"],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Short Description",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          blogs["data"]["short_description"],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Long Description",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          blogs["data"]["long_description"],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )
                ],
              )
            : SizedBox(),
      ),
    );
  }
}
