Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719097;
	b=lr7G2Ux3JjHXEBva7HUyRyZfc+wtLlEp32a99TCQ1XC1uK/o+fQG3gkVFzkAU5EOq1Yw
	 BgtfaKOqhLH8Z9bbNohgGCvQxq6G4/2ATTjXH4aN/2u/n0oszuosaLXIsNRygpOfrTw5K
	 VNrCTAN4vVFpL0Ojp3lw2F+/5gV9Sjlo64qN4oij/bcYQ5D+zLreu3FDU/to4jWcc1DVs
	 pRkXZxhFKINLtVcF9Httv/dEY8NYwKGICobQqpKrbbRuxJbvouEeetD7Ypt2MMDVBP27J
	 iwf9tjIKxIgcvSC8HYxnx2le5uAkyfnFtAGMFlrDzWaUDG5GQdXGIxcDMc2UaTrHA2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jl8AqubnS4n1475UbhVTokDsZdN8S7Jb0HrKLZ730Vw=;
	b=Sfr26h2ea4DTmT7CCh9VGDegPJyQxs7wGvgcq1BlxK/h9i81JJxFkwLZCj3CVSvnBxYJ
	 bGEqk8pk2qlHHQEhMB1PKMfsfY494GPycyDLQzqmHcX1YANepztKbAESR9Kt6RhMHqF3L
	 HmR811511SWAXaaRR7evpz+Du/HYYnH1kEl2+7sc+9MBVzHjKTzi4RKiOxkJRnpRTyyj+
	 1mIBfEoK/qEh7DWCaXWOhNSSfZDY6xU1M23pFu10mRfzFRmmbMaHrs7QML+LzTIcfJdQQ
	 UMxCb9KPkRGLHS2n8eKuwE8B92TmKrM4+3H0Hzf5RpZq7EokM42CGXi27MwJwGwywTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IUUPNBk6;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B66606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B66606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IUUPNBk6
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f04244c3d0so58152575ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719096; x=1796323896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jl8AqubnS4n1475UbhVTokDsZdN8S7Jb0HrKLZ730Vw=;
        b=IUUPNBk6lEckemYjSEqZYYkQUs+Ao3qICOGFNQwxYGcL6xMqirUyLuhDy2GPJKhDhP
         DQrbdV89akm669sfKRZE/zbvsueusaLOZaWCctKKvu3BOLIBcWtwD0Njsew59HE5zV8U
         rXirdx1S/j36zovS4KxkEpqzeg4nsp9IycF2HTSF7R7Ll3cmm6TRW+sOpd81TGmdRj9q
         WyFinXDc/JpWgQsazY1idS4CpQSbLaTDVr2ahLj+9bWuJGMvyHaVSr7Qv4zN1KrS2URO
         GbiE+V3T0BnmNYOL5EWoczmoNZSK2gTz2OX3w5cpVNWdCk7DGRyNBLGJ7MceuSUbnA/u
         /8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719096; x=1796323896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jl8AqubnS4n1475UbhVTokDsZdN8S7Jb0HrKLZ730Vw=;
        b=bPL8kADKnZog3BE9N0CQYW2fzx/xMUvvJpCxDSCV2JAfOG5p4CzCoX5zeGH/PBP7PD
         DtqJnHuCtP6auTSJsJEzorC3j7GaBH5BEQbGl1ewtE6UOhJoGhZyYMrPWrz3i//1n6aV
         vhYTTXT/maLqrPKqQC0bmSa1WFLEkoLChqAMBmlgywObn9HjI+BC9Ju/gmBCdSMC4saQ
         ivk/UA16nysjMIwgh6we+8aNfTpsd8th5yhTMjo1p3d6dGjBQGsRwg8l5Ednaq+l4njG
         dNI9NVR0WgfX7B/B5sWqcBbylVkmZOi1HsVGOckMSny9Wr4eooM+EKxA6g2GKR+H2TGq
         O7Vw==
X-Forwarded-Encrypted: i=1; AL+hErEHQIGReQq8eN8M2Nsp9dHri+8LNpygmJzjlK59AvfwQTmqRZy9CyQdlvDTo6IyQ03Xp2t7oTN6Q6NdchM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xLaoWQKFjFgQ2f4v3aKQEQm0ZpYNkPo9K91aaFFssWxBfshY0
	ZVvoF4C7k5BfANv/neIH/oSbYecRCbcMJIl5qYlfyvcQkYamHxBXpXi3
