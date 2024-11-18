#pragma once

#ifdef NC_PLATFORM_WINDOWS

extern Nutcracker::Application* Nutcracker::CreateApplication();

int main(int argc, char** argv)
{
	Nutcracker::Log::Init();
	NC_CORE_WARN("Initialised Log!");
	
	auto app = Nutcracker::CreateApplication();
	app->Run();
	delete app;
}

#endif