#pragma once
#include <filesystem>
namespace fs = std::experimental::filesystem;

class SettingsManager {
public:
	static const std::wstring APPLICATION_PATH_NAME;
	fs::path & getApplicationPath() const;
};
