
local X=require "xmlrep"
local N,A,T=X.N,X.A,X.T
local Nt=function(n) return function(t) return N(n){}(t) end end

local X={
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

X.enumproperty=function(name, value) return X.property (name) { X.enum (value) } end
X.setproperty=function(name, value) return X.property (name) { X.set (value) } end
X.boolproperty=function(name, value) return X.property (name) { X.bool (value) } end
X.stringproperty=function(name, value) return X.property (name) { X.string (value) } end
X.sizeproperty=function(name, w, h) return X.property (name) { X.size (w,h) } end
X.rectproperty=function(name, x, y, w, h) return X.property (name) { X.rect (x,y,w,h) } end

X.boolattribute=function(name, value) return X.attribute (name) { X.bool (value) } end

X.acceptedconnection=function(sender, receiver)
    return function(morecontent)
        local M={
            X.sender(sender),
            X.signal "accepted()",
            X.receiver(receiver),
            X.slot "accept()",
        }
        for _,p in ipairs(morecontent) do table.insert(M, p) end
        return X.connection (M)
    end
end
X.rejectedconnection=function(sender, receiver)
    return function(morecontent)
        local M={
            X.sender(sender),
            X.signal "rejected()",
            X.receiver(receiver),
            X.slot "reject()",
        }
        for _,p in ipairs(morecontent) do table.insert(M, p) end
        return X.connection (M)
    end
end

X.xyhint=function(label, x, y)
    return X.hint(label) {X.x(x), X.y(y)}
end

X.makeglobal=function(self)
    for k,v in pairs(self) do
        if k~="makeglobal" then
            _G[k]=v
        end
    end
end

return X
