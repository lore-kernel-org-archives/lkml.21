Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719115;
	b=2cdWsiQboMmWrsW6ho30AglYa9eFPyN+P0rQbn3DRLsjdmJ3ZhsVseJBo/YM3Jh9Di5M
	 NA1apRNpu8+ix/NP0QbltVfG6i2oWKgoInQSJ0SemkVRdbBTHrSPkUjzhWHysP4wgwmVF
	 IriTTAf+qvCV2imx4TY5nuK4n3UmM549Il4r7PSEHz9jkN46ptdybtFkT8wHiZwPhUB3J
	 bNQKa5KPiZJ9jENuNkQkr2eLH3MVBfwKexM35YRmuoTor7m3ocPIYlbgM6f5OD1NECzr2
	 PXNnR5dv3CTTMMXMDKRWSppcS19c9ndutOwomIko0T6pIn9r4Oo4qZXBl4/cbF+Uaiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k/bH4I6U0mY9o7t78YHEQqDOSqpSnGp+1NNP37/DkUA=;
	b=rQPbmlycrTCnI8cOW1WXlsVY/cWL+SttkR+uu+sKSPI9WJvS0/muwQjMgN1AwBdiYmLF
	 QL0Pws6GnpSA8w8XQCu5JqSPLv82l7PU8nNqZOucp5sX2oWXw2rHGvanKCi/psTDoADlg
	 7rbBJmdM4b9DczaT5pg8U6vZAvd5IEKKDyJHWnQkHyb2ArwfEJZDkjyJ1NfhxIMETsEjA
	 /HBewrmJVpShI0+zKEHPP3fWqPavd6Cr9rdcK1HlkZ+8uKtTjZ9BeKehV3Ugjn/P6aMEF
	 xjHOcdrNJvqXUBaJPnpLkJquL0u+bmS9c69UtfWOmk5D4VBzusKr6vmnBN5p9ERN1KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pOSPIt74;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03050606A332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03050606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pOSPIt74
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f03920c4a0so45855755ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719114; x=1796323914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/bH4I6U0mY9o7t78YHEQqDOSqpSnGp+1NNP37/DkUA=;
        b=pOSPIt74Y7ObE26tGCIPk1HTtT5bm6f1Mkyfd6c6vRByB7n+5mS9By3j+08WoOGBKx
         6NSzrzqLZnNmyFJ82Ogw20RLAH0k/RA8k1wgtOD4ACaPudoPWqXy0Z0tEHP8HMnIOSJQ
         joJKVk42GXlOfFO5ZDnZJufAP7tLAs20tNdrtnXji0vAK/PaSwPvYHWQAKJWlxahwwgv
         9yV31zLeri+DygMLce1wmbhcp0ImQG90wGl1Ts/0/ir8Io/71hbWci2NDUYcxXITWamg
         i66rUeXf6gpJJrO9iJYNnSsUVZtE+cnXoL3RMxPahlSFtLU9So+cMjbwEUFxQ5ohz++f
         qwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719114; x=1796323914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k/bH4I6U0mY9o7t78YHEQqDOSqpSnGp+1NNP37/DkUA=;
        b=srorTt6eKMCW5iZKTyOvgvfTRTo2ovpe71qEC55t7ce8hQAi02H09jY38SgY8epl5G
         556SqADkKApKw+DEJztzK2YanXr3wlleDyjoetMM6uuM5UphF0TNZrawKgaOXW7tDq9i
         36MIxy9EVZ1p4INPNHgHY2w+PKbcEebgOD9BowDM/IETCgD5oOz8vlG+LErA2srAIfxZ
         UDpZ/1Uky2Z9NhHCMVTtgiYxboFqjh1u1mhgyoLfkZ4XbO/1HF1x3nuultfkd4odFiw4
         8E2RcsnSaEEYRJ2bQpV61qztx5hB9E69kk++42p9YVqml2Twvh8sudBewBQN6xkORn6F
         5L+A==
