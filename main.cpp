#include <QtGui>
#include <QtDeclarative/QDeclarativeContext>
#include <QErrorMessage>
#include "qmlapplicationviewer.h"

#include "songsmodel.h"

#define DB_FILE "tabs.db"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);


    QSqlDatabase m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName(DB_FILE);
    if (!m_db.open()) {
        qDebug() << "cannot open database";

        QErrorMessage error;
        error.showMessage("cannot open database"); // FIXME _tr_
        error.exec();
        qApp->quit();
    }


    SongsModel authorsModel;
    authorsModel.loadAuthors();
    SongsModel songsModel;
//    songsModel.findByAuthor("ACDC");

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockLandscape);

    QDeclarativeContext *ctxt = viewer.rootContext();
    ctxt->setContextProperty("authorsModel", &authorsModel);
    ctxt->setContextProperty("songsModel", &songsModel);

    viewer.setMainQmlFile(QLatin1String("qml/chordie/main.qml"));
    viewer.showExpanded();


    return app.exec();
}
