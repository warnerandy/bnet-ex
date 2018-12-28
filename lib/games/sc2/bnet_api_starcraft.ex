defmodule BnetApi.Request.Starcraft do
	import BnetApi.Request

	def get_player(%{"region" => region, "account_id" => account_id}) do
		make_call("/sc2/player/#{account_id}", region)
	end

	def get_achievements(%{"region" => region, "region_id" => region_id}) do
		make_call("/sc2/static/#{region_id}", region)
	end

	def get_metadata(%{"region" => region, "realm" => realm, "user_id" => user_id, "region_id" => region_id}) do
		make_call("/sc2/metadata/profile/#{region_id}/#{realm}/#{user_id}", region)
	end

	def get_profile(%{"region" => region, "realm" => realm, "user_id" => user_id, "region_id" => region_id}) do
		make_call("/sc2/profile/#{region_id}/#{realm}/#{user_id}", region)
	end

	def get_ladder_summary(%{"region" => region, "realm" => realm, "user_id" => user_id, "region_id" => region_id}) do
		make_call("/sc2/profile/#{region_id}/#{realm}/#{user_id}/ladder/summary", region)
	end

	def get_ladder(%{"region" => region, "realm" => realm, "user_id" => user_id, "ladder_id" => ladder_id, "region_id" => region_id}) do
		make_call("/sc2/profile/#{region_id}/#{realm}/#{user_id}/ladder/#{ladder_id}", region)
	end

	def gm_leaderboard(%{"region" => region, "region_id" => region_id}) do
		make_call("/sc2/ladder/grandmaster/#{region_id}", region)
	end

	def season(%{"region" => region, "region_id" => region_id}) do
		make_call("/sc2/ladder/season/#{region_id}", region)
	end

	def get_match_history(%{"region" => region, "realm" => realm, "user_id" => user_id, "region_id" => region_id}) do
		make_call("/sc2/legacy/profile/#{region_id}/#{realm}/#{user_id}/matches", region)
	end

	def get_league(%{"region" => region, "league_id" => league_id, "queue_id" => queue_id, "team_type" => team_type}) do
		make_call("/data/sc2/league/#{season_id}/#{queue_id}/#{team_type}/#{league_id}", region)
	end

	def ref_team_types() {
		%{
			arranged: 0,
			random: 1
		}
	}

	def ref_queue_types() {
		%{
			ones: 201,
			twoes: 202,
			threes: 203,
			fours: 204,
			archon: 206
		}
	}
	def ref_league_ids() {
		%{
			bronze: 0,
			silver: 1,
			gold: 2,
			platinum: 3,
			diamond: 4,
			master: 5,
			grandmaster: 6
		}
	}

end