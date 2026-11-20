Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202049;
	b=ACHHcoW+iubVDebREfsDrsdzc9rZaPZtTAkIJuiVmRK4dESi6Y6xgEAU+GJnAAKP/d2w
	 8pB+48v6uBgNOXq1xEPnGCf/CUwHzQ4CYcqPx8nW5YfIFlDEF9HXtKaU0JY0LMUO2iVLP
	 16ZyZy6nMvSiwA5kZsF7GEbsMUb3P8O7eu938zbeXomYx076IpxsDyoDmYOHGq6ruLV07
	 hoeMVGKMF/xwlxZsZOC0UQ7m3qe2ckSQ/b7YKnUgTPWHz8u6biI3945a6byC/bJ0aEcYX
	 TtX3KwNtAE30ib67BGzjEgAQBgsoWf1dHBbZYyoKY2jm+9E39TdAtEJ46Im2qEwkDXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hff5tvGmP/RyFyMtruhnb2xhTD0GxWM6AkuaxxUQMjA=;
	b=iL2SCs5KTwj2G8MT2fdfsWXB9MYtN5pBheonUEAeCE/6waRcMpvw51+bqW+JUEpMOF9n
	 MbMqhQdRK+xOsgdMqz6DTpKtTggqgP+MCOEpNwuhwFSakdJfLHFr005iPbmJL/o3OeNG8
	 pgSQCNP1LLl96dOGgL27hk6Tjo95ZtUofB1Ie7aTRxHQiM4yR8GqLjmYr1nYDZMjiq4ti
	 VkH6MeO37kBGZ6lAMF4o3ln6RzNO50H9f2+i3W8bs/yODycLY04gXfyTGr1fjoJYaWXNq
	 +QT+ooTilIeoxuw7FjImDxTJyE1ZplEdMfNUhgNFPy84RYZshgx4o8AY6f80Zd1lvsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWkf5jVC;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B933760A2630
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B933760A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWkf5jVC
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-717080a2d50so1162722eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202045; x=1795806845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hff5tvGmP/RyFyMtruhnb2xhTD0GxWM6AkuaxxUQMjA=;
        b=rWkf5jVCB8LNCMh8N4AVYV5aWMG2fVD2EYCdQGGwTx6bHuW2pDeGm6d11kjsa1K8UI
         H5P52CHryu6ry3HvWHGLwRyVuPAE2sz590oz9ZBctoeosw/R7+3DumPTUc/11BhDLrRY
         on2wZDonBh30+zAUVHwAx0QJeO5Lq++chXZjsGCvc3kypauJti8RFW7bT/8rIHzboLL4
         ESWbD+d9jJNFTl709tRvWsEGtFZdICT+FvPB2kufXRBw3W1aFgzK5WNj+dJjPvMoas9a
         WfsgPJilomteRNE2D0SiQNhkTkrt90gE+ZjU/6NI/tk66dmRM0R06KOi8YgwVccvdCKP
         HmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202045; x=1795806845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hff5tvGmP/RyFyMtruhnb2xhTD0GxWM6AkuaxxUQMjA=;
        b=VH5sCjiXQmJQOk0yzcph6YGExnCFSMkVN1LbsulJWjKHMnQ1HSxJPxcb+LExM7sNFF
         NJzmLThHT6tlGtzIqCujL2o9PqwxulHqYbtigP8sBTOmbOA7aLXJ47p+5y7FFNWxVYzD
         0NA7L/2aavJTgqNIN0JYTEzZBiPWe6EzIEBKds5ZWC1jkctfqhKP/UvcgST28SBn7Kkt
         q6zumqQQm2e8UVZJ2RGGWvMi4FAGOH8t7EO5itgQMqgJovPCB4cZzZYSdtOybFawCtOu
         ky9rtrdilt7bu8v5lhB8rz/P0Asl0oOICSdVh3KWPi4/fIe3SMuymR8dga0J0c7j2MJz
         TC/w==
X-Forwarded-Encrypted: i=1; AL+hErHhM+yIpeKlA0uW103Ln0NtlFdhWPfGrSmxtOUlAEDA7vzjwFVUsJrjnrtsiGn0HKrdpbQwy8BKh0Ql3f8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ywnduHwTDUwZNXU357uchyLfRQSgPszB+N/pRX9JPYSm78TTD
	loJ22DlIqbElfvtbm8SgA3Yxc8zsTRyHkIuN2j+I8TmALnu9g9IwjhLsZ5cVcg==
