module FeedsHelper
  def choose_new_or_edit
    if action_name == "new"
      confirm_feeds_path
      elsir action
    end
  end
end
