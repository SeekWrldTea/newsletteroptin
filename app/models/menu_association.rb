# == Schema Information
#
# Table name: menu_associations
#
#  id         :integer          not null, primary key
#  menu_id    :integer
#  page_id    :integer
#  link_id    :integer
#  ancestry   :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_menu_associations_on_ancestry  (ancestry)
#  index_menu_associations_on_link_id   (link_id)
#  index_menu_associations_on_menu_id   (menu_id)
#  index_menu_associations_on_page_id   (page_id)
#

class MenuAssociation < ApplicationRecord
  include RailsAdmin::MenuAssociationAdmin
  belongs_to :menu
  belongs_to :page
  belongs_to :link

  has_ancestry

  accepts_nested_attributes_for :link, allow_destroy: true

  default_scope { order('position ASC') }

  attr_accessor :title

  def as_json(options = {})
    super(options.merge(
        include: [],
        methods: [:position, :children, :node_type, :title]
    ))
  end

  def node_type
    if page.present?
      node_type = 'page'.upcase
      self.title = page.title.to_s
    elsif link.present?
      node_type = 'link'.upcase
      self.title = link.title.to_s
    end

    node_type
  end
end
