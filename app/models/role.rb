class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    auditions.pluck(:actor)
  end

  def locations
    auditions.pluck(:location)
  end

  def lead
    lead = auditions.find_by(hired: true)
    lead || "no actor has been hired for this role"
  end

  def understudy
    understudy = auditions.where(hired:true)[1]
    understudy || "no actor has been hired for this role"
  end
end
