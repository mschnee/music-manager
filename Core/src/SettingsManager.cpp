#include "SettingsManager.h"

#if defined(PRODUCTION)
const std::wstring SettingsManager::APPLICATION_PATH_NAME = L"music-manager";
#else
const std::wstring SettingsManager::APPLICATION_PATH_NAME = L"music-manager-dev";
#endif