#include "uWS/uWS.h"
#include "spdlog/spdlog.h"

#include "SettingsManager.h"

namespace spd = spdlog;

int main() {
	auto console = spd::stdout_color_mt("console");
	console->info("Welcome to spdlog!");

	auto s = SettingsManager();
	console->info(s.getApplicationPath().native());
	uWS::Hub h;
	h.listen(40500);
	h.onMessage([](uWS::WebSocket<uWS::SERVER> *ws, char *message, size_t length, uWS::OpCode opCode) {
		ws->send(message, length, opCode);
	});

	h.run();
	console->info("Done");
	return 0;
}
