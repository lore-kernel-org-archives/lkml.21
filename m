Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202495;
	b=HhUux36OXo9X/U3g0qvtvkP0bVmPHCRL1qjRCzK/Yrv2ehNvuZeViuo/Z8tBJI1JT+9W
	 3Mrr9bOt9vK86n+KQF8O5m8yRkJwwaKSEveWxi5mVj2WPlQcw19BS0wnpeXblPSStj+8m
	 lDKDeysLslrdALUPG8Pmv++ci/Eclnh5obc2QR4JpjsntOmoMMffj6EcYY3qMK838TFiA
	 Mgjo3gUQk4g9opZR0ks7VH/gJyWaedogGSXOic8U/ufZvdHD95sf7+FLPxEPAyRmTqUN1
	 eHL/l87x9xZerd3IAthg9faGyfGWfUKW2bxInTdhqrHpP1SzX9IzRUlm4w6fEQpmqtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xesNbGJs7Ie8NeKfIsZ40AvzJTC0edKlZNHQZDSDZ0c=;
	b=YU1LIqwl/ppD8BQW1QTQPGng46bUSi1/oXvFw+avcYTUqQlNNZUQgpMYJBocXCmTPqxD
	 tzHWMcrek8+DqEMBLEO7IgTV9t3LBMQwPfnN8Uus3WtIYeeztzrDZxovx/qrCiFLVk7/g
	 WRJWiE9pejeg8oHneFo4wZgUTFUftBohZIjtdt/rSRyCx+RG7WidEx83ORxbLgzOMBmk5
	 bOGhGowLBJHAXcxZ5RF4yl2o8L1flBPCfwSBrZa2Siibx1KswNSB6JPjkEe99jQoESuZ6
	 fhd/MdqSyMi80dXOLvR99/5QG2Af2lfz2u/sj51ThbKC5e4+HAbRxrz9KHM2KKAhdFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sfpuq6I9;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8935060A260E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8935060A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sfpuq6I9
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a9be758734so830912f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202488; x=1795807288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xesNbGJs7Ie8NeKfIsZ40AvzJTC0edKlZNHQZDSDZ0c=;
        b=Sfpuq6I9WtE34joaFMGoElKollInkUzNfoJ6lgfLtSWvPCu0z5TkjqaCYQCPYqMGe9
         1eq3RVDxsXA0SbA5kmK2iaVdRdetvcLBoUpWadfa0Ez4emf3QAEzckF6KO4BcrpRWTXU
         0uXi0G8SClHUkHkuWN4DVhnnYApC8idhsoIyKh4d9yAJQfYwoKxdufDoUUoZhNlgpKcr
         RAtB0ANqniGyfwsQ6x/kEegDOnvAvSh9wBKJYwIW7/r5wQoD9XrhoTUcpOM4FkKcFx+E
         szWO4Y4iDf42TVA8tfksNQkL1teESoD+i7XSVOAnG0ovzeI2ZqBbhJwsWOSihYln343Y
         0lUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202488; x=1795807288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xesNbGJs7Ie8NeKfIsZ40AvzJTC0edKlZNHQZDSDZ0c=;
        b=Z6m81oXLP4Y4bry8qj4SOXP76skkcrkJzin8xflc8LtNE6zAD12HjUpGi9qApGcA1I
         ZNrjcPB5XGip4wwi1WJJIqTENXTnZrVyz9b9RS8hdoYdO2lZBBDkAiidSeD4rm5J0wUC
         WqT1rnbcPi0DU4BKNxmcSJrKklrNo/JTdBaL4M7oc4KRoxH+JeB8xZNtslXmjOzI9JH7
         XguE4O8UKWVpPVyVrMuK+TeTQL2vYen86ELDby7kmfcJFnGNJtgcSSpz9kR5owfHPztV
         etqMr+L7zQmEcwIw4W7DiT+5l+oFeoyzyfJAQrdCgWff0iILBO7BN26RIEWQ2BufEy8B
         5c/g==
X-Forwarded-Encrypted: i=1; AL+hErFmaPEf21tmpiW0RDK0aIce22oGxVHel/ljxftNyvWW5ZnUs58tAwyTZsigKYE1x10tCqgMlzu7l/tAst0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4rIMPgH4n2BrwKa048yFGs7jG9vh/ZFmUQYp1U4nhBont4Ptb
	JChel/ALiL52gCG/qE2OrhFKNSg9PnQp4iLxuNjOp41mzWuFeYqfv2D0
