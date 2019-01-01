# NuGet package template

This template will help you getting started quickly with developing a new NuGet package. It allows you to develop a .NET library written in C# with enforcing coding styles, unit tests with code coverage and PowerShell scripts for deploying the package.

| Development platform | IDE                         | Framework | Programming language | Coding standards | Testing | Code coverage              |
| -------------------- | --------------------------- | --------- | -------------------- | ---------------- | ------- | -------------------------- |
| Microsoft Windows 10 | Microsoft VisualStudio 2017 | .NET Core | C#                   | StyleCop         | MSTest  | OpenCover, ReportGenerator |

## Prerequisites

For using this template you'll need:

* Microsoft Windows 10,
* Microsoft Visual Studio Community or higher.

Suggested Visual Studio extensions:

* [GhostDoc](https://submain.com/products/ghostdoc.aspx) for easily generating code documentation,
* [CodeMaid](http://www.codemaid.net/) for easily organizing, formatting and navigation code,
* [Productivity Power Tools](https://marketplace.visualstudio.com/items?itemName=VisualStudioPlatformTeam.ProductivityPowerPack2017) and
* [Power Commands for Visual Studio](https://marketplace.visualstudio.com/items?itemName=VisualStudioPlatformTeam.ProductivityPowerPack2017).

## How to use this template

### Setting up the environment

Follow these steps:

* create a source control repository,
* clone the repository locally,
* download the contents of this directory only (by downloading a ZIP archive from GitHub) to the root directory of your repository,
* replace package logo in [./Doc/icon.ico](./Doc/icon.ico), [./Doc/icon.png](./Doc/icon.png) and [./Source/ProjectTemplate/icon.ico](./Source/ProjectTemplate/icon.ico),
* rename project and test project in Visual Studio,
* rename solution and project files,
* manually update references in solution and project files,
* create a new assembly signing key (`project template properties > Signing > check "Sign the assembly" > choose "New" > assign key name and password`) and make sure you do not publish the key in a public repository,
* update project information in [ProjectTemplate.csproj](./Source/ProjectTemplate/ProjectTemplate.csproj),
* install and update NuGet packages by running `Update-Package -reinstall` in Package Manager console in Visual Studio (be sure to update referenced NuGet package versions in [publishNuGetPackage.ps1](./Build/getUnitTestCodeCoverage.ps1) if necessary),
* replace the contents of this file with your project description.


### Setting editor and code styling preferences

* you can change your IDE editor and code styling preferences in [.editorconfig](./Source/.editorconfig),
* you can change StyleCop code styling preferences in [stylecop.ruleset](./Source/stylecop.ruleset) and [stylecop.json](./Source/stylecop.json).

### NuGet package location

You can change NuGet relates settings like where to store related NuGet packages in [nuget.config](./Source/nuget.config).

### Running unit tests

You can run unit tests from the Test Explorer in Visual Studio.

### Generating unit tests code coverage report

You can generate the code coverage report by running the following command in PowerShell:

```powershell
.\Build\getUnitTestCodeCoverage.ps1 -projectName "ProjectName" -testProjectName "ProjectName.Tests"`
```

This will:

* remove old reports,
* compile the solution,
* run unit tests,
* generate code coverage report,
* open the code coverage report in your default browser and
* clean up redundant files.

Be sure to replace respective project names. If you'll be changing directory structure, be sure to update the PowerShell script as well.

### Publishing NuGet package

You can publish the package to NuGet by running the following command in PowerShell:

```powershell
.\Build\publishNuGetPackage.ps1 -projectName "ProjectName" -projectVersion "1.2.3" -nugetKey "xxxxxxxxxx"
```

This will:

*  remove StyleCop and FxCop references,
*  compile the solution and
*  publish build artifacts to NuGet.org.

Be sure to:

* have a valid NuGet account,
* replace project name,
* replace project version (must match the project version in `project template properties > Package > Package version, Assembly version and Assembly file version`),
* replace the NuGet key (that you received from the NuGet website when creating a new project and make sure you do not publish the key in a public repository).