Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104114;
	b=A+A4cx7L3zeW/f3QyOnxTDsPN7fjvkzJ4Rg4+nwFbZZl++es7X3Sq1IcMWLhOOXYGKfR
	 2ge7ZIKoGF3/5aJrhJdny/jA1t/wDusNSWpaMw481Gre0b2htc763EgO52uRyvhi7qmy+
	 nU6Zc2V2A6Jk8Mp9ym13D7vzlaYXaIEG9VXzXQzEIqm8U3bJhmXyJe2PigGFUY6qFbVVF
	 tHCc3uVYQFyOqgi5SgY1KmlA09Kw1yt0GTpEo/Tme05j8jhqelKED7q0QIIE4t/3PcyPJ
	 Cgo2G+jFujGKbZ0w701Hu3iorTmMkyVc26WQHqA5XJm3dzXFgnZl5Q0yh0benwJ4UhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ELPVGKyJPN38ost3dJadROBrjbhctV0voUbr4/8P8tY=;
	b=YerTLc2Tv7vOIwyEOzmF91uzM9qLnAb2wkROGDdf4K3QA/JTMjldXfPD53EOc3+baQ8f
	 LV++OKyEZO3BIKD8pFlgqPMrAh3In1G8tXCxGvdtip9NJEYbHuT2uOpJhgEMmuQ73kpGQ
	 OUDJQ+K/WKl9u3u8VSjMdCnZktJp7+JyHfWrs0Kz0MdmXeHUmhyyEWTTeb5cg2jsq38+/
	 as3NY48Q8QYhXY5CfFzGphuW7bbY4t64968opNlotfp/sAE6OiG37MScN+D0MJlGISd9S
	 5UzM/kXTSWA8+8xkZwOPWyYNpT2YfrAJkfCktV5OiXnQZu417nzZkwgNx6cO8RLnkjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xsyHnKod;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502DD60A263A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 502DD60A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xsyHnKod
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0d126f631so22751227b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104113; x=1795708913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELPVGKyJPN38ost3dJadROBrjbhctV0voUbr4/8P8tY=;
        b=xsyHnKodkL1XBh5fRrq6hxBMmmzsBSrGtOkHT6OkZ9QXMFx47YLNZc6YWphfVjWXfZ
         q72sCG3RNnPwoUvjkztP9V4BGUymiWgNyChvKSW5Jdu3Cyp5XbbqHOy3RGboDsV1Fx4B
         cDTrWbfVK2ATpwpWR880HgF6tB8qwaKM5o3F+rpyDOfBKTA6TUp8TEXXAA93rlryLw8s
         XyuwiVJRSwEEls8DxvabLjsQKTNkFacXFD6bPQIo++EExZp+eJPab13zoRWvVj8oZcbm
         XCaM/q1NwQHn/hV6Gf90Vdto9fX3Akcl1YV/GXV+JR32EaSfPUA92jFI0MGvArVVvbDt
         0rKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104113; x=1795708913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ELPVGKyJPN38ost3dJadROBrjbhctV0voUbr4/8P8tY=;
        b=cg+VpJ2u4zPKHVSf2RWbJqC5IUKuKPWgP+LiKnGmJX3xiktHCI1IU/UmvccJXyuZIN
         oiw5XtDVC5+4qVe/uDpcZEABp0vrqvjvSsmkQ5PpdRtAUfpw8wCxqXkcMbZO4wuhFIya
         PbA1O5StzuL38+ZjO1HKizIGhm/8dYcl3isZ7wq68cdQl9y0qNLRv1JQWMHhnLrhl4x8
         8pQRRnSE8MEkRKlF6B5G6ERowX3CqAlDnf1vaYZTnEYrdUryjuBfzKb337cDcYihDyR8
         kSiCc8Pr1Q44HA+7JDodmSeOntqIwf/LJy/me+Tf9dp0EwsT8xDIOstIsoSgpF9k9MFm
         FzNQ==
X-Forwarded-Encrypted: i=1; AL+hErEQPrFLD31CiOfz9uV73EyWbvjsmnQXudWmDWQ5M979nKRxGrFEu32XF3I2tGoGdW7t8m0SHnqBeqGyvug=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n/5iqUoLIJz+aESo9YxfHbasIRqLl3SnGbQH+nuFeFk01VYTt
	GoOwPeAh7jAWdJfsO01C+ufv7j1ixJ3ED9jupPOSP9kRv0zD4U/CTO7R
X-Gm-Gg: AZFdTZcCv+4sZRAx3EAwr1HyB5RRim40nkZPmezqZ4Ke1RltUQCv5RvYVOKlxET9N/w
	eiTMvF0Zu6Si49c+xKDzFpLAWK+W+f8qG3HzxrCLdw3/sbre+V98O2kp8xON7Ov2LhlNNeFVPis
	GaUFtXx2zrPnmCCd6vGROvTJLpqMGKqg3av9ZgeCVh0uLM0+cefrJmY7b+0J27AO1iquYrB+hHb
	eFFWRQshpgCN9M2JvCACH7gzS+Z0D4iB28ElqXQtsm7fiy2RGSOWr29dS+PSrOdiazP6qIageAX
	6RxApBOgPyfsykGVjdjYIkYvBT3GF+95KIrFNDY5fOjEqDxIM/IOVofe14FCjcZsCZynwWIhjYh
	f9eNMBCPaxKWsWpe2UqvDSZmcp4kD13O+Wk3+zpz4WxONh4D7Rh/aGc5SxiH7XmQCGeH9ms2SgS
	5Q+cfKa25O6Yb/xDjYndzEMS81hpSFj7LjU7EcQxUIfQxhWZB534Jrs9OfLnxfmd4OL/V4fBNsL
	Qj6nMMBHX+53JH//YMZ9eQ+QSmpies11O3tFuUDPfHCXoN9nqKxZw6x9vpNSBQG3em4PhHSQvtG
	cf9g1BDDArKts4NYtGaIiqJEa3v8vS98XmnbUDwCQaiCysHXj8GkLzJD3ZiHQHDrgzpNa/4jrjD
	54/Ee9wvgYhvr9xrJZUOR1IQ0+/BRv4bMNnE+OetVYRq5ugBj/GQwHEZD7gOJW0O5yEd5cWC6OJ
	zXnDx/RRwixfZaqUcK1TuoI+QPXOgP3QKyvZdT+lWJfA4rk6oMRLo=
X-Received: by 2002:a05:690c:6381:b0:8ad:bc2e:aad1 with SMTP id 00721157ae682-8b52042e7b9mr753327b3.17.1795104113164;
        Thu, 19 Nov 2026 08:01:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:01:00 -0700
Subject: [PATCH v8 5/9] dmaengine: dw-axi-dmac: preserve pending pause
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
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-5-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
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

Leave SUSPENDED to the pause and resume paths. Track the suspend request
separately from its acknowledgment so a timeout can be followed by either
a pause retry or a resume. Wait for acknowledgment before clearing the
hardware request, since hardware ignores an earlier clear. If that wait
also times out, return -EAGAIN with the request still pending.

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