X-Gm-Gg: AZFdTZf7EayWECS0eK4EEa+4nkWARTQuPPexDE9pGdiraB1q4m+ib8qBiUBDgYvlgnw
	P0DbhjWTgMSwVtr1I0Yd7w9WrvWcr6RXSTsNHLOpjERf4yDrkaZVQCtmq5dPqQRZSjJgPoYfqix
	HeCqmQx0sEjkCuRR4zUxOxO+4717oGghtlkWtVtt2Y2U+y1sQhIaaCmcz+/vYFQbGf3NOcPlA49
	3e3bfK+vArctRo2nnFiYJtei/2Rqgcl2VRNffocXHFC8NBngvORNT6XekyXj88vshS7WWLcrGNN
	Hp7HYVMO6/Lnh6GoCBbVW9/qakWCJ8XR8tzkI3dC2OxuxvnpbtQBUidtFmV2LVJ3cu1bX3VHotB
	gDnIStqsekqZaEb4Y8Kc5rnyjNlMStxOCW65YFZD7DncdabU7T67Elwa85QNEUbpLWX1XrEBgb1
	+CzphEPT87E8uMqx8i4vF8piMYso4P1Hs7UOlPZrL5JM03ZWSVKYsRHUI3nvv/TpcZE+EeuM9Jc
	qoR7+u+8sAf6wgexTkvtXqqACRpsuGnHCoJIdHU30XHvTNLUcnEvEItfmCm/7s8VQpf4/eSOTt7
	m4l6RRgq1bWj5+hW+6ALMVCwAUrSHYT3lGZw5RT6
X-Received: by 2002:a05:6000:46cb:b0:4a7:f35a:5f97 with SMTP id ffacd0b85a97d-4abb4b85b7dmr6559867f8f.52.1795202487831;
        Fri, 20 Nov 2026 11:21:27 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:27 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 20 Nov 2026 22:20:53 +0300
Subject: [PATCH 4/6] phy: zte: Add a zx29 USB PHY driver.
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-zx29usb-v1-4-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9160;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=7XGAKP/u0GbzZCcgeEO6bPBl2TU8fS3aHFtWQRJOwl4=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2W1HckV/rfYaqvXirfmSoxSbuudpx0nQq2C
 eHOOXsd3C2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLsbRAAhdCtkEwBOlgEeAOCdAckLAPpsEE0WAg
 pfu4FWdpNrye7+4zN75Wyc4vnxe4Sk5+wwPNgAM6RAIojMVJKX3SOt+dXb9RVl60XhViu+J/nOn
 4lh0issMLOnCYGgBpgnhicqIHa6tJy5aN7/B/723axH+am0EmLqS66Ba9u2bjfpu0wwCc4me4Kl
 R8/bRwkf3fI1k576MfVjEmsG3TgJK6cVm6b2xW6vXncIhlBZZn6B6uUvhc0GvhyIDMms4fG00RG
 x4B9ivoAxuXPENCjnJwgMs4JA/MjpJBV0ZC2Vt1Uoa4JbvhwXVllYlPz3+2lVEbO03DPAWz0hHV
 VQHKwJckTRLPh8AABjRTK+dJpJsdqLRGsqUBD2IADoYLXdPswlyeQq2rG2gvk8YuoQEpoBt0/l5
 ukIT/Y6gWfp313i0q8n6Amk8O0VEWGfzvqd+FY9RZyc6XjbIftiEpeCJb7sAHMOLzX7W6RGOpWX
 jvgTVLrsPQko207y8WEES5eRrmapFnGWpz4UPugkMKp/K1l5n8ur3GJOlNc92CeNEpADX8BjxMe
 rtEI55OQt4iNZmyhX31XYXJesTXgW8MCzq4Lip4uSOVk1lJ89N4qL0BFh6hoNV68Ntm1nlCyOdL
 EeJdKkwuvJF7DSkjh7BGjmZvkPK5/lALxxVFw6hO8Tye7EHI+G9E=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This driver's responsibility is the correct reset sequencing of the USB
and HSIC PHYs. Before the ready flag is set in topcrm+0x84, the dwc2
controller mmio space reads zeroes. Waiting for them is therefore
necessary to avoid race conditions on boot.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Possible future features are host mode support and adjusting the USB PHY
to mpll over/underclocking. But both are unlikely to have productive use
on this platform. None of the zx29 boards I have seen so far can provide
power on VBUS.

