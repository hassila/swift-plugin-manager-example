import SystemPackage
import PluginManager
import PluginExampleAPI
import Logging

@main
struct Main {
    static func main() async {
      let path : FilePath = "../swift-plugin-example/.build/debug"
      let logger = Logger(label: "PluginManagerExample")

      do {
        let pluginManager = try await PluginManager<PluginExampleAPIFactory>(withPath: path)

        for (_, plugin) in await pluginManager.plugins {
          var myInstance = plugin.factory.create()
          myInstance.setPluginManagerExampleAPI(PluginManagerExampleAPIProvider())
          logger.info("\(myInstance.name())")
        }
      } catch PluginManagerError.failedToLoadPlugin(let path, let reason) {
        print("Failed to load plugin [\(path)] due to [\(reason)]")
      } catch {
        print("Failed to initialize PluginManager for path [\(path)]")
      }
    }
}
