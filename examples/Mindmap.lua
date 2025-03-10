
require "xmlrep.mindmap" :makeglobal()

local Oval=function(text) return T (text, {"FOLDED=false", "STYLE=oval"}) end
local BOR=function(text)  return T (text, {"FOLDED=false", "POSITION=bottom_or_right"}) end
local BORF=function(text) return T (text, {"FOLDED=true",  "POSITION=bottom_or_right"}) end

local K=Map {
    Oval "xmlrep" {
        N "font" {"SIZE=18"} {},
        BOR "Purpose" {
            N "edge" {"COLOR=#ff0000"} {},
            T ("Create xml source from Lua data structures") {},
            T ("Facilitate write domain-specific Lua representations") {}
        },
        BOR "Status&#xa;Version 0.1" {
            N "edge" {"COLOR=#00ff00"} {},
            BOR "Creation of arbitrary xml trees" {checked},
            BOR "Escaping text properly" {unchecked},
            BOR "Use of xml-entities" {unchecked},
            BOR "Use of namespaces" {unchecked}
        },
        BOR "How to ..." {
            N "edge" {"COLOR=#0000ff"} {},
        },
        BOR "Examples" {
            N "edge" {"COLOR=#00ffff"} {},
            BOR "generic" {
                BOR "Representation of the Readme file, more or less." {},
            },
            BORF "vcxproj" {
                BOR "vcxproj is the format of Visual Studio Projects." {},
                T ("Editing project files via the Visual Studio GUI is error prone.&#xa;The project representation in xml as generated by the GUI&#xa;is strongly redundant.&#xa;A script based generation could start from a non-redundant&#xa;representation with sensible defaults, define defaults per&#xa;project-tree, automate generation of input from external&#xa;source files, ...", A1) {},
            },
            BORF "mm" {
                BOR "mm is the format of freeplane mindmaps (like this one)." {},
            },
            BORF "ui" {
                BOR "ui ist the format used to specify user interfaces for Qt applications." {},
            }
        },
        BOR "Issues" {
            N "edge" {"COLOR=#ff00ff"} {},
            BOR "Indentation missing after Textnode with \\n" {unchecked},
        },
    }
}

-- "examples/Mindmap_generated.mm"
local outfile=...
if outfile then io.output(outfile):write(tostring(K), "\n")
else                               print(tostring(K))
end
