Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649450;
	b=TiS5rUwLA3fA1UFrDf85Bbc+UG+/BWbB/fVOW+EUW8GsHEuABiLJjrUk0CrZgGJMlTV7
	 JZIWMGx/H77TaZo28ltt4jpCQNqA1qaJ9pbTrhi0JRFnk8Uo3YLxBjHEzG5uXiBDmuCqD
	 uPosjviYWB+VOVX8w6NIFoNLMEPw1S50JNcbRlmK1riHH6iku8NXLCBczVmHIhe4hxO/C
	 yDN7BPFfhUYdCaQTwe7Zl6s0F/1q2zlPn5ReQdEqs18bSKmmQQfn5pKi/oHIDLDGZmMEK
	 9cXclhHYV4e8wdFdnRaYb6/SSItiD/SPlnmz2KvVwtvWkIVLCmZoX4VpzTxuIGtCimw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=F2u2sNXMJ/8Kzk3rb+4y45MaOW2FUfdnPJTV4Sx+e+w=;
	b=XJnoZlubcNdx9BUtPMddv6YtuuxwY02OY7ZjQ1xQoc3i6hzLqw+3fPOKVZcyEZd9sbWQ
	 WH6RqTynZISRO9ltroddGx+0GYjD13DYqC66z16ofoqPMSK08yb7lUhKEXNAERaWkXrTe
	 aDgpCiAzZsPWr8XFNIn1FZthmxPnE8Tt0z7XGtANVs9L4/bQH1MFTRQlfTnVCvG9ttA3w
	 gko80ue4VGW2xebVY5wWxIShg4G1OQcJ4l6tOcPpw7fCdUiEJGssunLY7V5LJnuf699JF
	 qrowPy239MWPyewm4WnewXv0sRwVim8F/HeLe4HRNNuhK3I4Iryqlgnfhk2X1WXeltA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BTQDSeGS;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C003606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C003606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BTQDSeGS
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49465892f7bso4628573f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649449; x=1796254249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F2u2sNXMJ/8Kzk3rb+4y45MaOW2FUfdnPJTV4Sx+e+w=;
        b=BTQDSeGSXVmcZGBj7XQDUVmsWiBe4NsZggLpbaxeDlDFyLbnrfspx9dCw2oeS1bFpP
         UiBScXo/QqYk3ES1wWK079MFnULwDBdBB9ovL55LP3ZBSvmi6lZEDAkftRg3a8Bw2Rz+
         rBQNGwNgd8AbLbAxGMjSuLG88niUkXN1PExgNXHoKxIPRtcIzifGWLJ4N7XDO1nnmNb0
         /69GcJ7iNG5xgFaqTMphd2tifIT0ut2XwshWUt2YRHhWPzPLGwMSh48gIHMxK5G4FxiN
         hSUBVEuldvw60viAoGETDy8k2q3YFGhrHCPMsbRQZLfXdKPHctjLthxmX8JKSwZ8Ya/c
         Dfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649449; x=1796254249;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2u2sNXMJ/8Kzk3rb+4y45MaOW2FUfdnPJTV4Sx+e+w=;
        b=ZXoho/NNR49a0oWHDOX/iRrdpMNl1E59bN88jmgFe4gZh/XFCle1iCAdb4IgcdXJa1
         oNMnoqj3rB/12gToknJWRmA/5w8VhTBd/BOL2HN5CMCW0Vju62m331PZ3xOgD8nKWDc/
         HZf+opeKWc526r52MIWHWo+5MXCR4yDPsq1//aZ+RWrPjETx5W40Y/xrRlTHGLI6NRcq
         8OvWlbykk2+k2rrTbislI6uJZ23uJk4kqdCtETIMvcC3aqK7iYHD0CIelChGKyW1KsV9
         EEPqIBYdDTFH8GPswDKeLOYWKbZC+Db6Hmp5AjnGeL9DyaDxZeOH6VTO0XTalRRKSUvo
         r05Q==
X-Forwarded-Encrypted: i=1; AL+hErF85p9ZfiCUDAp9hO5VOykozGFYJMXNl6N3EBvByGu1OH1gp2d8lbQv67CKCBiIhQCyyG1EQwjlcnpABCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HtrjDQoo5SzCQ4WxxVZfKHKjQmntkrC7TzM53Zi67QxVhG2rR
	XySZTp1HdHtB6bJPDThQpRvIOxDAE/lLxmzBRJf2cOrgQ3x4tHwaSnmE
