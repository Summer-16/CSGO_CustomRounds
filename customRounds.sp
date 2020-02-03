/*  SM Custom Rounds
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

new bool:revolver;
new bool:usp;
new bool:m249;
new bool:negev;
new bool:nova;
new bool:xm10;
new bool:mp5;
new bool:mp7;
new bool:mp9;
new bool:m4;
new bool:m4s;
new bool:aug;
new bool:ak47;
new bool:skout;
new bool:awp;
new bool:zeus;


public Plugin:myinfo =
{
	name = "Custom Rounds by SUMMER",
	author = "SUMMER SOldier",
	description = "",
	version = "1.0",
	url = "https://github.com/Summer-16"
};

new Handle:timers[MAXPLAYERS+1];

public OnPluginStart()
{
	HookEvent("round_prestart", Restart);
	HookEvent("player_spawn", Event_PlayerSpawn);
	RegAdminCmd("sm_revolver", roundRevolver, ADMFLAG_GENERIC);
	RegAdminCmd("sm_usp", roundUSP, ADMFLAG_GENERIC);
	RegAdminCmd("sm_m249", roundM249, ADMFLAG_GENERIC);
	RegAdminCmd("sm_negev", roundNegev, ADMFLAG_GENERIC);
	RegAdminCmd("sm_nova", roundNova, ADMFLAG_GENERIC);
	RegAdminCmd("sm_xm10", roundXM10, ADMFLAG_GENERIC);
	RegAdminCmd("sm_mp5", roundMP5, ADMFLAG_GENERIC);
	RegAdminCmd("sm_mp7", roundMP7, ADMFLAG_GENERIC);
	RegAdminCmd("sm_mp9", roundMP9, ADMFLAG_GENERIC);
	RegAdminCmd("sm_m4", roundM4, ADMFLAG_GENERIC);
	RegAdminCmd("sm_m4s", roundM4S, ADMFLAG_GENERIC);
	RegAdminCmd("sm_aug", roundAUG, ADMFLAG_GENERIC);
	RegAdminCmd("sm_ak47", roundAK47, ADMFLAG_GENERIC);
	RegAdminCmd("sm_skout", roundSkout, ADMFLAG_GENERIC);
	RegAdminCmd("sm_awp", roundAWP, ADMFLAG_GENERIC);
	RegAdminCmd("sm_zeus", roundZeus, ADMFLAG_GENERIC);
	
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i))
		{
			OnClientPutInServer(i);
		}
}

public Action:roundRevolver(client, args)
{
	revolver = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundUSP(client, args)
{
	usp = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundM249(client, args)
{
	m249 = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundNegev(client, args)
{
	negev = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundNova(client, args)
{
	nova = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundXM10(client, args)
{
	xm10 = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundMP5(client, args)
{
	mp5 = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundMP7(client, args)
{
	mp7 = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundMP9(client, args)
{
	mp9 = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundM4(client, args)
{
	m4 = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundM4S(client, args)
{
	m4s = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundAUG(client, args)
{
	aug = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundAK47(client, args)
{
	ak47 = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundSkout(client, args)
{
	skout = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundAWP(client, args)
{
	awp = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}
public Action:roundZeus(client, args)
{
	zeus = true;
	SetBuyZones("Disable");
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i) && GetClientTeam(i) > 1)
		{
			CS_RespawnPlayer(i);
		}

	return Plugin_Handled;
}


public Action:Restart(Handle:event, const String:name[], bool:dontBroadcast)
{
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i)) OnClientDisconnect(i);
	
	revolver = false;
	usp=false;
	m249=false;
	negev=false;
	nova=false;
	xm10=false;
	mp5=false;
	mp7=false;
	mp9=false;
	m4=false;
	m4s=false;
	aug=false;
	ak47=false;
	skout=false;
	awp=false;
	zeus=false;
	SetBuyZones("Enable");
}

public OnClientPutInServer(client)
{
   SDKHook(client, SDKHook_WeaponCanUse, OnWeaponCanUse);
}

public Action:OnWeaponCanUse(client, weapon)
{
	if(revolver || usp || m249 || negev || nova || xm10 || mp5 || mp7 || mp9 || m4 || m4s || aug || ak47 || skout || awp || zeus)
	{
		new index = GetEntProp(weapon, Prop_Send, "m_iItemDefinitionIndex");
		decl String:classname[64];
		
		if(index == 64 || (GetEdictClassname(weapon, classname, 64) && (StrContains(classname, "weapon_knife") != -1 || StrContains(classname, "weapon_bayonet") != -1))) return Plugin_Continue;
		else return Plugin_Handled;
		
	}
	return Plugin_Continue;
}



public Event_PlayerSpawn(Handle:event, const String:name[], bool:dontBroadcast)
{	
	new client = GetClientOfUserId(GetEventInt(event, "userid"));
	if(revolver || usp || m249 || negev || nova || xm10 || mp5 || mp7 || mp9 || m4 || m4s || aug || ak47 || skout || awp || zeus) DoRound(client);
}

public Action:CS_OnCSWeaponDrop(client, weaponindex)
{
	if(revolver || usp || m249 || negev || nova || xm10 || mp5 || mp7 || mp9 || m4 || m4s || aug || ak47 || skout || awp || zeus) return Plugin_Handled;
	
	return Plugin_Continue;
}



DoRound(client)
{
	if(timers[client] != INVALID_HANDLE) KillTimer(timers[client]);
	
	timers[client] = CreateTimer(3.0, Darm, client, TIMER_REPEAT);
	
	StripAllWeapons(client);
	
	if(revolver){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_revolver");
		}
	else if(usp){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_usp_silencer");
		}
	else if(m249){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_m249");
		}
	else if(negev){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_negev");
		}
	else if(nova){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_nova");}
	else if(xm10){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_xm1014");
		}
	else if(mp5){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_mp5sd");
		}
	else if(mp7){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_mp7");
		}
	else if(mp9){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_mp9");
		}
	else if(m4){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_m4a1");
		}
	else if(m4s){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_m4a1_silencer");
		}
	else if(aug){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_aug");
		}
	else if(ak47){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_ak47");
		}
	else if(skout){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_ssg08");
		}
	else if(awp){
		GivePlayerItem(client, "weapon_knife");
		GivePlayerItem(client, "weapon_awp");
		}
	else if(zeus){
		GivePlayerItem(client, "weapon_axe");
		GivePlayerItem(client, "weapon_hegrenade");
		GivePlayerItem(client, "weapon_tagrenade");
		GivePlayerItem(client, "weapon_incgrenade");
		GivePlayerItem(client, "weapon_taser");
		}
}

//--------------------------------------------------------

SetBuyZones(const String:status[])
{
	new maxEntities = GetMaxEntities();
	decl String:class[24];
	
	for (new i = MaxClients + 1; i < maxEntities; i++)
	{
		if (IsValidEdict(i))
		{
			GetEdictClassname(i, class, sizeof(class));
			if (StrEqual(class, "func_buyzone"))
				AcceptEntityInput(i, status);
		}
	}
}

stock StripAllWeapons(iClient)
{
    new iEnt;
    for (new i = 0; i <= 4; i++)
    {
		while ((iEnt = GetPlayerWeaponSlot(iClient, i)) != -1)
		{
            RemovePlayerItem(iClient, iEnt);
            AcceptEntityInput(iEnt, "Kill");
		}
    }
}  

public OnClientPostAdminCheck(client)
{
	timers[client] = CreateTimer(3.0, Darm, client, TIMER_REPEAT);
}

public OnClientDisconnect(client)
{
	if(timers[client] != INVALID_HANDLE)
	{
		KillTimer(timers[client]);
		timers[client] = INVALID_HANDLE;
	}
}

public Action:Darm(Handle:timer, any:client)
{
	if(IsPlayerAlive(client))
	{
		new weapon = GetEntPropEnt(client, Prop_Data, "m_hActiveWeapon");
		if(weapon > 0 && GetEntProp(weapon, Prop_Send, "m_iItemDefinitionIndex") == 64)
		{
			SetEntProp(weapon, Prop_Send, "m_iPrimaryReserveAmmoCount", 8);
		}
	}
}

