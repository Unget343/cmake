from conan import ConanFile
from conan.tools.cmake import cmake_layout


class ExampleRecipe(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps", "CMakeToolchain"

    def requirements(self):
        self.requires("catch2/3.13.0")
        self.requires("fmt/8.1.1")
        self.requires("spdlog/1.11.0")
        self.requires("cxxopts/3.0.0")
        self.requires("nlohmann_json/3.11.2")

    def layout(self):
        cmake_layout(self)
