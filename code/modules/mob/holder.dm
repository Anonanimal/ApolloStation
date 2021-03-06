//Helper object for picking dionaea (and other creatures) up.
/obj/item/weapon/holder
	name = "holder"
	desc = "You shouldn't ever see this."
	icon = 'icons/obj/objects.dmi'
	slot_flags = SLOT_HEAD
	sprite_sheets = list("Vox" = 'icons/mob/species/vox/head.dmi')

/obj/item/weapon/holder/New()
	item_state = icon_state
	..()
	processing_objects.Add(src)

/obj/item/weapon/holder/Del()
	processing_objects.Remove(src)
	..()

/obj/item/weapon/holder/process()

	if(istype(loc,/turf) || !(contents.len))

		for(var/mob/M in contents)

			var/atom/movable/mob_container
			mob_container = M
			mob_container.forceMove(get_turf(src))
			M.reset_view()

		del(src)

/obj/item/weapon/holder/attackby(obj/item/weapon/W as obj, mob/user as mob)
	for(var/mob/M in src.contents)
		M.attackby(W,user)

/obj/item/weapon/holder/proc/show_message(var/message, var/m_type)
	for(var/mob/living/M in contents)
		M.show_message(message,m_type)

//Mob procs and vars for scooping up
/mob/living/var/holder_type

/mob/living/proc/get_scooped(var/mob/living/carbon/grabber)
	if(!holder_type || buckled || pinned.len)
		return

	var/obj/item/weapon/holder/H = new holder_type(loc)
	src.loc = H
	H.name = loc.name
	H.attack_hand(grabber)

	grabber << "You scoop up [src]."
	src << "[grabber] scoops you up."
	grabber.status_flags |= PASSEMOTES
	return

//Mob specific holders.

/obj/item/weapon/holder/diona
	name = "diona nymph"
	desc = "It's a tiny plant critter."
	icon_state = "nymph"
	origin_tech = "biotech=5"
	slot_flags = SLOT_HEAD | SLOT_OCLOTHING

/obj/item/weapon/holder/drone
	name = "maintenance drone"
	desc = "It's a small maintenance robot."
	icon_state = "drone"
	origin_tech = "magnets=3;engineering=5"

/obj/item/weapon/holder/cat
	name = "cat"
	desc = "It's a cat. Meow."
	icon_state = "cat"
	origin_tech = null

/obj/item/weapon/holder/borer
	name = "cortical borer"
	desc = "It's a slimy brain slug. Gross."
	icon_state = "borer"
	origin_tech = "biotech=6"

/obj/item/weapon/holder/bunny
	name = "bunny"
	desc = "It's a cute little bunny."
	icon_state = "bunny"
	origin_tech = null

/obj/item/weapon/holder/bones2
	name = "Bones"
	desc = "That's Bones the cat. He's a laid back, brown stray cat. Meow."
	icon = 'icons/apollo/mob/animal.dmi'
	icon_state = "cat3"
	origin_tech = null

/obj/item/weapon/holder/danton
	name = "Danton"
	desc = "Its the great Danton! Perhaps he could fit in the entertainer's hat?"
	icon = 'icons/apollo/objects.dmi'
	icon_state = "bunny"
	origin_tech = null

/obj/item/weapon/holder/spybug
	name = "spy bug"
	desc = "It's a small robot bug with a microscopic camera and microphone."
	icon_state = "drone"
	icon = 'icons/apollo/objects.dmi'
	origin_tech = "engineering=5 illegal=2"

