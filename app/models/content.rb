class Content
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Paperclip 
  has_mongoid_attached_file :topic_content
  has_mongoid_attached_file :content_audio


  field :title, type: String
  field :content_body, type: String
  field :sq_no, type: Integer
  field :transcript, type: String 

  belongs_to :topic
  has_many :questions, dependent: :destroy, order: 'sq_no ASC'
  accepts_nested_attributes_for :questions, allow_destroy: true

  #validations
   validates :title, :content_body, :sq_no, :topic_id, :presence => true   
   validates :sq_no, :numericality => {:only_integer => true}
   #validates_attachment :topic_content, :presence => true
   validates_attachment :topic_content, :content_type => {:content_type => ['audio/mpeg', 'audio/mp3']}
   validates_attachment :content_audio, :content_type => {:content_type => ['video/ogg', 'audio/ogg', 'application/ogg']}

end
