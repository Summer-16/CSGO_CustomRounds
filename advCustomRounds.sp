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
char selectedRound[32];

public Plugin:myinfo =
{
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
}


public int roundsMenuHandler(Menu menu, MenuAction action, int param1, int param2) {
  /* If an option was selected, tell the client about the item. */
  if (action == MenuAction_Select) {
    bool found = menu.GetItem(param2, selectedRound, sizeof(selectedRound));
    if (found) {
      roundEnabled = true;
      for (new i = 1; i <= MaxClients; i++) {
        if (IsClientInGame(i) && GetClientTeam(i) > 1) {
          CS_RespawnPlayer(i);
        }
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
  menu.AddItem("knifeonly", "Knife Only Round");
  menu.AddItem("zeus", "Zeus + Nades Round");
  menu.AddItem("usp", "USP Round");
  menu.AddItem("deagle", "Deagle Round");
  menu.AddItem("nova", "Nova Round");
  menu.AddItem("mp5", "MP5 Round");
  menu.AddItem("mp9", "MP9 Round");
  menu.AddItem("negev", "Negev Round");
  menu.AddItem("ak", "AK47 Round");
  menu.AddItem("m4", "M4 Round");
  menu.AddItem("m4s", "M4-S Round");
  menu.AddItem("aug", "AUG Round");
  menu.AddItem("scout", "Scout Round");
  menu.AddItem("awp", "AWP Round");
  menu.AddItem("wtf", "WTF Round");

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

  if (StrEqual(selectedRound, "usp")) {
    GivePlayerItem(client, "weapon_knife");
    GivePlayerItem(client, "weapon_usp_silencer");
  } else if (StrEqual(selectedRound, "knifeonly")) {
    GivePlayerItem(client, "weapon_knife");
  } else if (StrEqual(selectedRound, "deagle")) {
    GivePlayerItem(client, "weapon_knife");
    GivePlayerItem(client, "weapon_deagle");
  } else if (StrEqual(selectedRound, "zeus")) {
    GivePlayerItem(client, "weapon_knife");
    GivePlayerItem(client, "weapon_axe");
    GivePlayerItem(client, "weapon_hegrenade");
    GivePlayerItem(client, "weapon_tagrenade");
    GivePlayerItem(client, "weapon_incgrenade");
    GivePlayerItem(client, "weapon_taser");
  } else if (StrEqual(selectedRound, "nova")) {
    GivePlayerItem(client, "weapon_knife");
    GivePlayerItem(client, "weapon_nova");
  } else if (StrEqual(selectedRound, "mp5")) {
    GivePlayerItem(client, "weapon_knife");
    GivePlayerItem(client, "weapon_mp5sd");
  }else if (StrEqual(selectedRound, "mp9")) {
    GivePlayerItem(client, "weapon_knife");
    GivePlayerItem(client, "weapon_mp9");
  } else if (StrEqual(selectedRound, "negev")) {
    GivePlayerItem(client, "weapon_knife");
    GivePlayerItem(client, "weapon_negev");
  } else if (StrEqual(selectedRound, "ak")) {
    GivePlayerItem(client, "weapon_knife");
    GivePlayerItem(client, "weapon_ak47");
  } else if (StrEqual(selectedRound, "m4")) {
    GivePlayerItem(client, "weapon_knife");
    GivePlayerItem(client, "weapon_m4a1");
  } else if (StrEqual(selectedRound, "m4s")) {
    GivePlayerItem(client, "weapon_knife");
    GivePlayerItem(client, "weapon_m4a1_silencer");
  } else if (StrEqual(selectedRound, "aug")) {
    GivePlayerItem(client, "weapon_knife");
    GivePlayerItem(client, "weapon_aug");
  } else if (StrEqual(selectedRound, "scout")) {
    GivePlayerItem(client, "weapon_knife");
    GivePlayerItem(client, "weapon_ssg08");
  } else if (StrEqual(selectedRound, "awp")) {
    GivePlayerItem(client, "weapon_knife");
    GivePlayerItem(client, "weapon_awp");
  } else if (StrEqual(selectedRound, "wtf")) {
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