# frozen_string_literal: true

module ApplicationHelper
  def humanize_boolean(value)
    case value
    when true
      '<span class="badge bg-success">Sim</span>'.html_safe
    when false
      '<span class="badge bg-danger">Não</span>'.html_safe
    when nil
      'Indefinido'
    else
      'Invalido'
    end
  end
end
