#include <QtGui/QApplication>
#include <QtDeclarative>
#include <QErrorMessage>
#include "qmlapplicationviewer.h"

#include "songsmodel.h"

#if defined(Q_WS_MAEMO_5)
#define DB_FILE "/opt/chordie/data/tabs.db"
#define QML_FILE "qml/chordie/fremantle/main.qml"
#elif defined(MEEGO_EDITION_HARMATTAN)
#define DB_FILE "/opt/chordie/data/tabs.db"
#define QML_FILE "qml/chordie/harmattan/main.qml"
#else
#define DB_FILE "tabs.db"
#define QML_FILE "qml/chordie/fremantle/main.qml"
#endif

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



    QmlApplicationViewer viewer;

    QDeclarativeContext *ctxt = viewer.rootContext();
    ctxt->setContextProperty("authorsModel", &authorsModel);
    ctxt->setContextProperty("songsModel", &songsModel);

    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String(QML_FILE));

    viewer.showExpanded();

    return app.exec();
}
