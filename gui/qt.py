import sys
from PySide6.QtWidgets import QApplication, QWidget, QVBoxLayout, QPushButton, QLineEdit, QSizePolicy, QLabel
from PySide6.QtCore import Qt

app = QApplication(sys.argv)

window = QWidget()
window.resize(640, 480)

window.setWindowTitle("Calculator")

layout = QVBoxLayout()

label = QLabel('Enter First Value:')
label.setAlignment(Qt.AlignCenter)

input1 = QLineEdit()
input2 = QLineEdit()

result = QLineEdit()
result.setReadOnly(True)

button = QPushButton("Perform")
# button.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding)


def calculate():
    try:
        num1 = eval(input1.text())
        num2 = eval(input2.text())
        result.setText(str(num1 + num2))
    except:
        result.setText("Error! Enter Proper Values")

button.clicked.connect(calculate)

layout.addWidget(input1)
layout.addWidget(input2)
layout.addWidget(button)
layout.addWidget(result)

window.setLayout(layout)
window.show()

sys.exit(app.exec())