Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989809;
	b=Srii+pkbBHJY7iEGjZFJgmAXgHk/GhhR3mxpQA1jqau8dITHhfHx2jkOtzLL3yBY/fLU
	 oRIBqvaNShE60g3abifbPRjfyKkW4r8ZnGzR2Z+/RzKkRV9wOT9fVUhkdDKyR23xqGtAh
	 FndSc7v/4mtMCRT0P+SLRdQESGqnHEzUhXh0oxg6cQ3rPhNvv2MB8ICE/bn2mFYfmYyyY
	 PDda5EI1Pk+4B2RzJpmy+tBQsXQsvxkP8lJ2qbi1fZ1xcVDNfjAx2yHWlgueRjIRtaqUl
	 y/Yz6IRHMYTSDqrhZQnmG+SioWW+dq5vvbumEppQOYGaGM/x5lnq8rcTjMIOE+1O4gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n/X/ib+QXW0aM8E5khBCUAfePu160JSALCSJ/A5VZrw=;
	b=E89N8Z3SCwftDki9xWQwvt8brCmDEEopr75npA8KB5HKKi80qnuWawAprTgkVijiMXox
	 ADg/Pebf0vU+h5VtVeEYNtiJ7jalIrT9GFtDInTlgt2MIZKGeDuQWJpIKlfyycmw21Rvf
	 3iBYC6cPaSFggBF9sv/BSpvz3LHj3zOMV9W1SluaUh9goSUKCpFenP6SKZx5jq8PF+Ssk
	 QvhKh7Au2j+DZGLvqrjf3w1wWQJm7lGf8TQ66hMSAA13xQSa4kzleKSKyocBMMWcfWoj0
	 dAWXXmIiP9VFqP1Ht1lrZXPDZrd3H9DuJTklQ9WQv46fTku68sNQYIFgC+EFZYwATRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4BAYY8f;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE4F606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE4F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4BAYY8f
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so313240b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989809; x=1795594609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/X/ib+QXW0aM8E5khBCUAfePu160JSALCSJ/A5VZrw=;
        b=G4BAYY8fsWvX9Ui/fpCbTHUfOurLU1Q06k6rEX2qO6A2DZ0V6UIYYPHrHyvz7bDUg5
         qLr/z/t7guAAcYDqPqJ1+brNYYCvyiT0w6J/YR+hghUkTW/og8o9BsuTAPGpudTqGQVA
         AnbiSeeMtkCDizn0a60BRaIGuW57VS0ZXB/YOtnLFzqu83lHIWIcs3x41FFa35jf00DP
         LGbGhV/sF2E8mDQcOY3d4D8qETdTxph+BwVlN+bRhVgXhp5hgGrhFUllCKn8Ro1fWmC+
         Vvs3mdakDr2jQZJQ1X7sPv2Pda/D8CUU2ha9MeyA3sE5HD0WjtQpX+HOjIUnCunnH1+6
         TKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989809; x=1795594609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/X/ib+QXW0aM8E5khBCUAfePu160JSALCSJ/A5VZrw=;
        b=smbnZep1pKl1xN7qPC/2pxvuNuaHgGzUD2251HK4lfJO06DOUxkfE62xs3Jz18dg0V
         wI67ZRpeCpSSu5uCMYJv9gecXNLoXR89RLe53Dkchlw8GRWCzwddTOLCpuON7bnIr0nX
         GIbIqoFaq/TSMskFYj+i9C2dj2qBP17PdnAzWYco7f+eCNNzh4n4QmDLsTFU1yNCB2xg
         iKWLmjaWbHzMt4y9JnXPvTIPeoVWlYz6WWMo8LmF/XzHiai9ncG5S0z6XJNan7Vmvuob
         ekn7IlgXgjCe8jIy3qPK9xA7f2rKqemnCGvAiCCVWZD27ojEHj0xln1Xwqqo8BNdHuC2
         n7sw==
X-Gm-Message-State: APuU4Z9A54DhHxdLm28AhnOjkQxrnxCPqHrqW7bSXQIw8TzsJI2oQVvA
	jxJnuGszndQp7FK242s4YsmkGwfEBJjzq6H3GC2/axvX8TUis7f9pM+k
