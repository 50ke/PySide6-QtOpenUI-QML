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

    Row {
        id: qqq
        spacing: 10
        anchors.centerIn: parent
        QtOpenButton{
            eleType: "default"
            eleText: "Default"
        }
        QtOpenButton{
            eleType: "primary"
            eleText: "Primary"
        }
        QtOpenButton{
            eleType: "success"
            eleText: "Success"
        }
        QtOpenButton{
            eleType: "warning"
            eleText: "Warning"
        }
        QtOpenButton{
            eleType: "danger"
            eleText: "Danger"
        }
        QtOpenButton{
            eleType: "info"
            eleText: "Info"
        }
    }
    Row {
        id: www
        spacing: 10
        anchors.top: qqq.bottom
        anchors.left: qqq.left
        anchors.topMargin: 10
        QtOpenButton{
            eleType: "default"
            eleText: "Default"
        }
        QtOpenButton{
            eleType: "plain-primary"
            eleText: "Primary"
        }
        QtOpenButton{
            eleType: "plain-success"
            eleText: "Success"
        }
        QtOpenButton{
            eleType: "plain-warning"
            eleText: "Warning"
        }
        QtOpenButton{
            eleType: "plain-danger"
            eleText: "Danger"
        }
        QtOpenButton{
            eleType: "plain-info"
            eleText: "Info"
        }
    }
    Row {
        id: rrr
        spacing: 10
        anchors.top: www.bottom
        anchors.left: qqq.left
        anchors.topMargin: 10
        QtOpenButton{
            eleShape: "round"
            eleType: "default"
            eleText: "Default"
        }
        QtOpenButton{
            eleShape: "round"
            eleType: "primary"
            eleText: "Primary"
        }
        QtOpenButton{
            eleShape: "round"
            eleType: "success"
            eleText: "Success"
        }
        QtOpenButton{
            eleShape: "round"
            eleType: "warning"
            eleText: "Warning"
        }
        QtOpenButton{
            eleShape: "round"
            eleType: "danger"
            eleText: "Danger"
        }
        QtOpenButton{
            eleShape: "round"
            eleType: "info"
            eleText: "Info"
        }
    }
}