The PHY driver reuses the topcrm node for the MFD child device because
the PHY subsystem enforces that the device either matches the of_node or
is a parent of the of_node (__of_phy_provider_register). Krzysztof
rejected a PHY child node [0] for the purpose of satisfying the check.

One issue - and that's possibly the reason for the PHY subsystem's
behavior - is that nothing prevents the phy driver from being unbound
because the DT producer-consumer relationship targets the MFD parent. I
have set suppress_bind_attrs = true, but that feels ugly and only solves
half the problem. The module can still be unloaded without first
releasing the USB consumer.

0:
https://lore.kernel.org/linux-arm-kernel/20260717-uncovered-feathered-groundhog-eab16e@quoll/
---
 MAINTAINERS                |   1 +
 drivers/phy/Kconfig        |  11 +++
 drivers/phy/Makefile       |   1 +
 drivers/phy/phy-zx29-usb.c | 183 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 196 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e394e0044f1f..1d47080b2290 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4038,6 +4038,7 @@ F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 F:	drivers/clk/zte/
 F:	drivers/mfd/zte-zx297520v3-crm.c
+F:	drivers/phy/phy-zx29-usb.c
 F:	drivers/pmdomain/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index d151c05297d7..c4829038bfeb 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -169,6 +169,17 @@ config PHY_XGENE
 	help
 	  This option enables support for APM X-Gene SoC multi-purpose PHY.
 
+config PHY_ZTE_ZX29_USB
+	tristate "ZTE zx29 USB phy"
+	depends on MFD_SYSCON && OF && (ARCH_ZTE || COMPILE_TEST)
+	select GENERIC_PHY
+	help
+	  This option enables support for ZTE zx29 USB PHYs. You will need this
+	  if you have a ZTE zx29 board and want to use its external USB
+	  connector for data transfer. This driver is not required purely for
+	  providing power to the board. If M is selected, the module will be
+	  called phy-zx29-usb.
+
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/apple/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c6dd02003bbe..e135e96b4930 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_PHY_NXP_TJA1145)		+= phy-nxp-tja1145.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
+obj-$(CONFIG_PHY_ZTE_ZX29_USB)		+= phy-zx29-usb.o
 
 obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
 					   amlogic/	\
