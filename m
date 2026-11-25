Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565199;
	b=YmPqAS4vl64o1OUOgIM7L0aOrRIVUbac9NHU3lzshxoBaCkSD+uO+rL2XPZURfEdwsk2
	 nWa5LOT3fOvmD2brL6uqNPKAHoot1tHErPXuFWZd2kyvjTs5RcelcqrTxPJGJuQb160yM
	 GiyX+sAoh+26mg1KwWQFeG6K0mKZH2CmFRRoX865JG+vTHa8BD4lKPApDmWOCziqDwgMv
	 bbjeFr/6+WpY6xd8+gmkQe7oKPkDjDwCSgqRFWQoL0gaOLLAYC8DD7hsd5h7zJpDQc9LS
	 feO6/jzm5yNB8ELLl40o0epXnaoTCTIiE+OdCb8hpwD9yo93sUt1dHj2VivUPuoKHWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=l8tGMJ9gf6kiMFZ1y5Rn7kaS3blJW0Im1f1QIH4h4UU=;
	b=CX8rR7TzVAGuxd2y9fLWNwcXOnlp/eqwzmUifCysp0JZOi0WJaEO4YBv8sqCNmToRTEf
	 rzIuH/rAhW/R/WXlxYLl7W8UWF813ICCoPqo7V3TjHlu3YTSFJsy9ZWk3N2Dtta7+MYfh
	 xJpghnFknGTojZFexprS2nLp6iJYnvxRR5KulZlnFN2N+tIb8+DV1TZIi8QLu5MlxZlPr
	 Az1/R7/op8yjP7yIz8iOlF+Gio03eor/hcrtcjoQwV3CcqkTV3sH8Vq+4apDscW2kNb5p
	 1XtqpbJZCq4AEUjmaNWEYR7Rrb509ruSpGEBBVWZ+Ex57Y2wEAXQmrDD2m1uerwi5qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n2jKNA0L;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEE9606A68C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EEE9606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n2jKNA0L
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386b8f2f671so2345107eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565197; x=1796169997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l8tGMJ9gf6kiMFZ1y5Rn7kaS3blJW0Im1f1QIH4h4UU=;
        b=n2jKNA0LMK+zT+dalkZ1doQPshk0eWpap+l7BptAkzTZlOFW+l1tZWBysaKUHmyeA/
         X/Q3CY9UCkem+5ypiwUfhtIOACueHNsC7kPorjiWoOGu7zHd0rx1tadsfENhvfWvxOoS
         bxPV9RsPbeTYsA7lbHBxZj3mU1VdqN7+anKeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565197; x=1796169997;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l8tGMJ9gf6kiMFZ1y5Rn7kaS3blJW0Im1f1QIH4h4UU=;
        b=Hho/LlxZHDlnKJuJ5BKDMfteXSpyw8zTCt1pKkPx9Zcseo6srVrBNtDUzjlHRrSfIO
         5s21HeZmtOpw2g3c8IWgQIoR5ZGQIPtFHcuWHRcnFaakwuJhyYfKMyEMPF7FIme3ebsi
         1/Inu9hjrl1AthgROreD1ecgEwWKN3lFxJI+b/9Ays0iohOE4a/sWPw8FcVPou2eeRi/
         8BJ7MDQ7eHvRDYf94odvcKnc0e+SkueG/d8HrTK9ODB/GjyIyHqANg4Kte30FIy4AqHG
         gCaXt71EWOpsl3TkWcmM43y2nfpTzz5dHbftbe4stTWNlgqS2pyKRnYXDPqoyrC9pmrN
         0ixA==
X-Forwarded-Encrypted: i=1; AL+hErFcRSS5r27OLqhviUllIEwdtqaCKcphoObeGOmA8JbDwU6SWKcQKZTrYut6NTkdKhIJg2ke6nYNhWAz+qU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P5MOYoHUsZ/lkTeB105hPhsUQnZrjyf3ZRsp5m1eNsxI/1C+c
	DtJtgi6J7CAUlf/FqeNKlrDrq8nFHOpyaf6rl5mh88wRGwL5Vce3ai+tOab03qDwWg==
