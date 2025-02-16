
local Indent={}
-- local Indent={"| 1|", "|     2|", "|         3|"}

local mtchunk={ __tostring=function(self) return self.text end }
mtchunk.__index=mtchunk
local XChunk=function(text, indent) return setmetatable({text=text, indent=indent}, mtchunk) end
local TChunk=function(text) return setmetatable({text=text, istext=true}, mtchunk) end

local function newline_required(chunk1, chunk2)
    return chunk1 and chunk2 and not chunk1.istext and not chunk2.istext
end

-- ============================================================================

local mttext={
    __tostring=function(self) return string.format("NewTextNode(%s)", self.text) end,
    join=function(self) return {TChunk(self.text)} end
}
mttext.__index=mttext
local function NewTextNode(text) return setmetatable({text=text}, mttext) end

-- ============================================================================

local mtattr={
    __tostring=function(self) return string.format("NewAttributeNode(%s=%s)", self.name, self.value) end,
    repr=function(self)
        return string.format('%s="%s"', self.name, self.value)
    end
}
mtattr.__index=mtattr
local function NewAttributeNode(name)
    return function(value)
        return setmetatable({name=name, value=value}, mtattr)
    end
end

-- ============================================================================

                    local function joinattrs(NewAttributeNode)
                        local X={}
                        for _,a in ipairs(NewAttributeNode) do
                            if a.repr then table.insert(X, a:repr())
                            else table.insert(X, "_"..tostring(a).."_")
                            end
                        end
                        return table.concat(X, " ")
                    end

                    local function joinnodes(NewXmlNode, level)
                        local X={}
                        for _,node in ipairs(NewXmlNode) do
                            for __,line in ipairs(node:join(level)) do table.insert(X, line) end
                        end
                        return X
                    end

local mtnode={
    __tostring=function(self) return self:serialise() end,
    join=function(self, level) -- turn to chunks
        level=level or 0
        local NA,NC=#self.attrs,#self.children
        local K1,K2=nil,nil
        if NA>0 and NC>0 then
            K1=string.format("<%s %s>", self.name, joinattrs(self.attrs))
            K2=string.format("</%s>", self.name);
        elseif NA>0 then
            K1=string.format("<%s %s/>", self.name, joinattrs(self.attrs))
        elseif NC>0 then
            K1=string.format("<%s>", self.name)
            K2=string.format("</%s>", self.name);
        else
            K1=string.format("<%s/>", self.name)
        end
        local repr={XChunk(K1, level)}
        for _,line in ipairs(joinnodes(self.children, level+1)) do table.insert(repr, line) end
        if K2 then table.insert(repr, XChunk(K2, level)) end
        return repr
    end,
    serialise=function(self)
        local Chunks=self:join()
        local X={}
        local merk, last, merknl
        for _,chunk in ipairs(Chunks) do
            if merk then
                if merknl then
                    local n=merk.indent or 0
                    if not Indent[n] then Indent[n]=string.rep("    ", n) end
                    table.insert(X, Indent[n])
                end
                table.insert(X, tostring(merk))
                merknl=newline_required(merk, chunk)
                if merknl then table.insert(X, "\n") end
            end
            last=merk
            merk=chunk
        end
        if merk then table.insert(X, tostring(merk)) end
        return table.concat(X, "")
    end,
    appendattr=function(self, A)
        table.insert(self.attrs, A)
    end,
    appendchildren=function(self, C)
        for j,c in ipairs(C) do table.insert(self.children, c) end
    end
}
mtnode.__index=mtnode

                    local function parseattrs(attrs)
                        local X={}
                        for j,a in ipairs(attrs) do
                            local a1=a
                            if type(a)=="string" then
                                local k,v=a:match "(.*)=(.*)"
                                a1=NewAttributeNode(k)(v)
                            elseif type(a)=="table" then
                            elseif nil then a1=NewAttributeNode("attr".._)(tostring(a)) 
                            else
                                error(string.format("\nElement [%d]='%s' cannot be interpreted as an attribute.", j, tostring(a)))
                            end
                            table.insert(X, a1)
                        end
                        return X
                    end
                    local function parsechildren(children)
                        local X={}
                        if type(children)=="table" then
                            for j,c in ipairs(children) do
                                if type(c)=="string" then table.insert(X, NewTextNode(c))
                                elseif type(c)=="table" then table.insert(X, c)
                                elseif nil then table.insert(X,
                                    -- NewTextNode(tostring(c))
                                    setmetatable({name="type_"..type(c), attrs={}, children={NewTextNode(tostring(c))}}, mtnode)
                                )
                                else
                                    error(string.format("\nElement [%d]='%s' cannot be interpreted as a node.", j, tostring(c)))
                                end
                            end
                        elseif type(children)=="string" then table.insert(X, NewTextNode(children))
                        else table.insert(X, NewXmlNode "parseerror" {NewTextNode("node: "..tostring(children))})
                        end
                        return X
                    end

local function NewXmlNode(name)
    return function(attrs)
        attrs=parseattrs(attrs)
        return function(children)
            children=parsechildren(children)
            return setmetatable({name=name, attrs=attrs, children=children}, mtnode)
        end
    end
end

-- ============================================================================

return {
    home="https://github.com/vorgestern/xmlrep",
    version="0.1",
    N=NewXmlNode,
    A=NewAttributeNode,
    T=NewTextNode,
    serialise=serialise
}
