Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445629;
	b=fA/jUJRXaKMVP2inNfNw0g0r+lA1R5O5131UTG1ioCPF1IE2tRNaABrNNT1sJtZkoJdr
	 0+Z9xP4ub0V3STFPy3IVZlb8CR8zcUQpBmBXs28caEyyyKmfjH8driovbQiCbpYGKGQRM
	 BBkcaqvXvMJlF5aOxH/DSFks2eImoYUw/j6gmi5hq3wXsHeqvEoZ+b5C7Eu2yQDPkngs7
	 EEAXo97KMe0OcqH299IxEvhPW0KZ1/3XYGA8iWGbqK8T1YfnJ4XoCpESUbey42XnK7Ruo
	 6BQDH2rqwVDQweTT3+77GbDRWlzZgvUACE3gBIU0whM3D+LZUkKA+skWA5kXHHukd8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tVq/cXwfFrUYTvVPC8LWfCG8earbmrGADPgjnQonGc8=;
	b=v1jMIIh0w4nPYqR037wAkIIq6n0szDvBaYj/YTag0O0ruu9k/CgUUS2/FF4FqziOnItm
	 8/GcEXq1EINdHgAcvfK3opyXtzTYX/kPeMuNZdcAheg2l9SYVDQKOQzJDquid8jGY4pgF
	 gbVYR2LIleiSiy+gc1aQhT5I/sPD2kBptacKKb+psRSSBwVoolEs0hvuizYruv1pdcRfC
	 /CpwM+PyVc/AThdQFMQDtf9QJTq0IuHg+az+2YYXlXBvLnXEVGFfCeHIpE0QgiCwUyj6Z
	 eZSYXXNgC5JXjONRZ2yuDNQ5xrPYwQCIpGG/9q57ljEUhUouoE0xhIeHYst6JMqpEzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=euNGAZ4K;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC1B60A380F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DC1B60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=euNGAZ4K
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so33117185e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445627; x=1796050427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVq/cXwfFrUYTvVPC8LWfCG8earbmrGADPgjnQonGc8=;
        b=euNGAZ4K+o2frNtFCLSaoc+w1MzWYRrC2DJ9LD03fOP+T3gQoBvowcTrX/72ennQDm
         iEBv6VXUYfx2YhE2Sx136lkwo3vVp3HZoVB9p+uerGtN29cyH7apJ+JuzoDOQbYL0e23
         TyCKEHzMIpKR72r+56Wn8b0QqErByHwrqMaQU6qXN7J+3KOL8CHjrdqXy0eFl/o1TRbb
         xKNmJRHDxhR0oZCHhDERJtn/K7DyeNMVI35IvrxROrRhcaGGDnVFkLW57QfqLBjqbmDh
         0J0aznUTlcp33hv51SPkPHpnDd0NeDkfeq3J1VU2ZUU5HWBkB3yknS90YNhsg+31TjbB
         Ly1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445627; x=1796050427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tVq/cXwfFrUYTvVPC8LWfCG8earbmrGADPgjnQonGc8=;
        b=qK15z0j1CWc2PEQUDTbYhb1ZUXEIEHwXS6z2LSZ8uBh0ZgdnWZF7Hbh2YfCsR1XvBD
         71LrhPwozVfmcWkxoUqll1SqMQD2HPt6gysOe2tRxtX26eT+RK9nl0dQPRXkn7jO7OFD
         O7qCoVIde/Kra4qnigJOuTfPG1kkYzZ9ZZ9q4DhYpCyAEghU979NTc0XfmR/I8Wi0E9W
         cwx6HaGaYX5X19iWZe7ZS4RpF71Y/UrWIGWM0yFnsLUzgDxeRM/BieOan7QDs5Z0TE9M
         KvA4+7NPZU2vNAnAsBRsVEkWvgZPWi46KGEdXyGoiQyk6yjPVHkOavzDa6XLxFUNMK3E
         6EBQ==
X-Forwarded-Encrypted: i=1; AL+hErGGQwoxkUnQocE2Bnot4j6uU/jXLZHOuoVuDIQn1PXUcAREc79osUJcYzB2dX2byI29ep34qYZc5f+JEVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9asWLBHw1eeYSrNELJ8WP9hwdZG977WKLCT6p3T9frrxtsKRWK
	4mwxqdczeCbsWNluc1pZmxqJ3RNerI1XsqBMZIJG9Oun+b0aTwWfYJ0y4xSr1hOBVCY=
X-Gm-Gg: AZFdTZdL+hNnnQnZw1rm1B/Ki6ae+NeKuwS56FEk8P3uPNDMZp2szMVuR7XfxIM9pTU
	81Mj4ezMWwhapbMYWPu8thebI6Sq+R9t+G6/6+3aang7oFYSdJh2jwnwbMSf6cVFeBCj5XZVRyA
	/4iIjUtG8LkHcvgRCXJWDZqmoWg2cQ5qx147Rd5aICngbLU6uMcBWzsvRGUKu9iiAIwzgbGWAgm
	6qceKlZd4xYqM31oH3h3qYrJF6eFXrFExW/IIdfoBJNwMm1chAZeP4iX25GnPwkitmRpOyAHqfF
	Y4GJ24o5zXvY7mA9RX4V1ValS3o6934ZkF+sFNw0hh0KW/3KF86CkUTdD4eCsggbe2Oh0FZ1Fo+
	vGe3k2mvzWfOljgvJof3oQSJ5XM3PKwXYMUu6ny6+IJc41Lad/WOu2UfdlNKj1ZRKlKAGOYr0gR
	cFMHv8R4EODL+HhNQnOqJ3jaS1wDdET72JRDVIwF01Okg86bOTOmHfYOBC17UgWwjt5uCmrVjW3
	YPuwoxj8k9Pl6dqPiWl+zqXlCcutunkmQzfKGu2+Kl5iv//RUv2moTQ+aBGaKBHsKqEIqd4NcOP
	AFDW4AyEJME6cLQxKm3cRbibQS4=
X-Received: by 2002:a05:600c:820c:b0:4bb:7987:fbbc with SMTP id 5b1f17b1804b1-4bb887c29b4mr212865605e9.1.1795445626921;
        Mon, 23 Nov 2026 06:53:46 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm663237455e9.4.2026.11.23.06.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:46 -0800 (PST)
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
Subject: [PATCH v3 10/28] dmaengine: bcm2835: make address increment platform independent
Date: Mon, 23 Nov 2026 15:56:48 +0100
Message-ID: <20261123145728.29082-11-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 77b3e2f58ac5..6180a2737e07 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -273,6 +273,24 @@ static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
 	return result;
 }
 
+static inline bool need_src_incr(enum dma_transfer_direction direction)
+{
+	return direction != DMA_DEV_TO_MEM;
+}
+
+static inline bool need_dst_incr(enum dma_transfer_direction direction)
+{
+	switch (direction) {
+	case DMA_MEM_TO_MEM:
+	case DMA_DEV_TO_MEM:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -338,10 +356,8 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
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
@@ -413,9 +429,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
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