X-Forwarded-Encrypted: i=1; AL+hErG36IDnAyGMFK8VcH5FTOLTeUZ/84Cph8bGAjJ54uHTTfvo72lBdc33FCgDi9CbQ+Eha2LcYDq+JgpMdFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2P40Z40W1ugnbm05nzQVqhRO/+zAGZ9jCH+UdiYh3bFCi392T
	sV4m/WO3zOfncJoLlMD5Iu9YZdb553eiJADJFsXQpdbg9OjA9ZYrz7kU
X-Gm-Gg: AZFdTZcbMnTPcjrJF6qiSMhB0dqlraS9CoHoipDdurP1bkYZTaJVzyLs36l2GrsYLQ2
	iuu6al2Zo0K7178Y/RPEoA7gkGJRwHP6mnBEtkSw6eRNfn57gxCH7PfzhNosEV3AcgQbshNeHwu
	qs1tGgvRYno3BTgWmjdzcxM+K3+otI+5iBO3KoEhGYgMmqkhZOWvjUmEU3n83l/w8af9GPtaIwx
	04+9NZweU8QvowPW2XJj+5UmMocBUe3lXbhJBRPQwA6TUxoZWPd7DvYxrainsw+HQtAkw4FT7XU
	xbsfSKe/fA4V1v1OFF8vmpjXBtVjEcunuXDNNJ54pH/Pg/9hs8PLBYT0BSNbI1uRUzmha18oo7N
	pg14Am2Ikjbou2bYWjq0XL/Y1HRmP9c8xlzLfhyH54zZ3TVyxSYTwQuJe0mDL+n6omgUqyaqf7Y
	bVkeljXod8zXl0YxVk3DSC/JN9bTo8tXPSIsq3YZsw6rAJUWTP04hc/qi6gCJb8KJmO9kERezzA
	XpRlEXAtPGYJQmk62ziOxNs+0q7ll8jczZ43uV0hmo9FSXPrrRR4FDpyQ3ZhhE1MXIXaExzzl8X
	LLrpf8FBGp7BmR4OJvJ4M/HH7FkHETYA1jzfbZ2f8kdlYD/CKR0zkTbBqHsjxSj6yeF3IX4Fwpp
	h860TB8sBYBmgIDTiKD0VxDJoUdqzfYu9YKVf2fR5ORVZ
X-Received: by 2002:a17:903:2c50:b0:2e9:9263:a6b with SMTP id d9443c01a7336-2f03f1b99cemr207242255ad.40.1795719114394;
        Thu, 26 Nov 2026 10:51:54 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:54 -0800 (PST)
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
Subject: [PATCH v2 6/7] m68k: virt: Switch to generic goldfish-pic driver
Date: Thu, 26 Nov 2026 18:51:19 +0000
Message-ID: <20261126185120.3815699-7-visitorckw@gmail.com>
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

The m68k virt platform implements a custom irq_chip and chained handler
in arch/m68k/virt/ints.c to handle its 6 goldfish PIC instances.

Replace this custom implementation with calls to goldfish_pic_init() to
use the generic goldfish-pic driver, and select CONFIG_GOLDFISH_PIC for
CONFIG_VIRT.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/m68k/Kconfig.machine |  1 +
 arch/m68k/virt/ints.c     | 89 ++++-----------------------------------
 2 files changed, 10 insertions(+), 80 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index cff990c319cb..7b15012ffb28 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -130,6 +130,7 @@ config VIRT
 	depends on MMU
 	select GENERIC_CLOCKEVENTS
 	select GOLDFISH
+	select GOLDFISH_PIC
 	select GOLDFISH_TIMER
 	select GOLDFISH_TTY
 	select M68040
diff --git a/arch/m68k/virt/ints.c b/arch/m68k/virt/ints.c
index 896aa6eb8bcc..54da6b1f5ce7 100644
--- a/arch/m68k/virt/ints.c
+++ b/arch/m68k/virt/ints.c
@@ -1,25 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/sched/debug.h>
-#include <linux/types.h>
 #include <linux/ioport.h>
+#include <linux/irqchip/irq-goldfish-pic.h>
 
-#include <asm/hwtest.h>
 #include <asm/irq.h>
 #include <asm/irq_regs.h>
 #include <asm/processor.h>
 #include <asm/virt.h>
 
