import json

from PySide6.QtCore import QObject, Signal, Property


class QtOpenTheme(QObject):
    themeChanged = Signal(str)
    backgroundColorChanged = Signal(str)
    textColorChanged = Signal(str)

    def __init__(self, file_path):
        QObject.__init__(self)
        self._file_path = file_path
        self._name = "黑色"
        self._themes = {}
        self.load_theme(self._file_path)
        self._backgroundColor = self._themes[self._name]["backgroundColor"]
        self._textColor = self._themes[self._name]["textColor"]

    def load_theme(self, file_path):
        with open(file=file_path, encoding='utf-8', errors='ignore', mode='r') as f:
            themes = json.load(f)
            for theme in themes:
                self._themes[theme["name"]] = theme["color"]

    @Property(str, notify=themeChanged)
    def name(self):
        return self._name

    @name.setter
    def name(self, name):
        if name in self._themes:
            self._name = name
            self._backgroundColor = self._themes[name]["backgroundColor"]
            self._textColor = self._themes[name]["textColor"]
            self.themeChanged.emit(name)
            self.backgroundColorChanged.emit(self._backgroundColor)
            self.textColorChanged.emit(self._textColor)

    @Property(str, notify=backgroundColorChanged)
    def background(self):
        return self._backgroundColor

    @Property(str, notify=textColorChanged)
    def text(self):
        return self._textColor
