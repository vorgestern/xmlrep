﻿
local X=require "examples.vcxproj"

local custombuildrules={
    deflatelua=function(filename)
        local settings={
            Nt "Command" "lua ../lua/DLLModule/LuaToXML/deflatemodule.lua $(IntDir)/%(Filename).cpp %(Identity)",
            Nt "Outputs" "$(IntDir)/%(Filename).cpp",
            Nt "Message" "%(Filename)%(Extension) to $(IntDir)%(Filename).cpp",
            Nt "FileType" "Document",
        }
        return CustomBuild(filename)(settings)
    end
}

local R32="'$(Configuration)|$(Platform)'=='Release|Win32'"

local K=Project {
    ItemGroup "ProjectConfigurations" {
        ProjectConfiguration "Release|Win32" {Nt "Configuration" "Release", Nt "Platform" "Win32"}
    },
    PropertyGroup ("Globals") {
        ProjectGuid="{C4C00E76-B078-50C3-1980-291F0557EBB3}",
        IgnoreWarnCompileDuplicatedFilename="true",
        Keyword="Win32Proj",
        RootNamespace="LuaToXML54",
    },
    Import "$(VCTargetsPath)/Microsoft.Cpp.Default.props",
    PropertyGroup ("Configuration", R32) {
        ConfigurationType="DynamicLibrary",
        UseDebugLibraries="false",
        CharacterSet="Unicode",
        PlatformToolset="v143",
    },
    Import "$(VCTargetsPath)/Microsoft.Cpp.props",
    ImportGroup ("ExtensionSettings") {},
    ImportGroup ("PropertySheets", R32) {
        Import ("$(UserRootDir)/Microsoft.Cpp.$(Platform).user.props", "LocalAppDataPlatform", "exists('$(UserRootDir)/Microsoft.Cpp.$(Platform).user.props')"),
    },
    PropertyGroup ("UserMacros") {},
    PropertyGroup (nil, R32) {
        LinkIncremental="false",
        IgnoreImportLibrary="true",
        OutDir="$(ROBINSON)/lua/modules/",
        IntDir="obj/LuaToXML54/",
        TargetName="LuaToXML54",
        TargetExt=".dll",
    },
    ItemDefinitionGroup (R32) {
        ItemDefinitions.Compiler {
            PrecompiledHeader="NotUsing",
            WarningLevel="Level3",
            PreprocessorDefinitions=prepend_define {"_CRT_SECURE_NO_WARNINGS", "ZLIB_CONST"},
            AdditionalIncludeDirectories=prepend_inc {"../libs/include/zlib-1.2.11", "../libs/inflate", "$(ROBINSON)/lua/5.4/include", "obj/LuaToXML54"},
            Optimization="Disabled",
            LanguageStandard="stdcpp20",
            ExternalWarningLevel="Level3"
        },
        ItemDefinitions.Linker {
            SubSystem="Windows",
            AdditionalDependencies=prepend_depend {"lua54-shared.lib"},
            AdditionalLibraryDirectories=prepend_libdirs {"$(ROBINSON)/lua/lib"},
            ImportLibrary="obj/LuaToXML54/LuaToXML54.lib",
            ModuleDefinitionFile="../lua/DLLModule/LuaToXML/LuaToXML.def",
            ProgramDatabaseFile="obj/LuaToXML54/.pdb",
        }
    },
    ItemGroups.ClCompile {
        "../lua/DLLModule/LuaToXML/DllMain.cpp",
        "../lua/DLLModule/LuaToXML/Modul.cpp",
        "obj/LuaToXML54/Attribute.cpp",
        "obj/LuaToXML54/Node.cpp",
        "obj/LuaToXML54/TextNode.cpp",
    },
    ItemGroups.None {
        "../lua/DLLModule/LuaToXML/LuaToXML.def",
        "../lua/DLLModule/LuaToXML/init.lua",
        "../lua/DLLModule/LuaToXML/xmldemo.lua",
    },
    ItemGroups.Custom (custombuildrules.deflatelua) {
        "../lua/DLLModule/LuaToXML/Attribute.lua",
        "../lua/DLLModule/LuaToXML/Node.lua",
        "../lua/DLLModule/LuaToXML/TextNode.lua",
    },
    ItemGroups.ProjectReference {
        ["zlibstat32.vcxproj"]="{57C7ADBA-437F-EF07-AC86-C863985D8AF8}",
        ["inflate32.vcxproj"]="{CD4E2EEC-39B9-E262-82F7-9308EEA0C0B7}",
    },
    Import "$(VCTargetsPath)/Microsoft.Cpp.targets",
    ImportGroup ("ExtensionTargets") {},
}

print(K)
