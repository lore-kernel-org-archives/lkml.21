Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202043;
	b=HBs/Z4XxP43xNE3DDYeClACTd5LOt5vQF4uAcTZ/xjX5y9pSirbQkWz3ng0U8n88OLPl
	 KrxjKLLOnJY2JxaynhD1UJE0ZpVzOwRP34FHgJyzlDA3j9O0K+O8HBDbOyWeQOrjQ0DxA
	 MEbeZ5t2tNhSHaqXM3+fcCVEmzVASEWcTKWrpeSdZuy5UDo8mI6d04kDn+Rlt++iWGkIB
	 6g3NRJbqCtxlxPr/3mVGj6BzQLHcAYZk74buHk/iZpt7Kg+ZEcX4zaOzAEVjQgJLCphgQ
	 itvaeLG75w2bm0G0lQbk7aCqAtm7vaSb7FHRiYVM9Ixbx+OWQsP8txVjL0AvxSym5rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YjkX+SIhmCFu9w6Er5NTY8ZxVe8WqPbD/o8Zqp+diPw=;
	b=tSfxBhLCTM4XfdmvbWdnp6C9m57whMhqUBKmUTwWSZ8fqE5QVpPBTEu3Gq3kv3+TePWk
	 C7p7ZiKrINUYihnFa2bbZ/Ptdj7MGLbhsqIy5ae6KT7ShyGtbTL2DG9tyvrrN2+Kdm5WW
	 oQSOV6Oe5ickRUxGs3VTvQzqiSnDTPIXhBhQN+qeavLN+UsxWcbmR6OVeRAJrANB01WBZ
	 kk5OXMZw6Brh6LP+kxoeSBZxR/BMJoXWbg65VZ9Y/dp2fM+jF0v2Il84vkcCqiIvcTfPQ
	 NW0MVK3tBOtkkJa64/J2tuWCPoLE52rCvZn8XTf4+P7Si1hj4P1o1SP7ziNWQPNlNDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PgJRtcQR;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA3160A2611
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FA3160A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PgJRtcQR
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-862d919fb1cso749796a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202041; x=1795806841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YjkX+SIhmCFu9w6Er5NTY8ZxVe8WqPbD/o8Zqp+diPw=;
        b=PgJRtcQRkArNOOYJpsfqboxt48e5N/IDxRgf74ME4tSG/G2dNoNtOyV3dsWiOgxXgl
         PUSQlqPWYRdXCcQXJz8EUsX9RtaaOqoEBudK3L09fA0FOgQ0Nh4WdZGpaxzD1dpmddug
         wOn1QWh6l9e46fX+V0uIvBN8ApzRUV3fh6UbAmIJNYi2gca24lBu+hLmTaTBXYwebrNs
         ud8D7HO7SHDQ7f6kpkkADqjeFeVFijW+ZlZWvTOr2LH3BE2SlasKPsysTAp+axajtm0c
         Htw3ZJXpgIbtqRPEO/XR29AWqkFU/TvgEX9lvDDfGwoJ2MFJnDk6VkEj954GRS1w4PdR
         40Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202041; x=1795806841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjkX+SIhmCFu9w6Er5NTY8ZxVe8WqPbD/o8Zqp+diPw=;
        b=E+V+NPPHYi0THKXV8fFgl8XYmOXZM/asJABFLe32ZQzDlucEMpZqqusu+6XKNRDOAW
         Vv+94Yxsct9coPjUhvam3Wy2Xp67Ulraht5WHzFnJ5s9QCAm6VyjmsG5HbmpGrLEvH72
         CyiO7i3NvkN1aZvhgQCQr4Fv4hqWmjav2a8elLZpWc4XL6WCFQx95qXx3PRqFCPh2XUQ
         uGVZ9bNCM6k9M2K0A7erHSxwrkZgMMo4Xlex1vqGXpfIntZhUcJXaaF6X7WGDrJ6VEhZ
         FoyMglIeA4O8Fl5IK0HCjsaAjrkmY8ipngybNAucR54+sVWxilxS2cSOrE/FekecKZQH
         J9Zw==
X-Forwarded-Encrypted: i=1; AL+hErHAmMIWjoUFC46L1n3KFxs/lmBQQOJCC/RTianjCDW+QCtSEfslFEHOH4aNqmqaENToRkPcSgurYHMAuog=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sJI0g7v55nEnsITRD9FVMAIBypW12PQBRgeHfhyQFgSg7Q1FL
	fdfPO1+DcwerAl3OFrHLwdCvM7+4lS+1wEZiwDLmdngjNqH4ZmmARW8P
X-Gm-Gg: AYBFou1rYFVEqdRr3dY0pIjqzoGLTPDE1rfNQxlgj6klCt5zswmzAbgfzxeIccrWoFq
	oo81hc0IChFywFVWuv6tUfMdrOAmQwEtV9z9LOi0q2dKv1atrmfERdvtL2SHztXrVMqz915Z1AL
	JtpZunO3qcXV354mM6ntnNleExQ/TKAR1tiVc/VUm3r+pFQnlxFfBKf+xjYsFIzsfBqEYHyJymu
	hGVedSTHyqYSQN+HUujUWi02vqFEWAbSKVMj44YoftDQNH8UIyrIQLqNmcJg0heVkiJ04YC4gyZ
	xJHS7iRuh6fYl/Wb8N6aKyjkf+6XrGI/yDljnF3MOE7goWJByY3Dn788otdeugRLBjkZpKFDcd7
	0l1+2iYF2aKOyn6llLMkaUW/MLaAIwDPHCBSoenXfvSPPftUP6s1OIeFW+QZK5TA9Mw1SKOKAyv
	XImlBcqCNaw+R0Pab/vEtZA5qwShyh7sXvVTC5ClpL3nIbLg35thDUrnlzEQciejOmOUwVOMLpg
	2SvTCUfDICfHImb57sQfPa4jzS9JAznTHERT27bf6f3vq4OUdrel9w87cPk1zLSZeqAaluY7D1a
	WNxtJraPITle0KaXFwwetoqb2q+O0wwuODYnsb+Hwj5wl4Rmpl1/2g/KAfEf2wZT8RLbdupvC+3
	kayXxXVEZ1n2MetK3xnTwI9Jtl3YRYroD63C3FAyuGp1X5bGf7mRVebH0KqrCod5kTCAus+OThB
	0WFyc2Fl04dFFidfPLCbU8CbN2o0hP8Q+sgCFPVMr5Yc9TXEXMB/m6
X-Received: by 2002:a05:6830:4ac5:b0:81e:b506:592d with SMTP id 46e09a7af769-86315987fa5mr4981894a34.27.1795202040971;
        Fri, 20 Nov 2026 11:14:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:51 -0700
Subject: [PATCH v9 1/9] dmaengine: dw-axi-dmac: keep cyclic mode in the
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-1-48ab58961d6e@gmail.com>
References: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
In-Reply-To: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