X-Gm-Gg: AZFdTZeppeaYX8mOX13tIXzN14Wuzf04JqEgjtik9qYQkqs/gcpQxPcxYOVfSWKFbmU
	ZrUau1W1JADxWR07rRHjSuVSBjCDeljb0XNp7YL6FIl+S89/qckcwsIyO3VJpQfb44ck8rbDUme
	Mf3RQvlqppJrrO1/Tg9VStkgXsLNtjZvpE7M7Z3x8erVTbgd6Em372kIrDhKhml+7IwnMVztjpZ
	/trd2mMeqt8RCWTsZZuH3kY9xYumuIlxe2HLVcMEAsPm81offwZo90CQus0J1AW0kufyr1r4fqb
	dFZPRMdGDBT0WDLum8IBIRDUnCu0EGNFsLg64Ty3Y1woWJZOLA6tUACzgRDq9YPLJVgTMROSVMk
	Iklw7V+c5xBjdpXYftULRp2DaZn2bKC+8epUOIQ+UgyC2+sp/4+I+PV4g0HUPTmaAgAhSfsUMNJ
	MuqzjSosMWQimPTbxJV5OBdBkGxJ7XTq4oQhBzloAmc4e3o1vMf61/gyIDS9YfTdc58+TJl4CQ/
	8oTWP/NT5EBX1s7hmtzO1trbnKn1f1K1dX43B4rzabv7PEvup9toJeEWAdZMfFgp0gS7jqOLIL+
	c6eUACHY1micj4AM6kGgequg66xkKdWY44cysfztgU2IzqoKd3ducstc5e4Eyz+Di0nllFlkHHt
	t6s25azYti8E=
X-Received: by 2002:a05:600c:64c7:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb887ffee2mr373628985e9.9.1795649448552;
        Wed, 25 Nov 2026 15:30:48 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm583684325e9.8.2026.11.25.15.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:48 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>
Subject: [PATCH RFC 04/19] irqchip: Add Espressif ESP32-P4 CLIC support
Date: Wed, 25 Nov 2026 23:30:05 +0000
Message-ID: <20261125233020.1380594-5-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
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

Register a hierarchical IRQ domain for the ESP32-P4 CLIC. Handle
per-CPU software and timer interrupts and support active-high level
triggering on the 32 external interrupt inputs.

Tested on the Waveshare ESP32-P4-Module-DEV-KIT hardware.
Verified that the CLIC handled local timer interrupts from the
CLINT and external interrupts routed through the interrupt matrix.

AI assisted with driver development, validation and testing.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 drivers/irqchip/Makefile           |   1 +
 drivers/irqchip/irq-esp32p4-clic.c | 178 +++++++++++++++++++++++++++++
 2 files changed, 179 insertions(+)
 create mode 100644 drivers/irqchip/irq-esp32p4-clic.c

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 16a5fd126c9a..408d06c20ab8 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -102,6 +102,7 @@ obj-$(CONFIG_QCOM_MPM)			+= irq-qcom-mpm.o
 obj-$(CONFIG_CSKY_MPINTC)		+= irq-csky-mpintc.o
 obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
 obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
+obj-$(CONFIG_RISCV_ESP32P4_CLIC)	+= irq-esp32p4-clic.o
 obj-$(CONFIG_RISCV_APLIC)		+= irq-riscv-aplic-main.o irq-riscv-aplic-direct.o
 obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
 obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
