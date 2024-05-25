import json

from PySide6.QtCore import QObject, Signal, Property, Slot
from PySide6.QtGui import QFont


class QtOpenStyle(QObject):
    fontFamilyChanged = Signal(str)
    bodyTextChanged = Signal(QFont)
    bodyBoldTextChanged = Signal(QFont)

    def __init__(self, file_path):
        QObject.__init__(self)
        self._file_path = file_path
        self._font_family = "Arial"
        self._styles = {}
        self.load_style(self._file_path)

    def load_style(self, file_path):
        with open(file=file_path, encoding='utf-8', errors='ignore', mode='r') as f:
            style_data = json.load(f)
            for key, value in style_data.items():
                self._styles[key] = {style["type"]: style for style in value}

    @Property(str, notify=fontFamilyChanged)
    def fontFamily(self):
        return self._font_family

    @fontFamily.setter
    def fontFamily(self, fontFamily):
        if fontFamily != self._font_family:
            self._font_family = fontFamily
            self.fontFamilyChanged.emit(fontFamily)

    @Slot(str, str, result=str)
    def Text(self, text_type, text_property):
        if text_type in self._styles["text"] and text_property in self._styles["text"][text_type]:
            return self._styles["text"][text_type][text_property]

    @Slot(str, str, result=str)
    def Button(self, button_type, button_property):
        if button_type in self._styles["button"] and button_property in self._styles["button"][button_type]:
            return self._styles["button"][button_type][button_property]

    @Property(QFont, notify=bodyTextChanged)
    def BodyText(self):
        return QFont(self._font_family, 12, QFont.Weight.Normal)

    @Property(QFont, notify=bodyBoldTextChanged)
    def BodyBoldText(self):
        return QFont(self._font_family, 12, QFont.Weight.Bold)