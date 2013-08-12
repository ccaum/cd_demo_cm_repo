Puppet::Type.newtype(:factory_stage) do
  @doc = "Manage a Factory Stage"

  ensurable

  newparam(:name, :namevar => true) do
    desc "Name of the stage"
  end

  newproperty(:jobs, :array_matching => :all) do
    desc "The list of jobs in this pipeline"
  end
end
