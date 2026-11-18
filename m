Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989826;
	b=I52MpWW5uAspwNvnFm2oSQX/y1WvxUK1eMxg/Wdc16V7QsatEu6hCi183VGiKmM30p0r
	 V6OsU5URKFYePcquOP6J6wPRRUAVUZ8b80UF76iNmbnHmQcomYDLDT833zwO2CeSEMhVf
	 z0KVmCfqikuns2n5GKVX8T/Tx+ckhlkMtjhj1tpS31EWn27OANsTLEO5TUEZRSPp6CY3+
	 LmOl1vyg+3336jDi3nilV9dIQ6n0b7+6DM//g1zPAe8RlbsnWb1iL9r1y8pNWAmW/SSud
	 NQ2D5LSRI8lBXpD96UMDzlRvJoUQumkz5kD2i+sbMmlteLJCZa2n8frwkFV2wKOheqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O7b5TvKaL5k5uS1R+qO89yuvUB8Ybxk8ZIDy/935QDw=;
	b=Mbs9PHsmoUlmwVPEXMtPoTKNXCwMxXZJPQaswlydlBlN1knOZsMyo8+QmCt2toqOpkpP
	 JChbiyc8DjEp+w5axuU98wQ0T2hoiRYU7+rh8Os0mOhV4P3+MSIibN7P/6QVB0XyuVDiL
	 poRV37Id6JPj2LWVEeqCnc9/j50Em5JwlFL5WhkZzctsR+stFAekU3AvnAhzatwjr/oaJ
	 VcU/58RctRFzT5en9afuCA/ehQ2ohjVzVnkU7QWR6hirPNh3SCpxhWnNDUGQNP6IM6zpM
	 IGpL4ZUWliSKtkcAAIwDz3S74QdoSo6NA+6p9PY53IE7FS/agvdfR1xZKhj5/Lf5Asw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ebQbQXtD;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4560E60A382D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4560E60A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ebQbQXtD
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a070781f63so356444b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989825; x=1795594625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7b5TvKaL5k5uS1R+qO89yuvUB8Ybxk8ZIDy/935QDw=;
        b=ebQbQXtDs7wv+qNkOMuU3SDJzXbKTF+Q015Bz73Y+aUlXeEpED460OPyZXYiahEEOa
         9rEWbowtglUfwSiyDNjKblJd6RaUXygpS1VJTkdTDkA4NuireVcoQgHDRawllUURqjyX
         L20UihiU3utU8zxFWvOBBdmKFaegoLhyPApbEv5oYOjvEsEXdGPZrC5ujXQ/SVCiH6xF
         353bvJCmtagq3fpT6tbwwCJ58htNI1Dqz5LigppmcM2Nvmp6f/tcpN1qywJRbveo6ClR
         0SuiIgY463Ge94QWcco3fClUAHlBcrah4seCLYD9LEg2jI8MFxibvE3QKmux28oyqY3e
         id+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989825; x=1795594625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7b5TvKaL5k5uS1R+qO89yuvUB8Ybxk8ZIDy/935QDw=;
        b=hyQmQxWAMXxbflBLy1jJr0f69wDWvWqLeH3KvpsKuuT6E4YRN7arEWHN3sIcSa+kir
         QRmn4ZBPCvOo91qgAfO1gOzzKNjIAC2n77j6wO+kEivs0rSL802EDr5sIrabpmCQFVir
         2ZIJAw6lOVjiVmPTjy5WoI+87IiVPZBpCJHgpKPtFWwGF9thkw6IzgkQBOAlf+TP7S41
         Lp2VX7we29Z1IjhlNKHum2b8xkCnCH1XMZ/kbXM9pp7lHjtgM1dk6DzIY1BRPV1E6ltk
         IH0j25OhpJVEAkK5FPNIuN1LV3MDggdrxzDzj2QZ7ufygR75wjgGTHb7hH0RYgoMB3dG
         RhUA==
