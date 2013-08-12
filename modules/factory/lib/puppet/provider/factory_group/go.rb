Puppet::Type.type(:factory_group).provide :go, :parent => Puppet::Provider::FactoryGroup do
  desc "The Thoughtworks Go provider for the factory_group type"

  def self.prefetch(resources)
    instances.each do |prov|
      if resource = resources[prov.name]
        resources.provider = prov
      end
    end
  end

  def self.instances


  def pipelines
