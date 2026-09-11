import Foundation

/// Prepares the app's Documents folder on first launch.
///
/// iOS hides an app's folder in the Files app while its Documents directory is
/// empty, even with UIFileSharingEnabled set. Creating the directory tree (and
/// leaving a note in it) makes the folder appear, and gives the guest images an
/// obvious place to land.
enum Bootstrap {
    static func prepareDocuments() {
        let fm = FileManager.default
        let documents = VMConfig.documents

        let directories = [
            "InfernoData",
            "InfernoData/Restore",
            "InfernoData/Restore/Firmware",
            "InfernoData/Restore/Firmware/all_flash",
        ]
        for relative in directories {
            let url = documents.appendingPathComponent(relative)
            if !fm.fileExists(atPath: url.path) {
                try? fm.createDirectory(at: url, withIntermediateDirectories: true)
            }
        }

        let readme = documents.appendingPathComponent(L("КУДА КЛАСТЬ ФАЙЛЫ.txt"))
        if !fm.fileExists(atPath: readme.path) {
            try? note.data(using: .utf8)?.write(to: readme)
        }
    }

    private static let note = """
    Inferno — guest files / ملفات الضيف
    ==================================

    Put the kit right into this folder / ضع الملفات هنا مباشرة:

      AppleSEPROM-Cebu-B1
      InfernoData/root.qcow2        (prefer qcow2 — not raw root)
      InfernoData/firmware
      InfernoData/syscfg
      InfernoData/ctrl_bits
      InfernoData/nvram
      InfernoData/effaceable
      InfernoData/panic_log
      InfernoData/sep_nvram
      InfernoData/sep_ssc
      InfernoData/root_ticket.der
      InfernoData/sep-firmware.n104.RELEASE.new.img4
      InfernoData/Restore/kernelcache.release.iphone12b
      InfernoData/Restore/Firmware/038-44135-124.dmg.trustcache
      InfernoData/Restore/Firmware/all_flash/DeviceTree.n104ap.im4p

    Empty folders are already created.

    Disk image: use root.qcow2, not raw root (raw looks ~34 GB and breaks when
    copied to the phone because sparseness is lost).

    JIT: always launch via StikDebug with legacy.js assigned BEFORE Start.
    Without JIT the emulator will not run.

    You can delete this file.
    """
}

