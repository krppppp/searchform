class CardsSearchForm < FormObject
  attribute :effect_category, String
  attribute :keyword, String
  attribute :name, String
  attribute :name_kana, String
  attribute :text, String
  attribute :card_monster1, String
  attribute :card_monster2, String
  attribute :attribute, String
  attribute :tribe, String
  attribute :level_low, String
  attribute :level_high, String
  attribute :level, String
  attribute :rank, String
  attribute :pendulum_blue_low, String
  attribute :pendulum_blue_high, String
  attribute :pendulum_red_low, String
  attribute :pendulum_red_high, String
  attribute :link_low, String
  attribute :link_high, String
  attribute :left_up, String
  attribute :up, String
  attribute :right_up, String
  attribute :left, String
  attribute :right, String
  attribute :left_down, String
  attribute :down, String
  attribute :right_down, String
  attribute :offensive_power_low, String
  attribute :offensive_power_high, String
  attribute :offensive_power_nil, String
  attribute :deffensive_power_low, String
  attribute :deffensive_power_high, String
  attribute :deffensive_power_nil, String
  attribute :no_restriction, String
  attribute :semi_restriction, String
  attribute :restriction, String
  attribute :ban, String

  def search_card form
    result = Card.all

    if form[:keyword].present?
      if form[:name] && form[:name_kana] && form[:text]
        result = result.where(
            'name LIKE ? or
            name_kana LIKE ? or
            text LIKE ?',
            "%#{form[:keyword]}%",
            "%#{form[:keyword]}%",
            "%#{form[:keyword]}%")
      elsif form[:name] && form[:name_kana]
        result = result.where(
            'name LIKE ? or
            name_kana LIKE ?',
            "%#{form[:keyword]}%",
            "%#{form[:keyword]}%")
      elsif form[:name] && form[:text]
        result = result.where(
            'name LIKE ? or
            text LIKE ?',
            "%#{form[:keyword]}%",
            "%#{form[:keyword]}%")
      elsif form[:name_kana] && form[:text]
        result = result.where(
            'name_kana LIKE ? or
            text LIKE ?',
            "%#{form[:keyword]}%",
            "%#{form[:keyword]}%")
      elsif form[:name]
        result = result.where(
            'name LIKE ?',
            "%#{form[:keyword]}%")
      elsif form[:name_kana]
        result = result.where(
            'name_kana LIKE ?',
            "%#{form[:keyword]}%")
      elsif form[:text]
        result = result.where(
            'text LIKE ?',
            "%#{form[:keyword]}%")
      end
    end


    # if form[:internships_search_form][:title].present?
    #   result = result.where('title LIKE ? or
    #                         business_description LIKE ? or
    #                         work_description LIKE ? or
    #                         flow LIKE ? or
    #                         skill LIKE ? or
    #                         work_at LIKE ? or
    #                         work_time LIKE ? or
    #                         work_style LIKE ? or
    #                         qualification_requirement LIKE ? or
    #                         seeking_person LIKE ? or
    #                         hourly_wage LIKE ? or
    #                         comments LIKE ? or
    #                         invoice LIKE ?',
    #                         "%#{form[:internships_search_form][:title]}%",
    #                         "%#{form[:internships_search_form][:title]}%",
    #                         "%#{form[:internships_search_form][:title]}%",
    #                         "%#{form[:internships_search_form][:title]}%",
    #                         "%#{form[:internships_search_form][:title]}%",
    #                         "%#{form[:internships_search_form][:title]}%",
    #                         "%#{form[:internships_search_form][:title]}%",
    #                         "%#{form[:internships_search_form][:title]}%",
    #                         "%#{form[:internships_search_form][:title]}%",
    #                         "%#{form[:internships_search_form][:title]}%",
    #                         "%#{form[:internships_search_form][:title]}%",
    #                         "%#{form[:internships_search_form][:title]}%",
    #                         "%#{form[:internships_search_form][:title]}%")
    # end
    #
    # if !result.blank? && !form[:area].blank? && !form[:area][:area].blank?
    #   result = result.where('work_at LIKE ?', "%#{form[:area][:area].first}%")
    # end
    # if !result.blank? && !form[:job].blank? && !form[:job][:job_id].blank?
    #   result = result.map{|m| m if form[:job][:job_id].map{|m| m.to_i}.include?(m.internship_type)}.compact
    # end
    # if !result.blank? && !form[:business].blank? && !form[:business][:business_type].blank?
    #   result = result.map{|m| m if form[:business][:business_type].map{|m| m.to_i}.include?(m.company.business_category)}.compact
    # end
    # if !result.blank? && !form[:internship_tag].blank? && !form[:internship_tag][:tag_id].blank?
    #   # result = result.map{|m| m if form[:internship_tag][:tag_id] == m.internship_tags.map{|m| m.tag_id.to_s}}.compact
    #
    #   result = result.map{|n| n if form[:internship_tag][:tag_id].map{|m| m if n.internship_tags.find_by(tag_id: m.to_i).nil? && n.internship_tags.blank? }.compact.blank? }.compact
    #
    # end

    return result
  end
end
