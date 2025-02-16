
--[[
        This example uses xmlrep.qtui to generate a Qt resource file.
        Original: https://github.com/nullobsi/cantata/blob/main/gui/coverdialog.ui
--]]

require "xmlrep.qtui" :makeglobal()

local K=ui {
    class "CoverDialog",
    widget("QWidget", "CoverDialog") {
        rectproperty("geometry", 0,0,417,304)
    },
    layout ("QGridLayout", "gridLayout") {
        numberproperty("margin", 0),
        item(0,0) {
            widget("LineEdit", "query"){}
        },
        item(0,1) {
            widget("QPushButton", "search") {
                stringproperty("text", "Search")
            }
        },
        item(0,2) {
            widget("FlatToolButton", "addFileButton") {
                stringproperty("tooltip", "A local file")
            }
        },
        item(1,0,4) {
            widget("QListWidget", "list") {}
        },
        item(2,0,4) {
            widget("NoteLabel", "note") {
                stringproperty("text", "This can only be used to change the file used for covers, it will not alter any embedded covers you may have in your song files."),
            }
        },
    },
    customwidgets {
        extendedwidget("FlatToolButton", "QToolButton", "support/flattoolbutton.h"),
        extendedwidget("LineEdit", "QLineEdit", "support/lineedit.h"),
        extendedwidget("NoteLabel", "QLabel", "widgets/notelabel.h"),
    }
}

local outfile=...
if outfile then io.output(outfile):write(tostring(K), "\n")
else                               print(tostring(K))
end
