function getStandings(major, pretendent, basic, api, cb) {
    major.clear()
    pretendent.clear()
    basic.clear()

    var callback = function (jsonData) {
        console.debug("Logic.js: Parsing json=", jsonData)
        var result = JSON.parse(jsonData)

        console.log("Standings: Parsing result ", result)

        __parseModel(result["major"], major)
        __parseModel(result["pretendent"], pretendent)
        __parseModel(result["basic"], basic)

        cb();
    }

    api.refreshStandings(callback);
}

function __parseModel(data, model) {
    for (var count = 0; count < data.length; count++) {
        var obj = data[count];
        model.append({
                                  name: obj.name,
                                  points: obj.points,
                                  score: obj.score,
                                  diff: obj.diff,
                                  lost: obj.lost,
                                  wons: obj.wons,
                                  games: obj.games
                              })
    }
}
