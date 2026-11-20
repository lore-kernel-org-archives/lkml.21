Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203229;
	b=KD1BLrNCsVX7ILSiZzn1yO3so4xadyRG4+BK+2x2C0zZPD2HS9OpSTAE3Y80LxP6luSf
	 n8IQggSdxDwVhPQM8MnJ3gUE1Jw/KTioeLHJXvZUXOhBvXTWlW0zpbVKXb8iytQj+ufgl
	 TV1/ZtOEJg/lJesI0k9tpptMJBxnVWIVe6EEEeRVeNuvzWb8sBlz3cLXPErA3fx7uyxHK
	 pItDTiaEWj0e63JfYybaKVqE8JSukj/R7isTjBIgfJ3ynOF0B9iiMcqL0m38eNaLDyEvX
	 4mQnERIhY6vsX6Ewua/jEx14fk4IKk+g09UW1aB6MicXN9UyHaTl0qomuohNyd8MsWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SYGSMC4mInP9yOLco1WrFx7aItxWYf+k5DNyaKookJA=;
	b=yjAPydVU60zv/P5dOSJBpp0jKZ8zGI9mQS6den6tutWla/2vuUDeMhzRpGlZ/rfAqOsu
	 3dKbiuv0K15ohtjJZoPqm1rv4DJylQtxODhhDwLSMjWTin4WY+BIJtrWbBqabAaOIB+FR
	 7yBglokWs2mZRUtvBS4nItvygfJMKUgW+ll2wipG8aWRFXs3Jdk+GgXesEvEy9iv7hsUL
	 sV6Y98XBS0STpjC56GvoYyT5oJMXh2SQKVZvSbLHRU9CxxCM/24/Hr0dp+M1iNkVapDGc
	 BBu3nkv5PGMeQvZ3KWwv70aBz2kgiNGfM6jzJgxhDzvZUanqXwHgA/Rv0WMrKNKA54Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3FtwwFz;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D199606A6F6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D199606A6F6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3FtwwFz
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso11437117b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203228; x=1795808028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYGSMC4mInP9yOLco1WrFx7aItxWYf+k5DNyaKookJA=;
        b=N3FtwwFz3iM7xz7vRU4WcpMFssOBTe6cvavAZZZS8XsHYkzZg05v8LFs7EbyZaM/Sp
         gn2Wy9tgxJoTIC697Kv8oSH4lI4qi5DJlNgW8XtEAJwGnjqkd0MMNEskUAwjGBckt63r
         Kgc4KXX49jXmQ8GJXB0Zun1nEzVvSeL9vLyHkTu1Lej8ajbfuGflUkO3BxtR3aQItMkO
         ud9Rqqo1e/yaqBhFAqQuj2nAdCV+hOOEcBBvgAW1KkgVqrobuviKB+bqKQ+AxUqGHRjf
         xuKObxoJKAht9y9oZv8BmTP55th3ywG2f8CS2+osXcFvyUrwdf++RAHoNsivggnTyVnZ
         HZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203228; x=1795808028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYGSMC4mInP9yOLco1WrFx7aItxWYf+k5DNyaKookJA=;
        b=W46H8Jwg+LcjsVgOd9zQqOZH/6KzlGvuXBe9XZQYKvzkLswwbGi+YA6Gj0wPx6nKUG
         swJULgOQnq8UtrU7vrzmwzcsXEyndlPF2oEJz949dMYq9lgO1GnDMRQXha+FohH28Imi
         R5fjDjM1BCldrnOY9tZLnseKkVEDr83ufZ5SAMDKtcsKNrzBpmld/B794NjOM6BQJXTx
         64kKZlO2sc0Se3IGrjRlAjn7SwzOLxicmzGQoSgD6QJt2mT2hpv86X2rCj3XeITHI8R4
         Z46UqrPqHyJQQqqxygiqmiHyuuo9/SQ29YpSnv78iv1JmYVZj+vfWaBwpjGlBd6m9WKv
         fMCQ==
