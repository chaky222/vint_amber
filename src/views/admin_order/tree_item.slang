tr item_id="#{data[:id]}"
  td
    div class="tree_item_main_block #{ data[:bold_label]}" level="#{data[:level]}"
      == "<input onchange='tree_item_changed(this);' form='load_by_ajax_form_lite' name='open' type='checkbox' id='tree_item_main_checkbox_#{data[:id]}' value='#{data[:id]}' #{data[:opened]} />"
      label for="tree_item_main_checkbox_#{data[:id]}"
        == "#{data[:label]}"
      div class="stat_table_block"
        table class="stat_table" border="0" cellspacing="1"
          tbody
            tr
              == "#{ data[:stat_items] }"
            
      div class="tree_item_main_block_content"
        == "#{data[:content]}"