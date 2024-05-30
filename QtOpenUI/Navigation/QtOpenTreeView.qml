import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import QtQml.Models

import QtOpenUI 1.0

TreeView {
    property var oModel
    anchors.fill: parent
    model: oModel
    delegate: Rectangle {
        id: treeDelegate
        implicitWidth: parent.width
        implicitHeight: 32
        border.color: "black"
        border.width: 1

        readonly property real indent: 20
        readonly property real padding: 50
        required property TreeView treeView
        required property bool isTreeNode
        required property bool expanded
        required property int hasChildren
        required property int depth
        required property bool current
        TapHandler {
            onTapped: treeView.toggleExpanded(row)
        }
        // 行内容
        Row{
            anchors.centerIn: parent
            anchors.fill: parent
            spacing: 10
            leftPadding: 10
            rightPadding: 10
            Image {
                anchors.verticalCenter: parent.verticalCenter
                visible: depth == 0
                width: 16
                height: 16
                source: QtOpenIcon.icon("setting")
            }
            Item {
                anchors.verticalCenter: parent.verticalCenter
                width: depth == 0 ? 0 : 20
                height: 16
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                id: label
                clip: true
                text: model.display
            }
            Item {
                anchors.verticalCenter: parent.verticalCenter
                width: 60
                height: 16
            }
            Image {
                anchors.verticalCenter: parent.verticalCenter
                visible: depth == 0
                width: 16
                height: 16
                source: treeDelegate.expanded ? QtOpenIcon.icon("angle-up-solid") : QtOpenIcon.icon("angle-down-solid")
            }
        }
//        Rectangle{
//            height: 32
//            color: "yellow"
//            Row{
//                anchors.fill: parent
//
//                spacing: 10
//                Image {
//                anchors.verticalCenter: parent.verticalCenter
//                    width: 24
//                    height: 24
//                    source: QtOpenIcon.icon("setting")
//                }
//                Text {
//                anchors.verticalCenter: parent.verticalCenter
//                    id: label
//                    x: padding + (treeDelegate.isTreeNode ? (treeDelegate.depth + 1) * treeDelegate.indent : 0)
//                    width: treeDelegate.width - treeDelegate.padding - x
//                    clip: true
//                    text: model.display
//                }
//            }
//        }


//        Text {
//            id: indicator
//            visible: treeDelegate.isTreeNode && treeDelegate.hasChildren
//            x: padding + (treeDelegate.depth * treeDelegate.indent)
//            anchors.verticalCenter: label.verticalCenter
//            text: "▶"
//            rotation: treeDelegate.expanded ? 90 : 0
//        }

//        Text {
//            id: label
//            x: padding + (treeDelegate.isTreeNode ? (treeDelegate.depth + 1)
//                                                    * treeDelegate.indent : 0)
//            width: treeDelegate.width - treeDelegate.padding - x
//            clip: true
//            text: model.display
//        }
    }
}