X-Gm-Gg: AZFdTZfa0EQSctBBO/ZGb/g82di34Z9l/HlxgLsos60Wbjpgd5nxCLx5ZXHpAlMvd0q
	y3cGY0ZyugcSojQGcLBhVtzKv2F9CJtkYIlZoL3GwNpKeP+TeIqSOXkDSq5ic5+h4LKz1ZWwsua
	GU8d6ytoJErQFaSP9Bh9oct+01xervPu/J8IykouK0xSjy+hZb8gp9BuuCsIkSrroqy4ixa4eIA
	t962NuzStWiUbmy8tCq0L/Js4pBDImXiLIRVM0bg9Nn1sxl/BPFOuLJuwu22p79TcUrVrqom6Ig
	o8xNpexOHWYTQaHuaJhTdWyEGJ4NQ2c3w8UIzq9JunCT0abYKLMZNjiudzcnkrcdB349yUcv/IU
	LFlJtCqef1BfxL40gw8SH08luTSP2HPQydnFWJ0rKBcuZ6cHUu893MDfGpXJuJCyKOjVz/maYVL
	NUGrxwdAyRJirv56SF/H8qBlJRLdCO0WnC7iYLobpDGfhKFj7lZelp1vrJcPVRGxrsAz7DZ5o61
	EFG4v9mMnZmmZWEWi6dg+x915egfAVIm9WpAIOV8ojPg3DrqaJInQrY8pQYtk8rTcQzjnS9I2BO
	Ajj3885pBbZqwBZcfgZGY8BQQbtjM1Wg4xvot8woaCQ/7iivGEm0ZorSnV+BjPjvAFZHvdPxseg
	KtpECefohiOLKM1g91R4pY20=
X-Received: by 2002:a17:903:b0e:b0:2ed:205e:eabc with SMTP id d9443c01a7336-2f03f142f86mr228464035ad.32.1795719096152;
        Thu, 26 Nov 2026 10:51:36 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:35 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 1/7] irqchip/goldfish-pic: Use gf_ioread32/gf_iowrite32 for MMIO access
Date: Thu, 26 Nov 2026 18:51:14 +0000
Message-ID: <20261126185120.3815699-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126185120.3815699-1-visitorckw@gmail.com>
References: <20261126185120.3815699-1-visitorckw@gmail.com>
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

The goldfish PIC driver uses readl() and writel() directly for register
accesses. On big endian architectures, goldfish devices require big
endian MMIO accessors [1].

Switch to gf_ioread32() and gf_iowrite32() to make MMIO accesses endian
safe.

Link: https://gitlab.com/qemu-project/qemu/-/blob/stable-11.1/hw/intc/goldfish_pic.c#L130 [1]
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/irqchip/irq-goldfish-pic.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index d458cf898f8e..c3c33f066140 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/goldfish.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
@@ -38,7 +39,7 @@ static void goldfish_pic_cascade(struct irq_desc *desc)
 
 	chained_irq_enter(host_chip, desc);
 
-	pending = readl(gfpic->base + GFPIC_REG_IRQ_PENDING);
+	pending = gf_ioread32(gfpic->base + GFPIC_REG_IRQ_PENDING);
 	while (pending) {
 		hwirq = __fls(pending);
 		generic_handle_domain_irq(gfpic->irq_domain, hwirq);
@@ -52,6 +53,16 @@ static const struct irq_domain_ops goldfish_irq_domain_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+static u32 gfpic_read(void __iomem *addr)
+{
+	return gf_ioread32(addr);
+}
+
+static void gfpic_write(u32 val, void __iomem *addr)
+{
+	gf_iowrite32(val, addr);
+}
+
 static int __init goldfish_pic_of_init(struct device_node *of_node,
 				       struct device_node *parent)
 {
@@ -82,7 +93,7 @@ static int __init goldfish_pic_of_init(struct device_node *of_node,
 	}
 
 	/* Mask interrupts. */
-	writel(1, gfpic->base + GFPIC_REG_IRQ_DISABLE_ALL);
+	gf_iowrite32(1, gfpic->base + GFPIC_REG_IRQ_DISABLE_ALL);
 
 	gc = irq_alloc_generic_chip("GFPIC", 1, GFPIC_IRQ_BASE, gfpic->base,
 				    handle_level_irq);
@@ -92,6 +103,9 @@ static int __init goldfish_pic_of_init(struct device_node *of_node,
 		goto out_iounmap;
 	}
 
+	gc->reg_readl = gfpic_read;
+	gc->reg_writel = gfpic_write;
+
 	ct = gc->chip_types;
 	ct->regs.enable = GFPIC_REG_IRQ_ENABLE;
 	ct->regs.disable = GFPIC_REG_IRQ_DISABLE;
-- 
2.56.1.839.g22a8290db9-goog

