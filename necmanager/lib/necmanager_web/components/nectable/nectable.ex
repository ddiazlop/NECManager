defmodule NecmanagerWeb.NecTable do
  use Phoenix.Component

  attr :username, :string, default: "Tagons"
  attr :characters, :list, default: []

  def participant(assigns) do
    ~H"""
    <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
      <th
        scope="row"
        class="flex items-center px-6 py-4 text-gray-900 whitespace-nowrap dark:text-white"
      >
        <div class="ps-3">
          <div class="text-base font-semibold"><%= @username %></div>
        </div>
      </th>

      <td class="px-6 py-4">

        <% toggle = false %>
        <button
          id="dropdownCharactersButton"
          class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
          type="button"
          action={toggle = !toggle}
        >
          Select Character
          <svg
            class="w-2.5 h-2.5 ms-3"
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 10 6"
          >
            <path
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="m1 1 4 4 4-4"
            />
          </svg>
        </button>
        <p><%= toggle %></p>

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
end
