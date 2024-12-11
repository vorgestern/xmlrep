
local X=require "xmlrep"

N,A,T=X.N,X.A,X.T

Nt=function(n) return function(t) return N(n){}(t) end end

                local Aopt=function(Node, As)
                    for a,v in pairs(As) do Node:appendattr(A(a)(v)) end
                    return Node
                end

PropertyGroup=function(C, L)
    local Node=N "PropertyGroup" {} {}
    Node=Aopt(Node, {Condition=C, Label=L})
    return function(children) Node:appendchildren(children); return Node end
end

ImportGroup=function(C, L)
    local Node=N "ImportGroup" {} {}
    Node=Aopt(Node, {Condition=C, Label=L})
    return function(children) Node:appendchildren(children); return Node end
end

ItemDefinitionGroup=function(C, L)
    local Node=N "ItemDefinitionGroup" {} {}
    Node=Aopt(Node, {Condition=C, Label=L})
    return function(children) Node:appendchildren(children); return Node end
end

Import=function(x, C, L)            return Aopt(N "Import"          {A "Project" (x)} {}, {Condition=C, Label=L})   end
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

Items={
    custombuild=function(filename)
        return function(settings)
            local K={}
            for k,_ in pairs(settings) do table.insert(K, k) end
            table.sort(K)
            local S={}
            for _,k in pairs(K) do table.insert(S, Nt(k)(settings[k])) end
            return CustomBuild(filename)(S)
        end
    end,
    custombuildrules={
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
}

ItemGroups={
    ClCompile=function(files)
        local F={}
        for _,f in ipairs(files) do table.insert(F, ClCompile(f)) end
        return ItemGroup() (F)
    end,
    None=function(files)
        local F={}
        for _,f in ipairs(files) do table.insert(F, None(f)) end
        return ItemGroup() (F)
    end
}
