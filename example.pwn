#include <open.mp>
#include <pp-menu>

main(){}

public OnPlayerCommandText(playerid, cmdtext[]) {
    if (strequal(cmdtext, "/menu")) {
        new const
            ITEM_DATA[][][] =
        {
            {"Item: A", "ABCDEFGH"},
            {"Item: AB", "ABCDEFG"},
            {"Item: ABC", "ABCDEF"},
            {"Item: ABCD", "ABCDE"},
            {"Item: ABCDE", "ABCD"},
            {"Item: ABCDEF", "ABC"},
            {"Item: ABCDEFG", "AB"},
            {"Item: ABCDEFGH", "A"},
            {"Item: ABCDEFG", "AB"},
            {"Item: ABCDEF", "ABC"},
            {"Item: ABCDE", "ABCD"},
            {"Item: ABCD", "ABCDE"},
            {"Item: ABC", "ABCDEF"},
            {"Item: AB", "ABCDEFG"},
            {"Item: A", "ABCDEFGH"}
        };

        for (new i, size = sizeof (ITEM_DATA); i != size; ++i) {
            AddItemToMenu(playerid, 0, ITEM_DATA[i][0]);
            AddItemToMenu(playerid, 1, ITEM_DATA[i][1]);
        }

        inline const OnResponse(response, listitem) {
            SendClientMessage(playerid, -1, "Response: %i, Listitem: %i", response, listitem);
        }

        ShowMenuCallback(playerid, using inline OnResponse, "Menu", 20.0, 120.0, 200.0);

        return 1;
    }

    return 0;
}