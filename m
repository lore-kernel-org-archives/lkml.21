Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445651;
	b=bjETjniA/cxeCeMGNxyKAG1JgqZU5lp5bRxfb1ZPuCXCxuGICe9j5HKfavL9iySu1Y8a
	 d5jg8pW4HheqmsDqx5FpawruSQDCV1rvFg6KSGXkpHGAXt8ILY14mwQ7fwZc8jHi5Il4D
	 8tJL3q7JsOMkGk19j4pXMDnxZwE+su9UpUMkMspX4Ll7ndnQx56/64jinimJ79EdkGBuS
	 5SZrlF4L8dfSoip9vKcuARkALGhD7O2zvg093M6u3DtgQH5PqZ1Dk1goO3ZOy0nZoQlhj
	 dnjOo4IiZM53twQyJMq/olhitoprCTfSRwv2ddg9s27QOczJgHEz8NOTZOnaaqfHGyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FEdGm/AcXh2womt9GiV7Pf7HrO6Vbc46kckpe+SSelU=;
	b=iCpiWiYmiDbGS5JN+suZcsUplsA5ZqbT7cNPxoOvRQMH3M/adp5Utgj3p2OZ7RjqaB2s
	 ZotapDyuAtPsAqIT1HEsoTdUP2vDl/BgbifBWl+dlVbMf9jx7thdaF5mTYqRbwSGKgjhS
	 p30Elk6XWIZJ+5uFP+LXp63a/TzmPEDFCM7Aa1t5V1gpa5DN2k5aa7FsTS0aD3ZWBaHRA
	 AQ1GvzyeAvwqoQu05aOqtWN/A80JaL0vVMzumVeBBYJk0UcasdqmbnkGsNH04d596c4RF
	 6srM9fIorpq5678Z7hhqUXhonF9TDdjQYodSbbfZ7E44vmY8ln6IwdQlZkSWjQFmGuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HL5uLzsn;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C902E606D150
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C902E606D150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HL5uLzsn
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49465892f7bso2474783f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445649; x=1796050449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEdGm/AcXh2womt9GiV7Pf7HrO6Vbc46kckpe+SSelU=;
        b=HL5uLzsnZ0HLGVR9tCA2U0cJX9QOExXCdawGBp8kA/TdqLrTwxqEKO7J5+0hyIpiqw
         Q6vXaVD9pW6ZsRoOzUdxG5bhK+dKc7P66U0qcMArv6mMI5cWA+2NLbEIGZJ2NXAum7Qg
         0+gjxCFuE1HvC3IhRJQcTZv0UKI6f3HPWtx5/sqmT0wBmaKU9fXvFN7XWSwZjsmv4ho2
         qLFT3lS7Li50VOoU81rpMkvgGicgdiaSXZ1AxdwiDW4DzsB0A2yR2i8HxnHIX6HqEL1L
         DuUXLdGzJCT62dBdQ0bGBy/IqIuhHeHJXgK3g3wp/PsuVAH5Xbbm/tD2KMzCBfEGCPdT
         sh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445649; x=1796050449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FEdGm/AcXh2womt9GiV7Pf7HrO6Vbc46kckpe+SSelU=;
        b=V76gWwtaHUlNTbq6d73mAZRLMWsZdwKDb/28uq17OFId4Z47OiBqXPLyZQq9YJq+Y4
         ++T+lqD95mSFEMx1TtkUdhHUWWAnAexcWBkcwqwb7oC6Zefr3trjmPJIxRpoEuGL+GGo
         nU8XhTwXx11BTgRgfowg7QOiyKgB4y1AUBLcAIF50Y+dPVXAKGMEQdj1xNH8lqGiLbwR
         2sf9DiXgpmpgqkhrWEuwf/lRxsBMfObWDfeGY3idgerptQnUwSJicdmXBDyujXDMtMTk
         5fywdqYBHpeaKCBPh7msBi+w2iQLjYNcOCXDZSmFGf72ixjAeBmb2YC7G+ULcuGlfwVi
         +SKw==
