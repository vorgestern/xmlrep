
local X=require "xmlrep"
local N,A,T=X.N,X.A,X.T
local Nt=function(n) return function(t) return N(n){}(t) end end

return {
    ui=N "ui" {
        A "version" "4.0"
    },
    class=function(name) return Nt "class" (name) end,
    extends=function(name) return Nt "extends" (name) end,
    header=function(name) return Nt "header" (name) end,
    set=function(values) return Nt "set" (values) end,
    enum=function(values) return Nt "enum" (values) end,
    sender=function(values) return Nt "sender" (values) end,
    receiver=function(values) return Nt "receiver" (values) end,
    signal=function(values) return Nt "signal" (values) end,
    slot=function(values) return Nt "slot" (values) end,
    widget=function(class, name) return N "widget" {
                A "class" (class),
                A "name" (name),
            }
    end,
    property=function(name) return N "property" {A "name" (name)} end,
    attribute=function(name) return N "attribute" {A "name" (name)} end,
    rect=function(x,y,w,h)
        return N "rect" {} {
            Nt "x" (tostring(x)),
            Nt "y" (tostring(y)),
            Nt "width" (tostring(w)),
            Nt "height" (tostring(h))
        }
    end,
    size=function(w,h)
        return N "size" {} {
            Nt "width" (tostring(w)),
            Nt "height" (tostring(h))
        }
    end,
    number=function(value) return  Nt "number" (tostring(value)) end,
    bool=function(value) return  Nt "bool" (tostring(value)) end,
    string=function(text) return Nt "string" (tostring(text)) end,
    x=function(value) return  Nt "x" (tostring(value)) end,
    y=function(value) return  Nt "y" (tostring(value)) end,
    layout=function(class, name)
        return N "layout" {
            A "class" (class),
            A "name" (name)
        }
    end,
    item=function(row, column, colspan)
        local attrs={}
        if row then table.insert(attrs, A "row" (tostring(row))) end
        if column then table.insert(attrs, A "column" (tostring(column))) end
        if colspan then table.insert(attrs, A "colspan" (tostring(colspan))) end
        return N "item" (attrs)
    end,
    customwidgets=N "customwidgets" {},
    resources=N "resources" {},
    connections=N "connections" {},
    customwidget=N "customwidget" {},
    connection=N "connection" {},
    hint=function(type) return N "hint" {A "type" (type)} end,
    hints=N "hints" {},
}
