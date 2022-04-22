
main() {
  int count = 1000000000;// 10 亿
  int start = DateTime.now().millisecondsSinceEpoch;
  int sum = 0;
  for(int i =0;i<count;i++){
    sum+=i;
  }
  int end = DateTime.now().millisecondsSinceEpoch;
  print('${((end-start)/1000).toStringAsFixed(4)} s');
  print(sum);
}
