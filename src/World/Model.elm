module World.Model exposing (World, init, canEncounter)

import World.Encounter.Model as Encounter  
import World.Zones.Model as Zone

import World.Zones.Data.Argenteuil as Argenteuil
import World.Zones.Data.BourgPoulette as BourgPoulette
import World.Zones.Data.Foret_de_Jude as Foret_de_Jude
import World.Zones.Data.Judielle as Judielle
import World.Zones.Data.Mont_Solonote as Mont_Solonote
import World.Zones.Data.Oziruo as Oziruo
import World.Zones.Data.Route1 as Route1
import World.Zones.Data.Route2 as Route2
import World.Zones.Data.Route3 as Route3
import World.Zones.Data.Route4 as Route4


type alias World = {
        currentZone: Zone.Zone,
        zones: List Zone.Zone,
        encounters: List Encounter.Encounter
    }


init: World
init = let currentZone = BourgPoulette.create
    in World 
        currentZone 
        [
            currentZone,
            Route1.create,
            Judielle.create,
            Route2.create,
            Foret_de_Jude.create,
            Argenteuil.create,
            Route3.create,
            Mont_Solonote.create,
            Route4.create,
            Oziruo.create
        ]
        []


canEncounter: World -> Bool
canEncounter world 
    = List.length world.encounters < 8 
    && Zone.hasPakeman world.currentZone