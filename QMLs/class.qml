import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    anchors.fill: parent

    Text {
        //Надпись: Что омтечать
    }

    ComboBox {
        //Выбор из выпадающего списка то, что нужно отмечать
        //Летят данные из БД
    }

    Text {
        //Надпись: выбирете класс
    }

    ComboBox {
        //Выбор из выпадающего списка класс. тоже из сервера
    }

    Rectangle {
        //Кнопка: "Далее", "начать отмечать"
    }

}

