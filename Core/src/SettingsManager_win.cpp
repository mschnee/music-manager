#if defined(WIN32)
#include "SettingsManager.h"
#include <Shlobj.h>
#pragma lib(Shell32.dll)

fs::path& SettingsManager::getApplicationPath() const {
	PWSTR path = NULL;

	fs::path pathResult;
	
	auto result = SHGetKnownFolderPath(FOLDERID_LocalAppData, 0, NULL, &path);
		
	if (result == S_OK) {
		pathResult = fs::path(path).append(SettingsManager::APPLICATION_PATH_NAME);
	}
	else {
		pathResult = fs::path(".config").append(SettingsManager::APPLICATION_PATH_NAME);
	}

	if (path != nullptr) {
		CoTaskMemFree(path);
	}

	return pathResult;
};
#endif