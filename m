Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295108;
	b=3dPxk6SnFPMjrW7fdda7hs1xDQfZdnBEEqyh9G12ULpk/F+5y5L1RwMeImRMG3C4jrPo
	 3wPvBxwSDZYweahN7ia+RcqaD2WyJbPjAEJabh+dZO+vBlUfu5uQ4fVDO0w3cXPjfgdpP
	 4R834BkkvbmX442rCVkyWFpuFsq0Kg0z2rQugBJa/nf0nam7qgVq0pr2JM3SoVmXkZxv2
	 wYtDkTPHY+/cYEMELmMZ0b+p6e3Q4U0hFbFD/Ps6uX4p+aLGUW9UHLpeQspJLaXjEONXD
	 A5AienelNVHMb70P68Qi5Uhju8UuE1sZrsam/OE6c1KLUQz0jF50P0aq0hcN+iQwuzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
	b=Xrj5+V7zdoQQqyFcrR2XkMfHU2qVuujv0EIIHwjIv5zjFXk/2ikmapZXiOfjTYUwCNnb
	 L2e98MsJwvSqP0BTLriJ64DMq7WnVItuXGr2kUp/S3cDeojI2Wo7GUj7gZ5kqUgQHc6Au
	 ByfBQiyflZXip47kWyaaMf47raifpPYDL88/d28m3hXosXJ7TdzgmQ0osrVjK6tNRce3U
	 4IynnBK3ya5ExGIMJEOPi4zrXFIHUkc8ZFtZim/Wnj+7lzP07uRRrkI2+HQb7P3wjuGEq
	 jvdmjsLZm9L6HVSp4rNAYqYCvTIU7nboOicqhBKRGedotTWWo29JlEMEfXG2ZgmBBpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ScglfkVr;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E859A606A337
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E859A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ScglfkVr
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6aa9606ddadso1365967eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795295107; x=1795899907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=ScglfkVrQoDBqFhOeralbC4w/qT4T6PObOz6mK+IdCelxDotSwRIhwn2xFhIq58UCw
         9Ws9TLsKxgZ+df5vHvYjs7AfVWtkqkmO4z5IYuDMwTB53bvSWCWrm80PVAD8qVLFE1bi
         51aAiOrtNxJrb//NaKrtnDcPW2DSoWag4FYoSMSILeZxKZvwxDKAlpKCqWzFhPtciMvl
         2um69p/pZRns+nP59bF0WvIurw3GI1OdbFyPBnYiXd1Vc2FifLWKuactqr5GgX83VGxv
         iMDbEynITUiVK78dkIMLSTi864Jh9Lbw6F1+P+vkJ7DAZWwCM1maohG/hTKi9roYkkRC
         N77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295107; x=1795899907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS2UBcR5n5u6jJuSGCUmpdlBoEKk3jjjMEO5gyi3TM8=;
        b=Ng0z13YPwaRym6cqcXSbPLBrBvLhX8zKBHFo6ZII9sZNc5HAm3D+Spi3E7l5nmAtLh
         GAjv7UOF7A7/g8k6vmkzp/Uhw4wk8r96vyaFeoCDytCCHWT+KtkOvmXZLHdRM2Nn961W
         jKfEuMWTgZKCNhNkCIdjO0S1rwVW/GsfH1KdF1Hz+h19TD32Bz//VZrcZ/0wFC04NquY
         jWg+ovWyEeK/t/wnviiIgWNSBmEClvk/YRB5zwh1esRBAwSdrpCTTnAnjhGxiNACQ9rf
         xuknpY9UFY1xt6iwJonF3MhD7sxozZd2P1u47mfmrgoXcKuwqECM+KMTB3uApq1IGoXO
         tkNA==
X-Forwarded-Encrypted: i=1; AL+hErGX9q38p14ENesKAh9LhFYMJHuEWmd3oBD5Gz+JE02k+jcKQIMeLKfWROp8KqW7+NjGM3oCmIfejPgWiXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ap5eMmCDc18syv4G2xv7U+DkUgk7OgLIHoeeejA3dr/rghI+5
	d8EJ9edFHpQQkElFN163ylGccdhvti0QaayZXLQLVpJFOdSkvPK4Yo9wLBJ4USuf
X-Gm-Gg: AZFdTZdvJcuXu27yrUfFjZo/TloRU/5biplBxok7DaCHcDPNTqvyzhaWctjHmfo5w/z
	QWRn6xNS//FJynPribrhCT09YXEIGUQNGvTmIcp23Ems7tXMr5IydYS9X6I0Er2/G0HtU5iZIgC
	cI5TtPXsR1SGr/XmxRcwGsgkjLh3XlRI3yO8dkSCjyfD+mE0qhmqt/3iwq9OX9rJkaz5Rg5Hr3Z
	wrI1aulVn+dx2ORLHFS0gp6pRuqxTVM2nQrohtY27HpIt8VIdBZ9S/yq5P7hfPjodeFyw3PYrvq
	p+6c2J1u/PDjfKbnGhgzG/L5XJkknlEzuxDUOkx40NoQFQsM/sGDB/FjZlISkAz7DbrX0gClUEG
	r55wglgMMmdBggTW/VxkbyBGqMnraAJGGxFYnBdbWtV1m1pQGDOk15bAuesbLmsBKHTALsc3LtJ
	Uy6R3SovhwG3CXQYSSJeapmvfWF+UjUF+k4XLrTithSsTmTOkrtWAySCmANH2Db2M54lOs4uCT3
	Q5R94R1DnyQClUk7Im5dyHExSgn6V+gY9UZdwXb18oU92u1tS5wPAiQ2MY4lMWLUauk+1KHC7nk
	3CP5isc8rTlSD0xSnF88Ha81XSysjP2bGR+lamwjXgt17Rvp0iJVqnDpj9ZxlMH6vcaSLnsq2aO
	7GCw1P6fWhLoEgkeuJ9X5pXED6/VZ/7TJcjvM6rsMoEYVNr7tUXdn2BXHYktU6K8DfQ6BvatI4M
	6roojmm6Fpn61TX4+yiwVrN2AjoXWH5LV7TBH0tbrIzBENxlqxqK2W
X-Received: by 2002:a05:6820:5081:b0:71a:e645:ddc3 with SMTP id 006d021491bc7-71b39483a3bmr4673731eaf.34.1795295106782;
        Sat, 21 Nov 2026 13:05:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm4635728eaf.13.2026.11.21.13.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:05:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 21 Nov 2026 14:03:17 -0700
Subject: [PATCH v12 2/7] dmaengine: dw: serialize error recovery with
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
Message-Id: <20261121-submit-dw-dma-synchronize-v1-v12-2-f51eb635209d@gmail.com>
References: <20261121-submit-dw-dma-synchronize-v1-v12-0-f51eb635209d@gmail.com>
In-Reply-To: <20261121-submit-dw-dma-synchronize-v1-v12-0-f51eb635209d@gmail.com>
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