diff --git a/drivers/irqchip/irq-esp32p4-clic.c b/drivers/irqchip/irq-esp32p4-clic.c
new file mode 100644
index 000000000000..f9235f230d37
--- /dev/null
+++ b/drivers/irqchip/irq-esp32p4-clic.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Espressif ESP32-P4 Core-Local Interrupt Controller
+ *
+ * Author: Vítor Hugo Silva <vitorhg20080@gmail.com>
+ * ESP32-P4 Technical Reference Manual, section 2.9.2 (CLIC)
+ * https://documentation.espressif.com/esp32-p4_technical_reference_manual_en.pdf
+ */
+#include <linux/bits.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/printk.h>
+
+#include <asm/csr.h>
+#include <asm/ptrace.h>
+
+#define CLIC_FIRST_EXT_IRQ	16
+#define CLIC_NR_IRQS		48
+#define CLIC_INTTHRESH		0x0008
+#define CLIC_INTIE(id)		(0x1001 + 4 * (id))
+#define CLIC_INTATTR(id)	(0x1002 + 4 * (id))
+#define CLIC_INTCTL(id)		(0x1003 + 4 * (id))
+#define CLIC_INTATTR_MODE_M	GENMASK(7, 6)
+#define CLIC_INTCTL_MAX		GENMASK(7, 5)
+
+#define CSR_MINTTHRESH		0x347
+
+static struct irq_domain *esp32p4_clic_domain __ro_after_init;
+
+static void esp32p4_clic_irq_mask(struct irq_data *d)
+{
+	void __iomem *base = irq_data_get_irq_chip_data(d);
+
+	writeb(0, base + CLIC_INTIE(d->hwirq));
+}
+
+static void esp32p4_clic_irq_unmask(struct irq_data *d)
+{
+	void __iomem *base = irq_data_get_irq_chip_data(d);
+
+	writeb(1, base + CLIC_INTIE(d->hwirq));
+}
+
+static int esp32p4_clic_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	if (type != IRQ_TYPE_LEVEL_HIGH)
+		return -EINVAL;
+
+	return IRQ_SET_MASK_OK;
+}
+
+static struct irq_chip esp32p4_clic_chip = {
+	.name		= "ESP32-P4 CLIC",
+	.irq_mask	= esp32p4_clic_irq_mask,
+	.irq_unmask	= esp32p4_clic_irq_unmask,
+	.irq_set_type	= esp32p4_clic_irq_set_type,
+};
+
+static int esp32p4_clic_domain_alloc(struct irq_domain *domain,
+				     unsigned int virq, unsigned int nr_irqs,
+				     void *arg)
+{
+	struct irq_fwspec *fwspec = arg;
+	irq_flow_handler_t handler;
+	irq_hw_number_t hwirq;
+	unsigned int type;
+	int ret;
+
+	if (nr_irqs != 1 || !fwspec)
+		return -EINVAL;
+
+	ret = irq_domain_translate_twocell(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	if (type != IRQ_TYPE_LEVEL_HIGH)
+		return -EINVAL;
+
+	if (hwirq == IRQ_M_SOFT || hwirq == IRQ_M_TIMER) {
+		ret = irq_set_percpu_devid(virq);
+		if (ret)
+			return ret;
+		handler = handle_percpu_devid_irq;
+	} else {
+		if (hwirq < CLIC_FIRST_EXT_IRQ || hwirq >= CLIC_NR_IRQS)
+			return -EINVAL;
+		handler = handle_level_irq;
+	}
+
+	irq_domain_set_info(domain, virq, hwirq, &esp32p4_clic_chip,
+			    domain->host_data, handler, NULL, NULL);
+
+	return 0;
+}
+
+static const struct irq_domain_ops esp32p4_clic_domain_ops = {
+	.alloc		= esp32p4_clic_domain_alloc,
+	.free		= irq_domain_free_irqs_top,
+	.translate	= irq_domain_translate_twocell,
+};
+
+static void esp32p4_clic_handle_irq(struct pt_regs *regs)
+{
+	unsigned long hwirq = regs->cause & ~CAUSE_IRQ_FLAG;
+
+	if (generic_handle_domain_irq(esp32p4_clic_domain, hwirq))
+		pr_warn_ratelimited("ESP32-P4 CLIC: unhandled IRQ %lu\n", hwirq);
+}
+
+static void __init esp32p4_clic_init_irq(void __iomem *base, unsigned int hwirq)
+{
+	writeb(0, base + CLIC_INTIE(hwirq));
+
+	/* Use non-vectored, active-high level interrupts in M-mode. */
+	writeb(CLIC_INTATTR_MODE_M, base + CLIC_INTATTR(hwirq));
+
+	/* Use one level for all IRQs regardless of the inherited MNLBITS. */
+	writeb(CLIC_INTCTL_MAX, base + CLIC_INTCTL(hwirq));
+}
+
+static int __init esp32p4_clic_init(struct device_node *node,
+				    struct device_node *parent)
+{
+	struct irq_domain *domain;
+	void __iomem *base;
+	unsigned int hwirq;
+	int ret;
+
+	base = of_iomap(node, 0);
+	if (!base)
+		return -ENOMEM;
+
+	domain = irq_domain_create_hierarchy(NULL, 0, CLIC_NR_IRQS,
+					     of_fwnode_handle(node),
+					     &esp32p4_clic_domain_ops, base);
+	if (!domain) {
+		ret = -ENOMEM;
+		goto err_unmap;
+	}
+
+	ret = set_handle_irq(esp32p4_clic_handle_irq);
+	if (ret)
+		goto err_remove_domain;
+
+	esp32p4_clic_init_irq(base, IRQ_M_SOFT);
+	esp32p4_clic_init_irq(base, IRQ_M_TIMER);
+	for (hwirq = CLIC_FIRST_EXT_IRQ; hwirq < CLIC_NR_IRQS; hwirq++)
+		esp32p4_clic_init_irq(base, hwirq);
+
+	/* Clear the threshold inherited from firmware. */
+	if (of_device_is_compatible(node, "esp,esp32p4-v3-clic")) {
+		csr_write(CSR_MINTTHRESH, 0);
+	} else {
+		writel(0, base + CLIC_INTTHRESH);
+		/* Ensure the new threshold is active before enabling IRQs. */
+		readl(base + CLIC_INTTHRESH);
+	}
+
+	esp32p4_clic_domain = domain;
+	pr_info("%pOF: ESP32-P4 CLIC registered\n", node);
+
+	return 0;
+
+err_remove_domain:
+	irq_domain_remove(domain);
+err_unmap:
+	iounmap(base);
+	return ret;
+}
+
+IRQCHIP_DECLARE(esp32p4_clic, "esp,esp32p4-clic", esp32p4_clic_init);
+IRQCHIP_DECLARE(esp32p4_v3_clic, "esp,esp32p4-v3-clic", esp32p4_clic_init);
-- 
2.56.1

