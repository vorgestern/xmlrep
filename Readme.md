
# xmlrep

## Purpose
Export structured data from Lua in xml-form

## Status
Works as intended
### Missing features
- Escaping Text properly
- xml entities
- xml namespace
### Defects
- Indentation after textnodes that are terminated with a newline

## How to use

    local X=require "xmlrep"
    local N,A,T=X.N,X.A,X.T  -- Abbreviate Node, Attribute, Textnode
                             -- (Attributes and Textnodes may not be necessary, since they can be created implicitly.)

    local Readme=N "Readme" {"version=0.1"} {
        N "Level1" {"index=0", "version=0.1"} {
            N "Level2" {} {
            },
            N "Level2" {} {
            }
        }
    }

    print(Readme) -- Print xml-representation

### More complex examples

    lua examples/Readme.lua                          outputs an xml-text with roughly the same content as this Readme.
    lua examples/ExampleVCXProj.lua                  outputs the xml-text of a project file for Visual Studio (.vcxproj).

## How to build
There is no need to build xmlrep,
since it can be used in source-form.

## How to install
Copy xmlrep.lua to a directory on your Luapath.
Consult LUA_PATH_5_4 or LUA_PATH environment variables
or https://www.lua.org/manual/5.4/manual.html#pdf-package.path
