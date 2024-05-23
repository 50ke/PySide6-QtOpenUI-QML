import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QtOpenUI 1.0

RoundButton {
    property string eleText: "Default"
    // 可选类型: | default | primary| success| warning | danger | info | plain-primary| plain-success| plain-warning | plain-danger | plain-info |
    property string eleType: "default"
    // 可选形状: | default | round |
    property string eleShape: "default"
    property color eleNormalTextColor: QtOpenStyle.Button(eleType, "normalTextColor")
    property color elePressedTextColor: QtOpenStyle.Button(eleType, "pressedTextColor")
    property color eleHoveredTextColor: QtOpenStyle.Button(eleType, "hoveredTextColor")
    property color eleNormalBackgroundColor: QtOpenStyle.Button(eleType, "normalBackgroundColor")
    property color elePressedBackgroundColor: QtOpenStyle.Button(eleType, "pressedBackgroundColor")
    property color eleHoveredBackgroundColor: QtOpenStyle.Button(eleType, "hoveredBackgroundColor")
    property color eleNormalBorderColor: QtOpenStyle.Button(eleType, "normalBorderColor")
    property color elePressedBorderColor: QtOpenStyle.Button(eleType, "pressedBorderColor")
    property color eleHoveredBorderColor: QtOpenStyle.Button(eleType, "hoveredBorderColor")
    id: control
    text: eleText
    topPadding: 8
    bottomPadding: 8
    leftPadding: 15
    rightPadding: 15
    contentItem: QtOpenText {
        text: control.text
        eleColor: control.pressed ? control.elePressedTextColor : (control.hovered ? control.eleHoveredTextColor : control.eleNormalTextColor)
        eleFont.pixelSize: 14
        eleFont.weight: Font.DemiBold
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
    background: Rectangle {
        radius: eleShape == "round" ? implicitHeight/2 : 5
        implicitWidth: 100
        implicitHeight: 40
        border.width: 1
        border.color: control.pressed ? control.elePressedBorderColor : (control.hovered ? control.eleHoveredBorderColor : control.eleNormalBorderColor)
        color: control.pressed ? control.elePressedBackgroundColor : (control.hovered ? control.eleHoveredBackgroundColor : control.eleNormalBackgroundColor)
    }
}