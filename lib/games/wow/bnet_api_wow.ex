defmodule BnetApi.Request.Wow do
	import BnetApi.Request

	require Logger

	def get_achievement(%{"region" => region, "id" => id}) do
		make_call("/wow/achievement/#{id}", region)
	end

	def get_auction_data_status(%{"region" => region, "realm" => realm}) do
		make_call('/wow/auction/data/:realm', region)
	end

	def get_all_bosses(%{"region" => region}) do
		make_call("/wow/boss", region)
	end

	def get_boss(%{"region" => region, "boss_id" => boss_id}) do
		make_call("/wow/boss/#{boss_id}", region)
	end

	def get_realm_leaderborad(%{"region" => region, "realm" => realm}) do
		make_call("/wow/challenge/#{realm}", region)
	end

	def get_region_leaderboard(%{"region" => region}) do
		make_call("/wow/challenge/region", region)
	end

	def get_character_profile(%{"region" => region, "realm" => realm, "character_name" => character_name, "fields" => fields}) do
		case fields.length do
			0 ->
				make_call("/wow/character/#{realm}/#{character_name}", region)
			_ ->
				make_call("/wow/character/#{realm}/#{character_name}?fields=#{Enum.join(fields, ",")}", region)
		end
	end

	def get_guild(%{"region" => region, "realm" => realm, "guild_name" => guild_name, "fields" => fields}) do
		case fields.length do
			0 ->
				make_call("/wow/guild/#{realm}/#{guild_name}", region)
			_ ->
				make_call("/wow/guild/#{realm}/#{guild_name}?fields=#{Enum.join(fields, ",")}", region)
		end
	end

	def get_item(%{"region" => region, "item_id" => item_id}) do
		make_call("/wow/item/${item_id}", region)
	end

	def get_item_set(%{"region" => region, "set_id" => set_id}) do
		make_call("/wow/item/set/#{set_id}", region)
	end

	def get_all_mounts(%{"region" => region}) do
		make_call("/wow/mount", region)
	end

	def get_all_pets(%{"region" => region}) do
		make_call("/wow/pet", region)
	end

	def get_pet_ability(%{"region" => region, "ability_id" => ability_id}) do
		make_call("/wow/pet/ability/#{ability_id}", region)
	end

	def get_pet_species(%{"region" => region, "species_id" => species_id}) do
		make_call("/wow/pet/species/species_id", region)
	end

	def get_pet_stats(%{"region" => region, "species_id" => species_id}) do
		make_call("/wow/pet/stats/species_id", region)
	end

	def get_pvp_leaderboard(%{"region" => region, "bracket" => bracket}) do 
		make_call("/wow/leaderboard/#{bracket}", region)
	end

	def get_quest(%{"region" => region, "quest_id" => quest_id}) do
		make_call("/wow/quest/#{quest_id}", region)
	end

	def get_realm_status(%{"region" => region}) do
		make_call("/wow/realm/status", region)
	end

	#data api
	def get_connected_realms(%{"region" => region}) do
		make_call("/data/wow/connected-realm/", region)
	end

	def get_connected_realm(%{"region" => region, "realm_id" => realm_id}) do
		make_call("/data/wow/connected-realm/#{realm_id}", region)
	end

	def get_mythic_leaderboards(%{"region" => region, "realm_id" => realm_id}) do
		make_call("/data/wow/connected-realm/#{realm_id}/mythic-leaderboard/", region)
	end

	def get_mythic_leaderboard(%{"region" => region, "realm_id" => realm_id, "dungeon_id" => dungeon_id, "period" => period}) do
		make_call("/data/wow/connected-realm/#{realm_id}/mythic-leaderboard/#{dungeon_id}/period/#{period}", region)
	end

	def get_mythic_raid_leaderboard(%{"region" => region, "raid" => raid, "faction" => faction}) do
		make_call("/data/wow/leaderboard/hall-of-fame/#{raid}/#{faction}", region)
	end

	def get_mythic_challenge_mode(%{"region" => region}) do
		make_call("/data/wow/mythic-challenge-mode/", region)
	end

	def get_playable_classes(%{"region" => region}) do
		make_call("/data/wow/playable-class/", region)
	end

	def get_playable_class(%{"region" => region, "class_id" => class_id}) do
		make_call("/data/wow/playable-class/#{class_id}", region)
	end

	def get_playable_specializations(%{"region" => region}) do
		make_call("/data/wow/playable-specialization/", region)
	end

	def get_playable_specialization(%{"region" => region, "spec_id" => spec_id}) do
		make_call("/data/wow/playable-specialization/#{spec_id}", region)
	end

	def get_realms(%{"region" => region}) do
		make_call("/data/wow/realm", region)
	end

	def get_realm(%{"region" => region, "realm" => realm}) do
		make_call("/data/wow/realm/#{realm}", region)
	end

	def get_regions(%{"region" => region}) do
		make_call("/data/wow/region/", region)
	end

	def get_region(%{"region_id" => region_id, "region" => region}) do
		make_call("/data/wow/region/#{region_id}", region)
	end

	def get_tokens(%{"region" => region}) do
		make_call("/data/wow/token/", region)
	end

	# end data api

	def get_recipe(%{"region" => region, "recipe_id" => recipe_id}) do
		make_call("/wow/recipe/#{recipe_id}", region)
	end

	def get_spell(%{"region" => region, "spell_id" => spell_id}) do
		make_call("/wow/spell/#{spell_id}", region)
	end

	def get_all_zones(%{"region" => region}) do
		make_call("/wow/zone", region)
	end

	def get_zone(%{"region" => region, "zone_id" => zone_id}) do
		make_call("/wow/zone/#{zone_id}", region)
	end

	def get_battlegroups(%{"region" => region}) do
		make_call("/wow/data/battlegroups/", region)
	end

	def get_character_races(%{"region" => region}) do
		make_call("/wow/data/character/races", region)
	end

	def get_character_classes(%{"region" => region}) do 
		make_call("/wow/data/character/classes", region)
	end

	def get_character_achievements(%{"region" => region}) do
		make_call("/wow/data/character/acheivements", region)
	end

	def get_guild_rewards(%{"region" => region}) do
		make_call("/wow/data/guild/rewards", region)
	end

	def get_guild_perks(%{"region" => region}) do
		make_call("/wow/data/guild/perks", region)
	end

	def get_guild_achievements(%{"region" => region}) do
		make_call("/wow/data/guild/acheivements", region)
	end

	def get_item_classes(%{"region" => region}) do
		make_call("/wow/data/item/classes", region)
	end

	def get_talents(%{"region" => region}) do
		make_call("/wow/data/talents", region)
	end

	def get_pet_types(%{"region" => region}) do
		make_call("/wow/data/pet/types", region)
	end

end