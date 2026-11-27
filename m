Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781935;
	b=OZiilQCCdE10uj14D+VC4fsFvVhS0hmxmq9+pdjpDe6DYIIu3x9VEbC+/59qbm21W/ge
	 MdhVnAQrJwlpaqQYb3hCNjHf9ve5O0pvFJ5th+WvbDBCn8p3tsJHRapdKks+iEpFHBdxX
	 xi/U6UjznsEyGj5MGrqQtmhQr0/qodYcLz9RNvEv6bdOUJCuEhTuaOQUypt/REBWr6mG7
	 whhSlCzfXaTViibiagJvPHFoplVDfU01z/1RlRKXnGeJTgGaMn6nKwHh9/VK2URJS90bt
	 TQi0fkwsMqhCgVzPsJAbA4YqLbs0/SMJfL2Cvazi8Acrkztf+gs16ba0tnSecG/EpEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nvvEuWhQRTxmdar/fCUOSARTg5nDRBRjuSNvJv1P61U=;
	b=ybyIiFfEgqp/WQAEaa4kAULGFdDQ9QPWZW7tzPHcKWTovbQRsQEXcRzuQQKn8e6Tdmny
	 ARD50V/ymmuarsBDq/kkBetR/rBzmtd+1tjF5KUqvcF6k49hfSxy0C/jl0nAerHFAH26A
	 oWgyAL12PaUtzFZVpNMMAOPLftX4ESM/NqBGP4J/bxeu7NQ44DlpRkuHiT5MDQMHmWMeb
	 jkEPgbFhslGNsNPNKHfV01kVfyan3kgqoxrxyj/pULqYjxqEYNIxxvhtu6wfYxUE60foT
	 Wit0MFsiQa0ghHWGRPXt6J41WaXE4vsH/QPnSu4Z2wB3Xiqa4E80cyXf9n2zegv0jMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fX9B0SIL;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2145D60A263F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2145D60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fX9B0SIL
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso3649707f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781933; x=1796386733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvvEuWhQRTxmdar/fCUOSARTg5nDRBRjuSNvJv1P61U=;
        b=fX9B0SILmEh8F76TCxRPqNwZrOyG8r32Icr6Jigt2ztTYcXfaXHVVPSBDvjJZgQZZa
         t4KeG1rvtDeLvUYLmgayXGG/12HY8RMXbjutqr7DzfaPG9wufX8OjNpK5yFPkZnX0JuO
         6S1WbElCD0q856RYuLJtyDTKdbtKWG1jZCW2bd8ABLM+2wVEQbHdLxvnzkxkXgVt7bvs
         8VdkDWY3Oan1uTdIHSuimSBVUfDRbejgPhL7Rp/Y2gJtlinK9TkHgSXa+uLeaxeJixVY
         2fRwNS+hPlYgNecjc+GXy4RIA1q6gPSjQ99s2L/zM6+HGIhhE3Jg3TxG1619W3Jsug16
         y6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781933; x=1796386733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvvEuWhQRTxmdar/fCUOSARTg5nDRBRjuSNvJv1P61U=;
        b=j6l9lXGj6pFz592z7Zut9RDyW8xC5gKmBJ/2VmxvPj751ed8w8vXlwgOGsgPdUkSaq
         jCemJq49jdtCe/Ipg5PNX2HF8SX1c1gQ75Mi7AEx6Ajncp62QoIQknNGClh+Ql2aPnGa
         T9V9ZHKager7tcEoAqs03xgb5yhbHy+kpMs/H6DkZyvRFRRr12ZOC9dPBU/XRdeI3C/5
         qvS+TogSadLySRhoEde9LBm7enn2WgmZcbcwW44hyvDqPYD7mpwD3Mc1tKWZk+N9nHbB
         huGj12ch8Kzk4EqwduGd6f5V891mxDEPWBf9sEwek9fUbYew31oJKqaKRHd6PohJcjuZ
         7pCg==