X-Gm-Message-State: APuU4Z9LoxyXpW0ULWBTGu6LXciVJ27igaOFfjbC9OWslvMvBzTgvqaT
	23e4DvJrGkvsYMfzZfOq9rzWh2JuH261L1IV0/2P4EW/dnkYRQfa6WTE
X-Gm-Gg: AYBFou0ZonZnhW2h/LhYeOly5Lq6VXwHA8uGuyYe5bgsVAAPTouXvU15znxd1BsCD5O
	Mtrzjah+p/gwFozoZQxO1w3dTpHvyoWk6Dlxq7hQk38bocEzBwuf4TYodkrro5+anr/n2A3Zitl
	bgNei3DMsXNfUjq9qkI1TKIWS0x/81LRDLz31VS7W8/d7rLuzDmzF3/wYEb0ppCz6f+F4wpMWHO
	BMYlkIulXaGUaR9duICBTjNl+L4w3Q2/H9ZN6K1JXD5BT6bYPYvTjCUkag2N8uTY2cBxKNfaO3B
	FpuxvVOLzT52ZIdnJZkf4rlUWQQKqOdSG94FsoFtL+ReM34MpzmUFpN4pBiegHVqL8yy/e9zmD1
	jTBABZsfQm/U03oiI0j2WoEtwkUcyteI93zFTpaU8Z5Gnvi05Uie0UWYFgX46gecTwbWkKLMAnL
	FMdYcPPPV0YjxWM8bC4c3DtL5El6emGaI61vqwYsqfyj2bO9xomFhxLNnR1gqOt0gMMKpaknz3a
	AqcJQGedHNVqq4qchCPBvIlhPgGSiogTISOCWIPCNesYat76y68zlRGNy0Ua9xY6yzDGAEZ9Fu2
	Sz339LHULGYNq26eVYQcHkHAvRaF6r22p7RC6S5pZ6cpgQVYb4b8FrRJlGDHfBUIvShwr23C2Qh
	tZuMnxBmYEnNo3aiG
X-Received: by 2002:a05:6a20:e613:b0:3fe:4bff:1a40 with SMTP id adf61e73a8af0-3fe988f6b48mr1808014637.58.1794989824648;
        Wed, 18 Nov 2026 00:17:04 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:17:03 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v10 10/13] mfd: nct6694: Extract core device management into a separate module
Date: Wed, 18 Nov 2026 16:16:21 +0800
Message-Id: <20261118081625.2399247-11-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118081625.2399247-1-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
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

From: Ming Yu <a0282524688@gmail.com>

Move the IRQ domain and IDA handling, which do not depend on the
transport, from the USB driver into a new nct6694-core module. The
core retrieves struct nct6694 from the driver data of the transport
device, and the transport keeps registering its own MFD cells.

The USB driver now creates the IRQ domain before submitting the
interrupt URB, and kills the URB before the domain is removed.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- Rebased on top of "mfd: nct6694: Drop the unused IRQ enable mask";
  the irq_chip moved to nct6694-core.c no longer has
  .irq_enable/.irq_disable.

Changes in v9:
- None.

Changes in v8:
- Pass only the transport device to the core and retrieve struct nct6694
  from its driver data.
- Let the transport register its own MFD cells.
- Rename nct6694_core_{probe,remove}() to nct6694_device_{init,exit}().
- Return -ENOMEM when the IRQ domain cannot be created.
- Folded in the v7 patch "Submit the interrupt URB after the core is
  registered", whose issue no longer arises.
- Moved the Kconfig split to a later patch.

Changes in v7:
- None.

Changes in v6:
- Reordered to sit before the transport-abstraction patch; no functional
  change.

Changes in v5:
- Split from the monolithic v4 patch to follow the single logical change
  principle.

 MAINTAINERS                 |  2 +-
 drivers/mfd/Makefile        |  1 +
 drivers/mfd/nct6694-core.c  | 85 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/nct6694-usb.c   | 73 ++++++-------------------------
 include/linux/mfd/nct6694.h |  3 ++
 5 files changed, 104 insertions(+), 60 deletions(-)
 create mode 100644 drivers/mfd/nct6694-core.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 62517279b5f8..69c31fe71f81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20081,7 +20081,7 @@ S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
