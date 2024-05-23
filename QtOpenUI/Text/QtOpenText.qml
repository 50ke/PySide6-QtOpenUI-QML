import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Text{
    property color oColor: QtOpenStyle.Text("default","color")
    property font oFont: QtOpenStyle.BodyText

    id: control
    color: oColor
    font: oFont
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
}