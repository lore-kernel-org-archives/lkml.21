Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960479;
	b=qqej8BrWEowbZKGSI+0qtMYuv76rHm29bOehSohSFxICBb2gFGVFRSKz9TL/IWl3T22M
	 2bcoa7Rm/N57Xcj4q9PlduxL0RHyNES7DIJVhHe4v3OXYoAlw4dDmCHDqLgmEUT3mxc04
	 y01yes1G9eDCm6+8CpR/OXj6IFqciZxEWCAVb/m42HZ86gY8BAIs5lMsIqVGR0r3LlJzD
	 XLZ7XwwvdnkjyzPIg49eqoh0LHZBnEdU039ucTLJL779bacrWgjeLdfZTbNuPrM7pzLkt
	 PwVVr7wIJgr8RN/GxBg+407+TUx+g1DdjDrbC7WuJl9QCGLm29RtR0Bukqwsa/sxLOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
	b=t5SCejIqsP0ruQJNNw2R90gGSB4ru3wuwfRJBJqo4AVOK6vbhkWYJ/p/b50dnMYfS7cU
	 MwlRSez7h4lId2Nc/X8UbwOSVE4lkeGCpa6f+X47w0/OhQuNSS27wnfaa6VlXINAnGkSp
	 D08oM5UfOssRBORZKwTDym17MrUv2TC5AHbXO6ZvvFvbgKD9K+VqEGA6vSHny5WUDEOM/
	 /71IU5nVJrkH3QBvpwBB+l937kuOtdnCDqoUafLLPSomHnWliaVtVF/jleSjWfl7AEp4S
	 UoRX6ENjCvO7XdgqDWcakRRu88ucHOYLH+rWPTnHqoECkzhxpxqoHY6q1v9Ma3HP3tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLUb2Ltf;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E597606A896
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E597606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLUb2Ltf
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-86103aaac12so842587a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960477; x=1795565277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
        b=jLUb2LtfTCdiUt+qLSzNRLh3e6vtIXez0t0u5ZErLAm4Piwa4rdkjyp1u/qEfiJ0Ld
         n2aeZ+e5g7TSqDzvBPP+wWpyAX+nWKEKudMkqJMWAuYCJpRAnsk0dGNVHRFMHKbVJF39
         POfWEurkqyiwTLqiJtr2pyWolsPfe54o/pU3vDVvzewFPonzMSqPSMpERUFafhInljHX
         GYUK6c+mlIG/tsVFGMzVhqXzas2AW4S9Af5upcFXpj6bWSjNss1giv/k6TwmtWP7LcS/
         QHxpPue0n0gZyGOg9LA8WZR3N/sqGsfBEyk0AFVeoMqY+1vyDvy711CsO4IgkNgANccU
         N/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960477; x=1795565277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
        b=Rz7SNlU3tVWpCNntrcj666VXMZBoJDuty5hD/RgYvgwXgMzaVx0EE6oPhcN4YTIwyQ
         H9+JFodyPZ3vcBKGX/+nqSI9+B3MY3SYFue1QD/8CNtnCag2jgh96yjWR+rWSsJxpbYl
         PMesmmm3cKJuer7BdQ/2Ggvo24zq3fNsYVOlc6BB47kyZaKyja81EUfnlxqHzE6SCAd6
         RGTuMYOOxjWg/iRYPdUPOm6JVUia2jcJe+04QTHEaPqonF4JiMAMZ3VjvieB7gDlsraG
         DXAHr1ibRST+/r01z0NR5XTptFd1RXEhTfBTypLNH/okfXYjM1ot1aWXIAIDXWY2Byzk
         yPYg==
X-Forwarded-Encrypted: i=1; AL+hErG62/ib8ekNJKtlkCtmUKGMgxyw2C/XFdL611f9r3s/4OYoE1c0/hhJlUV2vKiWVZyt7kF6iOvUWwwvNZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vVAGYqRFaI8Yc+vm8q/RCDtpprRFyYuPGjhlqr4XnidkbNice
	R3/ensJG0+tJgUOWvtcSD3XKwNsEcKnWaUriD92NmULXe+m6C5R9EdlY
