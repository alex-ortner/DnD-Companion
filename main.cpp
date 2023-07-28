#include <iostream>
#include <vector>

using namespace std;
int main(){
  vector<int> int_v = {3,1,4,1,5};
  for(int i : int_v){
    cout << "NR: " << i << endl;
  }
  std::cout << "Hello World!" << std::endl;
  return 0;
}