-F:	drivers/mfd/nct6694-usb.c
+F:	drivers/mfd/nct6694-*.c
 F:	drivers/net/can/usb/nct6694_canfd.c
 F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index af81e00b3573..20a5de726071 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -124,6 +124,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
+obj-$(CONFIG_MFD_NCT6694)	+= nct6694-core.o
 obj-$(CONFIG_MFD_NCT6694)	+= nct6694-usb.o
 
 obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
diff --git a/drivers/mfd/nct6694-core.c b/drivers/mfd/nct6694-core.c
new file mode 100644
index 000000000000..438f391a7bcd
--- /dev/null
+++ b/drivers/mfd/nct6694-core.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Nuvoton NCT6694 core driver providing the IRQ domain and IDA pools
+ * shared by all transport drivers.
+ */
+
+#include <linux/device.h>
+#include <linux/idr.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+
+static const struct irq_chip nct6694_irq_chip = {
+	.name = "nct6694-irq",
+	.flags = IRQCHIP_SKIP_SET_WAKE,
+};
+
+static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
+{
+	struct nct6694 *ddata = d->host_data;
+
+	irq_set_chip_data(irq, ddata);
+	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
+
+	return 0;
+}
+
+static void nct6694_irq_domain_unmap(struct irq_domain *d, unsigned int irq)
+{
+	irq_set_chip_and_handler(irq, NULL, NULL);
+	irq_set_chip_data(irq, NULL);
+}
+
+static const struct irq_domain_ops nct6694_irq_domain_ops = {
+	.map	= nct6694_irq_domain_map,
+	.unmap	= nct6694_irq_domain_unmap,
+};
+
+/**
+ * nct6694_device_init() - Set up the resources shared by all transports
+ * @dev: transport device whose driver data points to the struct nct6694
+ *
+ * Return: 0 on success or negative errno on failure.
+ */
+int nct6694_device_init(struct device *dev)
+{
+	struct nct6694 *ddata = dev_get_drvdata(dev);
+
+	ida_init(&ddata->gpio_ida);
+	ida_init(&ddata->i2c_ida);
+	ida_init(&ddata->canfd_ida);
+	ida_init(&ddata->wdt_ida);
+
+	ddata->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
+						 &nct6694_irq_domain_ops,
+						 ddata);
+	if (!ddata->domain)
+		return -ENOMEM;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nct6694_device_init);
+
+/**
+ * nct6694_device_exit() - Release the resources set up by nct6694_device_init()
+ * @dev: transport device passed to nct6694_device_init()
+ */
+void nct6694_device_exit(struct device *dev)
+{
+	struct nct6694 *ddata = dev_get_drvdata(dev);
+
+	ida_destroy(&ddata->wdt_ida);
+	ida_destroy(&ddata->canfd_ida);
+	ida_destroy(&ddata->i2c_ida);
+	ida_destroy(&ddata->gpio_ida);
+	irq_domain_remove(ddata->domain);
+}
+EXPORT_SYMBOL_GPL(nct6694_device_exit);
+
+MODULE_DESCRIPTION("Nuvoton NCT6694 core driver");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
index 10d08ab50e16..8f9c7b7d9471 100644
--- a/drivers/mfd/nct6694-usb.c
+++ b/drivers/mfd/nct6694-usb.c
@@ -11,7 +11,6 @@
 
 #include <linux/bits.h>
 #include <linux/interrupt.h>
-#include <linux/idr.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
@@ -283,32 +282,6 @@ static void nct6694_usb_int_callback(struct urb *urb)
 		dev_warn(ddata->dev, "Failed to resubmit urb, status %pe",  ERR_PTR(ret));
 }
 
