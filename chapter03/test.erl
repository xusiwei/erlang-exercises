-module(test).
-export([test_hourse/0, test_street/0]).


test_hourse() ->
    TomsHourse = hourse:create("Tom"),
    {hourse, {owner, "Tom"}} = TomsHourse,
    "Tom" = hourse:get_attribute(TomsHourse, owner),
    {hourse, {owner, "Tom"}, {no, 1234}} = hourse:add_attribute(TomsHourse, no, 1234),
    {ok, done}.

test_street() ->
    TomsHourse = hourse:create("Tom"),
    AmysHourse = hourse:create("Amy"),
    AvenStreet = street:create(TomsHourse),
    [TomsHourse] = AvenStreet,
    TomsHourse = street:get_hourse(AvenStreet, 0),
    AvenStreet2 = street:add_hourse(AvenStreet, AmysHourse),
    [TomsHourse, AmysHourse] = AvenStreet2,
    AmysHourse = street:get_hourse(AvenStreet2, 1),
    {ok, done}.
