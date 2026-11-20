Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202046;
	b=d0y6sju3TmQSmdsmEPt+/If07uktn7hCALHvDo7wM6OdvV11lF+96l9tKs17E2d3z9r9
	 opI9R+oLirj4y4InI5XfDYBZvCMDtEOQZ4kHmeoojXPZ+wS8E6wLf7xdv5cB/yBII5f93
	 zciM9iGuxS7Fq7Nz4wtds2rRwSBpafd1SobDzNYBYRm95jGNhWSm9fJS5fmbv6Mvwmg8u
	 0bw5UD+aLM2QvxJmQcmN4HxblT4d2wA9pxcJNOl0VUpYct/t+zGIAvE94CqD5OyldW1M+
	 pLZwlfufgO/cyb5x4eVs5uzW22DFn1Gr5siu125qzJYyuhpw7YTAi/SHe6QrpctaXfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=U3pz11HTx3wEJXUIblUFMnPhV1TcN7plqKmtgqFKa5A=;
	b=dsPmyXp9yG0zn5d5v2AXrEjdzOKDiFdN33vD36fD8Jbple1iYyWSFHbGok/qVtTT1+RO
	 aiSuYwKFyv56wGBau7qRTgrXULkpzO2N5bjI7bwbAmcSUtsHx+GSQ0VCOporWvsKfM72k
	 /ddAucfAPzLavDHOBXOB+35oQTpEXuu+vZTs2pxAoNbVPjPPE2I1G4UA6GcBw1qdLTJ/i
	 Ys6SrL6mmW8svVSDZhNqj4eUHIOe6jMRlJkR3sX8VD3TL0/Lhaz+VQuIhiY1AxgLXnlhS
	 yG8VaGlTzx4tr+z7porPK7eVSFwDWgyLLowY5kNIL6fE9nfvHlkEnmzRzUYuaoF+lsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LElRle4I;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E9E606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E9E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LElRle4I
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-862b3a39d0dso707914a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202043; x=1795806843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U3pz11HTx3wEJXUIblUFMnPhV1TcN7plqKmtgqFKa5A=;
        b=LElRle4IhO0HGc55HrSqtEHcvQCwYE2NHQGfCXGz+MY370KAJ8SELoCUXp9t7dB2E5
         4+YXTrgtKHQv2pwoKpNJGIKPTCrN4JCazFE8LIehS4ElBJC/NTbiDXiirpfdk4FnC3FS
         sa0cVxCcNtSSBsI5zHqCR+/GNB3GF8x6NayhYxSBK8ISYY0U4AIzxN41nn3DqeS2TG8L
         n9wkH/laAyVMT0FgMkrpnSJ/2R1epbnKjeziIS3abS62vpyPBv8thCG1bgOycD1BfprY
         A5Q6BYHEcbIUwSlP/qKueL6Zv1Tysjg8BDOf457Mp/BhyOhFrWERVJds+GHB2mnAgN+c
         4PDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202043; x=1795806843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U3pz11HTx3wEJXUIblUFMnPhV1TcN7plqKmtgqFKa5A=;
        b=eJ/4GyuVEpg+sIyEte473W3eqk8u7hOIpc1wUlQ03Ygb9YdYqO7cl37wHTtYW4I4Xn
         A7WITRE6lVQm57vJ2+Zsl7VUQH0LPHk77AD1f4TMJmzvqiRJTfFk5qRwUBshw2PK6e+b
         8V+EVruIGb5jewnS4vuPhgdJHhZ0dS4PFLtCwv8vXaVHde6l4uy8yb9P5/r+3kV9w4nB
         79RXxsjvRg/dlnafVMQVo0h8T9vwG+eea1d1JzFysgLOwDYd1bWpeY6NMvG2RGMJO5/C
         dldV3CVnGqd99cD5YImXFP2cwVm/GekYEPlzwFdt9a7gw2rfPXLzUqUEPYnVXCsZ5j47
         E5sQ==
X-Forwarded-Encrypted: i=1; AL+hErEC7LPwqwAFtPUIVNCiy5Zhn0XCBdTpYSIHAXQzpzyChgvUKkjPUO0LBKF0Txs3I1CGM73GAz+IrUxMmy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z//3nS7vM6nCui0TPiyv+nNPBvE+2oOybXUSBXo7KjpKQWqa4r8
	c+TQ5XRJO5MAbw63JH1SGiK+F1VCbDthpTiWL2+lonR5sKQ8knwGu8UL
