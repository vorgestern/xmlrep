
local X=require "xmlrep"

local N,A,T=X.N,X.A,X.T

local Nt=function(n) return function(t) return N(n){}(t) end end

--[[
    <Project>
        <ItemGroup Label="ProjectConfigurations">
            <ProjectConfiguration Include="Release|Win32"> ....
        <PropertyGroup Label="Globals">
        <Import Project="$(VCTargetsPath)/Microsoft.Cpp.Default.props"/>
        <PropertyGroup Label="Configuration" Condition="..."> ....
        <Import Project="$(VCTargetsPath)/Microsoft.Cpp.props"/>
        <ImportGroup Label="ExtensionSettings"/>
        <ImportGroup Label="PropertySheets" Condition="..."> ....
        <PropertyGroup Label="UserMacros"/>
        <PropertyGroup Condition="..."> ....
        <ItemDefinitionGroup Condition="..."> ....
            <ClCompile>
            <Link>
        <ItemGroup>
            <ClCompile Include="xxx.cpp"/> ....
        <ItemGroup>
            <None Include="xxx.def"/> ....
        <ItemGroup>
            <CustomBuild Include="xxx.lua"> ....
        <ItemGroup>
            <ProjectReference Include="xxx.vcxproj">
        <Import Project="$(VCTargetsPath)/Microsoft.Cpp.targets"/>
        <ImportGroup Label="ExtensionTargets"/>
--]]

local clcompile=function(x)               return N "ClCompile"            {A "Include" (x)} {}                            end
local none=function(x)                    return N "None"                 {A "Include" (x)} {}                            end
local custombuild=function(x)             return N "CustomBuild"          {A "Include" (x)}                               end
local projectconfiguration=function(x)    return N "ProjectConfiguration" {A "Include" (x)}                               end
local projectreference=function(x)        return N "ProjectReference"     {A "Include" (x)}                               end
local itemgroup=function(L)
    local attrs={}
    if L then table.insert(attrs, A "Label" (L)) end
    return N "ItemGroup" (attrs)
end

-- =====================================================

local mkitemdefinition=function(itemname)
    return function(settings)
        local K={}
        for k,_ in pairs(settings) do table.insert(K, k) end
        table.sort(K)
        local S={}
        for _,k in ipairs(K) do table.insert(S, Nt(k)(tostring(settings[k]))) end
        return N (itemname) {} (S)
    end
end

local mkitemgroup=function(itemfunction)
    return function(files)
        local F={}
        for _,f in ipairs(files) do table.insert(F, itemfunction(f)) end
        return itemgroup() (F)
    end
end

return {

    Project=N "Project" {
        A "DefaultTargets" "Build",
        A "xmlns" "http://schemas.microsoft.com/developer/msbuild/2003"
    },

    PropertyGroup=function(L, C)
        local attrs={}
        if L then table.insert(attrs, A "Label" (L)) end
        if C then table.insert(attrs, A "Condition" (C)) end
        return function(properties)
            local K={}
            for k,_ in pairs(properties) do table.insert(K, k) end
            table.sort(K)
            local C={}
            for _,k in ipairs(K) do table.insert(C, Nt (k) (properties[k])) end
            return N "PropertyGroup" (attrs) (C)
        end
    end,

    ImportGroup=function(L, C)
        local attrs={}
        if L then table.insert(attrs, A "Label" (L)) end
        if C then table.insert(attrs, A "Condition" (C)) end
        return N "ImportGroup" (attrs)
    end,

    Import=function(x, L, C)
        local attrs={A "Project" (x)}
        if L then table.insert(attrs, A "Label" (L)) end
        if C then table.insert(attrs, A "Condition" (C)) end
        return N "Import" (attrs) {}
    end,

    ItemDefinitionGroup=function(C)
        local attrs={}
        if C then table.insert(attrs, A "Condition" (C)) end
        return N "ItemDefinitionGroup" (attrs)
    end,

    make_config=function(c, p)
        local cp=string.format("%s|%s", c, p)
        local config=projectconfiguration (cp) {Nt "Configuration" (c), Nt "Platform" (p)}
        return config, "'$(Configuration)|$(Platform)'=='"..cp.."'"
    end,

    ItemGroup=itemgroup,
    ItemDefinitions={
        Compiler=mkitemdefinition("ClCompile"),
        Linker=mkitemdefinition("Link")
    },
    ItemGroups={
        ClCompile=mkitemgroup(clcompile),
        None=mkitemgroup(none),
        ProjectReference=function(projects)
            -- projects={ filename=guid, ...}
            local Files,G={},{}
            for file,guid in pairs(projects) do Files[guid]=file; table.insert(G, guid) end
            table.sort(G)
            local P={}
            for _,guid in ipairs(G) do
                table.insert(P, projectreference(Files[guid]) {Nt "Project" (guid)})
            end
            return Nt "ItemGroup" (P)
        end,
        Custom=function(rule)
            return mkitemgroup(rule)
        end,
    },

    ProjectConfiguration=projectconfiguration,
    CustomBuild=function(file, command, outputs, message, filetype)
        return N "CustomBuild" {A "Include" (file)} {
            Nt "Command" (command),
            Nt "Outputs" (outputs),
            Nt "Message" (message or "Custom build "..file),
            Nt "FileType" (filetype or "Document"),
        }
    end,

    prepend={
        define=function(defs)
            if #defs>0 then
                return table.concat(defs, ";")..";%(PreprocessorDefinitions)"
            end
        end,
        inc=function(dirs)
            if #dirs>0 then
                return table.concat(dirs, ";")..";%(AdditionalIncludeDirectories)"
            end
        end,
        depend=function(libs)
            if #libs>0 then
                return table.concat(libs, ";")..";%(AdditionalDependencies)"
            end
        end,
        libdirs=function(dirs)
            if #dirs>0 then
                return table.concat(dirs, ";")..";%(AdditionalLibraryDirectories)"
            end
        end
    }

}
