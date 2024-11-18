#include "ncpch.h"
#include "Application.h"

#include "Nutcracker/Log.h"
#include "Nutcracker/Events/ApplicationEvent.h"

namespace Nutcracker {

	Application::Application() {

	}

	Application::~Application() {

	}

	void Application::Run() {
		WindowResizeEvent event(1200, 720);
		NC_TRACE(event)

		while (true);
	}

}


