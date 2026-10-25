#include <stdio.h>

#include "base.h"


i32
main(i32 argc, char** argv)
{
	if (argc == 1) {
		printf("usage: touch <filename1> <filename2> ...\n");
		return 0;
	}

	for (u64 i = 1; i < argc; ++i)
	{
		FILE* f = fopen(argv[i], "a");
		fclose(f);
	}


}
