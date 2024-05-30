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
        return self._icons[name]

    @Slot(str, result=str)
    def namedIcon(self, name):
        if name == "组件总览":
            return self._icons["home-solid"]
        elif name == "基础组件":
            return self._icons["cube-solid"]
        elif name == "配置组件":
            return self._icons["tools-solid"]
        elif name == "表单组件":
            return self._icons["wpforms"]
        elif name == "数据展示":
            return self._icons["digital-tachograph-solid"]
        elif name == "导航组件":
            return self._icons["stream-solid"]
        elif name == "反馈组件":
            return self._icons["comment-dots-solid"]
        else:
            return self._icons["truck-moving-solid"]