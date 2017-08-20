#include <gtest/gtest.h>
#include "../src/SettingsManager.h"


TEST(SettingsManager, DefaultTest) {
	EXPECT_EQ(1, 1);
}

TEST(SettingsManager, WindowsTest) {
	SettingsManager m;
	ASSERT_EQ(m.getApplicationPath().generic_string(), std::string(".")) << m.getApplicationPath().generic_string();
}

