
local X=require "examples.gtkui" :makeglobal()

-- https://github.com/nullobsi/cantata/blob/main/gui/findmpddialog.ui

local K=ui {
    class "FindMpdDialog",
    widget("QDialog", "FindMpdDialog") {
        rectproperty("geometry", 0,0,478,310),
        sizeproperty("minimumSize", 0,0),
        stringproperty("windowTitle", "Server Detection"),
        layout ("QVBoxLayout", "verticalLayout") {
            item() {
                widget("QLabel", "label") {
                    stringproperty("text", "Please select your MPD. If you don't see your MPD listed here, check that zeroconf is activated in your MPD configuration or insert the host configuration manually."),
                    setproperty("alignment", "Qt::AlignLeading|Qt::AlignLeft|Qt::AlignTop"),
                    boolproperty("wordWrap", true),
                    setproperty("textInteractionFlags", "Qt::TextSelectableByMouse")
                }
            },
            item() {
                widget("QTableWidget", "tableWidget") {
                    setproperty("editTriggers", "QAbstractItemView::NoEditTriggers"),
                    enumproperty("selectionMode", "QAbstractItemView::SingleSelection"),
                    enumproperty("selectionBehavior", "QAbstractItemView::SelectRows"),
                    boolproperty("showGrid", true),
                    boolproperty("sortingEnabled", true),
                    boolattribute("horizontalHeaderStretchLastSection", true),
                    boolattribute("verticalHeaderVisible", false)
                }
            },
            item() {
                widget("QDialogButtonBox", "buttonBox") {
                    enumproperty("orientation", "Qt::Horizontal"),
                    setproperty("standardButtons", "QDialogButtonBox::Cancel|QDialogButtonBox::Ok")
                }
            }
        },
    },
    resources {},
    connections {
        acceptedconnection("buttonBox", "FindMpdDialog") {
            hints {xyhint("sourcelabel", 248, 254), xyhint("destinationlabel", 157, 274)}
        },
        rejectedconnection("buttonBox", "FindMpdDialog") {
            hints {xyhint("sourcelabel", 316, 260), xyhint("destinationlabel", 286, 274)}
        }
    }
}

print [[<?xml version="1.0" encoding="UTF-8"?>]]
print(tostring(K))