X-Gm-Gg: AYBFou23pwtIfiNtQoXFo2bolWXsYVP8UjFr1QvLWQDc1qHNKl/mP8nbObb5KaZ61QX
	DrSJ4nOmT/dvvk1zvHo/SV2vTJzlxi3xnLVTsWJux/qrD2+VHtMXQY7qO8+TxP4sUZmahYI/mmg
	TglTMJyG0uGtv7RDjw3kSqNpjqvA+qoZhK3h5sJG24Z6C4XR68suwDz2r01bb7GeIhIaI3UYGeb
	nyzW9nl7k1QUmnO9erZyeQptaKw+0Vng+G1V22RU89COfiWumqk2g2Tt++pSy2vJWpubuitX5JT
	DrrQdrqy9dkMArIj5ZzmO9xk4Dq17PZ3LnclLE/a8mNQzxCvr+jgO/Y1y4Ddm07Mqwhr/QInE1c
	8KfXN9oDsT6Pg0A44btVkq7JE+6YoFN0WAJu0iDnLPoTGgoq/6WE9/fGgGbdndGLHUMU5R9j8TD
	XYbOUtJUw4R2tREu5ew9fnyTHwKzKmhexJmwN1KrIGBoK/ngHuULR4xmbTR0fcZ2/n5neSURlr1
	f2nPXwKTStJ+gmJYBesSSpvDiOBC4fQJ4FnKPbUGJO6ftk91AXmnXIFZekBR6sb1Q4l1UdgVUwV
	7tEKmSRelH+zMH5CXlGNuu3XPqKebAu2jwOCyIYd/5zQn7aIiW1izV7zRfinyvZOHecIuyIfNX4
	tUowseRFusFZ5Cc+pMnviKG72uRaYYzihIK3SU8m8JMinxDukEb8qLd0N2tRh9EPugUxN75scq3
	h3NmRJEYCRmK0EE4Ku5d/Wke003nAJkKdpMmMwEUGplulNVJdy4tgc
X-Received: by 2002:a05:6820:891c:10b0:70b:8148:94f with SMTP id 006d021491bc7-71b39588aaemr2283538eaf.76.1795202044585;
        Fri, 20 Nov 2026 11:14:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:55 -0700
Subject: [PATCH v9 5/9] dmaengine: dw-axi-dmac: preserve pending pause
 requests
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-5-48ab58961d6e@gmail.com>
References: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
In-Reply-To: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

dma_chan_pause() clears SUSPENDED even when polling times out. Hardware
can set that status after the last poll, and the unconditional clear then
discards an acknowledgment the caller never observed. Another channel's
interrupt can also consume the status because the shared IRQ handler
clears every channel's status before taking its lock.

Leave SUSPENDED to the pause and resume paths. The channel latches the
status for polling but does not enable its interrupt signal, so leaving
the bit set does not assert the IRQ. Track the suspend request separately
from its acknowledgment so a timeout can be followed by either a pause
retry or a resume. Wait for acknowledgment before clearing the hardware
request, since hardware ignores an earlier clear. If that wait also times
out, return -EAGAIN with the request still pending.

A completed transfer is also quiescent, but its completion handler may
still need to advance a cyclic descriptor. Defer that restart while a
pause is pending, and resume it without reprogramming the first LLI.
Track the active descriptor until its completion handler runs so that
resume and issue_pending cannot restart a completed cyclic segment or
reissue a completed noncyclic descriptor while its IRQ is pending.
Start queued work after the active descriptor is retired, respecting the
pause request.

Clear stale suspension status at the start of a new descriptor rather
than at each cyclic restart. Reset the software state after successful
termination and when allocating a channel for a new client.

Store the lock-protected pause flags as bitfields in existing padding.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 99 ++++++++++++++++++++++----
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  8 ++-
 2 files changed, 91 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 8c115d20728b..99b648d4ca76 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -482,6 +482,8 @@ static void axi_chan_block_xfer_start(struct axi_dma_chan *chan,
 	irq_mask |= DWAXIDMAC_IRQ_SUSPENDED;
 	axi_chan_irq_set(chan, irq_mask);
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->desc = first;
 	axi_chan_enable(chan);
 }
 
@@ -490,6 +492,9 @@ static void axi_chan_start_first_queued(struct axi_dma_chan *chan)
 	struct axi_dma_desc *desc;
 	struct virt_dma_desc *vd;
 
+	if (chan->desc || chan->pause_requested)
+		return;
+
 	vd = vchan_next_desc(&chan->vc);
 	if (!vd)
 		return;
@@ -544,6 +549,10 @@ static int dma_chan_alloc_chan_resources(struct dma_chan *dchan)
 		pm_runtime_put(chan->chip->dev);
 		return -ENOMEM;
 	}
+	chan->desc = NULL;
+	chan->pause_requested = false;
+	chan->is_paused = false;
+	chan->cyclic_restart = false;
 	dev_vdbg(dmaengine_chan_dev(dchan), "%s: allocating\n", axi_chan_name(chan));
 
 	return 0;
@@ -1088,6 +1097,8 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	vchan_cookie_complete(vd);
 
 	/* Try to restart the controller */
+	chan->desc = NULL;
+	chan->cyclic_restart = false;
 	axi_chan_start_first_queued(chan);
 
 out:
