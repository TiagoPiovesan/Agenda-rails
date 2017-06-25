module ApplicationHelper
  CIDADES_SANTACATARINA = [
    ["Florianópolis", "Floripa"],
    ["Guarujá do Sul", "GJÁ"],
    ["São josé do cedro", "SJO"],
    ["Chapecó", "CCÓ"],
    ["São bento do sul", "SBDS"],
    ["São miguel do oeste", "SMO"],
  ]

  def options_for_cidades(selected)
  	options_for_select(CIDADES_SANTACATARINA, selected)
  end
end
