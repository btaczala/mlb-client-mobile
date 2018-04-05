var test = false

function Timer(parent) {
    return Qt.createQmlObject("import QtQuick 2.0; Timer {}", parent)
}

function getTeamData(teamList, finishedFunction) {

    var timer = new Timer(teamList)
    timer.interval = 1000 * 1

    timer.repeat = false

    timer.triggered.connect(function () {
        teamList.append({
                            image: "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                            name: "Michał Dudzik",
                            age: 10
                        })
        teamList.append({
                            image: "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                            name: "Michał Dudzik",
                            age: 10
                        })
        teamList.append({
                            image: "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                            name: "Michał Dudzik",
                            age: 10
                        })
        teamList.append({
                            image: "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                            name: "Michał Dudzik",
                            age: 10
                        })
        teamList.append({
                            image: "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                            name: "Michał Dudzik",
                            age: 10
                        })
        teamList.append({
                            image: "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                            name: "Michał Dudzik",
                            age: 10
                        })
        teamList.append({
                            image: "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                            name: "Michał Dudzik",
                            age: 10
                        })
        teamList.append({
                            image: "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                            name: "Michał Dudzik",
                            age: 10
                        })
        teamList.append({
                            image: "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                            name: "Michał Dudzik",
                            age: 10
                        })
        teamList.append({
                            image: "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                            name: "Michał Dudzik",
                            age: 10
                        })
        teamList.append({
                            image: "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                            name: "Michał Dudzik",
                            age: 10
                        })

        finishedFunction()
    })

    timer.start()
}

function getTeamsData(major, pretendent, basic, parent, callback) {

    var timer = new Timer(parent)
    timer.interval = 1000 * 1

    timer.repeat = false

    timer.triggered.connect(function () {
        major.append({
                         name: "GRYF-PANTHERS"
                     })
        major.append({
                         name: "GRYF-PANTHERS"
                     })
        major.append({
                         name: "GRYF-PANTHERS"
                     })
        major.append({
                         name: "GRYF-PANTHERS"
                     })
        major.append({
                         name: "GRYF-PANTHERS"
                     })
        major.append({
                         name: "GRYF-PANTHERS"
                     })
        major.append({
                         name: "GRYF-PANTHERS"
                     })

        pretendent.append({
                              name: "GRYF-PANTHERS"
                          })
        pretendent.append({
                              name: "GRYF-PANTHERS"
                          })
        pretendent.append({
                              name: "GRYF-PANTHERS"
                          })
        pretendent.append({
                              name: "GRYF-PANTHERS"
                          })
        pretendent.append({
                              name: "GRYF-PANTHERS"
                          })

        basic.append({
                         name: "GRYF-PANTHERS"
                     })
        basic.append({
                         name: "GRYF-PANTHERS"
                     })
        basic.append({
                         name: "GRYF-PANTHERS"
                     })
        basic.append({
                         name: "GRYF-PANTHERS"
                     })
        root.loading = false;
    })

    timer.start()
}