X-Gm-Gg: AYBFou1Qv4NXlcwLNCSm9p3tuCXSxC1ddOHzhYmd2BaQvZvrfVdIOjEiCQ1QMQKWDzR
	QG1AIvR6wwHTDIcs4JdWA+P15iACh9xzEVf1UUxMhxaKsig6XeqiosvDmQiQ7RNEQ8E0iPVt4e4
	L1b2UYU2Es89MZu6yRAFYhP8rUd4PY9bLI0Ee+SMf6NP68x+kaDSZj5eCBh548Wg4r1NFwYMFJR
	HzuizMGRSwV4sb9Fs4JZpl0SPxYhAwlKb16GJh6rMdsbkf6fhDfS0Llfo3DRyemv5Z50S0r5xI0
	wlMB4lm/oprFkIYS0+T8MWE5AjcvsKjuVUO+apUzdsRoKBFgwrnFDyW6YRtsdLQhxYlNV02Ed5F
	kMMImId8mjknpLgVE+gC1wH5GmvRN5zUVREzeRC3erzHX8Y7LP6t1ABmtpxK3mn7adH0fq+qXxY
	TFHUEO4mrEM4moeIHzYxZb6lryvlgYuWQYdpoMRNCyU5crgflEca935ZX6qt6hggje1tQxISKPE
	mvrIH4smmn+AZqOtO2LT/RgNZgHIYM3sMsVmn8OHRKaI14a/d99gJQnJIb6fwW7DKrXk7AZvBRg
	Y6Ed8eM1PHfSIhVr/rRtHPamSbXWnyD7I8+Sg+3SjjDpUn5mvH1v1zCzAcvmeIGzwbq1gYlrCC/
	xj4k83lIGrJzYvq2ujJ2xtD8kSgBjc5jlBmQ9b013xWGVenQHe2v4J/C7GGLYjtRjmaolTDy/22
	WIYttkx/EGE9cobtBma06EFg6jzEOqgQCWrjGCQ9eciyTxZzDf0D0z
X-Received: by 2002:a05:6830:640e:b0:862:c172:769c with SMTP id 46e09a7af769-86315ab1b56mr5230953a34.29.1795202042690;
        Fri, 20 Nov 2026 11:14:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:53 -0700
Subject: [PATCH v9 3/9] dmaengine: dw-axi-dmac: retain descriptors when
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-3-48ab58961d6e@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 37 ++++++++++++++------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index f17a71183050..def591fc75ce 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dmaengine.h>
@@ -1180,30 +1181,32 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 static int dma_chan_terminate_all(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
-	unsigned long flags;
-	bool enabled;
 	int ret;
 	LIST_HEAD(head);
 
-	axi_chan_disable(chan);
-
-	ret = read_poll_timeout_atomic(axi_chan_is_hw_enable, enabled, !enabled,
-				       1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC,
-				       false, chan);
-	if (ret)
-		dev_warn(dmaengine_chan_dev(dchan),
-			 "%s failed to stop\n", axi_chan_name(chan));
+	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
+		bool enabled;
 
-	if (chan->direction != DMA_MEM_TO_MEM)
-		dw_axi_dma_set_hw_channel(chan, false);
-	if (chan->direction == DMA_MEM_TO_DEV)
-		dw_axi_dma_set_byte_halfword(chan, false);
+		axi_chan_disable(chan);
+		ret = read_poll_timeout_atomic(axi_chan_is_hw_enable, enabled, !enabled,
+					       1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC,
+					       false, chan);
+		if (ret)
+			break;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
+		if (chan->direction != DMA_MEM_TO_MEM)
+			dw_axi_dma_set_hw_channel(chan, false);
+		if (chan->direction == DMA_MEM_TO_DEV)
+			dw_axi_dma_set_byte_halfword(chan, false);
 
-	vchan_get_all_descriptors(&chan->vc, &head);
+		vchan_get_all_descriptors(&chan->vc, &head);
+	}
 
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
+	if (ret) {
+		dev_warn(dmaengine_chan_dev(dchan),
+			 "%s failed to stop\n", axi_chan_name(chan));
+		return ret;
+	}
 
 	vchan_dma_desc_free_list(&chan->vc, &head);
 

-- 
2.53.0

