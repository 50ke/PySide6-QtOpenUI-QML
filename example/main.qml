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
            oType: "default"
            oText: "Default"
        }
        QtOpenButton{
            oType: "primary"
            oText: "Primary"
        }
        QtOpenButton{
            oType: "success"
            oText: "Success"
        }
        QtOpenButton{
            oType: "warning"
            oText: "Warning"
        }
        QtOpenButton{
            oType: "danger"
            oText: "Danger"
        }
        QtOpenButton{
            oType: "info"
            oText: "Info"
        }
    }
    Row {
        id: www
        spacing: 10
        anchors.top: qqq.bottom
        anchors.left: qqq.left
        anchors.topMargin: 10
        QtOpenButton{
            oType: "default"
            oText: "Default"
        }
        QtOpenButton{
            oType: "plain-primary"
            oText: "Primary"
        }
        QtOpenButton{
            oType: "plain-success"
            oText: "Success"
        }
        QtOpenButton{
            oType: "plain-warning"
            oText: "Warning"
        }
        QtOpenButton{
            oType: "plain-danger"
            oText: "Danger"
        }
        QtOpenButton{
            oType: "plain-info"
            oText: "Info"
        }
    }
    Row {
        id: rrr
        spacing: 10
        anchors.top: www.bottom
        anchors.left: qqq.left
        anchors.topMargin: 10
        QtOpenButton{
            oShape: "round"
            oType: "default"
            oText: "Default"
        }
        QtOpenButton{
            oShape: "round"
            oType: "primary"
            oText: "Primary"
        }
        QtOpenButton{
            oShape: "round"
            oType: "success"
            oText: "Success"
        }
        QtOpenButton{
            oShape: "round"
            oType: "warning"
            oText: "Warning"
        }
        QtOpenButton{
            oShape: "round"
            oType: "danger"
            oText: "Danger"
        }
        QtOpenButton{
            oShape: "round"
            oType: "info"
            oText: "Info"
        }
    }
}