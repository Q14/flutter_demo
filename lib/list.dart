import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'Item.dart';

class ListDemo extends StatefulWidget {
  @override
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> with SingleTickerProviderStateMixin {
   List<String> data1 = [];

  RefreshController _refreshController1 =
      RefreshController(initialRefresh: true);

      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 10; i++) {
      data1.add("Item $i");
    }
  }

  void _onRefresh(RefreshController controller, List<String> data) async {
    //monitor fetch data from network
    await Future.delayed(Duration(milliseconds: 1000));

    if (data.length == 0) {
      for (int i = 0; i < 10; i++) {
        data.add("Item $i");
      }
//      pageIndex++;
    }
    if (mounted) setState(() {});
    controller.refreshCompleted();

    /*
        if(failed){
         _refreshController.refreshFailed();
        }
      */
  }

  void _onLoading(RefreshController controller, List<String> data) async {
    //monitor fetch data from network
    await Future.delayed(Duration(milliseconds: 2000));
    for (int i = 0; i < 10; i++) {
      data.add("Item $i");
    }
//    pageIndex++;
    if (mounted) setState(() {});
    controller.loadComplete();
  }

  Widget buildList() {
    return ListView.separated(
      padding: EdgeInsets.only(left: 5, right: 5),
      itemBuilder: (c, i) => Item(
        title: data1[i],
      ),
      separatorBuilder: (context, index) {
        return Container(
          height: 0.5,
          color: Colors.greenAccent,
        );
      },
      itemCount: data1.length,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: SmartRefresher(
              child: buildList(),
              controller: _refreshController1,
              enablePullUp: true,
              header: WaterDropHeader(),
              onRefresh: () {
                _onRefresh(_refreshController1, data1);
              },
              onLoading: () {
                _onLoading(_refreshController1, data1);
              },
      ),
      ),
    );
  }
}