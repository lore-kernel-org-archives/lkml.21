Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795130074;
	b=Urs/a3Z0LRuMN33nSNixJXLm0+qO607BT+S7SxTurH6tsrSmBig9vaYfBWIDCbsmSe8T
	 7HZVwFAM+mRtaBokIpHKHpumjAaMPU6eaovaOVWWaG+AY3sp7j2/4yWJPLApBUa4BEfB+
	 /2x27mIvtLTo6qoHaOVeNO9Orx4GI6ibD5q8z5fR5PI3eYJ/pPoYOONByLz/Uh8DpxYDz
	 emEw+nS+kA363ZsqIrXbquGqn1ujpiByNAuARBHoX7stkVkBhZW3u2xM+OUozAKQMCP6j
	 cdIIgM948Lu+Y1raNsDonbDCG5eHybkcsUHWDrXrIbzzMcW7Ka1cagj55FII5HLeofw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130074;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PdwIhtMyh/Zj8GrfiHHSk6eMRax1ynu3bKJ4+ALvLjk=;
	b=u48iyeHY7g42KxEX2KTocOrQ1vxe8mszTcuLhYEXiroPuJGEsl+Vspl4elUDJ7hM8f4s
	 LC06+Rh+dXEzp3xCIUMQANOkmCQ1mS8ht72FH3dNR/kJWl6jBdhowz5Nd0CY8SHuwecCO
	 Hjf17dCBGEFF13IMV1sk5Ps12+RPB5qHtQHoFPxtq6EKDwXF4IT8luH1aUjjbLGZ/UUOD
	 TmlOJCvCpwjVjSOzbzq5Y/53vZZYjhqEi0ibqQf6ET2ZSgluoBUla4RJCMgxA+OWYfnF7
	 /O2KBVunSUmBYsllHRCnGGWef6KiR4tlhtcZAzR/uAI0lJ4jHORLL92UINPcBD7NHuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lplu+gP4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D5F606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lplu+gP4
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795130073;
	b=ra38V2xtOVnO14qz4jRkkb1maAMR6Ilt2gHuk1oa651AvzcFoLCzN9CHYEsArsVYKIYe
	 xemgrrs67/C1AzXKxj4zRcNnqPqswAg7TQRwsznI8s3RY8iVG2HZ7DzdnB+pUhWjq+TAW
	 fjCcWkZnaD1VC9fm+rDNYiB56VufhiRk29gc25+GF7lEIG2isa/FpvsgBfYo5Mo+ZoOrR
	 AyGKc0DoeF41JWOcv9Cb1OqMfDG2sMfFdtBTrI/HxJyAVZOZEGBwoqi7jsV07QtcNZmYj
	 m9UeGz1/By5R9CvvFQMwUAJ//K35+h1M85svKJglUtmdDqJk04drmej2ymoHHVD+pqw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795130073;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=PdwIhtMyh/Zj8GrfiHHSk6eMRax1ynu3bKJ4+ALvLjk=;
	b=oY/K+vDsYSjKbg5L03JAFkOeCwRk3RGx8LnJP4IB6XaOrPVTj2R5VFlqRraZEuTybSby
	 l/O9unXiYr7gpjPW5pHoixGFJIL+KMAri4IZ9t+60ltwV3vNQrcRfB45WaNn9cv8ScHxc
	 QmZw18SdGF+ofWtUnvztd44qT1nnRcXNcTW1q1YUCpc6xLT+0AYkwchMjeo4vgiB06rKy
	 Hl0CWNVbhbgsYwPmLkj6jOo65fKvSHMlFCIkxbxic2hbJV16cNBbkmMc8CEX9FVTW0KOr
	 agREQPg3NpMICx72ce0pOuKvFWcXLP+G4JeDtB/HI5MVXM448qWU7adQpQavFB9eYJA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF95F1F000C6;
	Thu, 19 Nov 2026 23:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795130073;
	bh=PdwIhtMyh/Zj8GrfiHHSk6eMRax1ynu3bKJ4+ALvLjk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=lplu+gP4tTydtQI4+wOPjb28uLAnhg5GnjcEwGCbu61xvSqSyPDDCE51QaS817tZT
	 3tKUykI/feDqLLIjFAjIvkq3IaraXSZCZaV6FmZC7s+J8C1NflQk5u/A92pK2/P8Yd
	 1KZ2K66KxfCBJZML4HCZ+2fdEbAKFTYHRu5nCPGtwuLP+JMfeDDRITfzPJEtYyMnHy
	 M6fAPntt/XAYvwhxHhaD7SQfOAD9o9WlW7X4cFBc2stUBhgcwgfHOfbIWyXdA0qXVj
	 6+xpxptv9COjixBZ8kmlIeZsKaHDM5snHw/S5RxgJQmWvRWcwpXhATmpFCLzUhXqEM
	 k5JAvzH872L4g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 84A0E41B45;
	Thu, 19 Nov 2026 23:14:32 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 20 Nov 2026 01:14:30 +0200
Subject: [PATCH] irqchip/meson-gpio: Restore the channel setup after
 hibernation
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
Message-Id: <20261120-meson-gpio-hibernate-v1-1-462fdd55810a@iav.lv>
X-B4-Tracking: v=1; b=H4sIANaC/2oC/x2MQQqAIBAAvxJ7bkGFhPpKdChbbQ+paEQg/b2l4
 zDMNKhUmCpMXYNCN1dOUUD3HbhjjYGQd2EwylitjcKTaooYMic8eKMS14twEKdHv1vvLEiaC3l
 +/u28vO8HycQ6aGYAAAA=
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4669; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=8E657J8E9V1B6VWAcIoFiF9rMDrYJrYzKUQ3uwXqqLM=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFn/m64f63MT/NzBfF2X+ZPwo+Qez9ff7eay8zz+kydnm
 GI1RXJqRykLgxgXg6yYIsuEQxq3MpZc/evvYf4AZg4rE8gQBi5OAZiI2yNGhuZkx9wrdnwaKcGS
 pY/F6rbxG+3UO+IQJJuibnAnfVJMAsP/guTL9xgy1gTd+r+b54zcKbYJh8PvWNnf0N31hD3Ch8m
 VEQA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The GPIO interrupt mux takes the first free channel when an interrupt is