X-Forwarded-Encrypted: i=1; AL+hErHVgLBTPWo1e5NVMzML63sQBcesVP6GQ163kGamSriIf3L50ADKYD6zRCywWoaWfe345wSF0C4Z8c7oYL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d7dWjXK8u9mrncPvfwceueQtN9lHbwUSgXpZ6YXWEMKfJJpdo
	4Fwz6plSqZqvIhJuZU+vUOGc7DSJD/Udsi1JEeEuYcXWmRQw/NxgCtEo
X-Gm-Gg: AZFdTZdORU/ldx1N7naZDli0omRv4wcTIBYowFaz4lEH6Ea7IJCZ2mY75m/UvA3U7/E
	4YLUJ9Gp0GB2CUrUcNoBiwb8Pvb6u1URUmxmD9Wg6u21lsd0RHGnQpyqB/KXO+JRNABmlFxDcir
	RZwl8wnIDggHCvdOyP0w9hRSQmtnyYlm66RMfT7ZSiFneYLVP2gCIVtJlGNOT97zG7Jy0gYVZ2R
	iy0ja+LtvI5t2H4zycFV1OJGr/IA0OUusnZvpPcplKHZKBM0iw7Os3rUVWHJmaWK7IxM1ba9lQ4
	hDQVNLruxAHJHQJMtzt+5ki6SLXO5uyf5JGoRcRz0S0E24GTtbJPeozf97SRSzLm/r/aT9eBByW
	PSGJiA9CKuOUSZp3bhvN86xIBJKJGCd5G7bSYgHR1I1I+KmaMgw+9SRATszoCKj2OoaaSq2HcuS
	jB66gB4R5kvp06L7UzIe0ynUbnqzkhxVhWHM5GXUZvRmjG3DunbJPJO+eeywKWvCN1fE8uqn6go
	AK6JowY7oVa7cZ/x95bk+0G2/rVp7W067dJY2V5A8rImiI01iyVKdD0CFZhilZqMLrIV07w5YTd
	bIarwmN8RaH1RuZdh/Mg/jkdBttJ4IWxQ5T4LXYdj/YvXu4ExXotLBMCRWAS+M6KcHwtJVz59wg
	V0zjea80vIRoq4iE4jdMP6mYM9QIMpqCtnxGif0BMag==
X-Received: by 2002:a05:690e:4806:b0:67d:c29e:9446 with SMTP id 956f58d0204a3-67df43fbc09mr1155990d50.47.1795203227770;
        Fri, 20 Nov 2026 11:33:47 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33b7502sm2036571d50.20.2026.11.20.11.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:33:46 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 20 Nov 2026 14:33:42 -0500
Subject: [PATCH 3/4] EDAC/mpc7448_l2: Add a driver for the MPC7448 L2 cache
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ppc32-l2-ecc-v1-3-98fc8e6e0a32@gmail.com>
References: <20261120-ppc32-l2-ecc-v1-0-98fc8e6e0a32@gmail.com>
In-Reply-To: <20261120-ppc32-l2-ecc-v1-0-98fc8e6e0a32@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, 
 Tony Luck <tony.luck@intel.com>, Matt Turner <mattst88@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-edac@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7077; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Jhl93cquvatpIX79cI6EiLvX4rUe9XzrZIGQXnwVAyo=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIZFky5+oHVRmnLE5euxqTPBfKPagy5Dkx1mbvEbJLZS
 qVLn704Oj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaazmyG/6F8L4994G
 WX6ZkeI5Ky+PFvPXdudcbv5+fwrFsvlHdglyfDP+u37ldWmte4/TPvuuD2hXeS74yKrpgDoRET5
 26Xe8Jqxg0A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Report MPC7448 L2 errors through EDAC, with one instance per CPU.

Single-bit errors are corrected by the hardware and only counted, so
poll L2ERRCTL[L2CCOUNT] and L2ERRDET and report the count as
correctable errors.  Report the L2 machine checks counted by the arch
code as uncorrectable errors, along with any multi-bit ECC or tag parity
error found in L2ERRDET without one, since clearing L2ERRDET would
otherwise lose it.

