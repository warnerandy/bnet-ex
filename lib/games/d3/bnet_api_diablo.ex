defmodule BnetApi.Request.Diablo do
	import BnetApi.Request

	require Logger

	def get_acts(%{"region" => region}) do
		make_call("/d3/data/act", region)
	end

	def get_act(%{"region" => region, "act_id" => act_id}) do
		make_call("/d3/data/act/#{act_id}", region)
	end

	def get_artisan(%{"region" => region, "artisan_slug" => artisan_slug}) do
		make_call("/d3/data/artisan/#{artisan_slug}", region)
	end

	def get_artisan_recipe(%{"region" => region, "artisan_slug" => artisan_slug, "recipe_slug" => recipe_slug}) do
		make_call("/d3/data/artisan/#{artisan_slug}/recipe/#{recipe_slug}", region)
	end

	def get_follower(%{"region" => region, "follower_slug" => follower_slug}) do
		make_call("/d3/data/follower/#{follower_slug}", region)
	end

	def get_character_class(%{"region" => region, "class_slug" => class_slug}) do
		make_call("/d3/data/hero/#{class_slug}", region)
	end

	def get_character_skill(%{"region" => region, "class_slug" => class_slug, "skill_slug" => skill_slug}) do
		make_call("/d3/data/hero/#{class_slug}/skill/#{skill_slug}", region)
	end

	def get_item_types(%{"region" => region}) do
		make_call("/d3/data/item-type", region)
	end

	def get_item_type(%{"region" => region, "item_type_slug" => item_type_slug}) do
		make_call("/d3/data/item-type/#{item_type_slug}", region)
	end

	def get_item(%{"region" => region, "item_slug" => item_slug, "item_id" => item_id}) do
		make_call("/d3/data/item/#{item_slug}#{item_id}", region)
	end

	def get_account(%{"region" => region, "account" => account}) do
		make_call("/d3/profile/#{account}/", region)
	end

	def get_hero(%{"region" => region, "account" => account, "hero_id" => hero_id}) do
		make_call("/d3/profile/#{account}/hero/#{hero_id}", region)
	end

	def get_hero_items(%{"region" => region, "account" => account, "hero_id" => hero_id}) do
		make_call("/d3/profile/#{account}/hero/#{hero_id}/items", region)
	end

	def get_hero_follower_items(%{"region" => region, "account" => account, "hero_id" => hero_id}) do
		make_call("/d3/profile/#{account}/hero/#{hero_id}/follower-items", region)
	end

	# data apis

	def get_seasons(%{"region" => region}) do
		make_call("/data/d3/season/", region)
	end

	def get_season(%{"region" => region, "season_id" => season_id}) do
		make_call("/data/d3/season/#{season_id}", region)
	end
	def get_season_leaderboard(%{"region" => region, "season_id" => season_id, "leaderboard_id" => leaderboard_id}) do
		make_call("/data/d3/season/#{season_id}/leaderboard/#{leaderboard_id}", region)
	end

	def get_eras(%{"region" => region}) do
		make_call("/data/d3/era", region)
	end

	def get_era(%{"region" => region, "era_id" => era_id}) do
		make_call("/data/d3/era/#{era_id}", region)
	end

	def get_era_leaderboard(%{"region" => region, "era_id" => era_id, "leaderboard_id" => leaderboard_id}) do
		make_call("/data/d3/era/#{era_id}/leaderboard/#{leaderboard_id}", region)
	end

end