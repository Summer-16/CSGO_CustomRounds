/*  Advanced-Custom-Rounds
 *
 *  Copyright (C) 2020 SUMMER SOLDIER
 * 
 * This program is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) 
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT 
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS 
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with 
 * this program. If not, see http://www.gnu.org/licenses/.
 */
#pragma semicolon 1
#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <sdkhooks>

new Handle: timers[MAXPLAYERS + 1];
new bool: roundEnabled;
int selectedRound;

public Plugin: myinfo = {
    name = "Advanced Custom Rounds",
    author = "Summer Soldier",
    description = "Advanced Custom Rounds by Summer Soldier",
    version = "1.2",
    url = "https://github.com/Summer-16"
};

public void OnPluginStart() {
    HookEvent("round_prestart", Restart);
    HookEvent("player_spawn", Event_PlayerSpawn);
    RegAdminCmd("sm_rounds", roundsMenu, ADMFLAG_GENERIC);
}

public Action: Restart(Handle: event,
    const String: name[], bool: dontBroadcast) {
    for (new i = 1; i <= MaxClients; i++) {
        if (IsClientInGame(i)) {
            OnClientDisconnect(i);
        }
    }
    roundEnabled = false;
    ServerCommand("wr_reload");
}

public Action startTheCustomRounds(Handle timer)
{
    roundEnabled = true;
    for (new i = 1; i <= MaxClients; i++) {
        if (IsClientInGame(i) && GetClientTeam(i) > 1) {
            CS_RespawnPlayer(i);
        }
    }
}

public int roundsMenuHandler(Menu menu, MenuAction action, int param1, int param2) {
    /* If an option was selected, tell the client about the item. */
    if (action == MenuAction_Select) {
        char roundName[32];
        bool found = menu.GetItem(param2, roundName, sizeof(roundName));
        selectedRound = param2;

        if (found) {
          if(selectedRound==3){
            ServerCommand("wr_unrestrict weapon_deagle");
            PrintToChatAll("Starting Deagle Round in 3 Sec");
            CreateTimer(3.0, startTheCustomRounds);
          }else if(selectedRound==11){
            ServerCommand("wr_unrestrict weapon_deagle");
            ServerCommand("wr_unrestrict weapon_revolver");
            PrintToChatAll("Starting Revolver Round in 3 Sec");
            CreateTimer(3.0, startTheCustomRounds);
          }else if(selectedRound==32){
            ServerCommand("wr_unrestrict weapon_scar20");
            PrintToChatAll("Starting SCAR20 Round in 3 Sec");
            CreateTimer(3.0, startTheCustomRounds);
          }else{
            CreateTimer(0.0, startTheCustomRounds);
          }
        }
    }
    /* If the menu was cancelled, print a message to the server about it. */
    else if (action == MenuAction_Cancel) {
        PrintToChat(param1, "You closed the menu no round selected");
    }
    /* If the menu has ended, destroy it */
    else if (action == MenuAction_End) {
        delete menu;
    }
}

public Action roundsMenu(int client, int args) {
    Menu menu = new Menu(roundsMenuHandler);
    menu.SetTitle("Custom Rounds by Summer Soldier");
    menu.AddItem("knifeonly", "Knife Only Round"); //0
    menu.AddItem("zeus", "Zeus + Nades Round"); //1
    menu.AddItem("usp", "USP Round"); //2
    menu.AddItem("deagle", "Deagle Round"); //3
    menu.AddItem("barettas", "Dual Barettas"); //4
    menu.AddItem("fivaSeven", "Fiveseven"); //5
    menu.AddItem("glock", "Glock"); //6
    menu.AddItem("p2000", "P2000"); //7
    menu.AddItem("p250", "P250"); //8
    menu.AddItem("tec9", "Tec9"); //9
    menu.AddItem("cz75", "cz75-Auto"); //10
    menu.AddItem("revolver", "R8 revolver"); //11
    menu.AddItem("m249", "M249 Round"); //12
    menu.AddItem("mag7", "Mag7  Round"); //13
    menu.AddItem("negev", "Negev  Round"); //14
    menu.AddItem("nova", "Nova  Round"); //15
    menu.AddItem("sawedoff", "Sawed-off Round"); //16
    menu.AddItem("xm1014", "XM1014  Round"); //17
    menu.AddItem("ppBizon", "PP-Bizon Round"); //18
    menu.AddItem("mac10", "Mac-10 Round"); //19
    menu.AddItem("mp7", "MP7  Round"); //20
    menu.AddItem("mp9", "MP9  Round"); //21
    menu.AddItem("p90", "P90  Round"); //22
    menu.AddItem("ump45", "UMP-45 Round"); //23
    menu.AddItem("mp5", "Mp5 sd Round"); //24
    menu.AddItem("m4", "M4A4 Round"); //25
    menu.AddItem("m4s", "M4A1-S Round"); //26
    menu.AddItem("ak47", "Ak47  Round"); //27
    menu.AddItem("aug", "AUG Round"); //28
    menu.AddItem("famas ", "Famas Round"); //29
    menu.AddItem("galil", "Galil  Round"); //30
    menu.AddItem("ssg08", "SSG 08 Round"); //31
    menu.AddItem("scar", "Scar  Round"); //32
    menu.AddItem("awp", "AWP  Round"); //33
    menu.AddItem("wtf", "WTF Round"); //34

    menu.ExitButton = true;
    menu.Display(client, 20);
    return Plugin_Handled;
}

