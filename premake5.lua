workspace "Nutcracker"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Nutcracker/vendor/GLFW/include"

include "Nutcracker/vendor/GLFW"

project "Nutcracker"
	location "Nutcracker"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "ncpch.h"
	pchsource "Nutcracker/src/ncpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links
	{
		"GLFW",
		"opengl32.lib",
		"dwmapi.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"NC_PLATFORM_WINDOWS",
			"NC_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "NC_DEBUG"
		symbols "On"
		buildoptions {"/utf-8"}

	filter "configurations:Release"
		defines "NC_Release"
		optimize "On"
		buildoptions {"/utf-8"}

	filter "configurations:Dist"
		defines "NC_Release"
		optimize "On"
		buildoptions {"/utf-8"}

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Nutcracker/vendor/spdlog/include",
		"Nutcracker/src"
	}

	links
	{
		"Nutcracker"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"NC_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "NC_DEBUG"
		symbols "On"
		buildoptions {"/utf-8"}

	filter "configurations:Release"
		defines "NC_Release"
		optimize "On"
		buildoptions {"/utf-8"}

	filter "configurations:Dist"
		defines "NC_Release"
		optimize "On"
		buildoptions {"/utf-8"}
