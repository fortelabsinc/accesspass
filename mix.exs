defmodule AccessPass.Mixfile do
  use Mix.Project

  def project do
    [
      app: :access_pass,
      name: "AccessPass",
      docs: [
        main: "introduction",
        extras: [
          "doc_extras/introduction.md",
          "doc_extras/getting_started.md",
          "doc_extras/configuration_options.md",
          "doc_extras/phoenix_routes_helper.md",
          "doc_extras/email_template.md",
          "doc_extras/plugs.md"
        ],
        groups_for_extras: [
          "Crash Course": Path.wildcard("doc_extras/*.md")
        ]
      ],
      version: "1.0.3",
      description:
        "Provides a full user authentication experience for an API.
      Includes login,logout,register,forgot password, forgot username, confirmation email and all that other good stuff.
      Includes plug for checking for authenticated users and macro for generating the required routes.",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [extra_applications: [:logger], mod: {AccessPass.Application, []}]
  end

  defp deps do
    [
      {:bamboo, "~> 1.5"},
      {:ecto, ">= 3.4"},
      {:plug, "~> 1.0"},
      {:ex_doc, ">= 0.0.19", only: :dev, runtime: false},
      {:gettext, "~> 0.11"},
      {:comeonin, "~> 5.3"},
      {:poison, ">= 4.0"},
      {:postgrex, ">= 0.0.0"},
      {:argon2_elixir, "~> 2.3"}
    ]
  end

  defp package do
    [
      maintainers: ["Jordan Piepkow"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/AppDoctorIo/accesspass"}
    ]
  end
end