X-Gm-Gg: AYBFou0xmvTukQgkSyeQC/7fWxa0COXRBdyTck2GI5Knuc1hhoDlOGG4RQ4HVwon/nT
	uJsuYfcQgJQfXTPl9kBr/wTiEisyMKekfuJa+9HEW3+qB9YAQ1NBhtVplo4oHb9FN4MIZHRYxso
	IJNaCYdp6O3ymjdrXPOl9tIEEaUX3pkUUXwkQF22ecky4cRi6oXnW/G81cgmgrLewa4YLLem2bC
	AT4IOuH9EOgdTiWmi3/tCdyJBN7yeThu837PJ00IuUZx4P7QfCJuf1fI0c9lMIHGl4lIT3KM1ZZ
	UKfhvogNzgC1fEAoHHpA+NDrRRia6+If8MESstpDyXSMoPrWzQXcmIzT2FNY2yFrEdekywnlcu1
	TYtd1PQg2CUSFlJkOcZ23F5dhC1QpzHxFZJzqegJ/LtV6tecqW2rbbWgjjGr0O5IeLKsZhI9tgk
	3sz8SGb24Sp8/F+RKCHeIoAE6B4jXb2fLEOvch66oNSgsHp/0psrppFTS9lycntxJnM8F0xxGB8
	cPtZfrpXcHn4EEHNtglYs1cfhyVkjn/U1zQkW4Sk9ruXOExLToWYp/YDeSiODkKrLl67f6V38FA
	Y8wZ+1kIkRjNlZnPSg7x/bTOSCeUgv+KPJ9W5mHU9EpJ8EPIh3IyMflilXrZCpUD/IYzM/g=
X-Received: by 2002:a05:6a21:7a8b:b0:3de:4516:27c9 with SMTP id adf61e73a8af0-3fe988f72afmr1918544637.64.1794989808851;
        Wed, 18 Nov 2026 00:16:48 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:48 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH v10 05/13] mfd: nct6694: Drop the unused IRQ enable mask
Date: Wed, 18 Nov 2026 16:16:16 +0800
Message-Id: <20261118081625.2399247-6-a0282524688@gmail.com>
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

The .irq_enable and .irq_disable callbacks only update the irq_enable
bitmask under irq_lock, which is a spinlock_t. Nothing ever reads that
bitmask, so the callbacks do not mask anything. They also take irq_lock
while the IRQ core holds desc->lock, a raw spinlock. On PREEMPT_RT this
is an invalid wait context.

Remove both callbacks, along with irq_enable and irq_lock, and keep
IRQCHIP_SKIP_SET_WAKE. Without .irq_disable, the IRQ core falls back to
lazy disable, and handle_simple_irq() keeps a disabled interrupt pending
instead of calling its handler. The behaviour is therefore unchanged.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- New patch. Drop the .irq_enable/.irq_disable callbacks, which only
  update a bitmask that is never read and take a spinlock_t while the
  IRQ core holds the raw desc->lock (reported by Sashiko on v9 06/12
  and 09/12).

 drivers/mfd/nct6694.c       | 25 -------------------------
 include/linux/mfd/nct6694.h |  2 --
 2 files changed, 27 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 6b8b951f0166..27e9effd68a7 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -19,7 +19,6 @@
 #include <linux/mfd/nct6694.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/spinlock.h>
 #include <linux/usb.h>
 
 static const struct mfd_cell nct6694_devs[] = {
@@ -250,31 +249,9 @@ static void usb_int_callback(struct urb *urb)
 		dev_warn(nct6694->dev, "Failed to resubmit urb, status %pe",  ERR_PTR(ret));
 }
 
-static void nct6694_irq_enable(struct irq_data *data)
-{
-	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
-	irq_hw_number_t hwirq = irqd_to_hwirq(data);
-
-	guard(spinlock_irqsave)(&nct6694->irq_lock);
-
-	nct6694->irq_enable |= BIT(hwirq);
-}
-
-static void nct6694_irq_disable(struct irq_data *data)
-{
-	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
-	irq_hw_number_t hwirq = irqd_to_hwirq(data);
-
-	guard(spinlock_irqsave)(&nct6694->irq_lock);
-
-	nct6694->irq_enable &= ~BIT(hwirq);
-}
-
 static const struct irq_chip nct6694_irq_chip = {
 	.name = "nct6694-irq",
 	.flags = IRQCHIP_SKIP_SET_WAKE,
-	.irq_enable = nct6694_irq_enable,
-	.irq_disable = nct6694_irq_disable,
 };
 
 static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
@@ -356,8 +333,6 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	ida_init(&nct6694->canfd_ida);
 	ida_init(&nct6694->wdt_ida);
 
-	spin_lock_init(&nct6694->irq_lock);
-
 	ret = devm_mutex_init(dev, &nct6694->access_lock);
 	if (ret)
 		goto err_ida;
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 69e4652cf16c..2022b8fcc096 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -91,13 +91,11 @@ struct nct6694 {
 	struct ida wdt_ida;
 	struct irq_domain *domain;
 	struct mutex access_lock;
-	spinlock_t irq_lock;
 	struct urb *int_in_urb;
 	struct usb_device *udev;
 	union nct6694_usb_msg *usb_msg;
 	void *data_buf;
 	__le32 *int_buffer;
-	unsigned int irq_enable;
 };
 
 int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
-- 
2.34.1

