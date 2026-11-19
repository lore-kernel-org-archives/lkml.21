Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104111;
	b=XrbHfsC13QawSHNRy2AAffuByCifDYuIS+jlwzLnC9EuqrY/uA3H/pgGQfqkp02uIQ3+
	 JIuOuZRaaQ6zLHp0X7qZgnWZm9NUyyWMGHSOT2fuBuSWrqYGv47yp6LubploxWHigDOx+
	 ibp7X0N9NK8fvo63IVXp1Xuh6oaXIphdGAgNt9UAOtJAokezDoZhFj0WuTz+rX0phUjQo
	 k9ZgM8lkvS1vEjlLaVIfmROi2GQMa1iswcNBKRu9X7tCBRuCAKxZO0Uun2Bgpf51Cp8B7
	 Mb3Dm32kUOd63oDatn0cnhltFEjpjGpdRUWS0ISX1tJzblGyf1gn6eTkGfDIvKtg/Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=aV02K7POjUQdpzVMLX1IIwtAJIBw0/JKJjqJMtm26W8=;
	b=CdwCuqVWdyHOvcSV53pyVHJFT+i0zFue4rHx46LTOMVcK1I2PDPstl1ATqDBwAKmtoKF
	 qp31+BVkCUO47V/cmMNTac5ITRif3TrMfqaJ3Wak38IjEyK7ja5MgjSeA9c8ImRuTlpkZ
	 AFIDLrHqUsP0Nj6UijrGMnLZb7eMtCMcdXiru45G0O60G0WzmsqGWjTgKDTRTQUwDTQCR
	 lWfWtFQ1gbjP6RGlxtVT32oZFhu97HEqYzWY93LuseuaJ7teVzLfK07bVAlVqgEPdFJCe
	 U94h1ngioJsL8gYpoUC+mrGp2zRBZyxg0fzDch3imo0jwOA8X0G5yltdKUTgHxUARXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SHNxJ5Rz;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C9F60A2615
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72C9F60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SHNxJ5Rz
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b335ef6441so17123407b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104110; x=1795708910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aV02K7POjUQdpzVMLX1IIwtAJIBw0/JKJjqJMtm26W8=;
        b=SHNxJ5Rz6m9M6ibwX1PpoV0iR6Z2biKXg0buZWVV4/dTD3uyanyG0DuwB5KGIHEmbG
         nHCMAoptTfCxeieIrhdGHiqHyUjaWmEju/BXWuOIioCSDeErhylTlkQGJVvrdNTEr6Ue
         BXWeyOC4Mh76Ya8kugMSQyah+DQvSPLsq9lIY5bCjACpEGSBXDSNpiHyPeeG/FPvrZzJ
         K45vJJjG8hJY8XHCSOWW+znRFChP/Auie0w4j+WIkZilCHNSYb/yy/KfT8ULyy9xQGtz
         ED8ROQCy5QlBY+HXlQvM75N640gbDSwCMbKtCuXBxzgNp5HHTAgJUWj3EDOV3PZj/ng8
         oL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104110; x=1795708910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aV02K7POjUQdpzVMLX1IIwtAJIBw0/JKJjqJMtm26W8=;
        b=NiJ5Q4IuWkb1dy9PYE/ncLzkAO9r495Ek8WJ5V6RGrtZX8rv3uUahQyO7jp9jwGc/6
         AZtxC1XJJu7GLIbDB4yMVjhvzIQMFwHhO3AyWbRx1ulRhj6m7X1Fj8Ki4aXaYHuUCtja
         il0q2KcVQUKWgfbRtS+hgKWb8FEb3u0g1WhHM+FeZdSCroaybyRQ0aZN1I40/p8cwZ8Q
         366mn4o0krivrKvU0U1TW1NLZ5tLzc/C5pahuJI3Q5WxkrUC/zTWVWS4GWJCTG/ImLzT
         Lp1PmtshSYS0N6wPdp7a22CZgqnMnfuM6Z1+cUekh+1YDtcp2yi0QK6gcgY7JsiS8zT4
         c8SA==
X-Forwarded-Encrypted: i=1; AL+hErFdblJhy/8UpGJYY4AmWz6KxLhGqDxTLhRfzPUUEYfFnx4rDtCwJWC0Y3lSUSUMX691Sgg8FsK9ywUU70M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+333lczAKRfr2jye/BXJomUaQqIzS0ukjw6XH7AoIvgPxzuKoK
	lh8aOCYZ78Df+e8ltXgjYcVD9QIirH/BcszXedOPl1Ux01iInDX3YQ/B
X-Gm-Gg: AZFdTZfPVIyDWdndAf0iJumqoAP08TK2wqADmBq4+d5HBK+EkFYNk7tktVHjRCQdHb2
	jzQ7f6XdoI222xet9tUisnLW+asyTJS+IqMUWSQNw8SXYKN3PT0Yskt8rWTwoQAOrWube7Sp3sb
	hMVp+s1pl666pDGW9eNvhW8gGm8dKe5LxfBK+wCichL40xi++GmuUArGEtyxk65Zbko3ZcSGpH5
	Y9RweU89R7d7+AVLWtONenMRPdIUmyB0Zi946FnRim4k8OpHGpk7WTwsO0AZxuMEtSVexdTmcGt
	H4syx8k4PFOhaoRcwhHWxbW9V1zso8fob4fLfh+LM9NahvvHF0s7rEbZBvbWE9z4z16dXQAgEdM
	mu2WCrtJ49sEijMAtviF8sHA/z1KuF7vWG6wKJxz4U1u7nyflWlBt/uTkmSWMknzujf0YW0ezCj
	EJazcJg/YbaWKTUFeitjNwurX8SBSsGPLkDUizotdDJX9vv4ulMMDt/X67x4WO3GJi8XqTB1p/K
	xFzF4z9nbKwWPyej/IZKGDyMq3f8V0+qOZ8RNTXyEguysHGYZkM3ykWEsEXpMp14+I1Y11MP5tt
	b83qU8O0h1Q4GdmZpXolQ6dsWXT9YeblMC9ZLTptbGerd4cifPVe39oG4GPp+wJBfwDBfYMrq+a
	uNw8D0bAmTjTLC4/B/+DuyqWMXYeLp0VaQEl/bJFBA84ewUyUHJJF31J7YWaX1sHMAWZKZ3vY+0
	2k/KNEpx51O97q7/ZhPcb+WottZ/+jQ/DR/a7Ytbxe7GS6RCk5i8OntCf6IJmJ+y6XFfPhRJXH
X-Received: by 2002:a05:690c:63c8:b0:8b4:cb03:c8ed with SMTP id 00721157ae682-8b5204d5e7bmr651417b3.46.1795104110368;
        Thu, 19 Nov 2026 08:01:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:00:58 -0700
Subject: [PATCH v8 3/9] dmaengine: dw-axi-dmac: retain descriptors when
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
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-3-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
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

