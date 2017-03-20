defmodule Rox.CFHandle do
  @moduledoc """
  Struct module representing a handle for a database.

  """

  @typedoc "A reference to a RocksDB column family"
  @type t :: %__MODULE__{resource: binary, reference: reference}
  defstruct [:resource, :reference]


  @doc false
  def wrap_resource(resource) do
    %__MODULE__{resource: resource, reference: make_ref()}
  end

  defimpl Inspect do
    import Inspect.Algebra

    def inspect(handle, opts) do
      "#Rox.CFHandle<#{to_doc(handle.reference, opts)}>"
    end
  end
end