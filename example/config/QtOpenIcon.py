from PySide6.QtCore import QObject, Slot, QDir


class QtOpenIcon(QObject):
    def __init__(self, folder, icon_prefix):
        QObject.__init__(self)
        self._folder = folder
        self._icon_prefix = icon_prefix
        self._icons = {}
        self.load_folder(self._folder)

    def load_folder(self, folder):
        file_path = QDir(folder)
        files = file_path.entryInfoList(["*.svg"])
        for file in files:
            self._icons[file.completeBaseName()] = self._icon_prefix + file.fileName()

    @Slot(str, result=str)
    def icon(self, name):
        a = self._icons[name]
        return self._icons[name]