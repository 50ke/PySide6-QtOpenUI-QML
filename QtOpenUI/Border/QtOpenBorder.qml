import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

import QtOpenUI 1.0

Rectangle {
    id: control
    implicitWidth: 100
    implicitHeight: 40
    border.width: 1
    border.color: "#dcdfe6"
    DropShadow {
        anchors.fill: parent
        horizontalOffset: 1
        verticalOffset: 1
        radius: 0.5
        samples: 25
        color: "#08000000"
        spread: 0.0
        source: parent
    }
}