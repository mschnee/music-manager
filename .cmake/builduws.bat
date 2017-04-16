set _install_prefix=%1
set INCLUDE=%_install_prefix%/include/uv;%_install_prefix%/include;%INCLUDE%
set LIBPATH=%_install_prefix%/bin;%_install_prefix%/lib;%LIBPATH%

echo msbuild /p:Configuration=Release /m VC++.vcxproj
msbuild /p:Configuration=Release  /p:IncludePath="%INCLUDE%" /p:AdditionalLibPaths="%LIBPATH%" VC++.vcxproj