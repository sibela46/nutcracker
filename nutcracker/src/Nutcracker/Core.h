#pragma once

#ifdef NC_PLATFORM_WINDOWS
	#ifdef NC_BUILD_DLL
		#define NUTCRACKER_API __declspec(dllexport)
	#else
		#define NUTCRACKER_API __declspec(dllimport)
	#endif
#else
	#error Nutcracker only supports Windows
#endif
