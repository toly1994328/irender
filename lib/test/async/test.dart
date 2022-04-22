
main() {
  int count = 1000000000;// 10 亿
  int start = DateTime.now().millisecondsSinceEpoch;
  for(int i =0;i<count;i++){
    Point(i, i);
  }
  int end = DateTime.now().millisecondsSinceEpoch;
  print('${((end-start)/1000).toStringAsFixed(4)} s');
}

class Point{
   int x;
   int y;

   Point(this.x, this.y);
}