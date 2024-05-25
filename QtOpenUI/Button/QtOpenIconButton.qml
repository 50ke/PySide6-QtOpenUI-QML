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
    property string oIconSource
    property font oTextFont
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
    topPadding: 8
    bottomPadding: 8
    leftPadding: oShape == "round" ? 8 : 15
    rightPadding: oShape == "round" ? 8 : 15
    palette.buttonText: control.pressed ? control.oPressedTextColor : (control.hovered ? control.oHoveredTextColor : control.oNormalTextColor)
    font.family: oTextFont != null ? oTextFont.family : QtOpenStyle.fontFamily
    font.pixelSize: oTextFont != null ? oTextFont.pixelSize : 14
    font.weight: oTextFont != null ? oTextFont.weight : Font.DemiBold
    text: oText
    icon.source: oIconSource
    icon.color: control.pressed ? control.oPressedTextColor : (control.hovered ? control.oHoveredTextColor : control.oNormalTextColor)
    background: Rectangle {
        radius: oShape == "round" ? implicitHeight/2 : 5
        implicitWidth: {
            if (control.display == AbstractButton.IconOnly){
                return 40
            } else if (control.display == AbstractButton.TextOnly){
                return 100
            } else if (control.display == AbstractButton.TextBesideIcon){
                return 100
            } else if (control.display == AbstractButton.TextUnderIcon){
                return 40
            } else {
                return 100
            }
        }
        implicitHeight: {
            if (control.display == AbstractButton.IconOnly){
                return 40
            } else if (control.display == AbstractButton.TextOnly){
                return 40
            } else if (control.display == AbstractButton.TextBesideIcon){
                return 40
            } else if (control.display == AbstractButton.TextUnderIcon){
                return 60
            } else {
                return 40
            }
        }
        border.width: 1
        border.color: control.pressed ? control.oPressedBorderColor : (control.hovered ? control.oHoveredBorderColor : control.oNormalBorderColor)
        color: control.pressed ? control.oPressedBackgroundColor : (control.hovered ? control.oHoveredBackgroundColor : control.oNormalBackgroundColor)
    }
}