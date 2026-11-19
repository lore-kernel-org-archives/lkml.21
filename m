Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082551;
	b=I2VC8h3j913lpdTdscdGKql/MWKE5UAfdAu92vKG5rrYWUXT04LniUlIMY0d5sK7tPOU
	 orDYNUPcGg4JEMEcj89Ho/x2rHEXF8UtEkIJwE4ohqbFaIQFw0fsIyrwpn14wXa63A4TN
	 LTvhu+F/x3ZIxKSxr2HfAV88a9hRdo8bFnsBLZWearabBQfcfH0xASs75J5tw2LMQxcMO
	 bbMSHQHN7clMjJGP2RiPE8BXdRMgmIAAQicIP9vI4AyjL69cOPcl+ALEmakGVcC+RQniO
	 iTe8k3GE6c6MQzQThUhxyvKh4UjXmozmDQ1YuXgnqTDpxig0nTnQHQyTO3gJHCM7ljg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
	b=s/aAZQnl3XrsmT0T+3fpP1SmHKTSgFHRaykm+MGdTkXeYnkQRkfW5ro6FucMcVeheJ3G
	 AjK+WgkyHLNM/q3KHh4a5+eGb1uN9UKIqsHOeQ3IyTbQGkdxzv/IOQ2qcQXTSoc8LVzoy
	 oOf7CGgHHctU/TtNV2Ad8Unr7kR0y5s8S2yoXH6JaC/GZdLKYp/MGmW1lTWSg/ZFBNhBb
	 mV8FpYO/N0PXOYcje3+up1n8cEgtnET7KnHa0SjYhGDwVlFIlOWNvkWEpjfFsU5PZDCC/
	 cwrThMEPRZ++XMCWszS3JNfTMOk1+FAcn6MCCJ/u6jUZgfrv+nGMSerq45t+Kmvir2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JrK1ZFEH;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF1060A2609
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF1060A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JrK1ZFEH
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6df5e315bd1so1674810eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082549; x=1795687349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=JrK1ZFEHOpFtaoo/a2oCwxsveMnQt5RFF5F9ruEezsTy1vL94EGMT4gp2WTbCQkR/q
         bKFzZCJeSHz7grx17qtAZEgaRZQ2Du6VYubvaxZoj6mtrVtaoS8L+KG/MQ0qLiehpdYA
         fyQHRJsYuC0NbxloGvrh6j+/3Xb6JDJ+89TnfIp1Hbq6Snbnkge6NF4X0PoVmjJBejK0
         W3JRaGdCKuc9eMMyRfiecjkjQlTY7GJN4mMLxmi70wiie+Y+fEWs8StYwDFH/V7I/VIu
         hbKKJFPL+J1Jm9hxeQ3MMEpL6mdV9yPFvheTLDNKAW4tZi1r+/GfKOJkWjFLL44Wu42z
         UrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082549; x=1795687349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=p9QzNCIL3IqImwNyOASNXTp426HldPsZkfosE6AqVDU8E/9FpTyQ7jAed9MnRz8kCa
         Bm0BjPRtwny4D3fslefqJdGYCKKC78uCh3WrNzTNZNIDmbd3P/sfm/1zp/2E+6Aiknsa
         q7OPcd5DspcqnyK3/D0vSVAmH1NrPARe42DbumCvFEs+yxgHooSHCfF43e0WDeYk7NBq
         g5qX69zgXtXy1AsyHlobvpDMYLgX4AywF4rPV0HMV/ATxdHbbFg34dBDRSIMD1/xHVqL
         Z4LniGmBoH+vEWZ1mczWEOhh/X9/u1V+DNRJdQ6qHwzjuV8PlXMD7FfiZPCX7BF7fOLe
         PoDg==
X-Forwarded-Encrypted: i=1; AL+hErGSc7symwOd6Ku4W3y0Huhb8wl9R7kn2Yltk+NkrRvWVmBMx3HuwHlewe2ryObxlnFCqHo0oYj+91EZi58=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yf3RfL39eWEI5mJjmQfMU3UcjqsIxBN0mBPw0geXBa+8OOV+Q
	q/VG2wKksGdx1iksWPTtzXvLvRkvv5583YsZUeqJAIBsZyHjGn4307dt
X-Gm-Gg: AYBFou2qL2Sc0ePmp/cgpMtAdkpTiy1mBbqsUUOBZK54ki5SyaEB4ZGq4Tf46DQsUAo
	63+kHPnUlAM5OUPSMY++zDAZB4VmLiuXU/igpnL8ABTEV41/uH7WW2P16XOZv3ffBouQZ+Dbb8j
	LKiz9QFRgR/lj7Wgrh713ZCAUYRlgqg+bwrUbCvM9HTANTWAmPUjpMn7lt//fN9IYKL1P7DnkFa
	ndqhWEDASV2JLZjD9R9USio2DkAVOutedEc8TP9HEq1gxLtYqb9t9wraOd/soqpijuT5AsfoESZ
	eFdwsUFhowSnOQYUjPp91r2g7EkR8T4U29q+YnF7T4gEr5sJW6YrFgnwL/u6vU6+b9oICKKDb3B
	Y2FzFIaN/hlhzsVDXNV+iSaAXCHJQXyD6Qve7gI2V8VORKMqi1j9Au6R82aCHT7lA1oWMszFA4s
	KWk+S3kH2Rwk/gmi/zyrz6zQbuf00ZQIkxAiVgnSDjpZ3Eo9XAPzQzVHU0MLi98iic5NuN450ev
	uHSke8F1aIeJgJsWTzq4c5eE5iCSb8wFS/5GK1D/SIvTlffmAW7sJwL9rWwwOP9OpPX8F3HxXQt
	+dK5ML7QqFV8zHoyupG8tBZifcS0cJtqWrEbU9uVuEiBalcCRSUxXoKKBnmjSvhXA/HQreaweoZ
	YN9MejYpozlk5EOa7lBidU8hJzdUIA3zvsFpU/6B8UzECrkFVNIcaDujTduQAq4jkreBE4fUEzR
	z+QI+WPXfQXly6c/Y+z2lmnSQczJMJaim8cu57Ha/kCGCbqfcv0fep
X-Received: by 2002:a05:6820:1388:b0:6fb:b922:8d30 with SMTP id 006d021491bc7-71b182af0b8mr4808799eaf.2.1795082549183;
        Thu, 19 Nov 2026 02:02:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b18fbb9a8sm3906194eaf.0.2026.11.19.02.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:02:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 03:01:36 -0700
Subject: [PATCH v10 2/7] dmaengine: dw: serialize error recovery with
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
Message-Id: <20261119-submit-dw-dma-synchronize-v1-v10-2-3a737597a0d1@gmail.com>
References: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
In-Reply-To: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
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

