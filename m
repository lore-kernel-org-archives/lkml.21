Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781937;
	b=TtGZHiIn0FuYQFiYCUfaLDKj56f6RUEVa/UtdV2Cq5KBiYftU4TLBVb7xVDPQcufrmHz
	 zrknqyal0/Gja7QCwkTMLiIkM0bb2uMRhN6T8s3uP6iBSJb4I7Y1EkmS1dPl/buO+nUEP
	 RCSc1jwVpNspJYQYqb/a9GjilqlKc3IRTMEc1hXdjbuTNx2IEpJSCVm+xO9VBxgbWjvf/
	 dqwTe1Ry6DUsw6NhTZ8Xw95cByGJZTwAFOzx3CliK5pIGtjGS6kuWqRACDrzwuZI8fFUc
	 BLSh+i0gCC22z6DvYICQz6cxAwdYN5qwwIsJlifQITp/GqQ05O/nwmCcsESt0fin3lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JDEDLRxX+y+hxeESjxpnyx7awbIDm3QHkdvwKR0hu5A=;
	b=QONWITWyRQCDtCoFn1m9UIrxPaSWDl6lfng17Zzl9ybW3eywa2uE8q0hByJSN9OVWekC
	 QmcL+dTpZfo97pa0b9jMFDCGJtx/tgnIgt1GyjQIihC8E/B1iFLh8xumbw1ilHhL5HYWL
	 62dtah7W7eCanRX/dEne1OpmCmlKNnCKRz+9eRUWJIJKF5DuPygdB0+lY1a7pKMtZmeQC
	 jNvZEpMa4Ecj00U09q8QMxsipUvUZIh1rNyPONQd1qYfhUACdvHiXHyrpqZBfwxjFtvmO
	 lTkaFb9k4/XRNC0awygKIEld+AC56UJAmdShy2LSBuoIW45lDxfJmeDt83lKbavPCAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OViBpshf;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDF260A2608
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCDF260A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OViBpshf
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so4763305f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781935; x=1796386735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDEDLRxX+y+hxeESjxpnyx7awbIDm3QHkdvwKR0hu5A=;
        b=OViBpshfT85AxZZqZTN0b48tevPt8loTi11LDqc5kLHvzkSCAztepAs6jdUo36QXao
         2t5LrbcSnH2rJcQ2+MOtl9eT1ky3V0BoOOBw9eEHBmWMBlew2AlnGbGsHuv5CisZ4aux
         7VHhr4PBtvrz/NaNXmDRoa6Ia2AJtfSL1cWtzvyP2sxKPwEVxhRSaNgESAagLcntWhXl
         FXFz8fh5hBb8/JH9jHIYrvpPtR6FHq7Yq869RF2MvxhbzD/7zGBYQCO4yGGPZnHK/g/0
         Lfc5B8zp939HylCryZTKKG0rSD1EMCRxdsj99ciwio9JlkzZv4ruIxoja+zKeYsmJ5Q8
         rW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781935; x=1796386735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDEDLRxX+y+hxeESjxpnyx7awbIDm3QHkdvwKR0hu5A=;
        b=UoKLsEABhF9zCl7Ur638CYNDRE8YGdwosn1is2xz+iib5V1x3jaXOcqo2Wm/Ks1EZS
         TNaASsYCSQYm6RUCA38k8Cej3CqBTRWIeWNFjDMaXDp/F1SMZzOoKst92SILX/3WNhKK
         LNCkT4ZHm9sv0b+Gwr0uZVZUtqo3t2/tAkDwlBAiBUD7e70bnuvThjhVA27A0hMjrVr7
         QSbbLGYeGqHhulUYhT8Y8S9/JLTG9DYOHuC3L1FbRHnTL9vIPdJJNwFbqbhP9EjWACq0
         aZvatCoVNd/SVZg1VtHzspbCQZdazRyGiBgBofiN3EFkbUAdbDMJELpjrS+w9IAsduGL
         uW0g==
X-Forwarded-Encrypted: i=1; AL+hErEFbKH/uv+Mk7n/wYKRrqeoGDKCIIazNaxvxrSWkJLlch0v+muXE0GWbklrV7S1YO/ggQBGYoxPm5x8Mw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+j3kZtq7my446dbPSt4qKogaPsVWHonOOYux1FeeW86L1+CQ2v
	xD9qAKi5/aXATqn437B2yDFtZmC8eE5QiDI7ZLFcMkZWA0XCUl9m0lSmO2kZtlsLs+s=
