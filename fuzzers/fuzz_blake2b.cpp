#include <string>
#include <iostream>
#include <stdint.h>
#include "digestpp.hpp"

using namespace std;
using namespace digestpp;

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size)
{
	string str(reinterpret_cast<const char *>(data), size);
	str.push_back('\0');
	cout << blake2b(256).absorb(str).hexdigest() << endl;
	return 0;
}