@@ -1135,11 +1146,18 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 			}
 		}
 
-		axi_chan_enable(chan);
+		if (chan->pause_requested) {
+			chan->is_paused = true;
+			chan->cyclic_restart = true;
+		} else {
+			axi_chan_enable(chan);
+		}
 	} else {
 		/* Remove the completed descriptor from issued list before completing */
 		list_del(&vd->node);
 		vchan_cookie_complete(vd);
+		chan->desc = NULL;
+		axi_chan_start_first_queued(chan);
 	}
 
 out:
@@ -1161,6 +1179,8 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
 		status = axi_chan_irq_read(chan);
+		/* Leave suspension status for the pause and resume paths. */
+		status &= ~DWAXIDMAC_IRQ_SUSPENDED;
 		axi_chan_irq_clear(chan, status);
 
 		dev_vdbg(chip->dev, "%s %u IRQ status: 0x%08x\n",
@@ -1200,6 +1220,12 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 			dw_axi_dma_set_byte_halfword(chan, false);
 
 		vchan_get_all_descriptors(&chan->vc, &head);
+
+		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+		chan->desc = NULL;
+		chan->pause_requested = false;
+		chan->is_paused = false;
+		chan->cyclic_restart = false;
 	}
 
 	if (ret) {
@@ -1215,16 +1241,49 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	return 0;
 }
 
+static bool axi_chan_is_suspended(struct axi_dma_chan *chan)
+{
+	if (axi_chan_is_hw_enable(chan))
+		return axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED;
+
+	/* A completed transfer cannot acknowledge a new suspend request. */
+	axi_chan_disable(chan);
+	return true;
+}
+
+/* A timed-out request can still be acknowledged. */
+static int axi_chan_wait_for_suspend(struct axi_dma_chan *chan)
+	__must_hold(&chan->vc.lock)
+{
+	bool suspended;
+	int ret;
+
+	if (chan->is_paused)
+		return 0;
+
+	ret = read_poll_timeout_atomic(axi_chan_is_suspended, suspended, suspended,
+				       2, 40, false, chan);
+	if (ret)
+		return -EAGAIN;
+
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->is_paused = true;
+	return 0;
+}
+
 static int dma_chan_pause(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
-	u32 status;
 	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
+	chan->pause_requested = true;
+	if (chan->is_paused || !axi_chan_is_hw_enable(chan))
+		goto wait;
+
 	if (chan->chip->dw->hdata->nr_channels >= DMAC_CHAN_16) {
 		val = axi_dma_ioread64(chan->chip, DMAC_CHSUSPREG);
 		if (chan->id >= DMAC_CHAN_16) {
@@ -1251,17 +1310,11 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	ret = read_poll_timeout_atomic(axi_chan_irq_read, status,
-				       status & DWAXIDMAC_IRQ_SUSPENDED,
-				       2, 40, false, chan);
-
-	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
-
-	chan->is_paused = true;
-
+wait:
+	ret = axi_chan_wait_for_suspend(chan);
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return ret ? -EAGAIN : 0;
+	return ret;
 }
 
 /* Called in chan locked context */
@@ -1295,6 +1348,8 @@ static inline void axi_chan_resume(struct axi_dma_chan *chan)
 		}
 	}
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->pause_requested = false;
 	chan->is_paused = false;
 }
 
@@ -1302,15 +1357,31 @@ static int dma_chan_resume(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
-	if (chan->is_paused)
-		axi_chan_resume(chan);
+	ret = 0;
+	if (!chan->pause_requested)
+		goto out;
+
+	/* Hardware ignores resume until the suspend request is acknowledged. */
+	ret = axi_chan_wait_for_suspend(chan);
+	if (ret)
+		goto out;
+
+	axi_chan_resume(chan);
+	if (chan->cyclic_restart) {
+		chan->cyclic_restart = false;
+		axi_chan_enable(chan);
+	} else {
+		axi_chan_start_first_queued(chan);
+	}
 
+out:
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return 0;
+	return ret;
 }
 
 static int axi_dma_suspend(struct axi_dma_chip *chip)
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index 3c86e5d468ea..b18c9880711a 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -42,6 +42,12 @@ struct axi_dma_chan {
 	void __iomem			*chan_regs;
 	u8				id;
 	u8				hw_handshake_num;
+
+	/* Protected by vc.lock. */
+	bool				pause_requested:1;
+	bool				is_paused:1;
+	bool				cyclic_restart:1;
+
 	atomic_t			descs_allocated;
 
 	struct dma_pool			*desc_pool;
@@ -50,8 +56,6 @@ struct axi_dma_chan {
 	struct axi_dma_desc		*desc;
 	struct dma_slave_config		config;
 	enum dma_transfer_direction	direction;
-	/* these other elements are all protected by vc.lock */
-	bool				is_paused;
 };
 
 struct dw_axi_dma {

-- 
2.53.0