X-Gm-Gg: AZFdTZexIjaH8MZMLD2gPk8EJCR9xMGipq3nVVTzvj4BEMQfYi1/On6d2jyzAzgZZOc
	tx0muPu1mNNiSEnN8DKadbA7QafLm0xG6c8p7Ku38f/pVcrMLiXhxYzGEm6Cc9o2XFzgHbDsq8g
	TOpqV8y50Pst73tu9cB+YiqPl8pOwNu+hZK+OmG37CRz6U9R7WzhJ3JwYAlRVwg0lEk4BWZvSDp
	9ASUCMwJitcx2k1vCEMVffRBpL/NON5G/sFuYTJ64GDBJe14wpJJe97V4gvqd6obZYnoRFKNo1I
	MeNoB12Kc7FeVPbEXfVwdsSR/VoduvK+L3TzcHOzbPNQzx58UP7l/7/2J7rTJ+EHTAbzk0Q4xpq
	80qR8Gb376nSpcWRIce2yAVTuz3prRuaqy6Nv9jhdpqgK1kB5YndZKwUscKvrrYM8yRCiaooPYT
	tAD6/x3VkaINoVUGEwNbwKQQuSyR6E4MxY3lfVRTs50NZTQ0F5sXtOu0mnH+jf4usuQHwv2CYBf
	pzLc1Gpzb4p79MQcMWx5rNJa7EeqhXaHZOMZQjdvF9xEczYBg5oJAg3OkstBN2Q6VMrkrGx0RpD
	6Zxv3QMbHZSY5ibeCHe5coIAj2dzF0uOOwSJ91wp1SUIJrPxxqLAs3/YcEIXkoSMFuLa
X-Received: by 2002:a05:7301:d81c:b0:386:b7d2:a279 with SMTP id 5a478bee46e88-386b7d2aba6mr6043229eec.34.1795565197480;
        Tue, 24 Nov 2026 16:06:37 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385666e99fdsm60034542eec.5.2026.11.24.16.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:36 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 6/9] irqchip/google-cpm: Add CPM IRQ driver
Date: Tue, 24 Nov 2026 16:03:40 -0800
Message-ID: <20261124160343.v2.6.I41e14e9460b3add41e69dac97abf57a741e9c4c5@changeid>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261125000349.3385325-1-briannorris@chromium.org>
References: <20261125000349.3385325-1-briannorris@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jim Wylder <jwylder@google.com>

The Central Power Manager (CPM) on Google Tensor SoCs can signal
events/interrupts over its mailbox communication protocol. Today, the
downstream driver for these chips only supports interrupt notification,
although the CPM firmware may also have mask/unmask support (not
currently used) that could be added later if needed.

In practice, this driver is used for RTC alarms and for events driven by
the Always-on Compute (AoC) subsystem.

Signed-off-by: Jim Wylder <jwylder@google.com>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Formatting requests from v1 review
 * Adapt to devm_cpm_register_rx_callback()
 * Update author/SoB to retain downstream heritage

 drivers/irqchip/Kconfig          |  10 +++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-google-cpm.c | 131 +++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 drivers/irqchip/irq-google-cpm.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 8aee8f731848..ceaad2ab04f6 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -556,6 +556,16 @@ config CSKY_APB_INTC
 	  by C-SKY single core SOC system. It uses mmio map apb-bus to visit
 	  the controller's register.
 
+config GOOGLE_CPM_IRQ
+	tristate "Google Tensor CPM interrupt controller"
+	depends on GOOGLE_CPM_MBA
+	depends on ARCH_GOOGLE || COMPILE_TEST
+	select IRQ_DOMAIN
+	help
+	  Support for the Central Power Manager (CPM) interrupt controller
+	  found on Google Tensor SoCs. This controller routes interrupts from
+	  the CPM to the Application Processor.
+
 config IMX_IRQSTEER
 	tristate "i.MX IRQSTEER support"
 	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index eb539d41251e..ac6352d3b797 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_QCOM_PDC)			+= qcom-pdc.o
 obj-$(CONFIG_QCOM_MPM)			+= irq-qcom-mpm.o
 obj-$(CONFIG_CSKY_MPINTC)		+= irq-csky-mpintc.o
 obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
