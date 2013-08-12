Puppet::Type.newtype(:factory_job) do
  @doc = "Manage a Factory Job"

  ensurable

  newparam(:command, :namevar => true) do
    desc "The command to run"
  end

  newproperty(:arguments, :array_matching => :all) do
    desc "The arguments to be passed to the command"
  end

  newproperty(:if_conditions) do
    desc "The conditions under which the job should run"
  end
end
