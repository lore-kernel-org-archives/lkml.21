Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202969;
	b=a6R/MH5HDBK3Mkn+pYXWZc0QyyvHdu7h93jl9GVEMoSVYSj+V2j2gWsrv7o5+rzRg4cS
	 0eujqN3E/CkMCtBhmBCfmEu8AcxP0o/zedPZ+suhDoff9bg8QC7Av2XpvCyZh4Csb9fmd
	 KQ2C0lzMm//Isdk0l69cJAkrKlwEgShJnOukl0zcmtTWgVcO8SvmfA+lk0uK85bziGcga
	 AvuhCuo7pqLOHZCZD5gktJalxW68CpItt7VZTVXmhVyIDoXWHrNQaIFpBu9MxQAaetvjh
	 OuCjQ/OjbwfRUg9Xst7JC76dXWzkDZZ2UIeUDa5yeKrzkRSrYUfUQ+fBVcwhQcgNS1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
	b=NCOEsLGsEAzLQmiL4krGQHwB881+KrHDugyKSU2iYojjPkpOt1WsaqaXW9UnDEr3geot
	 9jcZ62mPjpu7CiUon8FTgf6JTo4KwppRm9t52boJ/giqG1HY6X4vUSiH9/h0czxjilXZG
	 NiLMNil6grkgEaLh+NX17/HhAaxDYwbDmyA8a6n5h2yj6vy7D+9z5D+pbl6C4dGk+gB3B
	 gkgqX3j1lDcTbqNR89jw5WBQFqv4v9lmaZO4TqVviV6EaXUYJHxBSWBMi2ymkF3LsoKOa
	 RsF+BCbMybGLtW7KCju+uIwsTHE7sT2hGwSf1rR0aAQbOk1Pux3HYPqPkq8OYNPtbww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GEOB0blT;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E9C606A6F7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2E9C606A6F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GEOB0blT
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-56431524c22so594824b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202960; x=1795807760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=GEOB0blTq1pdOAK1AAs4SvedVsy9ZgE9IV6E9LjdV6BFVFLwS256U0naIqpqYOFlEP
         i2k1T+PSD/ANlTcK6J8nw2UgAXL5pdrvabNAvOltMG6QQXMcudk0c08rY3nnfWiVKt/7
         12rFq/m1fcZMf6G9Y4lq4gBWQYgOMXGJAQaPaVZ7qfooKNaXVgS8f9SpmbVION3h0+MX
         qLG+G3MiX/mpSBs9TFKssUrhJGTWy/VMGidxkUyha0B7wm7VBR6adtVJT6cpT0q9/Wo+
         2xxoBaebcN68gy1ia2rZCqTqMHICDWNiZxCEYnJhOOZw9nKJoSxqBActdTpxH9Z9YdcL
         qTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202960; x=1795807760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=iFX9Dwj07y0SSYi1mwCILABY2o9AE/moujbvyhIfelqKnfICVTQZOYiHc34S3ssprX
         GRVCOogqer0dJ85V9Ns587LAYlLL0eJNUuww4FnJB48vWzfBgmWMK+pgbLJfZ6dyCZHR
         W+nRyDHqAqLGQTk5mND4wF7XDX24kSh7kIJ9otCUisTxlckLQFQRBEUTH6mz0TI1OLCC
         GBwqIBgB71yLxmE+fS80vNd+20R0J8Dqck1dq+mw0F0y5iiW5qLoQiZsP5z/y/g7a0b/
         S45hzVoK9oq2/6+AFCpd/jk6uSOf53/Ut1OwJ3dD/b8fRi6quxCY2EeILmI1QJGiBmde
         oz/g==
X-Forwarded-Encrypted: i=1; AL+hErF0NXvakD6HMnWKGOyouPklJPRKoLoOZYZkiPdA2QJihKTkSoPu8kOzXKOtxnp/ZPaLGhaDTFfTsyYGJH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sSFKQXmOiLdChw1l90rnaH5PRgVWLHjTxzf9DpY2XDPyOww2p
	Ygs4W6w5wCCiiPIMX07VWF4EllqOSJ+OpR3PFTRdZPZ7Z9EP+U/S4RuL
