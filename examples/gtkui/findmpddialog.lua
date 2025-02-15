
X=require "examples.gtkui"

-- https://github.com/nullobsi/cantata/blob/main/gui/findmpddialog.ui

local K=X.ui {
    X.class "FindMpdDialog",
    X.widget("QDialog", "FindMpdDialog") {
        X.property "geometry" {
            X.rect(0,0,478,310)
        },
        X.property "minimumSize" {
            X.size(0,0)
        },
        X.property "windowTitle" {
            X.string "Server Detection"
        },
        X.layout ("QVBoxLayout", "verticalLayout") {
            X.item() {
                X.widget("QLabel", "label") {
                    X.property "text" {
                        X.string "Please select your MPD. If you don't see your MPD listed here, check that zeroconf is activated in your MPD configuration or insert the host configuration manually."
                    },
                    X.property "alignment" {
                        X.set "Qt::AlignLeading|Qt::AlignLeft|Qt::AlignTop"
                    },
                    X.property "wordWrap" {
                        X.bool(true)
                    },
                    X.property "textInteractionFlags" {
                        X.set "Qt::TextSelectableByMouse"
                    },
                }
            },
            X.item() {
                X.widget("QTableWidget", "tableWidget") {
                    X.property "editTriggers"{
                        X.set "QAbstractItemView::NoEditTriggers"
                    },
                    X.property "selectionMode"{
                        X.enum "QAbstractItemView::SingleSelection"
                    },
                    X.property "selectionBehavior"{
                        X.enum "QAbstractItemView::SelectRows"
                    },
                    X.property "showGrid"{
                        X.bool (true)
                    },
                    X.property "sortingEnabled"{
                        X.bool (true)
                    },
                    X.attribute "horizontalHeaderStretchLastSection"{
                        X.bool (true)
                    },
                    X.attribute "verticalHeaderVisible"{
                        X.bool (false)
                    },
                }
            },
            X.item() {
                X.widget("QDialogButtonBox", "buttonBox") {
                    X.property "orientation"{
                        X.enum "Qt::Horizontal"
                    },
                    X.property "standardButtons"{
                        X.set "QDialogButtonBox::Cancel|QDialogButtonBox::Ok"
                    },
                }
            }
        },
    },
    X.resources {},
    X.connections {
        X.connection {
            X.sender "buttonBox",
            X.signal "accepted()",
            X.receiver "FindMpdDialog",
            X.slot "accept()",
            X.hints {
                X.hint "sourcelabel" {X.x (248), X.y(254)},
                X.hint "destinationlabel" {X.x (157), X.y(274)}
            }
        },
        X.connection {
            X.sender "buttonBox",
            X.signal "rejected()",
            X.receiver "FindMpdDialog",
            X.slot "reject()",
            X.hints {
                X.hint "sourcelabel" {X.x (316), X.y(260)},
                X.hint "destinationlabel" {X.x (286), X.y(274)}
            }
        }
    }
}

print [[<?xml version="1.0" encoding="UTF-8"?>]]
print(tostring(K))
