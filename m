Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960476;
	b=5dmrS/EJubQU4yacgv4V2X6tWTYwL5Inzv9aIfjyA632SMuvx6cvOXw3DAYNK9JU8Ney
	 CJioZ1Ygf2YT24kXt/FM9TMYK/s15C+QuQ5Vsf+xolSsz6JRiIqikJMi0twKHKl4B2GT5
	 8fX/NG7LC7lj9fKjRMc1pmCrlAbW+6XWIBzix651Lr96jeJstJ+st9Y89Q3V/+70/7YGd
	 rXeFllN9m78Hl3zAb0Gm3qE0txsJtOgFBLKK2y8MenhDBMv8OhkEoQxJkaMJU8n5hUqfI
	 X/w1rXwMey2mUgiPkn8JPl/zDmkCMuZpcN1kpnYLVcw89HWAH04+y5jaIrT4WDFJy7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
	b=vHtdkuKTwmJ/gG33mzn+ytsttpr0ny9Qg70wI4E1Q4347xqvIra2L4yIrdNAuZvxU4TR
	 jGN4U12wFedF0VHun9kxszpgikLTuB60dAqo4dUiwwCUBEQ54P8ULy0bdMVfMNGYJALnU
	 x/NsgwdKGsro0iM1uciqBpkIwH5vTe6YSLHnHx5cV+CjGdh68BzaMjlEzGKBH/T4au5C6
	 VfyMOsMWovt/MbOSf1T90AwHYAsrut/m1TOsj5TKl3k1WAYQZs6lDtElFHdW8r7Aayk81
	 nySdycIiOkYEXr80TYuSgJ9ru6BtA5hW1q0lrlQ/GXQ9H4p4QWYQU0gGXvR4RG35fQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zOt8eDQ9;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAC2606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EAC2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zOt8eDQ9
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4877837890fso203150fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960475; x=1795565275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
        b=zOt8eDQ9hpHAcp8EP8ZMgHNhc/ZlvAAtQuaDsUqUgahBUU/h4UMThDO7N2KXkCTAi7
         XqAGGCeBFvifMwAG2FhIkzOc+muP+dnJKLkDV1a9a3bWSWim1SxWh1mr6IcktIJnbfxo
         M01Qv7TZoMcxC5jZLhSbKQ5Dp0DmTFZ2exVoql4FNYsmEPloWiKuOJhfIAagxa4wL7eZ
         ge4opepllw6wDrFayKiLCeUO/eOfdECJKAOEg7quAAuSxaFOhIG+FEHf5Sc58bvRfcxM
         Xf0tU0DSfCf8jbWH40QxpWRumTM/EI/lTyvXE+u+6fZrT3D9VngcYHNVCMeY0uONlrhd
         XDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960475; x=1795565275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
        b=VcK9ol9y1dl59TLjgqoYJdglH0Nz0fQX1wkqSSxjRfP5JbDA+LqGQnEdQASy4TdN+L
         ak4Hj6Y4Z3zIdGb701uqDXlv1Sdc+uohVRM+tOEHFg5eJS+6jA+Tv/sRb+l3F4zXQcUN
         7/Zy4G9H367awdIVI6e2/oVkXHXKSjfmMoxsXCTluGhYobJ4QdKErDQHSnj6cSmWGe45
         77amagZ9+7LJWnydquQe1T6CDopA5iWtGUVqYVU27Kbo5KDPymweywbEIIyNn6Ak+LKR
         8fmcOl/tDOhjFvj2js/bp/YnpnVVYoYqML7m6viybY+owR7CzSfavT7gGJflNPh5SxfP
         megw==
X-Forwarded-Encrypted: i=1; AL+hErFc0Z/a6Ytn1s7DCQMMkjOyv3P0dZlX8/tZYuG85ayXX0A4pWWLLNMyUR8soXsyKAwFC52fuhws8mp4Ge4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ycgjf1VVi86YyLUxNioo0ghsINOKIGH+YJM8LAjWL0XEwOoPx
	D+hESm39LVPeKTLdF+bFkKO6o6QR4phKYrd0Wg+aBtTHwzhvzlsdgN3/3lFfeVGUNSE=
X-Gm-Gg: AYBFou3/gXQUMIYqQUGC5pAZCFaT4G+AYo4Nwoc3rttGYPKemc7nxZAflFZrG/EJ6uB
	j2+cAgxdyr6Ag5+qjAFmspXyI4f00+fS4zVPGsaOdG9dRdE9KI8tnBXyl2Z+mJZEukRB4smF37v
	jgJ45YJItLvtFUeZ08lfnucYsda3JdyqizDatJeEHRwNjyXukJyHsEuNU618AtO7aOIYKUjpdhD
	CBOYwrmENP1mBhdz0TxqfNXtCjVh8up93kdZ4g2xN3FmZ3uvEm+rmJWMREZHhMJrF3IazRXrJu5
	NXTNJ9+H8wtIuP78zMRLQ0FcNbfRTTER4uJg0aoUvLDL/avblagSpuQcJzOGh1DUj8Q4t9rkwGD
	vqzyXwxGvzPmidUF5BiElNQO+FDz4csPubIASAx25gDR8C1RLa4rJMrJTr/KM4bRCTNjEBYw2tl
	kj2xrZ5/lDwjtcsVtT38qblyW0SonQTodZ/wPjhOJxeLqdVJfABYZzjRirdlAXbYylhpIsh+7Rn
	gxWscsKgTPd4BMP8Zg1VWzS+Xc87CZDe8qn+KlV11S3RSMHDI1ctOQLl1jPUlLG5vfLnqWrUQ/4
	lUlP1Nrt6Eh1nLk2Ua78yxIRljFvQAiW4PEaflVo4DW7gj28OhuoXN6uphByG85L4q4+qUHbv6E
	qzxVrtc1F8ztfkEzM8GIL0PV+5j6ibN1UKB8yEwJ25UkshQAMGLkIYI90mvAAEEiFvfNi6RRmV2
	fTfd+BJdFzgJ2HF6EM2gxADauAPB7X8E08xkyyFXNl1i0vq1R7YYk=
