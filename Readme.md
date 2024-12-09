
# xmlrep

## Purpose
Export structured data from Lua in xml-form

Xmlrep makes it easy to create 'domain-specific' utilities
to establish default-attributes or parameterised node-structures
in the Lua representation of a data structure.

A Lua file is typically easier to keep under version control than
an application-specific xml-file, because applications usually include
extraneous information (e.g. 'last-modified' timestamps).

## Status
Works as intended
### Missing features
- Creating attributes directly from generic Lua-tables (alphabetic order)
- Escaping Text properly
- xml entities
- xml namespace
### Defects
- Indentation after textnodes that are terminated with a newline

## How to use

    local X=require "xmlrep"
    local N,A,T=X.N,X.A,X.T  -- Abbreviate Node, Attribute, Textnode
                             -- (Attributes and Textnodes may not be necessary,
                             -- since they can be created implicitly.)

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
                                      outputs xml-text ..
    lua examples/Readme.lua           .. with roughly the same content as this Readme.
    lua examples/VCXProj.lua          .. of a project file for Visual Studio (.vcxproj).
    lua examples/Mindmap.lua          .. of a mindmap for Freeplane (https://github.com/freeplane/freeplane)

## How to build
There is no need to build xmlrep,
since it can be used in source-form.

## How to install
Copy xmlrep.lua to a directory on your Luapath.
Consult LUA_PATH_5_4 or LUA_PATH environment variables
or https://www.lua.org/manual/5.4/manual.html#pdf-package.path
