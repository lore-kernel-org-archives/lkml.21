Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093475;
	b=BwTOnjcKTH2TsZOt6pDBr7JqBAWPLVw/kaBWVvxa6pg99jPXlY9dJMUHuMWKq2/Pz0uc
	 cLpZgkT/FO1DqOlTCH9q7A76OCvXTCHyQHhrBCRJdT7uCOge7R4C9+9EkTlTnfwOr8VV4
	 ySawGXfgwNGfaxktwqgf8AhOPTQb+o3sC3Bm//4LQUJ5LOHFH3LES7M8DKEeqoz27dciZ
	 C9k0elVbQ1WAFZYnDKznsnkQnJ7CKaLT1mfjitrlG1mQtFNQPrP0H9FuSGu0eVTztd5hq
	 3/39SB0G745vpv8Bnv8RbJGNdp907XQmW9PlkNPBwT30M4rQnHtbqclP0Io6DCOr9IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093475;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=kqDqFnX19MFdyinSjEoO70xx6iOJeMyJ1peqLym3cZ8=;
	b=TsO1f/bEqTJ1em4GBhFFbxHamnI1m478o/yf6GhPakwzKLBZrvZH1H+phvZGmRefBj8p
	 FeolBdoM0xjR+pbMX+xtBi1Fq1UC7bBnXL+AuXisV/9jshz15XjuIzZOB+eXO1eoXaxt7
	 HExia/vWI89dRVzi9eeBUrFqZP73rW4/LKWHTtoudIRN+37KwZHA9TFmoHD80FYeRus7P
	 iXMD2DJ2LStU55/gB75aBK+Jww4N3w8j1nlz3ERmrneqAK/QU6n/WALWP5THMsx539hm6
	 aeB8OklEAn+AWQsi1m8jlY2TjhOAygaEqJOeFIWpHikRGYHvH45uNQollt46Tr09Veg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rustsbi.com;
	spf=pass smtp.mailfrom=rustsbi.com;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07A5606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rustsbi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rustsbi.com
X-QQ-mid: zesmtpsz2t1795093462td71789a8
X-QQ-Originating-IP: cR3TjEg74wmWMTs1ARy7U2n+xVQze2SG4pmLd9lYPZY=
Received: from LAPTOP-H63V2Q11 ( [36.110.52.2])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 21:04:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15795927322090036901
EX-QQ-RecipientCnt: 14
From: Zhouqi Jiang <luojia@rustsbi.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Anup Patel <anup@brainfault.org>,
	Andrew Davis <afd@ti.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Alejandro Colomar <alx@kernel.org>,
	contact@rustsbi.com
