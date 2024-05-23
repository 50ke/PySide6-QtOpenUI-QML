import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Text{
    property color eleColor: QtOpenStyle.Text("default","color")
    property font eleFont: QtOpenStyle.BodyText

    id: control
    color: eleColor
    font: eleFont
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
}