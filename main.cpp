#include <QtGui>
#include <QtDeclarative>
#include <QErrorMessage>

#include "songsmodel.h"

/*
#if defined(Q_WS_MAEMO_5)
  #define DB_FILE "/opt/chordie/data/tabs.db"
#elif defined(Q_WS_MAEMO_6)
*/
  #define DB_FILE "/opt/chordie/data/tabs.db"
/*
#else
  #define DB_FILE "tabs.db"
#endif
*/


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QSqlDatabase m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName(DB_FILE);

    if (!m_db.open()) {
        qDebug() << "cannot open database";

        QErrorMessage error;
        error.showMessage(QErrorMessage::tr("cannot open database"));
        error.exec();
        qApp->quit();
    }


    SongsModel authorsModel;
    authorsModel.loadAuthors();
    SongsModel songsModel;


    QDeclarativeView view;

    QDeclarativeContext *ctxt = view.rootContext();
    ctxt->setContextProperty("authorsModel", &authorsModel);
    ctxt->setContextProperty("songsModel", &songsModel);

    view.setSource(QUrl("qrc:/qml/main.qml"));
    view.showFullScreen();
    return app.exec();
}