X-Gm-Gg: AYBFou0J4pk2K8C6DgW7bUcF3mlvChAxwhwtyI9nNgoypOnwR2O7wm4CUChNewZ/9p4
	ZwWt9431571gjFdPb4shMFh2fP8/tBWAgj+xYhd7HBzKct1rPbM1ZR4sxCH4TAB1HLQflLWUGXO
	de0L8nlK2NDCjllWqyQBXrAbzOO80KqqealbctjuQ2EBjh9T7u5dFMHlXbmYyKJyisXDmlCG1aB
	hs1mE6KqS3d7wQAKny9VFQaFP3nruZPCjzN3qaE8bAv2G+b0xhs2dq4igo1nuuSGziyg+R31rLj
	9RLpW8tYbKA7Brq4HaAq1qDE6f2Vf/f7lwt/3IB5lr/5UzTifeZT3bl0s8aWEUSo7TKKVkACl3i
	V7Q9wI50C8qHAGfU9UxcfZKRGWrJM4qHCxCQurywxV/4e70j9W233tCWhR9BTKQywVHR21+CVfe
	qQDqqrl1cYZmsCX5y60FM0Pzguwbv2LWu8iOGDbfBG5G9YyOd0RgJqRYXSGYCgeXqB4VS017e7P
	ta3n97pOei8/zlyxQHaRuw4fb0FO3D0jiayE01gXP1GhOFVu3iG1uTEZxlk2vwx/sRn3hoGTaXV
	0IJErbiaLzDFlk8n3F9NE877pueWKDIeYGj9EiJDdJh/1Z58SJ4mXoRQmJshcWva9eduZGzRQge
	7i5VD86mBs0l31r1tuZI9CjOLcFcUBbp/vueWFpMXPpck+n+S3X7fOa7xuabd5wzz8yKbujQVRz
	jNiWYQo0QdETyJBoPB7wMOTew1IXTrdh7n8gsLOodZUGajWSGX20s=
X-Received: by 2002:a05:6808:4f68:b0:4fb:c2dd:c7a5 with SMTP id 5614622812f47-57740a52bfcmr1093436b6e.31.1794960477683;
        Tue, 17 Nov 2026 16:07:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777b393d40sm434954b6e.17.2026.11.17.16.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:07:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 17:07:42 -0700
Subject: [PATCH v7 3/8] dmaengine: dw-axi-dmac: retain descriptors when
 termination times out
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
Message-Id: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-3-d5f2309afd72@gmail.com>
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

dma_chan_terminate_all() warns when the channel enable bit does not clear,
but then frees the descriptors and returns success. Its synchronize
callback only drains virtual-channel callbacks, so terminate_sync() can
also report success while hardware still accesses the transfer.

Return the polling error before detaching descriptors or changing the
peripheral routing. This keeps the transfer resources available while
the channel remains enabled and lets the caller retry termination without
treating the timeout as a successful stop.

Hold the channel lock across disabling, polling and descriptor detachment
so an interrupt handler cannot restart the channel between the stop check
and cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 405ab9a78955..040c12d07db2 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1185,22 +1185,25 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	int ret;
 	LIST_HEAD(head);
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
+
 	axi_chan_disable(chan);
 
 	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan,
 					enabled, !enabled,
 					1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
-	if (ret)
+	if (ret) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
+		return ret;
+	}
 
 	if (chan->direction != DMA_MEM_TO_MEM)
 		dw_axi_dma_set_hw_channel(chan, false);
 	if (chan->direction == DMA_MEM_TO_DEV)
 		dw_axi_dma_set_byte_halfword(chan, false);
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
-
 	vchan_get_all_descriptors(&chan->vc, &head);
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);

-- 
2.53.0

