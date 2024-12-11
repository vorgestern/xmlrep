
local X=require "xmlrep"

N,A,T=X.N,X.A,X.T

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

Nt=function(n) return function(t) return N(n){}(t) end end

Project=N "Project" {
    "DefaultTargets=Build", "xmlns=http://schemas.microsoft.com/developer/msbuild/2003"
}

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
end

ImportGroup=function(L, C)
    local attrs={}
    if L then table.insert(attrs, A "Label" (L)) end
    if C then table.insert(attrs, A "Condition" (C)) end
    return N "ImportGroup" (attrs)
end

ItemDefinitionGroup=function(C)
    local attrs={}
    if C then table.insert(attrs, A "Condition" (C)) end
    return N "ItemDefinitionGroup" (attrs)
end

Import=function(x, L, C)
    local attrs={A "Project" (x)}
    if L then table.insert(attrs, A "Label" (L)) end
    if C then table.insert(attrs, A "Condition" (C)) end
    return N "Import" (attrs) {}
end

ClCompile=function(x)               return N "ClCompile"            {A "Include" (x)} {}                            end
None=function(x)                    return N "None"                 {A "Include" (x)} {}                            end
CustomBuild=function(x)             return N "CustomBuild"          {A "Include" (x)}                               end
ProjectConfiguration=function(x)    return N "ProjectConfiguration" {A "Include" (x)}                               end
ProjectReference=function(x)        return N "ProjectReference"     {A "Include" (x)}                               end

ItemGroup=function(L)
    local attrs={}
    if L then table.insert(attrs, A "Label" (L)) end
    return N "ItemGroup" (attrs)
end

-- =====================================================

local ItemDefinition=function(itemname)
    return function(settings)
        local K={}
        for k,_ in pairs(settings) do table.insert(K, k) end
        table.sort(K)
        local S={}
        for _,k in ipairs(K) do table.insert(S, Nt(k)(tostring(settings[k]))) end
        return N (itemname) {} (S)
    end
end

ItemDefinitions={
    Compiler=ItemDefinition("ClCompile"),
    Linker=ItemDefinition("Link")
}

-- =====================================================

local ItemGroup=function(itemfunction)
    return function(files)
        local F={}
        for _,f in ipairs(files) do table.insert(F, itemfunction(f)) end
        return ItemGroup() (F)
    end
end

ItemGroups={
    ClCompile=ItemGroup(ClCompile),
    None=ItemGroup(None),
    ProjectReference=function(projects)
        -- projects={ filename=guid, ...}
        local Files,G={},{}
        for file,guid in pairs(projects) do Files[guid]=file; table.insert(G, guid) end
        table.sort(G)
        local P={}
        for _,guid in ipairs(G) do
            table.insert(P, ProjectReference(Files[guid]) {Nt "Project" (guid)})
        end
        return Nt "ItemGroup" (P)
    end,
    Custom=function(rule) return ItemGroup(rule) end,
}
