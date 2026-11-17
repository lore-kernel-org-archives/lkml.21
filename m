Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955743;
	b=2V/7O+l//To+Hy1RmcicJvtiv+4uZX0UUAtC6j0TiJvjzhg9qS/4i0kgnC3RretYsa3q
	 pnk2gvJOJ337SAAGxg1o3VSmMybcoT1gM2iXNlOhpeXNkHzmDRwYTN9ObbWc3pEemIWxG
	 8f/jZG/tTn0h6VnnUTqc2Zv5eKI2/OGyZRLqTo2f3xZ2kD8P1/cvKz0zIKDQXmxUhx7m6
	 TqeWJ0qW1EWHVqEYYyr0Ltl8lv6aNEJDskzQwJo7956zRDO5NOLi9I2r4/dt1EcB3scTB
	 2//1mGlOZ0utSI4hKwlfk5km+78gdQvxLNHo7ICvmgHIRqRLgodXhsasRndQ2FXg4Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
	b=jGKgppINJJMnv8MXh1HVVpi6P+T1q/Fum1kgyRy2mFKwOOr5B4M2A6Pp9Td1YpBc8WEj
	 tfX0RrmYYQL7Ya2M7C+fb5eNrevjXn4VPaMI/7Ui5IrODQDxyPHkaKcAEeTbDfdt41gCt
	 +BStkVNnR6udBOz+qaZcylJZ2nzjlOwsu6rNyGB/IJELD5trx2tfydOm7iXIp6lOupD5Y
	 MW1xgLWGskCSrGrNBEgx0OVBUzGnRC31ROyU6UbiDnj+EG3B8LFWmbbhQohBw89/3yAXG
	 lioJ8sPyB/5qGfOT1JSi6Gr+kS6LsOxUV/owA9TvwWep7eOlNYPREptyoJHFM5AJmMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqs5FAtb;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80672606A8A0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80672606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqs5FAtb
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-48e94879f02so152094fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794955742; x=1795560542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=hqs5FAtb/l2lFZVbNANYpUobM0kxuJ4ncJAfURemCBqRlXF469IVUDfOOPy+rQ297p
         XlnXZ5DDxt/8PERRhtvJLa+Zue5BebERINoyUEkReDe5nfkwNyp49NtXluCSdh7/I5To
         h8FFH/rPNuhPVlJwJyI3wHenK6msmV4Xc3ONfyB4AI6jOA4EG4RTnQi5r4XXjW+6UrMz
         tfZ7/s2nYG8y9qzMb0Kyg5KphJGMPKq4knV+ghbi6geUXfsaoFrPz8hFeiSSYfJjX6cY
         5SnCO3SyIG44N99/GjMx5qu4oq/PCq2qpCaDFGla0K9tInS+N8DCf70jgIPuRgkf1HzW
         wggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955742; x=1795560542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=Md7MTQ0voORuzRSD5ak1fUS/D5uiCbRFUeNAYEFJfGTGctTxoGBKUh5lG7MNiTs9om
         nZWPYgyBJj6otEwgspnLZ8t71GGyDoJ58hTQTCDWkCSabB06GwUw0ENKszT4L4XwTT1j
         +dfxvWvws9ZFR0JLNuyW1agFCgW/6YOIXCOTCyqCUOhW+eAbc0gY0Bgx0dK3fDhy1nv1
         DmLW2yS8bLnJuSjZ/JEHHGkBaAQZ2cIxoWb63CFCm7uqQsiCLXOwvNLJXafCysBiWyxE
         VtD/S9ypX7iChyBMadmN9joLs5Rz7czZhwbdouHH/RLbqFuMsa0KPqd1gxlTZWepmBqv
         DaYw==
X-Forwarded-Encrypted: i=1; AL+hErFJDpaPF/EFMU/BKo4o3N+Nxi1NfH5trBt2HvQ/81q1AjYx9lu9EdcvmFXH7nzJZS0rXJPQoiDCeUtFdBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pJtXezRl0tAI2+qkYBBpWYERd6MR2iMGsUp7LickFYi13PNUP
	gX89fSqhKih3y4VJ0rEjm+VTzMqHRi831HfwuH3RAe70rodVMBpN2LHJjlZ2E4g4bXs=
X-Gm-Gg: AYBFou2rG8Pu3S/RTRtT8wu1BNwIzZoDXuJVaBdwK8cJmf7t+YyF9uGgYyny+3dHggM
	z3ddLg9NtWEXdU95Mgdb/O4wvzdlVDqI6djZ4SnB9HfPF97eTULibSPzdEuchL/tEXgiY449lgu
	XwsiFdM9Tqz9o5lGao58rJ2Dw5bou42YnWiuTS8ZH5nKHfmxNXD1zbdkdO5xLWj5T0no9/pOe5z
	vLhTv5p2fKqE5q8dPM2PQboVjbZCKpaXUYfY9MniZjfw0P1SILxhbE8ZzjqceoNJYonHd41I/vq
	nUcbyFnCKALnF6p2Ai4P1/5AoKki0um/WOiG1wJ5P0+wJ2zh2AfiIgBcSP0aQvRMu/L98remOI0
	eLFwpMDTp0pCS4j//4k5TVYXAE5baGO6lT5zy1F9nxaExcJ0CeOMszxjQ5e4UVvgjXD5dXfq2K8
	Go6rZD0ggDIFSQB0MyfnwHZZwaGXIUbIgPLO1cQ5TJXzNZLZkX0Gw5MJz3Y0GutcogCZf5VirrM
	+xUZptSRnq3B6CBXGhsFZkDep3gRye2qMGAmNsCR2I9qV6p0+DW1p+n3gjQ9GLE7ggCqEce3O8O
	NCGA73HVG7zyzsoMnvOBIFQx8StZRhy5wjbguhl/dDsWHi5isY8f/8Ss9NgLXZrsB4jskoeI1Y2
	hblJTbDjpvAH+oeJdy33k+VCM8tINV0WjJW2pnAAtwroY6xQSqFbmuaDEFGmMSXJ79RXNQkFpxv
	j+aKbmuOux7jtWKOXy/73Cbd9sQbWj1qw/+Z68ZCa5USWUWpyggqtGIZRd1UtJarMi+4dIAElsk
	w==
X-Received: by 2002:a05:6808:3086:b0:4c3:d087:4446 with SMTP id 5614622812f47-5773d02801fmr1580025b6e.42.1794955742318;
        Tue, 17 Nov 2026 14:49:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b74560af5fsm583066fac.16.2026.11.17.14.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:49:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 15:48:37 -0700
Subject: [PATCH v9 2/6] dmaengine: dw: serialize error recovery with
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
Message-Id: <20261117-submit-dw-dma-synchronize-v1-v9-2-7dc066ed0bcf@gmail.com>
References: <20261117-submit-dw-dma-synchronize-v1-v9-0-7dc066ed0bcf@gmail.com>
In-Reply-To: <20261117-submit-dw-dma-synchronize-v1-v9-0-7dc066ed0bcf@gmail.com>
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