-static const struct irq_chip nct6694_irq_chip = {
-	.name = "nct6694-irq",
-	.flags = IRQCHIP_SKIP_SET_WAKE,
-};
-
-static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
-{
-	struct nct6694 *ddata = d->host_data;
-
-	irq_set_chip_data(irq, ddata);
-	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
-
-	return 0;
-}
-
-static void nct6694_irq_domain_unmap(struct irq_domain *d, unsigned int irq)
-{
-	irq_set_chip_and_handler(irq, NULL, NULL);
-	irq_set_chip_data(irq, NULL);
-}
-
-static const struct irq_domain_ops nct6694_irq_domain_ops = {
-	.map	= nct6694_irq_domain_map,
-	.unmap	= nct6694_irq_domain_unmap,
-};
-
 static int nct6694_usb_probe(struct usb_interface *iface,
 			     const struct usb_device_id *id)
 {
@@ -353,26 +326,12 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 		return -ENOMEM;
 
 	ddata = &usb_data->core;
-
-	ddata->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
-						 &nct6694_irq_domain_ops,
-						 ddata);
-	if (!ddata->domain) {
-		ret = -ENODEV;
-		goto err_urb;
-	}
-
 	ddata->dev = dev;
 	usb_data->usb_dev = usb_dev;
 
-	ida_init(&ddata->gpio_ida);
-	ida_init(&ddata->i2c_ida);
-	ida_init(&ddata->canfd_ida);
-	ida_init(&ddata->wdt_ida);
-
 	ret = devm_mutex_init(dev, &usb_data->access_lock);
 	if (ret)
-		goto err_ida;
+		goto err_free_urb;
 
 	int_pipe = usb_rcvintpipe(usb_dev, NCT6694_INT_IN_EP);
 	usb_fill_int_urb(usb_data->int_urb, usb_dev, int_pipe,
@@ -380,27 +339,27 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 			 nct6694_usb_int_callback, ddata,
 			 usb_pipe_endpoint(usb_dev, int_pipe)->desc.bInterval);
 
-	ret = usb_submit_urb(usb_data->int_urb, GFP_KERNEL);
+	usb_set_intfdata(iface, ddata);
+
+	ret = nct6694_device_init(dev);
 	if (ret)
-		goto err_ida;
+		goto err_free_urb;
 
-	usb_set_intfdata(iface, ddata);
+	ret = usb_submit_urb(usb_data->int_urb, GFP_KERNEL);
+	if (ret)
+		goto err_device_exit;
 
 	ret = mfd_add_hotplug_devices(dev, nct6694_usb_devs, ARRAY_SIZE(nct6694_usb_devs));
 	if (ret)
-		goto err_mfd;
+		goto err_kill_urb;
 
 	return 0;
 
-err_mfd:
+err_kill_urb:
 	usb_kill_urb(usb_data->int_urb);
-err_ida:
-	ida_destroy(&ddata->wdt_ida);
-	ida_destroy(&ddata->canfd_ida);
-	ida_destroy(&ddata->i2c_ida);
-	ida_destroy(&ddata->gpio_ida);
-	irq_domain_remove(ddata->domain);
-err_urb:
+err_device_exit:
+	nct6694_device_exit(dev);
+err_free_urb:
 	usb_free_urb(usb_data->int_urb);
 	return ret;
 }
@@ -412,11 +371,7 @@ static void nct6694_usb_disconnect(struct usb_interface *iface)
 
 	mfd_remove_devices(ddata->dev);
 	usb_kill_urb(usb_data->int_urb);
-	ida_destroy(&ddata->wdt_ida);
-	ida_destroy(&ddata->canfd_ida);
-	ida_destroy(&ddata->i2c_ida);
-	ida_destroy(&ddata->gpio_ida);
-	irq_domain_remove(ddata->domain);
+	nct6694_device_exit(ddata->dev);
 	usb_free_urb(usb_data->int_urb);
 }
 
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 24cfe6a03ef0..26e9034daa53 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -89,6 +89,9 @@ struct nct6694 {
 	struct irq_domain *domain;
 };
 
+int nct6694_device_init(struct device *dev);
+void nct6694_device_exit(struct device *dev);
+
 int nct6694_usb_read_msg(struct nct6694 *ddata,
 			 const struct nct6694_cmd_header *cmd_hd,
 			 void *buf);
-- 
2.34.1

