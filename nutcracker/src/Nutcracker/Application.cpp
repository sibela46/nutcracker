#include "ncpch.h"
#include "Application.h"

#include "Nutcracker/Log.h"
#include "Nutcracker/Events/ApplicationEvent.h"

namespace Nutcracker {

	Application::Application() {
		m_Window = std::unique_ptr<Window>(Window::Create());
	}

	Application::~Application() {

	}

	void Application::Run() {
		while (m_Running) {
			m_Window->OnUpdate();
		}
	}

}


