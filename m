Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104109;
	b=W3ilsyowJjOei/Lpy7zhh56cMy1GodRLb4P6yW7x48tKAMPd09X1Dw1QlxA5xyWR5KPP
	 3kPp9cJaC3xPU5xSpk3R6NetvSJWiwotfayTxgtg0Q9o8kpW4s43Eg53lAutFSUt6zjFZ
	 ambVZ9hnvIM3N4gDGCXhYcDWw8TjpazSs6kEPlUo+3JTTgDQdJg5Fmz7/1K+AFK7N4ncE
	 O5FLs+EYrzmoaiLJZA1C8/BbGuh7vpx8oESyXB9jTb4DUP9tg3iZMNyiYnxDoDpUer3f3
	 Pg9JwzaocymZ/i9RIB+332OH1RmAv3PEHZB03tB3YgUbHIJmhjD1uT33DPPwj+Qp1aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YjkX+SIhmCFu9w6Er5NTY8ZxVe8WqPbD/o8Zqp+diPw=;
	b=PZnYPzzikxgRmVZDfJNSnwu/qjPt+TR3Oq6uO9OSr7O2ydkW+UKBb01YJ9Lz8jfM5UWr
	 dCY2H3+oUaQsKbQjnyHvVrB9YVqo3Vxu8XPaBanQjVZT1UcWvq36htciHJnuEzU6utaqs
	 RAtyZdgPJub0nZwvI+LoTvitocKiYZ7dzdckUt5bQAhA3cyV9QSHybps7a2OmJe9cO9NU
	 bL/n4ppiU2MhA89OAT+8EbDnA4slc6m+6c4xM21ZrWtq9qnbatTZWCS3q+wby/voq0ch2
	 aqgN5dujUDK4OlnujRln3IyCJB0x9lnNSs/Acec+3GTnZITwn09UQYa0v2bZGPX1yjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gsF6tYcY;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A0B606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A0B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gsF6tYcY
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4d543b6b6so15083577b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104108; x=1795708908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YjkX+SIhmCFu9w6Er5NTY8ZxVe8WqPbD/o8Zqp+diPw=;
        b=gsF6tYcYJ8FC3cel931aNMGVn5nCBhw8tRjL8x+3fFjZEU2LMzexo+lcuHehFyBpfk
         suq7g2olxPfa0mZWy5fNnqXsQzLqdOwK6HtIaDW8tjK6jUbszUBul8YFd5T/gtVurhd/
         9GyaWFHTFsU4RE4Q0YUa9ll2eyoh3NHel7ynrhJZ6VOLWDATgM0l6YZK48ZLvZ+EURvH
         rIk5UvJwM75ceh8djNUXar/9weE7ol6em6D+tdeH0HD4wuSysrjL3L5NILFhYDc5DmD/
         nf1ZE7cjZSos43rc58Q8Zk8UZI3cv6FoRmdY3Fva29SR/tC0VDNgfzq14EMEMYnWzEa8
         HrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104108; x=1795708908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjkX+SIhmCFu9w6Er5NTY8ZxVe8WqPbD/o8Zqp+diPw=;
        b=v3xoAOjTI0EXG2IjBjLzREJFThFSN8hidhBLBVoerWjmHcRHPRgrS1gKimOaFB/Go3
         evhGvi99latFpPYQeoTRAuKUxwXFRYkCtvztH45sctjBA+7GhbuTEuqKFLQpLAtEbbbe
         hhhGp/XFbxRQuIGtAs2HcX/Ezejar2AWyZF1iNICj9yBEQLDrt09kVU8i/H4BbfvOQKB
         gRsOShuEjjc5N8DZr5/1GoTN8qpUKCEh6CJRPtnVb0fTkUQZFKneGYedu6ung9m0I4ug
         ABd9nK2kY9gzbulNBVwSMIfB4HYLIGJ3HXdKt6502ZjNCgc5mQge8KlayleOlGp6WOjk
         F/MQ==
X-Forwarded-Encrypted: i=1; AL+hErHVVA3uvSX11bbOkx0knPeS1GgFSUmEnpOa3ncvC6NNkxFHCcxMoQlqw1awjEQJl7rfZKJd9r4mdWV3QiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DkIeMUpSa/c3YFPn3QttZoAySqx7MLYdJ+5GU3I8dZqiZNPor
	EKQSyq0vgjvn6aNJx12A5IHHEMs5eMRQeshPKGt++PbV26Y5ms/5qQKL
X-Gm-Gg: AZFdTZciGRJJvEwvwa8CBVhEzYwiIS6tmK2pRLMZE2W02K4OX0VGmILQQvBiWRFFtN4
	atvY74DfK1Sk9ktBk6sDQYhtkP/z8/2NCh9NpKcSiW7Rmu3dQnR0o8wv/MU13pvoboTA4EElr6q
	vDPwZzcU9GYYKVjX0gpOdwSMXIHD5SVdlkHFAodj9NVT5w97oK4vLSzR5ACi+RPC0N6F/B7Z99l
	wCLvZuR+e5LSi1kg9GN7siloC4cjpNgFJ1pGhS3RCAjDMcHsW0c9pkWfbfglGoCidsSa9B0srE6
	SSYFuFvP2Hbq0S1o6AO4rB5Hnh1D/Lv6hRhcu1TErnZum+uHA0vVAdx2wPBF7uFFk2yWNnvug/G
	pXGi6md7TL4iiFdInv4zYxIN61M0T23ZG85kPjwxfwnhSDJDrvqf5RoasQn/Ul9DGtT9PI8KPxG
	NCROnHougOId+U2lLMybIZaYJ6hC3mTVphU3eutxBCbBLuSz0TQlZxnF+aM9uJltFav24NhPgE0
	Cpyjc67Ux9uHypTa0YYt9eNbRlf4FaBGhXL+aOBeUbPL90j15VaTRvaEggRsqcB4kJEuNSCkUP8
	v5XSbr4qOOgShu7ZI4/wOslv1GbYrrJLfqOv+SZjCashMW6Y20vbc7t7jfs3+zDeoAov2Suk3F/
	nV08WTXBGdal3AgJr1nvkY5+BNdcVPIkRzBxVZ4ksTX1PGJj5jAmMq3SUgIqAAnBoUElbuWqDm0
	dbOyqsqmzT9EAAiNfvtQrcCLOGhqwiYk687rEiIAp83vc+4O/nCXk=
X-Received: by 2002:a05:690c:4448:b0:8b3:5969:f25c with SMTP id 00721157ae682-8b520435b4cmr656757b3.31.1795104107663;
        Thu, 19 Nov 2026 08:01:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:00:56 -0700
Subject: [PATCH v8 1/9] dmaengine: dw-axi-dmac: keep cyclic mode in the
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
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-1-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
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