X-Forwarded-Encrypted: i=1; AL+hErHnF7aDXfoBTIuQhJ5pfqeOtgoz6pKbZvl9UMeCHGQxvkhHrX8xINQVkQh7ioKbBDSLAw40OFuJHz8WcCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z85q0sjfg/LZGKzuUqd1M0sDVZulA5BiB1DAa0JBxQib5VHXV+6
	eNTe3S153JScUOqCLaqWFy/tbL6Kl7FedfmqQTpBs20GHzYrWAIAUB2m2eenAdyo73Q=
X-Gm-Gg: AZFdTZfJjlMZZV/L0VXS70hU9TquyGsYsJAg0BnJ2sGqXr71q55prymFIUvkS7eTzXI
	3j3GA19wzrgpZ8s6WKkOh/KXc7DCdKVK1icjcYei2T5Actp2DuXVBwG9AGO5AWXYmfAHQbCeLwO
	soxZMvdrPeRLhCXIH8TCCaXU1RzzXOvn8qoIa1qvLTyRSLbDvKYMBsd9YnBmilUKTPyGNRiW2Al
	LAWqiWhO+KjLoFT6uY6Jo7aDIRuL5K9x45seYfdK3ku9wKIe0mqDKpXhjSLHZq/PGf3GSlpO3yR
	1red4nul+8eCb2YCl09lo7LPzhPv/Q4b7hFmL3HPmXTh9hXUTwSdpTTz/vdB5ZjXp73iwbJ1Kw2
	PMk9Vq5TLVwfbMglp2eiCuulcp9VyL0AxC5CUKVDZ0VrEhGQdvcqcfMIdaqZEtpo2SOem9I47Ht
	h4iJaxTxKvFqbDTzqCsM1AAaOEmBJQJuhbNc+JxbUq+qdYHMDWnISRePXAMe0GpY+3YAjkx8j6U
	04ccRL4NTTv2B1XnnPPxtH451z2D4du6HOcmdOiqadbhpHTakjC58nSpVHFINZsSsYSCy35TQgd
	T42KHX89+THPOZA1lFFHTyhPdzM=
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id ffacd0b85a97d-4abb59e2898mr22790459f8f.53.1795445649226;
        Mon, 23 Nov 2026 06:54:09 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm22701444f8f.41.2026.11.23.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:08 -0800 (PST)
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
Subject: [PATCH v3 27/28] ARM: dts: broadcom: Set the DMA flags of the HDMI audio channel on BCM283x
Date: Mon, 23 Nov 2026 15:57:05 +0100
Message-ID: <20261123145728.29082-28-andrea.porta@suse.com>
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

The upper bits of the DMA specifier of the BCM2835 DMA controller carry
per-channel flags, which nothing uses in the upstream device trees so
far.

Request wide (128-bit) source reads and skip waiting for the AXI write
responses on the HDMI audio channel of BCM283x, as done for years by the
downstream Raspberry Pi device trees. This reduces the bus traffic
needed to feed the MAI FIFO.

BCM2711 is left alone: the downstream device trees route its HDMI audio
through the 40-bit channels, so there is no established set of flags for
its legacy channels.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 39eea8ce1058..6267f0a67565 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -130,7 +130,8 @@ hdmi: hdmi@7e902000 {
 			clocks = <&clocks BCM2835_PLLH_PIX>,
 				 <&clocks BCM2835_CLOCK_HSM>;
 			clock-names = "pixel", "hdmi";
-			dmas = <&dma 17>;
+			/* DREQ 17, no AXI write response wait, wide source reads */
+			dmas = <&dma (17 | (1 << 27) | (1 << 24))>;
 			dma-names = "audio-rx";
 			status = "disabled";
 		};
-- 
2.51.0

