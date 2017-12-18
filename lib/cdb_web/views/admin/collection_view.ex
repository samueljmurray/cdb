defmodule CDBWeb.Admin.CollectionView do
  use CDBWeb, :view

  def format_datetime(%DateTime{year: year, month: month, day: day, hour: hour, minute: minute, second: second}) do
    "#{zero_pad(day)} #{format_month(month)} #{year} at #{zero_pad(hour)}:#{zero_pad(minute)}:#{zero_pad(second)} (UTC)"
  end
  
  defp zero_pad(number) when number < 10, do: "0#{number}"
  defp zero_pad(number), do: "#{number}"
  
  defp format_month(1), do: "Jan"
  defp format_month(2), do: "Feb"
  defp format_month(3), do: "Mar"
  defp format_month(4), do: "Apr"
  defp format_month(5), do: "May"
  defp format_month(6), do: "Jun"
  defp format_month(7), do: "Jul"
  defp format_month(8), do: "Aug"
  defp format_month(9), do: "Sep"
  defp format_month(10), do: "Oct"
  defp format_month(11), do: "Nov"
  defp format_month(12), do: "Dec"
end
