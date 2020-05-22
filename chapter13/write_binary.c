#include <stdio.h>

int main() {
	struct {
		int x;
		char code[3];
		float value;
	} record = { 5319, { 0, 0, 0 }, 1.0 };
	fwrite(&record, sizeof (record), 1, stdout);
	return 0;
}