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

  def status_badge(status)
    if status == :active
      '<span class="badge badge-success">Ativo</span>'.html_safe
    else
      '<span class="badge badge-danger">Inativo</span>'.html_safe
    end
  end

  def plan_badge(plan)
    case plan
    when :basic
      '<span class="badge badge-secondary">Básico</span>'.html_safe
    when :balance
      '<span class="badge badge-secondary">Equilíbrio</span>'.html_safe
    when :freedom
      '<span class="badge badge-secondary">Liberdade</span>'.html_safe
    else
      '<span class="badge badge-danger"> </span>'.html_safe
    end
  end
end
