Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960480;
	b=nfabQf95SdaAa2ASJVqFIp7qJ7wiC6JVQ0vMct4jSPg5ocpjpY3kToII9xHLOjcgBDNb
	 b73FsAdTzsNNMOD2xxgU3zpEZqZys7en0TpO5ppeZjDi4fn2HCZ/6m+spHjL/85Q3VuGx
	 iiOwPj28X3iBcwqSl/XXBWLBU8BZyAC2j08Tr1GTRZbkk4Yb+UrExHWJRTdkciefkFf6u
	 8TUAjq5Ki4HGU/AKzDVihFOQpX35pZb44IrPsU1G3a6kS/cTGyTuPvlx6mInFwumbxrK0
	 rQHRLO89CHnWM+db4oF+/L+jtOX0x5qfhbCQoMPET0qr+cJPyCyhNlJCXj+Db2pZIxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
	b=RiERYgi86F5MWA/rnC8T4lDE+jpB724k6wlCO6ncwAOgtnXnbaCRskGbfV9TVXShrEdD
	 yA7xQsJsUDRX0KIqOf/aHG/OUBUoAAzuioLQRB10Kci9bXOfqwsQCJgeMpVcISVSr70Xf
	 mZdQGmZSFnEzF0+pRfGCrVzp7IIF+eCHbWbMA081QhuipbCSRk4Vt+6bUozudnVyQ1e+m
	 vac967pqaOO9FHkysLWQqMhT9CShJWHFOwmkNSgtVdZYAbnTYb6NXZqesYGRs38AM0yac
	 EfZrXU9JdSb62YLeTiZm6LO94I7gCtUBNrB9hC44HakJas8EMhvT8eXl1buJ24NEycw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="prnQ/qiP";
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE25F606A882
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE25F606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=prnQ/qiP
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8629ef8613aso157925a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960479; x=1795565279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=prnQ/qiPlE65zIvnXobRHhIMQyIlwwD8KCllVt7YPKlF7LGSkrGug6bsC34rlwftEn
         dJWarqi4gs/GKi3Vo00u43bWTWb1mSpH4/KiIREx6RHq5VzsdLrURUO9TamkdSzjvN0g
         pfdvzNo2b1/4XNiX4JrhkAQk7EKK/oKnIwLGSxsqORXHKyTL2lZWx0j8uGSqA3T3vFj8
         0qIm+HxSTFAoY3LVGh0yeBecMlDRfo3q5oF65fyf5DgOeQ7wr5DVThrK2ZaHqaTQJFif
         IgVxcJk24eD+QEVuHOrwsq9oGlUd/6f1x+fRluxui3rIm4WHthzjMtFLBnU33D/kp2be
         F59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960479; x=1795565279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=b8TMT3PD43p0kk1tscAABdE/vDmmAsEhQZ9hLAGc6zCVCQCcKjjEgG7QkTywRpcHfS
         zZBPvaclFC5eTd6tjxzKECFkCfedr8auto3PwnF5Iij5nKAGxQ0A5AHteaK8ysw6HS7e
         qald7+CELp5X0VCVIECU3bQ7vcQ6zZ2FwBrTU+AeEP8SDwmCQv566KBKWJ4NDlrmHW9d
         t13J5QpdyMirkh+GCrU29rzqZUF6NGPtng8tlLsk8b8+BS/FV5ciEQSf93/ADc2ntuTl
         z3GW1JPyxhuGjwU8JMZPjlsqEOFOHkKyraODtvUoIc8atlHAyF59pnFTuf6C98mw+9dD
         yppQ==
X-Forwarded-Encrypted: i=1; AL+hErF07SNKa4I9ZlcZi85NAGkwBPlG8puYhtSsjnZurXf+66dunu3ItAyP0MVvum1D94Ja6HHTs7imqyeLeHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LkhXO7QNuqDya5roN8Jl3TkN8RthwtPpcEX0UG+PWKkZsp0ne
	V8VSz5mc1buln9+xbq2yrXe1N/W+X06hYJs3a+o9pjAHA8lB4BTzYJ4R
X-Gm-Gg: AYBFou1cLsTfLM2giZZxtHsZ82PQPrWdXWr5y6ND/d19ewkGJHgKqjKCV2HCwMo7x3c
	wKUCWmiECV0yw2O18cnN1My85pvotM+1TbZW5PTRDtSrqfEK8Qc8mNnD7D/9Bew8gi0dtA3f3Lu
	7eCF9i6YCyCyBBN3vHGDZh4N3zB6Oz8QD/9vUCV9hKBnpbk5+ZWGgcrr8ToRP2NFEtYqwY6dqyG
	DTd9mJWRa6n86ey1hRXKcey6ac7BmBNnmLE5m86La2O8LPbvERnOIsKPcJWgDwLp10aSmGk+Ks0
	YmEYDU3L+3ytP6gwX/ATcNJkFbFXB/DYnae827GqXAsXOcOTFnP4yEN9Gt+urZUdY9JKFJDtylE
	KpKu7yihQ/y4riVbmdhE3dezvVEiBOpoeqLK2RIYa1aYBsVmjExx1KGjKOlptk+/R7fX3MPvEan
	9D5P4DLuj3AYHLJIJ4+R7XzvHycblq4R79RQeJk5ON0p9i0yPGj9j+yRfzUtIgdUiPHGZlg/NN3
	gGZU/CjlukqoqEPSH9eDn4gXsy6+TmlbnDaTu9JUacejIL99ic5G48G61DowtQVACrs+cbYks3h
	cJ/R2jW/3UpjQ3FCndlWT0RLeDbInK+9Iwm+bWG4Al6OpybQohCtW27AHNTCLFLtztLUV29R8c/
	osM9amMCO6SfCY/gzCtCyKes3hOfLLl//r1UjUec5gJqaywuebN/2IE9vyTd5l0wYYX1IQtHE+C
	vMK+LNXusbLm/LINJ3F8fSwQ3wMtOEFz6AEmJ6mUmNrOi78KJYv3Q=
X-Received: by 2002:a05:6808:14c7:b0:4fc:248a:de3b with SMTP id 5614622812f47-57740b4736cmr1444474b6e.23.1794960478756;
        Tue, 17 Nov 2026 16:07:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777b393d40sm434954b6e.17.2026.11.17.16.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:07:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 17:07:43 -0700
Subject: [PATCH v7 4/8] dmaengine: dw-axi-dmac: use atomic polling for
 suspend acknowledgment
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
Message-Id: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-4-d5f2309afd72@gmail.com>
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

The pause loop delays after its final status read, so an acknowledgment
that arrives during that delay is cleared without being observed and
the caller receives -EAGAIN.

Use readx_poll_timeout_atomic() to check the status after the final delay.
Keep the two-microsecond polling interval, 40-microsecond timeout and
-EAGAIN return value when suspension is not acknowledged.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 040c12d07db2..1a53fbc951a9 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1219,7 +1219,8 @@ static int dma_chan_pause(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
-	unsigned int timeout = 20; /* timeout iterations */
+	u32 status;
+	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
@@ -1250,12 +1251,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	do  {
-		if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED)
-			break;
-
-		udelay(2);
-	} while (--timeout);
+	ret = readx_poll_timeout_atomic(axi_chan_irq_read, chan,
+					status, status & DWAXIDMAC_IRQ_SUSPENDED,
+					2, 40);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 
@@ -1263,7 +1261,7 @@ static int dma_chan_pause(struct dma_chan *dchan)
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return timeout ? 0 : -EAGAIN;
+	return ret ? -EAGAIN : 0;
 }
 
 /* Called in chan locked context */

-- 
2.53.0

