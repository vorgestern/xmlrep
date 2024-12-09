<map version="freeplane 1.12.1">
    <node TEXT="xmlrep" FOLDED="false" STYLE="oval">
        <font SIZE="18"/>
        <node TEXT="Purpose" FOLDED="false" POSITION="bottom_or_right">
            <edge COLOR="#ff0000"/>
            <node TEXT="Create xml source from Lua data structures"/>
            <node TEXT="Facilitate write domain-specific Lua representations"/>
        </node>
        <node TEXT="Status&#xa;Version 0.1" FOLDED="false" POSITION="bottom_or_right">
            <edge COLOR="#00ff00"/>
            <node TEXT="Creation of arbitrary xml trees" FOLDED="false" POSITION="bottom_or_right">
                <icon BUILTIN="checked"/>
            </node>
            <node TEXT="Escaping text properly" FOLDED="false" POSITION="bottom_or_right">
                <icon BUILTIN="unchecked"/>
            </node>
            <node TEXT="Use of xml-entities" FOLDED="false" POSITION="bottom_or_right">
                <icon BUILTIN="unchecked"/>
            </node>
            <node TEXT="Use of namespaces" FOLDED="false" POSITION="bottom_or_right">
                <icon BUILTIN="unchecked"/>
            </node>
        </node>
        <node TEXT="How to ..." FOLDED="false" POSITION="bottom_or_right">
            <edge COLOR="#0000ff"/>
        </node>
        <node TEXT="Examples" FOLDED="false" POSITION="bottom_or_right">
            <edge COLOR="#00ffff"/>
            <node TEXT="generic" FOLDED="false" POSITION="bottom_or_right">
                <node TEXT="Representation of the Readme file, more or less." FOLDED="false" POSITION="bottom_or_right"/>
            </node>
            <node TEXT="vcxproj" FOLDED="true" POSITION="bottom_or_right">
                <node TEXT="vcxproj is the format of Visual Studio Projects." FOLDED="false" POSITION="bottom_or_right"/>
                <node TEXT="Editing project files via the Visual Studio GIU is error prone.&#xa;The project representation in xml as generated by the GUI&#xa;is strongly redundant.&#xa;A script based generation could start from a non-redundant&#xa;representation with sensible defaults, define defaults per&#xa;project-tree, automate generation of input from external&#xa;source files, ..." FOLDED="false" POSITION="bottom_or_right"/>
            </node>
            <node TEXT="mm" FOLDED="true" POSITION="bottom_or_right">
                <node TEXT="mm is the format of freeplane mindmaps (like this one)." FOLDED="false" POSITION="bottom_or_right"/>
            </node>
        </node>
        <node TEXT="Issues" FOLDED="false" POSITION="bottom_or_right">
            <edge COLOR="#ff00ff"/>
            <node TEXT="Indentation missing after Textnode with \n" FOLDED="false" POSITION="bottom_or_right">
                <icon BUILTIN="unchecked"/>
            </node>
        </node>
    </node>
</map>
