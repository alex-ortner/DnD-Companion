#include <vector>
#include <map>

using std::vector;

namespace dnd{
  class dnd_map{
    vector<vector<int>> tiles;
    int width, height;
  };
}