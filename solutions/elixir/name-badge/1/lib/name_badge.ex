defmodule NameBadge do
  @separator " - "

  def print(id, name, department) do
    print_id(id) <> name <> @separator <> print_department(department) 
  end

  defp print_id(id, separator \\ @separator) do
    if id, do: "[#{id}]" <> separator, else: ""
  end

  defp print_department(department) do
    if department do
      String.upcase(department)
    else
      "OWNER"
    end
  end
end
