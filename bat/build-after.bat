echo "■■■■■■■■■■■■■■■■■■■■■■ 编译完成 ■■■■■■■■■■■■■■■■■■■■■■"
dotnet pack -o unpkgs --no-build
echo "■■■■■■■■■■■■■■■■■■■■■■ 打包完成 ■■■■■■■■■■■■■■■■■■■■■■"
for /r . %%a in (unpkgs\*.nupkg) do (
    md "d:\appdata\nuget_local\"
    echo "■■■■■■■■■■■■■■■■■■■■■■ 安装到本地 ■■■■■■■■■■■■■■■■■■■■■■"
    dotnet nuget push "%%a" -s "d:\appdata\nuget_local"
)
echo "■■■■■■■■■■■■■■■■■■■■■■ 安装完成 ■■■■■■■■■■■■■■■■■■■■■■"
del unpkgs /f /s /q
