Puppet::Type.newtype(:factory_group) do
  @doc = "Manage a Factory Pipeline group"

  ensurable

  newparam(:name, :namevar => true) do
    desc "Name of the group"
  end

  newproperty(:pipelines, :array_matching => :all) do
    desc "The list of pipelines in this group"
  end
end