PowerMacs have no device tree node for the L2, so bind to a faux
device.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 MAINTAINERS                    |   1 +
 drivers/edac/Kconfig           |   9 +++
 drivers/edac/Makefile          |   1 +
 drivers/edac/mpc7448_l2_edac.c | 160 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 171 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ea66ea2be2d..0d02f0a7316c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9754,6 +9754,7 @@ L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
 F:	arch/powerpc/include/asm/mpc7448_l2.h
 F:	arch/powerpc/kernel/mpc7448_l2.c
+F:	drivers/edac/mpc7448_l2_edac.c
 
 EDAC-MPC85XX
 L:	linux-edac@vger.kernel.org
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 4c70729b0d3a..c3256da3d6fd 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -320,6 +320,15 @@ config EDAC_MPC85XX
 	  Support for error detection and correction on the Freescale
 	  MPC8349, MPC8560, MPC8540, MPC8548, T4240
 
+config EDAC_MPC7448_L2
+	tristate "Freescale MPC7448 L2 cache"
+	depends on PPC_BOOK3S_32
+	help
+	  Support for error detection and correction on the L2 cache of
+	  the Freescale MPC7448 processor.  Correctable errors are found
+	  by polling the L2 error counter, and uncorrectable errors are
+	  reported by the machine check handler.
+
 config EDAC_LAYERSCAPE
 	tristate "Freescale Layerscape DDR"
 	depends on ARCH_LAYERSCAPE || SOC_LS1021A
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index 4020ea60738a..06c951d680f7 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_EDAC_PASEMI)		+= pasemi_edac.o
 
 mpc85xx_edac_mod-y			:= fsl_ddr_edac.o mpc85xx_edac.o
 obj-$(CONFIG_EDAC_MPC85XX)		+= mpc85xx_edac_mod.o
+obj-$(CONFIG_EDAC_MPC7448_L2)		+= mpc7448_l2_edac.o
 
 layerscape_edac_mod-y			:= fsl_ddr_edac.o layerscape_edac.o
 obj-$(CONFIG_EDAC_LAYERSCAPE)		+= layerscape_edac_mod.o
