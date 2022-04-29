
void main() {
  BuildOwner owner = BuildOwner();
  owner.buildScope();
}

class BuildOwner{
  bool? _dirtyElementsNeedsResorting;

  void scheduleBuildFor() {
    _dirtyElementsNeedsResorting = true;
  }

  void buildScope() {
    _dirtyElementsNeedsResorting = false;
    // 模拟耗时
    rebuild();
    if(_dirtyElementsNeedsResorting!){
      print('_dirtyElementsNeedsResorting:true');
    }else{
      print('_dirtyElementsNeedsResorting:false');
    }
  }

  void rebuild(){
    int start = DateTime.now().millisecondsSinceEpoch;
    for(int i = 0;i<1000000000;i++){
      if(i==400){
        scheduleBuildFor();
      }
    }
    int end = DateTime.now().millisecondsSinceEpoch;
    print(end-start);
  }
}