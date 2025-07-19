extends Level

@onready var small_path: PathFollow2D = $Red/SmallPath/SmallPathFollow2D
@onready var large_path: PathFollow2D = $Red/LargePath/LargePathFollow2D
@onready var red_cog_l: Cog = $Red/LargePath/LargePathFollow2D/RedCogL
@onready var red_cog_s: Cog = $Red/SmallPath/SmallPathFollow2D/RedCogS

var lever_on : bool = false


func _process(delta: float) -> void:
	if small_path.progress_ratio < 1 and lever_on:
		small_path.progress_ratio += 1 * delta
	if small_path.progress_ratio >= 1 and lever_on:
		large_path.progress_ratio += 1 * delta
		if !red_cog_l.is_spinning():
			red_cog_l.toggle_animation()
	

func _on_red_lever_lever_toggled() -> void:
	lever_on = !lever_on
	red_cog_s.toggle_animation()
	if small_path.progress_ratio >= 1:
		red_cog_l.toggle_animation()