mapped, so the channel a pad gets depends on probe order. A hibernation
image is restored by a freshly booted kernel that maps the interrupts in
its own order, and the controller may lose power while the image is on
disk. The restored kernel keeps its channel table, but the hardware
routes the pads as the boot kernel set them up.

On ODROID-HC4, after a power cut during hibernation, PIN_03_SEL changed
from 0x54521a3b to 0x001a523b: the PHY and RTC channels swapped, the
PHY interrupt ran the pcf8563 handler and the link was never reported.
This happened on 7 of 11 restores.

Save the register block in syscore suspend and write it back in syscore
resume. create_image() calls them around the snapshot, so the image's
own setup comes back.

Tested on ODROID-HC4: 10 restores after a power cut, the registers and
the network came back every time.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on ODROID-HC4 with v7.3.5 and v7.4-rc3 based kernels: hybrid sleep, power removed while asleep, image restored on the next boot.
---
 drivers/irqchip/irq-meson-gpio.c | 53 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index e0329ef5e4a2..009576633ff7 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -15,6 +15,7 @@
 #include <linux/irqchip.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/syscore_ops.h>
 
 #define MAX_NUM_CHANNEL 64
 #define MAX_INPUT_MUX 256
@@ -245,6 +246,9 @@ struct meson_gpio_irq_controller {
 	u32 channel_irqs[MAX_NUM_CHANNEL];
 	DECLARE_BITMAP(channel_map, MAX_NUM_CHANNEL);
 	raw_spinlock_t lock;
+	struct syscore syscore;
+	unsigned int nr_regs;
+	u32 *saved_regs;
 };
 
 static void meson_gpio_irq_update_bits(struct meson_gpio_irq_controller *ctl,
@@ -633,6 +637,35 @@ static const struct irq_domain_ops meson_gpio_irq_domain_ops = {
 	.translate	= meson_gpio_irq_domain_translate,
 };
 
+/*
+ * The kernel that restores a hibernation image routes the channels in its
+ * own order; write back the image's setup.
+ */
+static int meson_gpio_irq_suspend(void *data)
+{
+	struct meson_gpio_irq_controller *ctl = data;
+	unsigned int i;
+
+	for (i = 0; i < ctl->nr_regs; i++)
+		ctl->saved_regs[i] = readl_relaxed(ctl->base + 4 * i);
+
+	return 0;
+}
+
+static void meson_gpio_irq_resume(void *data)
+{
+	struct meson_gpio_irq_controller *ctl = data;
+	unsigned int i;
+
+	for (i = 0; i < ctl->nr_regs; i++)
+		writel_relaxed(ctl->saved_regs[i], ctl->base + 4 * i);
+}
+
+static const struct syscore_ops meson_gpio_irq_syscore_ops = {
+	.suspend	= meson_gpio_irq_suspend,
+	.resume		= meson_gpio_irq_resume,
+};
+
 static int meson_gpio_irq_parse_dt(struct device_node *node, struct meson_gpio_irq_controller *ctl)
 {
 	const struct of_device_id *match;
@@ -664,6 +697,7 @@ static int meson_gpio_irq_probe(struct platform_device *pdev, struct device_node
 	struct device_node *node = pdev->dev.of_node;
 	struct irq_domain *domain, *parent_domain;
 	struct meson_gpio_irq_controller *ctl;
+	struct resource res;
 	int ret;
 
 	if (!parent) {
@@ -683,10 +717,21 @@ static int meson_gpio_irq_probe(struct platform_device *pdev, struct device_node
 
 	raw_spin_lock_init(&ctl->lock);
 
+	ret = of_address_to_resource(node, 0, &res);
+	if (ret)
+		goto free_ctl;
+
+	ctl->nr_regs = resource_size(&res) / 4;
+	ctl->saved_regs = kzalloc_objs(*ctl->saved_regs, ctl->nr_regs);
+	if (!ctl->saved_regs) {
+		ret = -ENOMEM;
+		goto free_ctl;
+	}
+
 	ctl->base = of_iomap(node, 0);
 	if (!ctl->base) {
 		ret = -ENOMEM;
-		goto free_ctl;
+		goto free_saved_regs;
 	}
 
 	ret = meson_gpio_irq_parse_dt(node, ctl);
@@ -704,6 +749,10 @@ static int meson_gpio_irq_probe(struct platform_device *pdev, struct device_node
 		goto free_channel_irqs;
 	}
 
+	ctl->syscore.ops = &meson_gpio_irq_syscore_ops;
+	ctl->syscore.data = ctl;
+	register_syscore(&ctl->syscore);
+
 	pr_info("%d to %d gpio interrupt mux initialized\n",
 		ctl->params->nr_hwirq, ctl->params->nr_channels);
 
@@ -711,6 +760,8 @@ static int meson_gpio_irq_probe(struct platform_device *pdev, struct device_node
 
 free_channel_irqs:
 	iounmap(ctl->base);
+free_saved_regs:
+	kfree(ctl->saved_regs);
 free_ctl:
 	kfree(ctl);
 

---
base-commit: aab02e49f0b54a0837e58c67651c4abdad1a3208
change-id: 20261120-meson-gpio-hibernate-561119fd6fc6

Best regards,
-- 
Igor Velkov <iav@iav.lv>