Subject: [RFC PATCH RESEND] riscv: sbi: expose firmware identity in sysfs
Date: Thu, 19 Nov 2026 21:03:56 +0800
Message-ID: <A039A2DE1DF8F274+20261119130356.1537-1-luojia@rustsbi.com>
X-Mailer: git-send-email 2.53.0.windows.2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:rustsbi.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OT1af/FwY+++5Q6rP15BZ3kDNspZEEHDGje0rFWNYajy+neHcXGAUJin
	hoeLMDufWJqaFHkUtF+q8ovTsTOB5PLf5JyNYmgd3/ajKrhDHqgD+ypXmMuWi+m1fOA7ilI
	18sn1SHxx2qWXOMROnj2t4MUUdISBgx/fzz/Z/7t9qkxtFE2t3KNMVZDM7DV/UKsIqXhUE2
	u8Bgng65PHkdgDT8GD7VYMvBwpRGkm6PXF8S5T8pnjfnHGAu5c4QhCYZ52/hh0UHsgRWGQM
	ZcyUEkqpL08GmyMSo56HCBN2Rv4sNT/Ur2NrqGPnedS4pIWUQl+XwQT1JQEOPur17duGrKy
	JmpdsTaapsVLLFNESeVBToMxEu6ocYUW6VwdrbiIEX4aYrX/xktzZmvHIaTbljozyB2n4AE
	EzgtXQIjFVOJrWaV4bD65cJlldrbnvCyH3IlB0i0wxfPRpPGHvZBKGKI0z5q/RSQzmL8vH1
	EYdpR3EtshTppc95zm7B/Ebj1ghqMa0HNtqhFXTecIeOy50zUryplchiGdfIC8bFQe787Y1
	FKuTlxFt3YnWIM3I0sh8vAkO/TYIyj44IJUG8OUWKGVRAodE4z1X3oKcEeefrQChB17vG+L
	X0zyMiWh+RwBRCX4zBCxBznoOCyS0dSTsaOVVGYiKpdRwd2BvP1EKHhKViW/dYNV5UBnMSB
	EE+8lbd5m7DPu9n+uQZFOdVC/mek781rYzGR0ua0UvqO/kyuDUV+RZ5fBBknBvZv+cPtOHR
	xElEcdyu/PYTk3siO8Sw3cEiQIKxcG2/Yo+4nyM2QCTk836Bry56mSL8WS3+LmV6bj2DEel
	beMzJyc5+IrBLrueJ1oMjRpdZMv1dAlGFWLnsMm7PQbx3EexHJpAYJ/+pAmUqV13AXNC1sg
	xZIOzK/rE9Q8ejvdZtaQ+9esRAxtJ/fmwr+tnp5CbKVr3s1iG6Rxlm2BT33awLFstKdLC2Y
	Hir2QPBeby6waUmsH1aVL6r9+EVXJ54nL76JWeIbv5oX9V8+j52WJ/9+fpVqcYTjNscEjLI
	dW4kIGbhnxg7nWs36aoAFdneDdIT74TgfYYgGG6RapGnIl2HAufUklGy/XRACl7MNgAPXzy
	EaLqnhce0DUK10Lv9DOs0g=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Linux queries the SBI specification and implementation identity during
boot. It caches the specification version, but discards the
implementation ID and version after logging them. Userspace therefore
has no structured interface for this immutable firmware metadata.

Cache the implementation ID and version and expose the available values
as read-only attributes under /sys/firmware/sbi:

  spec_version
  impl_id
  impl_version

SBI v0.1 systems expose only spec_version because the implementation
fields were introduced by the SBI Base extension in v0.2.

This gives tools such as lssbi a native source for basic SBI identity
information and starts moving those queries away from out-of-tree
kernel modules.

Codex was prompted to research lssbi's out-of-tree SBI probe and design
a minimal in-kernel replacement. It assisted with the sysfs interface,
implementation, ABI documentation, changelog, and QEMU test setup. The
result was built with a RISC-V defconfig and boot-tested under QEMU
virt with:

  OpenSBI v1.3
  RustSBI v0.4.1

Assisted-by: Codex:GPT-5
Signed-off-by: Zhouqi Jiang <luojia@rustsbi.com>
---
 Documentation/ABI/testing/sysfs-firmware-sbi | 30 ++++++++++
 MAINTAINERS                                  |  1 +
 arch/riscv/kernel/sbi.c                      | 62 +++++++++++++++++++-
 3 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-sbi

diff --git a/Documentation/ABI/testing/sysfs-firmware-sbi b/Documentation/ABI/testing/sysfs-firmware-sbi
new file mode 100644
index 000000000000..516f9e6cee79
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-sbi
@@ -0,0 +1,30 @@
+What:		/sys/firmware/sbi/spec_version
+Date:		August 2026
+Contact:	Linux RISC-V mailing list <linux-riscv@lists.infradead.org>
+Description:
+		The SBI specification version available to Linux, formatted as two
+		unsigned decimal integers separated by a period and followed by a
+		newline. For example, SBI v0.2 is represented as "0.2".
+Users:		lssbi
+
+What:		/sys/firmware/sbi/impl_id
+Date:		August 2026
+Contact:	Linux RISC-V mailing list <linux-riscv@lists.infradead.org>
+Description:
+		The SBI implementation ID, formatted as lowercase hexadecimal with
+		a 0x prefix, no leading zero padding, and a trailing newline. For
+		example, OpenSBI is represented as "0x1". The ID is assigned by the
+		SBI specification. This attribute is present only when SBI v0.2 or
+		later is available.
+Users:		lssbi
+
+What:		/sys/firmware/sbi/impl_version
+Date:		August 2026
+Contact:	Linux RISC-V mailing list <linux-riscv@lists.infradead.org>
+Description:
+		The SBI implementation version, formatted as lowercase hexadecimal
+		with a 0x prefix, no leading zero padding, and a trailing newline.
+		Its encoding is specific to the SBI implementation identified by
+		impl_id. This attribute is present only when SBI v0.2 or
+		later is available.
+Users:		lssbi
diff --git a/MAINTAINERS b/MAINTAINERS
index 0b42e898f4d8..707afa1af1a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23494,6 +23494,7 @@ Q:	https://patchwork.kernel.org/project/linux-riscv/list/
 C:	irc://irc.libera.chat/riscv
 P:	Documentation/arch/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
