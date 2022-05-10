# frozen_string_literal: true

class Package
  attr_accessor :name, :contents, :handlings
  @@packages = []

  def initialize name, &blank
    @name = name
    @contents = []
    @handlings = []
    instance_eval &blank
    @@packages << self
  end

  def self.clear
    @@packages = []
  end

  def self.count
    @@packages.length
  end

  def self.for name
    @@packages.find {|p| p.name == name}
  end

  def self.describe(&block)
    instance_eval &block
  end

  def self.package(name, &block)
    Package.new name, &block
  end
  
  def content(text)
    self.contents << text
  end
  
  def handling(&block)
    instance_eval &block
  end
  
  def instruction text
    self.handlings << text
  end
end