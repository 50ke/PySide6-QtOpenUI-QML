import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window

import QtOpenUI 1.0

ApplicationWindow {
    id: page
    width: 1000
    height: 640
    visible: true
    visibility: Window.Maximized
    title: "QtOpen"

    header: ToolBar {
        height: 30
        background: Rectangle {
            anchors.fill: parent
            color: QtOpenTheme.background
        }
        Row{
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            spacing: 10
            QtOpenIconButton1{
                oIconSource: QtOpenIcon.icon("skin")
            }
            QtOpenIconButton1{
                oIconSource: QtOpenIcon.icon("language")
            }
            QtOpenIconButton1{
                oIconSource: QtOpenIcon.icon("setting")
            }
            QtOpenIconButton1{
                oIconSource: QtOpenIcon.icon("question-circle")
            }
        }
    }

    footer: TabBar {
        // ...
    }

    Rectangle{
        anchors.fill: parent
        color: "red"
    }

//    StackView {
//        anchors.fill: parent
//    }

}