diff --git a/drivers/edac/mpc7448_l2_edac.c b/drivers/edac/mpc7448_l2_edac.c
new file mode 100644
index 000000000000..a62c7a2e7147
--- /dev/null
+++ b/drivers/edac/mpc7448_l2_edac.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * EDAC driver for the MPC7448 on-chip L2 cache.
+ *
+ * Single-bit ECC errors are corrected by the hardware and only counted in
+ * L2ERRCTL[L2CCOUNT], so they are found by polling.  Multi-bit ECC and tag
+ * parity errors raise a machine check (arch/powerpc/kernel/mpc7448_l2.c)
+ * and are reported here at the next poll, if the system survived it.
+ * Errors latched in L2ERRDET without a machine check are reported as
+ * uncorrectable too.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cpu.h>
+#include <linux/device/faux.h>
+#include <linux/edac.h>
+#include <linux/module.h>
+#include <linux/smp.h>
+#include <linux/sprintf.h>
+
+#include <asm/mpc7448_l2.h>
+#include <asm/reg.h>
+
+#include "edac_module.h"
+
+#define DRV_NAME	"mpc7448_l2_edac"
+
+static struct faux_device *mpc7448_l2_fdev;
+
+struct mpc7448_l2_poll {
+	struct mpc7448_l2_err err;
+	u32 ctl;
+	unsigned int mce_ue;
+};
+
+static void mpc7448_l2_poll_cpu(void *info)
+{
+	struct mpc7448_l2_poll *p = info;
+
+	p->ctl = mfspr(SPRN_L2ERRCTL);
+	if (p->ctl & L2ERRCTL_L2CCOUNT)
+		mtspr(SPRN_L2ERRCTL, p->ctl & ~L2ERRCTL_L2CCOUNT);
+
+	mpc7448_l2_err_capture(&p->err);
+
+	p->mce_ue = mpc7448_l2_mce_take();
+}
+
+static void mpc7448_l2_report(struct edac_device_ctl_info *edac_dev,
+			      unsigned int cpu, const struct mpc7448_l2_poll *p)
+{
+	unsigned int ce, ue;
+	char msg[64];
+
+	ce = FIELD_GET(L2ERRCTL_L2CCOUNT, p->ctl) ?:
+	     !!(p->err.det & L2ERR_SBECCERR);
+	if (ce) {
+		if (p->err.det & L2ERR_SBECCERR)
+			snprintf(msg, sizeof(msg), "single-bit ECC at 0x%09llx",
+				 mpc7448_l2_err_paddr(&p->err));
+		else
+			snprintf(msg, sizeof(msg), "single-bit ECC");
+		edac_device_handle_ce_count(edac_dev, ce, cpu, 0, msg);
+	}
+
+	/* Errors latched without a machine check */
+	ue = !!(p->err.det & L2ERR_MBECCERR) + !!(p->err.det & L2ERR_TPARERR);
+	if (ue) {
+		mpc7448_l2_err_print(&p->err);
+		snprintf(msg, sizeof(msg), "%s at 0x%09llx",
+			 p->err.det & L2ERR_TPARERR ? "tag parity" : "multi-bit ECC",
+			 mpc7448_l2_err_paddr(&p->err));
+		edac_device_handle_ue_count(edac_dev, ue, cpu, 0, msg);
+	}
+
+	/* The machine check handler has already printed the details */
+	if (p->mce_ue)
+		edac_device_handle_ue_count(edac_dev, p->mce_ue, cpu, 0,
+					    "machine check");
+}
+
+static void mpc7448_l2_check_cpu(struct edac_device_ctl_info *edac_dev,
+				 unsigned int cpu)
+{
+	struct mpc7448_l2_poll p;
+
+	if (!smp_call_function_single(cpu, mpc7448_l2_poll_cpu, &p, 1))
+		mpc7448_l2_report(edac_dev, cpu, &p);
+}
+
+static void mpc7448_l2_check(struct edac_device_ctl_info *edac_dev)
+{
+	unsigned int cpu;
+
+	cpus_read_lock();
+	for_each_online_cpu(cpu)
+		mpc7448_l2_check_cpu(edac_dev, cpu);
+	cpus_read_unlock();
+}
+
+static int mpc7448_l2_probe(struct faux_device *fdev)
+{
+	struct edac_device_ctl_info *edac_dev;
+
+	edac_dev = edac_device_alloc_ctl_info(0, "cpu", nr_cpu_ids, "L", 1, 2,
+					      edac_device_alloc_index());
+	if (!edac_dev)
+		return -ENOMEM;
+
+	edac_dev->dev = &fdev->dev;
+	edac_dev->mod_name = DRV_NAME;
+	edac_dev->ctl_name = "MPC7448_L2";
+	edac_dev->dev_name = dev_name(&fdev->dev);
+	edac_dev->edac_check = mpc7448_l2_check;
+
+	if (edac_device_add_device(edac_dev)) {
+		edac_device_free_ctl_info(edac_dev);
+		return -ENXIO;
+	}
+
+	faux_device_set_drvdata(fdev, edac_dev);
+	return 0;
+}
+
+static void mpc7448_l2_remove(struct faux_device *fdev)
+{
+	struct edac_device_ctl_info *edac_dev = faux_device_get_drvdata(fdev);
+
+	edac_device_del_device(&fdev->dev);
+	edac_device_free_ctl_info(edac_dev);
+}
+
+static const struct faux_device_ops mpc7448_l2_ops = {
+	.probe = mpc7448_l2_probe,
+	.remove = mpc7448_l2_remove,
+};
+
+static int __init mpc7448_l2_edac_init(void)
+{
+	if (PVR_VER(mfspr(SPRN_PVR)) != PVR_VER_7448)
+		return -ENODEV;
+
+	opstate_init();
+
+	mpc7448_l2_fdev = faux_device_create(DRV_NAME, NULL, &mpc7448_l2_ops);
+	if (!mpc7448_l2_fdev)
+		return -ENODEV;
+
+	return 0;
+}
+module_init(mpc7448_l2_edac_init);
+
+static void __exit mpc7448_l2_edac_exit(void)
+{
+	faux_device_destroy(mpc7448_l2_fdev);
+}
+module_exit(mpc7448_l2_edac_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MPC7448 L2 cache EDAC driver");

-- 
2.56.1

