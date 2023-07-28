#include <string>
#include <vector>
#include <map>
#include "../res/store.hpp"

using std::string;
using std::vector;
using std::map;

namespace dnd
{
  class fileHandler
  {
    string m_file_name;
    fileHandler(string);
    fileHandler(const fileHandler&) = delete;
    ~fileHandler() = default;
    int readFile(storage&);
    int writeFile(storage&);
  };

}