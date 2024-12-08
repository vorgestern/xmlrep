<map version="freeplane 1.12.1">
<!--To view this file, download free mind mapping software Freeplane from https://www.freeplane.org -->
<node TEXT="xmlrep" FOLDED="false" ID="ID_696401721" CREATED="1610381621824" MODIFIED="1733700963932" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false" associatedTemplateLocation="template:/standard-1.6.mm" show_tags="UNDER_NODES" showTagCategories="false" show_icon_for_attributes="true" show_note_icons="true"/>
    <tags category_separator="::"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="bottom_or_right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ID="ID_271890427" ICON_SIZE="12 pt" COLOR="#000000" STYLE="fork">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="200" DASH="" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_271890427" STARTARROW="NONE" ENDARROW="DEFAULT"/>
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
<richcontent TYPE="DETAILS" CONTENT-TYPE="plain/auto"/>
<richcontent TYPE="NOTE" CONTENT-TYPE="plain/auto"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.tags">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.selection" BACKGROUND_COLOR="#afd3f7" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#afd3f7"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="bottom_or_right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important" ID="ID_67550811">
<icon BUILTIN="yes"/>
<arrowlink COLOR="#003399" TRANSPARENCY="255" DESTINATION="ID_67550811"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.flower" COLOR="#ffffff" BACKGROUND_COLOR="#255aba" STYLE="oval" TEXT_ALIGN="CENTER" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="22 pt" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#f9d71c" BORDER_DASH_LIKE_EDGE="false" BORDER_DASH="CLOSE_DOTS" MAX_WIDTH="6 cm" MIN_WIDTH="3 cm"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="bottom_or_right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10 pt" SHAPE_VERTICAL_MARGIN="10 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="5" RULE="ON_BRANCH_CREATION"/>
<node TEXT="Purpose" POSITION="bottom_or_right" ID="ID_1181759979" CREATED="1733700866673" MODIFIED="1733700975406">
<edge COLOR="#ff0000"/>
<node TEXT="Create xml source from Lua data structures" ID="ID_71315440" CREATED="1733700941378" MODIFIED="1733701030272"/>
<node TEXT="Facilitate write domain-specific Lua representations" ID="ID_525229881" CREATED="1733701035688" MODIFIED="1733701076217"/>
</node>
<node TEXT="Status&#xa;Version 0.1" POSITION="bottom_or_right" ID="ID_207607545" CREATED="1733700884937" MODIFIED="1733702150888">
<edge COLOR="#00ff00"/>
<node TEXT="Creation of arbitrary xml trees" LOCALIZED_STYLE_REF="default" ID="ID_1023651828" CREATED="1733701105078" MODIFIED="1733701390807">
<icon BUILTIN="checked"/>
</node>
<node TEXT="Escaping text properly" ID="ID_1269337889" CREATED="1733701135616" MODIFIED="1733701384273">
<icon BUILTIN="unchecked"/>
</node>
<node TEXT="Use of xml-entities" ID="ID_732699357" CREATED="1733701150132" MODIFIED="1733701378164">
<icon BUILTIN="unchecked"/>
</node>
<node TEXT="Use of namespaces" ID="ID_1813137980" CREATED="1733701165379" MODIFIED="1733701368644">
<icon BUILTIN="unchecked"/>
</node>
</node>
<node TEXT="How to .." POSITION="bottom_or_right" ID="ID_1870027787" CREATED="1733700879179" MODIFIED="1733700999776">
<edge COLOR="#0000ff"/>
</node>
<node TEXT="Examples" POSITION="bottom_or_right" ID="ID_1099087003" CREATED="1733701536642" MODIFIED="1733701541195">
<edge COLOR="#00ffff"/>
<node TEXT="generic" ID="ID_237108734" CREATED="1733702063916" MODIFIED="1733702068156">
<node TEXT="Representation of the Readme file, more or less." ID="ID_466552312" CREATED="1733702080891" MODIFIED="1733702118825"/>
</node>
<node TEXT="vcxproj" ID="ID_1112602961" CREATED="1733701551078" MODIFIED="1733701555396">
<node TEXT="vcxproj is the format of Visual Studio Projects" ID="ID_1252952431" CREATED="1733701563480" MODIFIED="1733701604967"/>
<node TEXT="Editing project files via the Visual Studio GIU is error prone.&#xa;The project representation in xml as generated by the GUI&#xa;is strongly redundant.&#xa;A script based generation could start from a non-redundant&#xa;representation with sensible defaults, define defaults per&#xa;project-tree, automate generation of input from external&#xa;source files, ..." ID="ID_437575547" CREATED="1733701605889" MODIFIED="1733702019506"/>
<node TEXT="" ID="ID_1859156869" CREATED="1733701689262" MODIFIED="1733701689262"/>
</node>
<node TEXT="mm" ID="ID_1468197862" CREATED="1733702028727" MODIFIED="1733702030834">
<node TEXT="mm is the format of freeplane mindmaps (like this one)" ID="ID_1276167471" CREATED="1733702033169" MODIFIED="1733702058036"/>
</node>
</node>
<node TEXT="Issues" POSITION="bottom_or_right" ID="ID_722241524" CREATED="1733701448183" MODIFIED="1733701452691">
<edge COLOR="#ff00ff"/>
<node TEXT="Indentation missing after Textnode with \n" ID="ID_967967247" CREATED="1733701461604" MODIFIED="1733701501709">
<icon BUILTIN="unchecked"/>
</node>
</node>
</node>
</map>
