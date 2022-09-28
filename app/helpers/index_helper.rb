# frozen_string_literal: true

module IndexHelper
  def section_content(code)
    section = Section.find_by(code: code)
    section.content
  end

  def contact_link(contact)
    value = contact.value
    if contact.code == 'phone'
      return "tel:#{value.gsub(' ','').gsub('(','').gsub(')','').gsub('-','')}"
    end
    if contact.code == 'email'
      return "mailto:#{value}"
    end
    if ['vk', 'inst', 'github'].include? contact.code
      return value
    end
  end
end
