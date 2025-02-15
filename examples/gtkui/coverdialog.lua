
X=require "examples.gtkui"

-- https://github.com/nullobsi/cantata/blob/main/gui/coverdialog.ui

local K=X.ui {
    X.class "CoverDialog",
    X.widget("QWidget", "CoverDialog") {
        X.property "geometry" {
            X.rect(0,0,417,304)
        }
    },
    X.layout ("QGridLayout", "gridLayout") {
        X.property "margin" {
            X.number (0)
        },
        X.item(0,0) {
            X.widget("LineEdit", "query"){}
        },
        X.item(0,1) {
            X.widget("QPushButton", "search") {
                X.property "text" {
                    X.string "Search"
                }
            }
        },
        X.item(0,2) {
            X.widget("FlatToolButton", "addFileButton") {
                X.property "tooltip" {
                    X.string "A local file"
                }
            }
        },
        X.item(1,0,4) {
            X.widget("QListWidget", "list") {}
        },
        X.item(2,0,4) {
            X.widget("NoteLabel", "note") {
                X.property "text" {
                    X.string "This can only be used to change the file used for covers, it will not alter any embedded covers you may have in your song files."
                }
            }
        },
    },
    X.customwidgets {
        X.customwidget {X.class "FlatToolButton", X.extends "QToolButton", X.header "support/flattoolbutton.h"},
        X.customwidget {X.class "LineEdit", X.extends "QLineEdit", X.header "support/lineedit.h"},
        X.customwidget {X.class "NoteLabel", X.extends "QLabel", X.header "widgets/notelabel.h"},
    }
}

print(tostring(K))
