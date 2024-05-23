import json

from PySide6.QtCore import QObject, Slot, Signal, QDir, Property


class QtOpenI18n(QObject):
    langChanged = Signal(str)
    transStringChanged = Signal()

    def __init__(self, folder):
        QObject.__init__(self)
        self._folder = folder
        self._lang = "简体中文"
        self._languages = {}
        self.load_folder(self._folder)

    def load_folder(self, folder):
        file_path = QDir(folder)
        files = file_path.entryInfoList(["language_*.json"])
        for file in files:
            with open(file=file.absoluteFilePath(), encoding='utf-8', errors='ignore', mode='r') as f:
                data = json.load(f)
                self._languages[data["lang"]] = {word["key"]: word["value"] for word in data["trans"]}

    @Property(str, notify=langChanged)
    def lang(self):
        return self._lang

    @lang.setter
    def lang(self, lang):
        if self._lang != lang:
            self._lang = lang
            self.langChanged.emit(lang)
            self.transStringChanged.emit()

    @Property(str, notify=transStringChanged)
    def transString(self):
        return ""

    @Slot(str, result=str)
    def trans(self, key):
        return self._languages[self._lang][key]