+F:	Documentation/ABI/testing/sysfs-firmware-sbi
 F:	arch/riscv/
 N:	riscv
 K:	riscv
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index c443337056ab..945a6d8d4f3e 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -7,6 +7,7 @@
 
 #include <linux/bits.h>
 #include <linux/init.h>
+#include <linux/kobject.h>
 #include <linux/mm.h>
 #include <linux/pm.h>
 #include <linux/reboot.h>
@@ -18,6 +19,9 @@
 unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
 EXPORT_SYMBOL(sbi_spec_version);
 
+static unsigned long sbi_impl_id __ro_after_init;
+static unsigned long sbi_impl_version __ro_after_init;
+
 static void (*__sbi_set_timer)(uint64_t stime) __ro_after_init;
 static void (*__sbi_send_ipi)(unsigned int cpu) __ro_after_init;
 static int (*__sbi_rfence)(int fid, const struct cpumask *cpu_mask,
@@ -659,8 +663,10 @@ void __init sbi_init(void)
 		sbi_major_version(), sbi_minor_version());
 
 	if (!sbi_spec_is_0_1()) {
+		sbi_impl_id = sbi_get_firmware_id();
+		sbi_impl_version = sbi_get_firmware_version();
 		pr_info("SBI implementation ID=0x%lx Version=0x%lx\n",
-			sbi_get_firmware_id(), sbi_get_firmware_version());
+			sbi_impl_id, sbi_impl_version);
 		if (sbi_probe_extension(SBI_EXT_TIME)) {
 			__sbi_set_timer = __sbi_set_timer_v02;
 			pr_info("SBI TIME extension detected\n");
@@ -707,3 +713,57 @@ void __init sbi_init(void)
 	if (!srst_power_off)
 		sbi_set_power_off();
 }
+
+static ssize_t spec_version_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%lu.%lu\n",
+			  sbi_major_version(), sbi_minor_version());
+}
+
+static ssize_t impl_id_show(struct kobject *kobj,
+			    struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0x%lx\n", sbi_impl_id);
+}
+
+static ssize_t impl_version_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0x%lx\n", sbi_impl_version);
+}
+
+static struct kobj_attribute spec_version_attr = __ATTR_RO(spec_version);
+static struct kobj_attribute impl_id_attr = __ATTR_RO(impl_id);
+static struct kobj_attribute impl_version_attr = __ATTR_RO(impl_version);
+
+static umode_t sbi_attr_is_visible(struct kobject *kobj,
+				   struct attribute *attr, int n)
+{
+	if (sbi_spec_is_0_1() && attr != &spec_version_attr.attr)
+		return 0;
+
+	return attr->mode;
+}
+
+static struct attribute *sbi_attrs[] = {
+	&spec_version_attr.attr,
+	&impl_id_attr.attr,
+	&impl_version_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group sbi_attr_group = {
+	.name = "sbi",
+	.is_visible = sbi_attr_is_visible,
+	.attrs = sbi_attrs,
+};
+
+static int __init sbi_sysfs_init(void)
+{
+	if (!firmware_kobj)
+		return -ENOMEM;
+
+	return sysfs_create_group(firmware_kobj, &sbi_attr_group);
+}
+subsys_initcall(sbi_sysfs_init);

base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
-- 
2.43.0


