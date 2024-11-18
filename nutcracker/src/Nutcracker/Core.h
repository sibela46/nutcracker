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

#ifdef NC_ENABLE_ASSERTS
	#define  NC_ASSERT(x, ...) if (!(x)) { NC_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define  NC_CORE_ASSERT(x, ...) if (!(x)) { NC_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define NC_ASSERT(x, ...)
	#define NC_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << (x))