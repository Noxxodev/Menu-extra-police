Config = {}
--Script extra police by Nox Dev : https://discord.gg/V7TkQTPbhZ
Config.MenuExtra = {
    Language = "FR", -- FR, EN
	JobName = "police", -- Nom du job pouvant utiliser le menu*
    Notif = 1, -- notif = 1 ( Esx notification ) | notif = 2 ( s1n_notif )
    ['Menu'] = {
        CoordsMenu = vector3(450.1972, -1019.044, 28.49097 + 0.8), -- Localisation du point
        Distance = 15, -- Distance a lequel on voie le point
        Markerselect = 36, -- Choix du marker affichier modifiable https://docs.fivem.net/docs/game-references/markers/
        Marker = {dirX = 0.0, dirY = 0.0, dirZ = 0.0, rotX = 0.0, rotY = 0.0, rotZ = 0.0, scaleX = 1.5, scaleY = 1.5, scaleZ = 1.5}, -- Réglage marker
        Color = {red = 46, green = 183, blue = 234, alpha = 100}, -- Couleur du marker
    },
    ['VehicleList'] = { -- Liste des véhicule autoriser à modifiers les extras
        'police',
        'police2',
        'police3',
    },
    ['Translate'] = {
        ['FR'] = {
            Text3D = "Appuyer sur [~b~E~s~] pour ouvrir le menu",
            TOO_DAMAGED = "Véhicule trop abimé",
            Police_menu = "Menu extra police",
            Active = "installé",
            Desactive = "désactivé",
        },
        ['EN'] = {
            Text3D = "Press [~b~E~s~] to open",
            TOO_DAMAGED = "Vehicle too damaged",
            Police_menu = "Extra police menu",
            Active = "activated",
            Desactive = "disabled",
        },
        
    }

}