
        local X=require "xmlrep"
        local XN,XA=X.N,X.A

local checked=XN "icon" {"BUILTIN=checked"}{}
local unchecked=XN "icon" {"BUILTIN=unchecked"}{}

local function canonicalatt(A)
    local K={}
    for k,_ in pairs(A) do table.insert(K, k) end
    table.sort(K)
    local X={}
    for _,k in ipairs(K) do
        local a=A[k]
        table.insert(X, string.format("%s=%s", k, a))
    end
    return X
end

local A0=canonicalatt {
    FOLDED=false,
    STYLE="oval"
}
local A1=canonicalatt {
    FOLDED=false,
--  STYLE="oval",
    POSITION="bottom_or_right"
}
local A1F=canonicalatt {
    FOLDED=true,
    POSITION="bottom_or_right"
}
-- for k,v in pairs(A1) do print("xx", k, v) end

local T=function(text, attrs)
    local A={XA "TEXT" (text)}
    for _,a in ipairs(attrs or {}) do table.insert(A, a) end
    return XN "node" (A)
end

local K=XN "map" {"version=freeplane 1.12.1"} {
    T ("xmlrep", A0) {
        XN "font" {"SIZE=18"} {},
        T ("Purpose", A1) {
            XN "edge" {"COLOR=#ff0000"} {},
            T ("Create xml source from Lua data structures") {},
            T ("Facilitate write domain-specific Lua representations") {}
        },
        T ("Status&#xa;Version 0.1", A1) {
            XN "edge" {"COLOR=#00ff00"} {},
            T ("Creation of arbitrary xml trees", A1) {checked},
            T ("Escaping text properly", A1) {unchecked},
            T ("Use of xml-entities", A1) {unchecked},
            T ("Use of namespaces", A1) {unchecked}
        },
        T ("How to ...", A1) {
            XN "edge" {"COLOR=#0000ff"} {},
        },
        T ("Examples", A1) {
            XN "edge" {"COLOR=#00ffff"} {},
            T ("generic", A1) {
                T ("Representation of the Readme file, more or less.", A1) {},
            },
            T ("vcxproj", A1F) {
                T ("vcxproj is the format of Visual Studio Projects.", A1) {},
                T ("Editing project files via the Visual Studio GIU is error prone.&#xa;The project representation in xml as generated by the GUI&#xa;is strongly redundant.&#xa;A script based generation could start from a non-redundant&#xa;representation with sensible defaults, define defaults per&#xa;project-tree, automate generation of input from external&#xa;source files, ...", A1) {},
            },
            T ("mm", A1F) {
                T ("mm is the format of freeplane mindmaps (like this one).", A1) {},
            },
        },
        T ("Issues", A1) {
            XN "edge" {"COLOR=#ff00ff"} {},
            T ("Indentation missing after Textnode with \\n", A1) {unchecked},
        },
    }
}

io.output("mmgenerated.xml"):write(tostring(K), "\n")
io.output("examples/Mindmap_generated.mm"):write(tostring(K), "\n")
