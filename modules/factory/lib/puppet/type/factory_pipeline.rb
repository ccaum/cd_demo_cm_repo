Puppet::Type.newtype(:factory_pipeline) do
  @doc = "Manage a Factory Pipeline"

  ensurable

  newparam(:name, :namevar => true) do
    desc "Name of the pipeline"
  end

  newproperty(:stages, :array_matching => :all) do
    desc "The list of stages in this pipeline"
  end
end
