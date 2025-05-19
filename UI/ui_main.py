from PyQt5.QtWidgets import (QWidget, QFileDialog, QMessageBox, QPushButton, QVBoxLayout, QLabel)

'''
用于对行人特征参数进行设置
Modified by: Lennon
Date: 2025-05-20
'''


class MainWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.setWindowTitle("行人仿真特征参数嵌入工具")

        self.btn_choose = QPushButton('选择.mm文件', self)
        self.btn_choose.clicked.connect(self.select_mm_file)

        self.lbl_path = QLabel("未选择文件", self)

        layout = QVBoxLayout()
        layout.addWidget(self.btn_choose)
        layout.addWidget(self.lbl_path)
        self.setLayout(layout)
        self.setFixedSize(540, 720)

    def select_mm_file(self):
        while True:
            file_path, _ = QFileDialog.getOpenFileName(
                self,
                "选择MassMotion文件",
                "",
                "MassMotion Files (*.mm)"
            )

            if not file_path:
                break

            if file_path.endswith('.mm'):
                self.lbl_path.setText(file_path)
                return

            # 文件格式错误提示
            QMessageBox.warning(
                self,
                "文件格式错误",
                "请选择扩展名为.mm的MassMotion文件",
                QMessageBox.Ok
            )


if __name__ == '__main__':
    import sys
    from PyQt5.QtWidgets import QApplication

    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec_())