+obj-$(CONFIG_GOOGLE_CPM_IRQ)		+= irq-google-cpm.o
 obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
 obj-$(CONFIG_RISCV_APLIC)		+= irq-riscv-aplic-main.o irq-riscv-aplic-direct.o
 obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
diff --git a/drivers/irqchip/irq-google-cpm.c b/drivers/irqchip/irq-google-cpm.c
new file mode 100644
index 000000000000..ce960b48f271
--- /dev/null
+++ b/drivers/irqchip/irq-google-cpm.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Google CPM IRQ chip driver
+ *
+ * Copyright 2023-2026 Google LLC
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gfp_types.h>
+#include <linux/irq.h>
+#include <linux/irqdesc.h>
+#include <linux/irqdomain.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/types.h>
+#include <soc/google/cpm-service-ids.h>
+#include <soc/google/google-cpm-mba.h>
+
+#define CPM_IRQ_COUNT				512
+
+struct cpm_irq_info {
+	struct device		*dev;
+	struct irq_domain	*domain;
+};
+
+static void cpm_irq_process_irq_status(struct cpm_irq_info *info, u32 irq_number)
+{
+	int ret = generic_handle_domain_irq_safe(info->domain, irq_number);
+
+	if (ret)
+		dev_err(info->dev, "Error handling IRQ %u, error code %d\n", irq_number, ret);
+}
+
+static void cpm_irq_rx_callback(const struct cpm_payload *msg, void *priv)
+{
+	struct cpm_irq_info *info = priv;
+	u32 irq_number = msg->payload[0];
+
+	cpm_irq_process_irq_status(info, irq_number);
+}
+
+static void cpm_irq_domain_remove_action(void *data)
+{
+	struct irq_domain *domain = data;
+	unsigned int hwirq;
+
+	for (hwirq = 0; hwirq < CPM_IRQ_COUNT; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(domain, hwirq));
+
+	irq_domain_remove(domain);
+}
+
+static int cpm_irq_domain_map(struct irq_domain *d, unsigned int virq,
+			      irq_hw_number_t hwirq)
+{
+	struct cpm_irq_info *info = d->host_data;
+
+	if (hwirq >= CPM_IRQ_COUNT)
+		return -EINVAL;
+
+	irq_set_chip_data(virq, info);
+	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
+
+	dev_dbg(info->dev, "Mapped hwirq %lu to virq %u\n", hwirq, virq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops cpm_irq_domain_ops = {
+	.map	= cpm_irq_domain_map,
+	.xlate	= irq_domain_xlate_onecell,
+};
+
+static int cpm_irq_probe(struct auxiliary_device *adev, const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct cpm_irq_info *info;
+	struct cpm_handle *cpm;
+	int ret;
+
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->dev = dev;
+	auxiliary_set_drvdata(adev, info);
+
+	info->domain = irq_domain_create_tree(dev_fwnode(dev), &cpm_irq_domain_ops, info);
+	if (!info->domain) {
+		dev_err(dev, "Unable to add irq domain\n");
+		return -ENODEV;
+	}
+
+	ret = devm_add_action_or_reset(dev, cpm_irq_domain_remove_action, info->domain);
+	if (ret) {
+		dev_err(dev, "Failed to add irq domain removal action\n");
+		return ret;
+	}
+
+	cpm = devm_cpm_get_handle(dev);
+	if (IS_ERR(cpm))
+		return dev_err_probe(dev, PTR_ERR(cpm), "Failed to get CPM handle\n");
+
+	ret = devm_cpm_register_rx_callback(dev, cpm, CPM_AP_NS_IRQ_SERVICE,
+					    cpm_irq_rx_callback, info);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register CPM RX callback\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id cpm_irq_id_table[] = {
+	{ .name = "google_cpm_mba.irq" },
+	{ },
+};
+MODULE_DEVICE_TABLE(auxiliary, cpm_irq_id_table);
+
+static struct auxiliary_driver cpm_irq_driver = {
+	.name		= "cpm-irq-chip",
+	.probe		= cpm_irq_probe,
+	.id_table	= cpm_irq_id_table,
+};
+module_auxiliary_driver(cpm_irq_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jim Wylder <jwylder@google.com>");
+MODULE_DESCRIPTION("Google CPM IRQ chip driver");
-- 
2.56.1.831.g720f3f5937-goog

