# frozen_string_literal: true

module IndexHelper
  def section_content(code)
    section = Section.find_by(code: code)
    section.content
  end

  def contact_link(contact)
    value = contact.value
    return "tel:#{value.gsub(' ', '').gsub('(', '').gsub(')', '').gsub('-', '')}" if contact.code == 'phone'
    return "mailto:#{value}" if contact.code == 'email'

    value if %w[vk inst github tlgrm].include? contact.code
  end
end
