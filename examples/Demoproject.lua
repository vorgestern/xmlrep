
local X=require "examples.vcxproj"

local custombuildrules={
    deflatelua=function(filename)
        return X.CustomBuild(filename,
            "lua ../lua/DLLModule/LuaToXML/deflatemodule.lua $(IntDir)/%(Filename).cpp %(Identity)",
            "$(IntDir)/%(Filename).cpp",
            "%(Filename)%(Extension) to $(IntDir)%(Filename).cpp",
            "Document"
        )
    end
}

local R32,IfR32=X.make_config("Release", "Win32") -- "Release|Win32", "'$(Configuration)|$(Platform)'=='Release|Win32'"

local K=X.Project {
    X.ItemGroup "ProjectConfigurations" {R32},
    X.PropertyGroup ("Globals") {
        ProjectGuid="{C4C00E76-B078-50C3-1980-291F0557EBB3}",
        IgnoreWarnCompileDuplicatedFilename="true",
        Keyword="Win32Proj",
        RootNamespace="LuaToXML54",
    },
    X.Import "$(VCTargetsPath)/Microsoft.Cpp.Default.props",
    X.PropertyGroup ("Configuration", IfR32) {
        ConfigurationType="DynamicLibrary",
        UseDebugLibraries="false",
        CharacterSet="Unicode",
        PlatformToolset="v143",
    },
    X.Import "$(VCTargetsPath)/Microsoft.Cpp.props",
    X.ImportGroup ("ExtensionSettings") {},
    X.ImportGroup ("PropertySheets", IfR32) {
        X.Import ("$(UserRootDir)/Microsoft.Cpp.$(Platform).user.props", "LocalAppDataPlatform", "exists('$(UserRootDir)/Microsoft.Cpp.$(Platform).user.props')"),
    },
    X.PropertyGroup ("UserMacros") {},
    X.PropertyGroup (nil, IfR32) {
        LinkIncremental="false",
        IgnoreImportLibrary="true",
        OutDir="$(ROBINSON)/lua/modules/",
        IntDir="obj/LuaToXML54/",
        TargetName="LuaToXML54",
        TargetExt=".dll",
    },
    X.ItemDefinitionGroup (IfR32) {
        X.ItemDefinitions.Compiler {
            PrecompiledHeader="NotUsing",
            WarningLevel="Level3",
            PreprocessorDefinitions=X.prepend.define {
                "_CRT_SECURE_NO_WARNINGS",
                "ZLIB_CONST"
            },
            AdditionalIncludeDirectories=X.prepend.inc {
                "../libs/include/zlib-1.2.11",
                "../libs/inflate",
                "$(ROBINSON)/lua/5.4/include",
                "obj/LuaToXML54"
            },
            Optimization="Disabled",
            LanguageStandard="stdcpp20",
            ExternalWarningLevel="Level3"
        },
        X.ItemDefinitions.Linker {
            SubSystem="Windows",
            AdditionalDependencies=X.prepend.depend {"lua54-shared.lib"},
            AdditionalLibraryDirectories=X.prepend.libdirs {"$(ROBINSON)/lua/lib"},
            ImportLibrary="obj/LuaToXML54/LuaToXML54.lib",
            ModuleDefinitionFile="../lua/DLLModule/LuaToXML/LuaToXML.def",
            ProgramDatabaseFile="obj/LuaToXML54/LuaToXML54.pdb",
        }
    },
    X.ItemGroups.ClCompile {
        "../lua/DLLModule/LuaToXML/DllMain.cpp",
        "../lua/DLLModule/LuaToXML/Modul.cpp",
        "obj/LuaToXML54/Attribute.cpp",
        "obj/LuaToXML54/Node.cpp",
        "obj/LuaToXML54/TextNode.cpp",
    },
    X.ItemGroups.None {
        "../lua/DLLModule/LuaToXML/LuaToXML.def",
        "../lua/DLLModule/LuaToXML/init.lua",
        "../lua/DLLModule/LuaToXML/xmldemo.lua",
    },
    X.ItemGroups.Custom (custombuildrules.deflatelua) {
        "../lua/DLLModule/LuaToXML/Attribute.lua",
        "../lua/DLLModule/LuaToXML/Node.lua",
        "../lua/DLLModule/LuaToXML/TextNode.lua",
    },
    X.ItemGroups.ProjectReference {
        ["zlibstat32.vcxproj"]="{57C7ADBA-437F-EF07-AC86-C863985D8AF8}",
        ["inflate32.vcxproj"]="{CD4E2EEC-39B9-E262-82F7-9308EEA0C0B7}",
    },
    X.Import "$(VCTargetsPath)/Microsoft.Cpp.targets",
    X.ImportGroup ("ExtensionTargets") {},
}

io.output "examples/Demoproject.vcxproj" :write(tostring(K), "\n")