public Event_PlayerSpawn(Handle: event,
    const String: name[], bool: dontBroadcast) {
    new client = GetClientOfUserId(GetEventInt(event, "userid"));
    if (roundEnabled) {
        execRound(client);
    }
}

execRound(client) {
    if (timers[client] != INVALID_HANDLE) {
        KillTimer(timers[client]);
    }

    timers[client] = CreateTimer(3.0, Darm, client, TIMER_REPEAT);

    StripAllWeapons(client);

    switch (selectedRound) {
        case 0: {
            GivePlayerItem(client, "weapon_knife");
        }
        case 1: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_hegrenade");
            GivePlayerItem(client, "weapon_tagrenade");
            GivePlayerItem(client, "weapon_incgrenade");
            GivePlayerItem(client, "weapon_taser");
        }
        case 2: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_usp_silencer");
        }
        case 3: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_deagle");
        }
        case 4: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_deagle");
        }
        case 5: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_fiveseven");
        }
        case 6: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_glock");
        }
        case 7: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_hkp2000");
        }
        case 8: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_p250");
        }
        case 9: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_tec9");
        }
        case 10: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_cz75a");
        }
        case 11: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_revolver");
        }
        case 12: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_m249");
        }
        case 13: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_mag7");
        }
        case 14: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_negev");
        }
        case 15: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_nova");
        }
        case 16: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_sawedoff");
        }
        case 17: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_xm1014");
        }
        case 18: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_bizon");
        }
        case 19: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_mac10");
        }
        case 20: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_mp7");
        }
        case 21: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_mp9");
        }
        case 22: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_p90");
        }
        case 23: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_ump45");
        }
        case 24: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_mp5sd");
        }
        case 25: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_m4a1");
        }
        case 26: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_m4a1_silencer");
        }
        case 27: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_ak47");
        }
        case 28: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_aug");
        }
        case 29: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_famas");
        }
        case 30: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_galilar");
        }
        case 31: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_ssg08");
        }
        case 32: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_scar20");
        }
        case 33: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_awp");
        }
        case 34: {
            GivePlayerItem(client, "weapon_knife");
            GivePlayerItem(client, "weapon_breachcharge");
            GivePlayerItem(client, "weapon_bumpmine");
            GivePlayerItem(client, "weapon_shield");
            GivePlayerItem(client, "weapon_taser");
            GivePlayerItem(client, "weapon_flashbang");
            GivePlayerItem(client, "weapon_flashbang");
            GivePlayerItem(client, "weapon_hegrenade");
            GivePlayerItem(client, "weapon_incgrenade");
            GivePlayerItem(client, "weapon_smokegrenade");
            GivePlayerItem(client, "weapon_tagrenade");
            GivePlayerItem(client, "weapon_healthshot");
        }
    }
}

stock StripAllWeapons(iClient) {
    new iEnt;
    for (new i = 0; i <= 4; i++) {
        while ((iEnt = GetPlayerWeaponSlot(iClient, i)) != -1) {
            RemovePlayerItem(iClient, iEnt);
            AcceptEntityInput(iEnt, "Kill");
        }
    }
}

public Action: Darm(Handle: timer, any: client) {
    if (IsPlayerAlive(client)) {
        new weapon = GetEntPropEnt(client, Prop_Data, "m_hActiveWeapon");
        if (weapon > 0 && GetEntProp(weapon, Prop_Send, "m_iItemDefinitionIndex") == 64) {
            SetEntProp(weapon, Prop_Send, "m_iPrimaryReserveAmmoCount", 8);
        }
    }
}

public OnClientDisconnect(client) {
    if (timers[client] != INVALID_HANDLE) {
        KillTimer(timers[client]);
        timers[client] = INVALID_HANDLE;
    }
}