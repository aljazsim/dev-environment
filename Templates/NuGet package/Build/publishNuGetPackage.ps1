param(
	[string] $projectName = "ProjectTemplate",
	[string] $projectVersion = "1.0.0",
	[string] $nugetKey="")

$ErrorPreference = "Stop"

$msbuild = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\msbuild.exe"
$nuget = "C:\Program Files (x86)\NuGet\nuget.exe"

$projectFilePath = "..\Source\$projectName\$projectName.csproj";
$nugetPackageFilePath = "..\Source\$projectName\bin\Release\$projectName.$projectVersion.nupkg"

# remove references to stylecop and fxcop before publishing
(Get-Content $projectFilePath) -replace ".*StyleCop.*", "" | Out-File $projectFilePath
(Get-Content $projectFilePath) -replace ".*FxCop.*", "" | Out-File $projectFilePath

# build package
& "$msbuild" "$projectFilePath" /t:pack /p:Configuration=Release

# publish package
& "$nuget" push "$nugetPackageFilePath" $nugetKey -Source https://api.nuget.org/v3/index.json