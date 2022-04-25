# frozen_string_literal: true

class Package
  @@packages = []
  attr_accessor :name, :contents, :handlings

  def initialize name
    @name = name
    @contents = []
    @handlings = []
    @@packages << self
  end

  def self.clear
    @@packages = []
  end

  def self.count
    @@packages.length
  end

  def self.last
    @@packages[-1]
  end

  def self.for name
    @@packages.find {|p| p.name == name}
  end

  def self.describe(&block)
    instance_eval &block
  end

  def self.package(name, &block)
    Package.new name
    instance_eval &block
  end
  
  def self.content(text)
    Package.last.contents << text
  end
  
  def self.handling(&block)
    instance_eval &block
  end
  
  def self.instruction text
    Package.last.handlings << text
  end
end