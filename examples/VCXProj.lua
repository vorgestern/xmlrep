
    local X=require "xmlrep"
    local N,A,T=X.N,X.A,X.T
    local Nt=function(n) return function(t) return N(n){}(t) end end

local Aopt=function(Node, As)
    for a,v in pairs(As) do Node:appendattr(A(a)(v)) end
    return Node
end
local PropertyGroup=function(C, L)
    local Node=N "PropertyGroup" {} {}
    Node=Aopt(Node, {Condition=C, Label=L})
    return function(children) Node:appendchildren(children); return Node end
end
local ImportGroup=function(C, L)
    local Node=N "ImportGroup" {} {}
    Node=Aopt(Node, {Condition=C, Label=L})
    return function(children) Node:appendchildren(children); return Node end
end
local ItemDefinitionGroup=function(C, L)
    local Node=N "ItemDefinitionGroup" {} {}
    Node=Aopt(Node, {Condition=C, Label=L})
    return function(children) Node:appendchildren(children); return Node end
end
local Import=function(x, C, L)     return Aopt(N "Import"      {A "Project" (x)} {}, {Condition=C, Label=L}) end
local ClCompile=function(x)        return N "ClCompile"        {A "Include" (x)} {} end
local None=function(x)             return N "None"             {A "Include" (x)} {} end
local CustomBuild=function(x)      return N "CustomBuild"      {A "Include" (x)}    end
local ProjectConfiguration=function(x) return N "ProjectConfiguration" {A "Include" (x)} end
local ProjectReference=function(x) return N "ProjectReference" {A "Include" (x)}    end
local ItemGroup=function(L)
    local attrs={}
    if L then table.insert(attrs, A "Label" (L)) end
    return N "ItemGroup" (attrs)
end

