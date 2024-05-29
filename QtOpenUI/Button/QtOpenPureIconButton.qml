import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QtOpenUI 1.0

RoundButton {
    property string oIconSource
    property color oNormalTextColor: "#dedfe0"
    property color oPressedTextColor: "#ffffff"
    property color oHoveredTextColor: "#ffffff"
    id: control
    topPadding: 2
    bottomPadding: 2
    leftPadding: 2
    rightPadding: 2
    display: AbstractButton.IconOnly
    icon.source: oIconSource
    icon.color: control.pressed ? control.oPressedTextColor : (control.hovered ? control.oHoveredTextColor : control.oNormalTextColor)
    background: Rectangle {
        border.width: 0
        border.color: "transparent"
        color: "transparent"
    }
}