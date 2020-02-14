defmodule Library do
  def float_to_string(arg) do
    :io_lib.format("~.2f", [arg])
  end

  def get_env_variable(name) do
    System.get_env(name)
  end

  def get_extension_name(file) do
    Path.extname(file)
  end

  def get_cwd do
    File.cwd!()
  end
end