local K=N "Project" {"DefaultTargets=Build", "xmlns=http://schemas.microsoft.com/developer/msbuild/2003"} {
  ItemGroup "ProjectConfigurations" {
    ProjectConfiguration "Release|Win32" {
      Nt "Configuration" "Release",
      Nt "Platform" "Win32"
    }
  },
  PropertyGroup (nil, "Globals") {
    Nt "ProjectGuid" "{C4C00E76-B078-50C3-1980-291F0557EBB3}",
    Nt "IgnoreWarnCompileDuplicatedFilename" "true",
    Nt "Keyword" "Win32Proj",
    Nt "RootNamespace" "LuaToXML54",
  },
  Import "$(VCTargetsPath)/Microsoft.Cpp.Default.props",
  PropertyGroup ("'$(Configuration)|$(Platform)'=='Release|Win32'", "Configuration") {
    Nt "ConfigurationType" "DynamicLibrary",
    Nt "UseDebugLibraries" "false",
    Nt "CharacterSet" "Unicode",
    Nt "PlatformToolset" "v143",
  },
  Import "$(VCTargetsPath)/Microsoft.Cpp.props",
  N "ImportGroup" {"Label=ExtensionSettings"} {},
  ImportGroup ("'$(Configuration)|$(Platform)'=='Release|Win32'", "PropertySheets") {
    Import ("$(UserRootDir)/Microsoft.Cpp.$(Platform).user.props", "exists('$(UserRootDir)/Microsoft.Cpp.$(Platform).user.props')", "LocalAppDataPlatform"),
  },
  N "PropertyGroup" {"Label=UserMacros"} {},
  PropertyGroup ("'$(Configuration)|$(Platform)'=='Release|Win32'") {
    Nt "LinkIncremental" "false",
    Nt "IgnoreImportLibrary" "true",
    Nt "OutDir" "$(ROBINSON)/lua/modules/",
    Nt "IntDir" "obj/LuaToXML54/",
    Nt "TargetName" "LuaToXML54",
    Nt "TargetExt" ".dll",
  },
  ItemDefinitionGroup "'$(Configuration)|$(Platform)'=='Release|Win32'" {
    N "ClCompile" {} {
      Nt "PrecompiledHeader" "NotUsing",
      Nt "WarningLevel" "Level3",
      Nt "PreprocessorDefinitions" "_CRT_SECURE_NO_WARNINGS;ZLIB_CONST;%(PreprocessorDefinitions)",
      Nt "AdditionalIncludeDirectories" "../libs/include/zlib-1.2.11;../libs/inflate;$(ROBINSON)/lua/5.4/include;obj/LuaToXML54;%(AdditionalIncludeDirectories)",
      Nt "Optimization" "Disabled",
      Nt "LanguageStandard" "stdcpp20",
      Nt "ExternalWarningLevel" "Level3"
    },
    N "Link" {} {
      Nt "SubSystem" "Windows",
      Nt "AdditionalDependencies" "lua54-shared.lib;%(AdditionalDependencies)",
      Nt "AdditionalLibraryDirectories" "$(ROBINSON)/lua/lib;%(AdditionalLibraryDirectories)",
      Nt "ImportLibrary" "obj/LuaToXML54/LuaToXML54.lib",
      Nt "ModuleDefinitionFile" "../lua/DLLModule/LuaToXML/LuaToXML.def",
      Nt "ProgramDatabaseFile" "obj/LuaToXML54/.pdb",
    }
  },
  ItemGroup() {
    ClCompile "../lua/DLLModule/LuaToXML/DllMain.cpp",
    ClCompile "../lua/DLLModule/LuaToXML/Modul.cpp",
    ClCompile "obj/LuaToXML54/Attribute.cpp",
    ClCompile "obj/LuaToXML54/Node.cpp",
    ClCompile "obj/LuaToXML54/TextNode.cpp",
  },
  ItemGroup() {
    None "../lua/DLLModule/LuaToXML/LuaToXML.def",
    None "../lua/DLLModule/LuaToXML/init.lua",
    None "../lua/DLLModule/LuaToXML/xmldemo.lua",
  },
  ItemGroup() {
    CustomBuild "../lua/DLLModule/LuaToXML/Attribute.lua" {
      Nt "FileType" "Document",
      Nt "Command" "lua ../lua/DLLModule/LuaToXML/deflatemodule.lua $(IntDir)/%(Filename).cpp %(Identity)",
      Nt "Outputs" "obj/LuaToXML54/Attribute.cpp",
      Nt "Message" "%(Filename)%(Extension) to $(IntDir)%(Filename).cpp"
    },
    CustomBuild "../lua/DLLModule/LuaToXML/Node.lua" {
      Nt "FileType" "Document",
      Nt "Command" "lua ../lua/DLLModule/LuaToXML/deflatemodule.lua $(IntDir)/%(Filename).cpp %(Identity)",
      Nt "Outputs" "obj/LuaToXML54/Node.cpp",
      Nt "Message" "%(Filename)%(Extension) to $(IntDir)%(Filename).cpp",
    },
    CustomBuild "../lua/DLLModule/LuaToXML/TextNode.lua" {
      Nt "FileType" "Document",
      Nt "Command" "lua ../lua/DLLModule/LuaToXML/deflatemodule.lua $(IntDir)/%(Filename).cpp %(Identity)",
      Nt "Outputs" "obj/LuaToXML54/TextNode.cpp",
      Nt "Message" "%(Filename)%(Extension) to $(IntDir)%(Filename).cpp",
    },
  },
  ItemGroup() {
    ProjectReference "zlibstat32.vcxproj" {Nt "Project" "{57C7ADBA-437F-EF07-AC86-C863985D8AF8}"},
    ProjectReference "inflate32.vcxproj"  {Nt "Project" "{CD4E2EEC-39B9-E262-82F7-9308EEA0C0B7}"},
  },
  Import "$(VCTargetsPath)/Microsoft.Cpp.targets",
  N "ImportGroup" {"Label=ExtensionTargets"} {},
}

local K1=N "Project" {"DefaultTargets=Build", "xmlns=http://schemas.microsoft.com/developer/msbuild/2003"} {
  Import "$(VCTargetsPath)/Microsoft.Cpp.Default.props",
  N "ImportGroup" {"Label=ExtensionSettings"} {},
}

print(K)
