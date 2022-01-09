module ApplicationHelper
  def flash_class(level)
    bootstrap_alert_class = {
      "success" => "green white-text",
      "error" => "red white-text",
      "notice" => "purple white-text",
      "alert" => "amber white-text",
      "warn" => "blue white-text"
    }
    bootstrap_alert_class[level]
  end

end
