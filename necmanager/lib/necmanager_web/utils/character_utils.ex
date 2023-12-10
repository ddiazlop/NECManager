defmodule NecmanagerWeb.CharacterUtils do
  def get_characters(characters) do
    if characters == [] do
      Path.wildcard("priv/static/images/characters/*.svg")
      |> Enum.map(fn path -> String.replace(path, "priv/static/", "") end)
    else
      characters
    end
  end

  def search_character(characters, current_text) do
    Enum.map(characters, fn character -> String.replace(character, "images/characters/", "") end)
    |> Enum.map(fn character -> String.replace(character, "_", " ") end)
    |> Enum.filter(fn character -> String.contains?(character, String.downcase(current_text)) end)
    |> Enum.map(fn character -> String.replace(character, " ", "_") end)
    |> Enum.map(fn character -> "/images/characters/" <> character end)
  end
end