X-Gm-Gg: AYBFou2+uRBoavk5rhoYfdVF/cK4xqbyNMVL7jTUtP4sS4VJK5W2aCNMFDKDwXLc3EL
	oe78hzRTozGNGV+sltDh3yiH5KmqlVsHRUEL4hSXozJKZUG+teIGeFkKcPCUucBPk9aBqVmkdbE
	Fwe02qdH/oL7b10RdeZrdJs9OlMK7iNDiygFvxduxpCoMZVLmJyjetVH1DlwRX23l9i5CEbrMGa
	XN9HoslslT6KutMKXqDNIARvRH3f/pvZWuvoB+NrcDNNS3aa17YZTt7q6e/kI6cyudL4qlvITBB
	sfFU5G21ll1l6fLUSeAIxowuDRK/Cw5LbJGOJwmhnWjzl/S/3DJ87Ixt0K4D5Z1+CGfvyxwlI+6
	59o5UYpDxh3CyY1Q2XdTTlUlUrOmq9ykQgtoc00RlF462GoGTKipP2U8mIJwIMBIiqnxcIQwosK
	+C2qWdRppJUG5rnitUYEzdRpq2HcWnfcjLXWNu6RByNdRwc3urBnYLNLP+GqyMXCpRYV4OjcEKx
	emXKrIFVy7HEqZ6IQJ6wKP2OoY1izKPtp7CKLV1546BeO76gag44Aoz2FoqeQV/ws0xlyL7IK+S
	MBorHea5im/EiOzExMM1n7U//UGmOpLkQEICY5eEUsAxRVM+KKq4xtbkxQgYp1KfQ/xwALylFmk
	dy5YqFidDhSzPjDLUhAbu6RGcM2HfMj9NmNAetJ+lpq4Tgz13SRHcwMgb5n/hIgj+R3yMoWIc7M
	1iiLAJEEReSC4Xeu5Cn2JmDCHOUZy4HUlvo5HEQYECS0Xw1X5h9BWlrYhIdQRgSFBQIMB/RJOEU
	w==
X-Received: by 2002:a05:6808:301e:b0:4ec:d580:2440 with SMTP id 5614622812f47-57a0bb73636mr4665554b6e.54.1795202959832;
        Fri, 20 Nov 2026 11:29:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm3434498fac.8.2026.11.20.11.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:29:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:29:08 -0700
Subject: [PATCH v11 2/7] dmaengine: dw: serialize error recovery with
 channel termination
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
Message-Id: <20261120-submit-dw-dma-synchronize-v1-v11-2-9b9166bc2cc7@gmail.com>
References: <20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com>
In-Reply-To: <20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.17-dev

The tasklet samples RAW.ERROR before taking the channel lock. A
concurrent termination can empty the active list before dwc_handle_error()
uses that cached error to select a descriptor. The list head is then
interpreted as a descriptor. Even with an active descriptor, moving
queue.next unconditionally can put an empty queue's head on the active
list and pass it to dwc_dostart().

Recheck the error status under the channel lock and stop the channel
before selecting its failed descriptor. Only one transaction is issued
at a time, so take that descriptor directly instead of scanning for
completions first. The scan can otherwise complete it and start queued
work before the error handler has identified the failed transaction.

Detach the failed descriptor under the same lock and use the queued-start
helper, which leaves an empty queue alone. Clear the software-LLP flag
before restarting so a failed multiblock transfer does not prevent the
next transaction from starting. Keep the completion callback outside the
lock, with the detached descriptor owned by the tasklet.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Fixes: f336e42f73d9 ("dw_dmac: Move single descriptor from dwc->queue to dwc->active_list in dwc_complete_all")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 2a9db9e39f5f..f7ca9da5af90 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -403,10 +403,17 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	struct dw_desc *child;
 	unsigned long flags;
 
-	dwc_scan_descriptors(dw, dwc);
-
 	spin_lock_irqsave(&dwc->lock, flags);
 
+	/* Termination may have cleared the error since the tasklet sampled it. */
+	if (!(dma_readl(dw, RAW.ERROR) & dwc->mask))
+		goto unlock;
+
+	dwc_chan_disable(dw, dwc);
+	clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
+	if (list_empty(&dwc->active_list))
+		goto unlock;
+
 	/*
 	 * The descriptor currently at the head of the active list is
 	 * borked. Since we don't have any way to report errors, we'll
@@ -414,12 +421,7 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	 */
 	bad_desc = dwc_first_active(dwc);
 	list_del_init(&bad_desc->desc_node);
-	list_move(dwc->queue.next, dwc->active_list.prev);
-
-	/* Clear the error flag and try to restart the controller */
-	dma_writel(dw, CLEAR.ERROR, dwc->mask);
-	if (!list_empty(&dwc->active_list))
-		dwc_dostart(dwc, dwc_first_active(dwc));
+	dwc_dostart_first_queued(dwc);
 
 	/*
 	 * WARN may seem harsh, but since this only happens
@@ -438,6 +440,10 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 
 	/* Pretend the descriptor completed successfully */
 	dwc_descriptor_complete(dwc, bad_desc, true);
+	return;
+
+unlock:
+	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
 static void dw_dma_tasklet(struct tasklet_struct *t)

-- 
2.53.0

