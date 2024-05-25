from PySide6.QtCore import QAbstractItemModel, QModelIndex, Qt


# 自定义的树形节点类
class TreeNode:
    # 初始化节点数据和父亲节点
    def __init__(self, data, parent=None):
        # 存储节点数据
        self._data = data
        # 存储父节点
        self._parent = parent
        # 存储子节点
        self._children = []

    # 添加一个子节点
    def appendChild(self, child):
        self._children.append(child)

    # 删除一个子节点
    def removeChild(self, item):
        self._children.remove(item)

    # 获取某一行的子节点
    def child(self, row):
        return self._children[row]

    # 获取子节点的个数
    def childCount(self):
        return len(self._children)

    # 获取列数
    def columnCount(self):
        return 1

    # 获取节点某一列的数据
    def data(self, column):
        if column == 0:
            return self._data

    # 获取父节点
    def parent(self):
        return self._parent

    # 获取该节点在父节点中的行号
    def row(self):
        if self._parent:
            return self._parent._children.index(self)

    # 判断节点是否包含子节点
    def hasChildren(self):
        return len(self._children) > 0


# 自定义的树形数据模型
class QtOpenTreeModel(QAbstractItemModel):
    # 初始化根节点
    def __init__(self, root, parent=None):
        super().__init__(parent)
        # 如果没有传入根节点，则创建一个空的根节点作为根
        self._root = root or TreeNode(None)
        # self._root = root

    # 获取某个节点在模型中的Index
    def index(self, row, column, parent=QModelIndex()):
        if not self.hasIndex(row, column, parent):
            return QModelIndex()
        if not parent.isValid():
            parentItem = self._root
        else:
            parentItem = parent.internalPointer()
        childItem = parentItem.child(row)
        if childItem:
            return self.createIndex(row, column, childItem)
        else:
            return QModelIndex()

    # 获取某个节点的父节点的Index
    def parent(self, index):
        if not index.isValid():
            return QModelIndex()
        childItem = index.internalPointer()
        parentItem = childItem.parent()
        if parentItem == self._root:
            return QModelIndex()
        return self.createIndex(parentItem.row(), 0, parentItem)

    # 获取某个节点的子节点个数
    def rowCount(self, parent=QModelIndex()):
        if parent.column() > 0:
            return 0
        if not parent.isValid():
            parentItem = self._root
        else:
            parentItem = parent.internalPointer()
        return parentItem.childCount()

    # 获取列数，这里只有一列
    def columnCount(self, parent=QModelIndex()):
        return 1

    # 获取某个节点的数据
    def data(self, index, role=Qt.DisplayRole):
        if not index.isValid():
            return None
        item = index.internalPointer()
        if role == Qt.DisplayRole:
            return item.data(index.column())

    def flags(self, index):
        if not index.isValid():
            return Qt.NoItemFlags
        return super().flags(index)
