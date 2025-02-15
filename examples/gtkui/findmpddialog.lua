
X=require "examples.gtkui"

-- https://github.com/nullobsi/cantata/blob/main/gui/findmpddialog.ui

local K=X.ui {
    X.class "FindMpdDialog",
    X.widget("QDialog", "FindMpdDialog") {
        X.rectproperty("geometry", 0,0,478,310),
        X.sizeproperty("minimumSize", 0,0),
        X.stringproperty("windowTitle", "Server Detection"),
        X.layout ("QVBoxLayout", "verticalLayout") {
            X.item() {
                X.widget("QLabel", "label") {
                    X.stringproperty("text", "Please select your MPD. If you don't see your MPD listed here, check that zeroconf is activated in your MPD configuration or insert the host configuration manually."),
                    X.setproperty("alignment", "Qt::AlignLeading|Qt::AlignLeft|Qt::AlignTop"),
                    X.boolproperty("wordWrap", true),
                    X.setproperty("textInteractionFlags", "Qt::TextSelectableByMouse")
                }
            },
            X.item() {
                X.widget("QTableWidget", "tableWidget") {
                    X.setproperty("editTriggers", "QAbstractItemView::NoEditTriggers"),
                    X.enumproperty("selectionMode", "QAbstractItemView::SingleSelection"),
                    X.enumproperty("selectionBehavior", "QAbstractItemView::SelectRows"),
                    X.boolproperty("showGrid", true),
                    X.boolproperty("sortingEnabled", true),
                    X.boolattribute("horizontalHeaderStretchLastSection", true),
                    X.boolattribute("verticalHeaderVisible", false)
                }
            },
            X.item() {
                X.widget("QDialogButtonBox", "buttonBox") {
                    X.enumproperty("orientation", "Qt::Horizontal"),
                    X.setproperty("standardButtons", "QDialogButtonBox::Cancel|QDialogButtonBox::Ok")
                }
            }
        },
    },
    X.resources {},
    X.connections {
        X.acceptedconnection("buttonBox", "FindMpdDialog") {
            X.hints {X.xyhint("sourcelabel", 248, 254), X.xyhint("destinationlabel", 157, 274)}
        },
        X.rejectedconnection("buttonBox", "FindMpdDialog") {
            X.hints {X.xyhint("sourcelabel", 316, 260), X.xyhint("destinationlabel", 286, 274)}
        }
    }
}

print [[<?xml version="1.0" encoding="UTF-8"?>]]
print(tostring(K))