X-Gm-Gg: AZFdTZd7ZPcIvf3DB61CG7RVeWKBeX8bb+8q18MqaH28nXLkYntqhmYEWPjn/FF/iTy
	WicqG1A/lUZJ5/zCERjDB5+g42Mmaj26ywvB0PUuHlavXG15uk9Zr0iheb4+vRxePpfIQcMuHQp
	sbkAdZERIiStJeTSXN3q1M2vS7NWOfM5VfpPk8nZFSV0kz+/4pitf38T4k9WTDNdMLku3b0PdJI
	w1QexY/y5hXVvfcwSnfoq7USKjFQmBQo/Ca92dfx5Xl9CDx45Vj0BZZZYveIITrDsur9A9r/CC1
	oTNTS0QmED/UqqrbCYrUcfFd2jxYlGr1KvPHsBbLkEGl+GhPZsZIqwpf8zdriAUXqB1hk+RhzLL
	q9e8baeLPAD4Bt8YzQANMnWSzyVpw53+ru8d87loyjKOqON1BrMnJV0lhVrfCnpxUL3On54nX19
	DzDYbwqIQ562pg/RBnsaS9f3+P81nutWeUji2kZhwU4rrUSUn4VbALQlIllgbvcvPCoz/3wdAjS
	3vnOA6Np7jHPJLEZxV6Iwva0APY/j7eH0vXeY7cNI+pyIeXCGIJyYrQhinzuOdE65Liiri+hANT
	Bi7f2V3dA4M/ay74eboAHn/nCW3r
X-Received: by 2002:a05:6000:288c:b0:4b4:2ce4:6dc1 with SMTP id ffacd0b85a97d-4b42ce46e7cmr29398834f8f.44.1795781935043;
        Fri, 27 Nov 2026 04:18:55 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm45163333f8f.56.2026.11.27.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:54 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 10/28] dmaengine: bcm2835: make address increment platform independent
Date: Fri, 27 Nov 2026 13:22:00 +0100
Message-ID: <20261127122236.4976-11-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Actually the criteria to increment source & destination address isn't
based on platform specific bits. It's just the DMA transfer direction which
is translated into the info bits. So introduce two new helper functions
and get the rid of these platform specifics.

Only the memory side of a transfer is incremented, as the peripherals are
accessed through a single FIFO register. DMA_DEV_TO_DEV is not supported
by the driver, so the helpers only consider the advertised directions.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 0ba23ec6b6fd..1fa7cbfe3c2d 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -275,6 +275,20 @@ static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
 	return result;
 }
 
+/*
+ * Only the memory side of a transfer gets incremented: the peripherals are
+ * accessed through a single FIFO register. DMA_DEV_TO_DEV is not supported.
+ */
+static inline bool need_src_incr(enum dma_transfer_direction direction)
+{
+	return direction == DMA_MEM_TO_MEM || direction == DMA_MEM_TO_DEV;
+}
+
+static inline bool need_dst_incr(enum dma_transfer_direction direction)
+{
+	return direction == DMA_MEM_TO_MEM || direction == DMA_DEV_TO_MEM;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -340,10 +354,8 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
  * @cyclic:         it is a cyclic transfer
  * @info:           the default info bits to apply per controlblock
  * @frames:         number of controlblocks to allocate
- * @src:            the src address to assign (if the S_INC bit is set
- *                  in @info, then it gets incremented)
- * @dst:            the dst address to assign (if the D_INC bit is set
- *                  in @info, then it gets incremented)
+ * @src:            the src address to assign
+ * @dst:            the dst address to assign
  * @buf_len:        the full buffer length (may also be 0)
  * @period_len:     the period length when to apply @finalextrainfo
  *                  in addition to the last transfer
@@ -415,9 +427,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
 
 		/* update src and dst and length */
-		if (src && (info & BCM2835_DMA_S_INC))
+		if (src && need_src_incr(direction))
 			src += control_block->length;
-		if (dst && (info & BCM2835_DMA_D_INC))
+		if (dst && need_dst_incr(direction))
 			dst += control_block->length;
 
 		/* Length of total transfer */
-- 
2.51.0

