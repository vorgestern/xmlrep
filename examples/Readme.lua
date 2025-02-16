
--[[
        This is an example to write a generic xml-file.
--]]

local X=require "xmlrep"
local N,A,T=X.N,X.A,X.T  -- Node, Attribute, Textnode (Attributes and Textnodes can be created implicitly.)

local Item=function(text) return N "Item" {} (text) end -- Frequently used node type

local K=N "Readme" {"version=0.1"} {
    N "Chapter" {"title=Purpose"} "Export structured data from Lua in xml-form",  -- Only 1 (text-) node
    N "Chapter" {"title=Info"} {
        N "Name" {} "xmlrep",
        N "Home" {} (X.home),
        N "Version" {} (X.version)
    },
    N "Chapter" {"title=Status"} {
        "Works as intended\n",
        N "Subchapter" {"title=Missing Features"} {
            N "List" {} {
               Item "Escaping Text properly",
               Item "xml entities",
               Item "xml namespaces"
            }
        },
        N "Subchapter" {"title=Defects"} {
            N "List" {} {
                Item "Indentation after textnodes that are terminated with a newline"
            }
        }
    },
    N "Chapter" {"title=How to use"} "See demo scripts",
    N "Chapter" {"title=How to build"} [[
There is no need to build xmlrep,
since it can be used in source-form.]],
    N "Chapter" {"title=How to install"} [[
Copy xmlrep.lua to a directory on your Luapath.
Consult LUA_PATH_5_4 or LUA_PATH environment variables
or https://www.lua.org/manual/5.4/manual.html#pdf-package.path]],
}

-- "examples/Readme.xml"
local outfile=...
if outfile then io.output(outfile):write(tostring(K), "\n")
else                               print(tostring(K))
end