X-Forwarded-Encrypted: i=1; AL+hErFPw2TNU7TCQUKOWz0nrIVfVW0A5wZqiByfd1aVrqHBCvBZLkfUNT0IYCAQMCFwU8hwqeT/CVARfQNfIOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CS+p8/5beL43ZMY251T2MY/apjjwffz1giyYYhjudmXVk4aSB
	XZ1XZMYBlMsf8tR5oUXkb/qLBTRwY67ZVxrwuPmfucO+xO0IfuM0YHs6aur0SfzOIW0=
X-Gm-Gg: AZFdTZf12x3oH0vokx2duhZhQO/vWqApW8oyLw7gJFFGXehj4P0sT1xjodoa6rBuOmQ
	/MwgmBkCFkVGlPxXU3BOSEHJ7NNtM/lXRMO8ezdq3nz1K0zHdeFt5GbSQ+hF9Dtfgi0jLRDn5R5
	3RbR0Y23xpSYt46R/vvMGzSYxUhURHYSUay8YinbY9tmSfjbQfIz1aWiNhJo8FOK6Yi6jhy950R
	tCY6ToWQdwEZxMGX7YTwGSRUsoG5PvHv1kt4pOlMjTEano6V3A0DqnamrB6LNzNSHzcSDHgpARA
	04chxVVntYFwYOIvX7igRw34aGbBuKuDHq8GXYqkc2caK/LDxoYeMAaR7QhGOcrgGqFLNa/NgYx
	ezQ9C80xGMcbJODzCVUYjp7qhraL58v5IZe6iQADhGyY+reCv/6DR4uPfHTgftzwbOB3xNKRuBv
	b5vM5aGb56qG7iH6qFe1qXPn1IAu10sVqOVgnkukCPTmc1U386UHpzO8hyLX3qkj/OyfHSYZ4ez
	GiUV2ZLH+bVQAS+jDUeWzyujMyQO2L808ueb37huK+odULxruvea26tO4lBFa+K0pn5sATNwGgw
	TmlwW7TxVydTEHIAAarXMzSDF7SW
X-Received: by 2002:a05:6000:4028:b0:4a6:bc53:246c with SMTP id ffacd0b85a97d-4abb3956374mr49731029f8f.42.1795781933498;
        Fri, 27 Nov 2026 04:18:53 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm38491893f8f.35.2026.11.27.04.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:53 -0800 (PST)
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
Subject: [PATCH v4 09/28] dmaengine: bcm2835: move CB final extra info generation into function
Date: Fri, 27 Nov 2026 13:21:59 +0100
Message-ID: <20261127122236.4976-10-andrea.porta@suse.com>
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

Similar to the info generation, generate the final extra info with a
separate function. This is necessary to introduce other platforms
with different info bits.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index eb306397b0fa..0ba23ec6b6fd 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -255,6 +255,26 @@ static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
 	return result;
 }
 
+static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
+					enum dma_transfer_direction direction,
+					bool cyclic, bool final,
+					unsigned long flags)
+{
+	u32 result = 0;
+
+	if (cyclic) {
+		if (flags & DMA_PREP_INTERRUPT)
+			result |= BCM2835_DMA_INT_EN;
+	} else {
+		if (!final)
+			return 0;
+
+		result |= BCM2835_DMA_INT_EN;
+	}
+
+	return result;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -659,7 +679,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
+						 true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -690,7 +711,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
 	size_t frames;
 
 	if (!is_slave_direction(direction)) {
@@ -738,7 +759,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	dma_addr_t src, dst;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
 					       buf_addr == od->zero_page);
-	u32 extra = 0;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true,
+						 flags);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -754,9 +776,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 		return NULL;
 	}
 
-	if (flags & DMA_PREP_INTERRUPT)
-		extra |= BCM2835_DMA_INT_EN;
-	else
+	if (!(flags & DMA_PREP_INTERRUPT))
 		period_len = buf_len;
 
 	/*
-- 
2.51.0

