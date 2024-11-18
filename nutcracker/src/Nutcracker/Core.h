#pragma once

#ifdef NC_PLATFORM_WINDOWS
	#ifdef NC_BUILD_DLL
		#define Nutcracker_API __declspec(dllexport)
	#else
		#define Nutcracker_API __declspec(dllimport)
	#endif
#else
	#error Nutcracker only supports Windows
#endif

#define BIT(x) (1 << (x))