diff --git a/drivers/phy/phy-zx29-usb.c b/drivers/phy/phy-zx29-usb.c
new file mode 100644
index 000000000000..8dfbcb468c26
--- /dev/null
+++ b/drivers/phy/phy-zx29-usb.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ZTE zx29 USB2 PHY driver
+ *
+ * Copyright (C) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
+ */
+
+#include <dt-bindings/phy/zte,zx297520v3-topcrm.h>
+#include <linux/err.h>
+#include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/* This driver controls the PHY reset bits found in zx297520v3-topcrm register 0x80 and waits for
+ * the ready bits in 0x84.
+ *
+ * More USB related controls can be found in zx297520v3-socsys+0x20 and 0x24:
+ *
+ * Bit 0: Limits the PHY to USB 1
+ * Bit 1: Unknown
+ * Bit 2: DWC2 controller endianness
+ * Bit 3: DWC2 DMA endianness
+ * Bits 7:4: PHY clock adjustments. Adjusting these is necessary if mpll is changed from its default
+ *           624 MHz.
+ * Bits 9:8: PHY electrical configuration. Setting them both to 1 allows operating in host mode.
+ *
+ * They are a fairly useless curiosity though. So far no zx297520v3 based device has a working 5v
+ * VBUS supply, so host mode only works when injecting power externally. The clock bits are too
+ * coarse to be of much use. The default value is 2 (0b0010). Setting it to 1 allows lowering mpll
+ * from 624 to about 530 MHz. The next higher setting might be around mpll=718 MHz, but the SoC is
+ * not able to operate stably at that frequency anyway.
+ */
+
+struct phy_zx29_drv_priv;
+
+struct phy_zx29_phy_priv {
+	struct phy_zx29_drv_priv	*drv;
+	struct phy			*phy;
+	u32				resetflag;
+	u32				waitflag;
+};
+
+struct phy_zx29_drv_priv {
+	struct regmap			*regmap;
+	struct phy_zx29_phy_priv	phy[2];
+};
+
+static const struct {
+	const char			*name;
+	u32				resetflag;
+	u32				waitflag;
+} phy_data[] = {
+	{"usb",		0x8, 0x2},
+	{"hsic",	0x1, 0x1},
+};
+
+#define PHY_ADDR_ZX297520V3		0x80
+
+static int phy_zx29_init(struct phy *phy)
+{
+	struct phy_zx29_phy_priv *phypriv = phy_get_drvdata(phy);
+	struct phy_zx29_drv_priv *priv = phypriv->drv;
+	int res;
+	u32 val;
+
+	dev_dbg(&phy->dev, "Initializing, reset 0x%x, wait 0x%x\n",
+		phypriv->resetflag, phypriv->waitflag);
+
+	/* If the bootloader used the USB device it sometimes fails to re-initialize without a
+	 * reset.
+	 */
+	res = regmap_clear_bits(priv->regmap, PHY_ADDR_ZX297520V3, phypriv->resetflag);
+	if (res)
+		return res;
+
+	fsleep(10);
+
+	res = regmap_set_bits(priv->regmap, PHY_ADDR_ZX297520V3, phypriv->resetflag);
+	if (res)
+		return res;
+
+	/* The wait time is usually in the single digit microsecond range, but it can be
+	 * considerably longer in some situations. The upper ceiling isn't clear though - 50 us is
+	 * not reliably enough, but every time I add timing, the usb wakeup time goes back below 10
+	 * us.
+	 */
+	res = regmap_read_poll_timeout(priv->regmap, PHY_ADDR_ZX297520V3 + 0x4, val,
+				       val & phypriv->waitflag, 10, 500);
+	if (res) {
+		dev_err(&phy->dev, "PHY reset failed: %d\n", res);
+		regmap_clear_bits(priv->regmap, PHY_ADDR_ZX297520V3, phypriv->resetflag);
+	}
+
+	return res;
+}
+
+static int phy_zx29_exit(struct phy *phy)
+{
+	struct phy_zx29_phy_priv *phypriv = phy_get_drvdata(phy);
+	struct phy_zx29_drv_priv *priv = phypriv->drv;
+
+	return regmap_clear_bits(priv->regmap, PHY_ADDR_ZX297520V3, phypriv->resetflag);
+}
+
+static const struct phy_ops phy_zx29_ops = {
+	.init		= phy_zx29_init,
+	.exit		= phy_zx29_exit,
+	.owner		= THIS_MODULE,
+};
+
+static struct phy *phy_zx29_xlate(struct device *dev,
+				const struct of_phandle_args *args)
+{
+	struct phy_zx29_drv_priv *priv = dev_get_drvdata(dev);
+
+	if (args->args_count != 1)
+		return ERR_PTR(-EINVAL);
+	if (args->args[0] >= ARRAY_SIZE(priv->phy))
+		return ERR_PTR(-EINVAL);
+
+	return priv->phy[args->args[0]].phy;
+}
+
+static int phy_zx29_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct phy_zx29_drv_priv *priv;
+	unsigned int i;
+
+	device_set_of_node_from_dev(dev, dev->parent);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, priv);
+
+	priv->regmap = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(priv->regmap)) {
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "Failed to get regmap\n");
+	}
+
+	for (i = 0; i < ARRAY_SIZE(phy_data); ++i) {
+		priv->phy[i].drv = priv;
+		priv->phy[i].waitflag = phy_data[i].waitflag;
+		priv->phy[i].resetflag = phy_data[i].resetflag;
+
+		priv->phy[i].phy = devm_phy_create(dev, NULL, &phy_zx29_ops);
+		if (IS_ERR(priv->phy[i].phy))
+			return dev_err_probe(dev, PTR_ERR(priv->phy[i].phy),
+					"failed to create %s PHY\n", phy_data[i].name);
+
+		phy_set_drvdata(priv->phy[i].phy, &priv->phy[i]);
+	}
+
+	phy_provider = devm_of_phy_provider_register(dev, phy_zx29_xlate);
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct platform_device_id phy_zx29_ids[] = {
+	{
+		.name = "zx297520v3-usb-phy",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, phy_zx29_ids);
+
+static struct platform_driver phy_zx29_driver = {
+	.probe	= phy_zx29_probe,
+	.driver	= {
+		.name		= "zx297520v3-usb-phy",
+		.suppress_bind_attrs = true,
+	},
+	.id_table = phy_zx29_ids,
+};
+module_platform_driver(phy_zx29_driver);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx29 USB2 PHY driver");
+MODULE_LICENSE("GPL");

-- 
2.56.1

