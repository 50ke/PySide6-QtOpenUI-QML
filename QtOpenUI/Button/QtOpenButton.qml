import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QtOpenUI 1.0

RoundButton {
    property string oText: "Default"
    // 可选类型: | default | primary| success| warning | danger | info | plain-primary| plain-success| plain-warning | plain-danger | plain-info |
    property string oType: "default"
    // 可选形状: | default | round |
    property string oShape: "default"
    property color oNormalTextColor: QtOpenStyle.Button(oType, "normalTextColor")
    property color oPressedTextColor: QtOpenStyle.Button(oType, "pressedTextColor")
    property color oHoveredTextColor: QtOpenStyle.Button(oType, "hoveredTextColor")
    property color oNormalBackgroundColor: QtOpenStyle.Button(oType, "normalBackgroundColor")
    property color oPressedBackgroundColor: QtOpenStyle.Button(oType, "pressedBackgroundColor")
    property color oHoveredBackgroundColor: QtOpenStyle.Button(oType, "hoveredBackgroundColor")
    property color oNormalBorderColor: QtOpenStyle.Button(oType, "normalBorderColor")
    property color oPressedBorderColor: QtOpenStyle.Button(oType, "pressedBorderColor")
    property color oHoveredBorderColor: QtOpenStyle.Button(oType, "hoveredBorderColor")
    id: control
    text: oText
    topPadding: 8
    bottomPadding: 8
    leftPadding: 15
    rightPadding: 15
    contentItem: QtOpenText {
        text: control.text
        oColor: control.pressed ? control.oPressedTextColor : (control.hovered ? control.oHoveredTextColor : control.oNormalTextColor)
        oFont.pixelSize: 14
        oFont.weight: Font.DemiBold
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
    background: Rectangle {
        radius: oShape == "round" ? implicitHeight/2 : 5
        implicitWidth: 100
        implicitHeight: 40
        border.width: 1
        border.color: control.pressed ? control.oPressedBorderColor : (control.hovered ? control.oHoveredBorderColor : control.oNormalBorderColor)
        color: control.pressed ? control.oPressedBackgroundColor : (control.hovered ? control.oHoveredBackgroundColor : control.oNormalBackgroundColor)
    }
}