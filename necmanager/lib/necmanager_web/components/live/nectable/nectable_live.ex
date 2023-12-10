defmodule NectableLiveComponent do
  use NecmanagerWeb, :live_component

  attr :username, :string, default: "Tagons"
  attr :characters, :list, default: []

  def render(assigns) do
    ~H"""
    <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600 overflow-visible">
      <th
        scope="row"
        class="flex items-center px-6 py-4 text-gray-900 whitespace-nowrap dark:text-white"
      >
        <div class="ps-3">
          <div class="text-base font-semibold"><%= @username %></div>
        </div>
      </th>

      <td class="px-6 py-4">
        <img src="images/question-mark.svg" class="w-6 h-6 me-2" id={"selectedCharacter" <> @username} />
        <input
          type="text"
          class="w-full px-4 py-2 mt-2 text-base text-gray-700 placeholder-gray-400 border rounded-lg focus:shadow-outline"
          placeholder="Search character"
          phx-debounce="200"
          phx-keyup="character_search"
          phx-target={@myself}
          phx-click={
            JS.toggle(
              to: "#dropdownCharacters" <> @username,
              in: {"ease-out duration-300", "opacity-0", "opacity-100"},
              out: {"ease-in duration-200", "opacity-100", "opacity-0"}
            )
          }
          phx-click-away={
            JS.hide(
              to: "#dropdownCharacters" <> @username,
              transition: {"ease-in duration-200", "opacity-100", "opacity-0"}
            )
          }
        />

        <div
          id={"dropdownCharacters" <> @username}
          class="absolute mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 hidden"
          role="menu"
          aria-orientation="vertical"
          aria-labelledby={"dropdownCharactersButton" <> @username}
          tabindex="-1"
          z-index="10000"
        >
          <div class="py-1" role="none">
            <%= for character <- @characters do %>
              <a
                href="#"
                class="text-gray-700 block px-4 py-2 text-sm hover:bg-gray-100 hover:text-gray-900 dark:text-gray-200 dark:hover:bg-gray-700 dark:hover:text-white"
                role="menuitem"
                tabindex="-1"
                id={"dropdownCharacters" <> @username <> character}
                phx-click={
                  JS.set_attribute({"src", character}, to: "#selectedCharacter" <> @username)
                }
              >
                <img src={character} class="w-6 h-6 me-2" />
                <%= character
                |> Path.split()
                |> List.last()
                |> String.split("_")
                |> Enum.map(&String.capitalize/1)
                |> Enum.join(" ")
                |> String.replace(".svg", " ") %>
              </a>
            <% end %>
          </div>
        </div>
      </td>

      <td class="px-6 py-4">
        <div class="flex items-center">
          <div class="h-2.5 w-2.5 rounded-full bg-green-500 me-2"></div>
          Online
        </div>
      </td>

      <td class="px-6 py-4">
        <!-- Modal toggle -->
        <a
          href="#"
          type="button"
          data-modal-target="editUserModal"
          data-modal-show="editUserModal"
          class="font-medium text-blue-600 dark:text-blue-500 hover:underline"
        >
          Edit user
        </a>
      </td>
    </tr>
    """
  end

  import NecmanagerWeb.CharacterUtils

  def handle_event("character_search", %{"key" => "Backspace", "value" => current_text}, socket) do
    characters = search_character(get_characters([]), current_text)
    {:noreply, assign(socket, characters: characters)}
  end

  def handle_event("character_search", %{"value" => current_text}, socket) do
    characters = search_character(socket.assigns.characters, current_text)
    {:noreply, assign(socket, characters: characters)}
  end
end