-#define GFPIC_REG_IRQ_PENDING           0x04
-#define GFPIC_REG_IRQ_DISABLE_ALL       0x08
-#define GFPIC_REG_IRQ_DISABLE           0x0c
-#define GFPIC_REG_IRQ_ENABLE            0x10
-
 static struct resource picres[6];
 static const char *picname[6] = {
 	"goldfish_pic.0",
@@ -50,43 +39,6 @@ static const char *picname[6] = {
  * CPU IRQ #7 -> NMI
  */
 
-static u32 gfpic_read(int pic, int reg)
-{
-	void __iomem *base = (void __iomem *)(virt_bi_data.pic.mmio +
-					      pic * 0x1000);
-
-	return ioread32be(base + reg);
-}
-
-static void gfpic_write(u32 value, int pic, int reg)
-{
-	void __iomem *base = (void __iomem *)(virt_bi_data.pic.mmio +
-					      pic * 0x1000);
-
-	iowrite32be(value, base + reg);
-}
-
-#define GF_PIC(irq) ((irq - IRQ_USER) / 32)
-#define GF_IRQ(irq) ((irq - IRQ_USER) % 32)
-
-static void virt_irq_enable(struct irq_data *data)
-{
-	gfpic_write(BIT(GF_IRQ(data->irq)), GF_PIC(data->irq),
-		    GFPIC_REG_IRQ_ENABLE);
-}
-
-static void virt_irq_disable(struct irq_data *data)
-{
-	gfpic_write(BIT(GF_IRQ(data->irq)), GF_PIC(data->irq),
-		    GFPIC_REG_IRQ_DISABLE);
-}
-
-static unsigned int virt_irq_startup(struct irq_data *data)
-{
-	virt_irq_enable(data);
-	return 0;
-}
-
 static irqreturn_t virt_nmi_handler(int irq, void *dev_id)
 {
 	static int in_nmi;
@@ -102,40 +54,12 @@ static irqreturn_t virt_nmi_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irq_chip virt_irq_chip = {
-	.name		= "virt",
-	.irq_enable	= virt_irq_enable,
-	.irq_disable	= virt_irq_disable,
-	.irq_startup	= virt_irq_startup,
-	.irq_shutdown	= virt_irq_disable,
-};
-
-static void goldfish_pic_irq(struct irq_desc *desc)
-{
-	u32 irq_pending;
-	unsigned int irq_num;
-	unsigned int pic = desc->irq_data.irq - 1;
-
-	irq_pending = gfpic_read(pic, GFPIC_REG_IRQ_PENDING);
-	irq_num = IRQ_USER + pic * 32;
-
-	do {
-		if (irq_pending & 1)
-			generic_handle_irq(irq_num);
-		++irq_num;
-		irq_pending >>= 1;
-	} while (irq_pending);
-}
-
 void __init virt_init_IRQ(void)
 {
 	unsigned int i;
-
-	m68k_setup_irq_controller(&virt_irq_chip, handle_simple_irq, IRQ_USER,
-				  NUM_VIRT_SOURCES - IRQ_USER);
+	int ret;
 
 	for (i = 0; i < 6; i++) {
-
 		picres[i] = (struct resource)
 		    DEFINE_RES_MEM_NAMED(virt_bi_data.pic.mmio + i * 0x1000,
 					 0x1000, picname[i]);
@@ -144,8 +68,13 @@ void __init virt_init_IRQ(void)
 			return;
 		}
 
-		irq_set_chained_handler(virt_bi_data.pic.irq + i,
-					goldfish_pic_irq);
+		ret = goldfish_pic_init((void __iomem *)(virt_bi_data.pic.mmio + i * 0x1000),
+					virt_bi_data.pic.irq + i,
+					IRQ_USER + i * 32, NULL);
+		if (ret) {
+			pr_err("Failed to initialize %s\n", picname[i]);
+			return;
+		}
 	}
 
 	if (request_irq(IRQ_AUTO_7, virt_nmi_handler, 0, "NMI",
-- 
2.56.1.839.g22a8290db9-goog