X-Received: by 2002:a05:6808:14c1:b0:571:3ee4:9a63 with SMTP id 5614622812f47-5773d82f896mr1508695b6e.52.1794960475100;
        Tue, 17 Nov 2026 16:07:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777b393d40sm434954b6e.17.2026.11.17.16.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:07:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 17:07:40 -0700
Subject: [PATCH v7 1/8] dmaengine: dw-axi-dmac: keep cyclic mode in the
 descriptor
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
Message-Id: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-1-d5f2309afd72@gmail.com>
References: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
In-Reply-To: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

dw_axi_dma_chan_prep_cyclic() sets chan->cyclic before allocating all the
hardware descriptors and leaves it set when preparation fails. The flag
also survives cyclic transfer errors and channel resource release. A
subsequent noncyclic transfer then takes the cyclic completion path,
leaving its cookie incomplete and its descriptor on the issued list.
Its zero period_len can also cause a division by zero.

Resetting the flag on failure or channel allocation is not sufficient:
preparing cyclic work while an ordinary transfer is active changes how
that transfer's completion interrupt is handled.

Store the mode in each descriptor and use the completed descriptor's
mode in the interrupt handler. Cyclic preparation sets only its own
descriptor's flag, while the zero-initialized noncyclic descriptors keep
it clear. Error recovery and channel reuse then use the next descriptor's
mode without relying on channel-wide cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Closes: https://lore.kernel.org/r/sashiko-outbox-208213@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 35 ++++++++++++--------------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  2 +-
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 7520c78f55cc..6dae63024721 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -801,7 +801,7 @@ dw_axi_dma_chan_prep_cyclic(struct dma_chan *dchan, dma_addr_t dma_addr,
 
 	chan->direction = direction;
 	desc->chan = chan;
-	chan->cyclic = true;
+	desc->cyclic = true;
 	desc->length = 0;
 	desc->period_len = period_len;
 
@@ -1117,25 +1117,23 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 		goto out;
 	}
 
-	if (chan->cyclic) {
-		desc = vd_to_axi_desc(vd);
-		if (desc) {
-			llp = lo_hi_readq(chan->chan_regs + CH_LLP);
-			for (i = 0; i < count; i++) {
-				hw_desc = &desc->hw_desc[i];
-				if (hw_desc->llp == llp) {
-					axi_chan_irq_clear(chan, hw_desc->lli->status_lo);
-					hw_desc->lli->ctl_hi |= cpu_to_le32(CH_CTL_H_LLI_VALID);
-					desc->completed_blocks = i;
-
-					if (((hw_desc->len * (i + 1)) % desc->period_len) == 0)
-						vchan_cyclic_callback(vd);
-					break;
-				}
+	desc = vd_to_axi_desc(vd);
+	if (desc->cyclic) {
+		llp = lo_hi_readq(chan->chan_regs + CH_LLP);
+		for (i = 0; i < count; i++) {
+			hw_desc = &desc->hw_desc[i];
+			if (hw_desc->llp == llp) {
+				axi_chan_irq_clear(chan, hw_desc->lli->status_lo);
+				hw_desc->lli->ctl_hi |= cpu_to_le32(CH_CTL_H_LLI_VALID);
+				desc->completed_blocks = i;
+
+				if (((hw_desc->len * (i + 1)) % desc->period_len) == 0)
+					vchan_cyclic_callback(vd);
+				break;
 			}
-
-			axi_chan_enable(chan);
 		}
+
+		axi_chan_enable(chan);
 	} else {
 		/* Remove the completed descriptor from issued list before completing */
 		list_del(&vd->node);
@@ -1204,7 +1202,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_get_all_descriptors(&chan->vc, &head);
 
-	chan->cyclic = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&chan->vc, &head);
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index d8dd07efe60f..3c86e5d468ea 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -50,7 +50,6 @@ struct axi_dma_chan {
 	struct axi_dma_desc		*desc;
 	struct dma_slave_config		config;
 	enum dma_transfer_direction	direction;
-	bool				cyclic;
 	/* these other elements are all protected by vc.lock */
 	bool				is_paused;
 };
@@ -105,6 +104,7 @@ struct axi_dma_desc {
 	u32				length;
 	u32				period_len;
 	u32				nr_hw_descs;
+	bool				cyclic;
 };
 
 struct axi_dma_chan_config {

-- 
2.53.0

