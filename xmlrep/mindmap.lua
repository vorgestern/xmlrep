
--[[
        This is a tool to generate Mindmaps for Freeplane.
        See examples/Mindmap.lua for an example.
--]]

        local X=require "xmlrep"

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

return {
    makeglobal=function(self)
        for k,v in pairs(self) do
            if k=="makeglobal" then
            elseif k=="string" then
                _G.uistring=v
            else
                _G[k]=v
            end
        end
    end,

    N=X.N,
    A=X.A,

    checked=X.N "icon" {"BUILTIN=checked"}{},
    unchecked=X.N "icon" {"BUILTIN=unchecked"}{},
    canonicalatt=canonicalatt,

    T=function(text, attrs)
        local A={X.A "TEXT" (text)}
        for _,a in ipairs(attrs or {}) do table.insert(A, a) end
        return X.N "node" (A)
    end,

    Map=X.N "map" {"version=freeplane 1.7.0"},
}
