# تشغيل أسهل — Inferno على الآيفون

هذا الـ fork يسهّل **خطوات التشغيل** قدر الإمكان. المتطلبات الصعبة ما تروح (JIT + صورة الضيف)، بس المسار أوضح.

## باختصار (٦ خطوات)

1. ابنِ **صورة الضيف المكسورة الحماية** من دليل ChefKiss (ما تنزل هنا قانونياً):
   - https://chefkiss.dev/guides/inferno/
   - https://chefkiss.dev/guides/inferno-post-setup/jailbreak-bootstrap/
2. ثبّت **StikDebug** + **LocalDevVPN** (App Store)، وحط ملف الـ pairing.
3. ثبّت `Inferno.ipa` (من Releases أو البناء).
4. في StikDebug: اضغط مطوّل على Inferno → **Assign Script** → اختر **`legacy.js`** → شغّل Inferno **دائماً من StikDebug**.
5. انسخ ملفات الضيف إلى `Files → On My iPhone → Inferno` (انظر القائمة تحت). **خذ `root.qcow2` مو الـ raw `root`.**
6. أعد التشغيل من StikDebug → القائمة → Start.

حوالي **٩ GB** مساحة فاضية.

## ليش لازم StikDebug؟

الإيموليتر يحتاج **JIT**. بدونها التطبيق يتجمّد أو يرفض التشغيل. لا تشغّله من الأيقونة العادية.

## ملفات الضيف المطلوبة

حطها بهذا الشكل داخل مجلد التطبيق:

```
AppleSEPROM-Cebu-B1
InfernoData/root.qcow2
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
```

Checklist سريع:

- [ ] StikDebug + LocalDevVPN شغالين
- [ ] `legacy.js` معيّن لـ Inferno
- [ ] `AppleSEPROM-Cebu-B1` موجود
- [ ] `InfernoData/root.qcow2` موجود (مو raw)
- [ ] باقي ملفات InfernoData موجودة
- [ ] التشغيل من StikDebug فقط

## لو ما يشتغل

| العرض | غالباً السبب | الحل |
|---|---|---|
| يعلق من أول لحظة | ما في JIT | شغّل من StikDebug + `legacy.js` |
| ما يلقى الصورة | ملفات ناقصة/مسار غلط | راجع القائمة فوق في Files |
| شبكة الضيف تموت | سلوك معروف لـ iOS الضيف | من القائمة: Bring network up |
| بطء شديد | طبيعي بدون KVM | الإقلاع دقائق |

تفاصيل أكثر: [TROUBLESHOOTING.md](TROUBLESHOOTING.md) و README الأصلي بالإنجليزي.

## تطوير لاحق (معالج داخل التطبيق)

المطلوب التالي في التطبيق نفسه: شاشة إعداد أول تشغيل تفحص JIT + الملفات وتعطي زر Start واضح بالعربي/الإنجليزي. يحتاج بيئة بناء/Cloud Agents.

---

# Easier launch — Inferno on iPhone

Same six steps as above in English: jailbroken guest image (ChefKiss guides), StikDebug+LocalDevVPN+`legacy.js`, install IPA, copy guest files (prefer `root.qcow2`), always launch via StikDebug, then Start.

Hard limits remain: no guest image in this repo, JIT required on stock iOS, ~9 GB free, slow boot.
