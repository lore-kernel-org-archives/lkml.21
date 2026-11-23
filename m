Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445646;
	b=C69NrLA71aMMOPaVdxC/mNUzmFSq9VoDVUsQQNJhgfPT18I04QONCwXEQfYy23l4T+Ge
	 MDhPFblA+uDiQ4JeXsi9+4EvA76hPTrZjM2xm9htfjwRQSwX5RmnzqAdMBY2EZBSsca+W
	 YTltqB8uzgyeOME/+HB1sg9EBn4rcpn6ZDlSCl95KeSx5P/ZBruVEOT43JkAvHuAL0cj1
	 PdG62DyWh2xIcOEtf2v7LskWGnNQkIup4SIwSXSjQ6irj9jYiZOkcA51/O7q4ptfbL6mF
	 T8gB28MrP0qQEQZBE4Z+imew0ljTEcW8BtfMcOxReuYZp9aS6d4HkELjrnm/T+s/FRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sknB6aQ4PlQDo8HZucV1PufjxI6KnBGvn1RhZrHtfHM=;
	b=5mzrxhw7rhBR/aRnMNTD4wTtI1D5IZYOZnS7lGBPsGpMZBSU37miIomipbGw2sg8ZZnd
	 IMF08go1KA557ZLpe1pfdrnV+NTtXtb+u2juBdQ48spY+DHLTGpl5LN7RtVtBe9/5/xWV
	 UDhMthuXb6RzgRwlvrb0o9VNHkPL2oCM8arPpyGUwVWDyVUx8gRW1IbWXRoczTmppD7AC
	 E97WAQuNG9ZyQ4HxMBR/w7BebgGciL3wI6p8VzlQLKYkTrMgVrxiZOjhikXx5NPGRYhcf
	 U3byVPn2Xna9Azm7qe6F58dgl8gHIOmMDyw36bIGkxOfV/NECZzlNu/Q2KyFHOfuChA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="IRC/4nqI";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF47606B08F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF47606B08F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IRC/4nqI
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso33093975e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445644; x=1796050444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sknB6aQ4PlQDo8HZucV1PufjxI6KnBGvn1RhZrHtfHM=;
        b=IRC/4nqIN/TukIVJjlr+quumteedHeJUY624RxL8kTaq93bj/VPPgv6w4dJGH0g9Dx
         EkJeP0YBVbnQwK4lwqwcqmCsFgwDhuc0qy4w3hG+8cmJeJoR38vN8VQF6OhNc04cAjcn
         NkSAX+yhzAh6YYQYvnrS58Wcdk0l1AXYshXjrpvj5siDdDfZqNDKYGThka4tTbYTocVh
         nsqCntJnmfJ/qDhbXMDXshZk1CshSH3yJT31rgjgFF8iCaknQ1KkpyFy1dKYUXI1X697
         Uama9nukcemmJlB1QZffQ/szG20xkvRilbDSRpfNivGJQZOh0PBanvLc3Ym4SqyhYvas
         Z1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445644; x=1796050444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sknB6aQ4PlQDo8HZucV1PufjxI6KnBGvn1RhZrHtfHM=;
        b=i1Xz+9yo52DjzEWo6pbfbI92UemUU6QIfi67Ij1tmQ+rtZLu9Rwuymj+pi+s6Vexih
         77R7Rpb71ELEiaw/Qgzqvjaa0Q7Kl+5ClLSp3qcB65zsyQMC5qlY3AVj6FdPyKJy1doX
         6pLji6f4d9B3c3n8tAY7jn10bYTyRjNTKBbqnw3awjtzjmUVUZDavOoiRGM9ATfNAVPF
         GuDXAyp+d7uGTnGuLL9cHltilsdKCVP+VxDWaTnH7X+trMpOn75KrmgL/162sV/XmXuH
         9Qtx+X217i3VZGcu/7H1FH1UaVDqd6oR749zBn68aMF4rK+hrTENJbKxryDEhu45zMv+
         zlhQ==
X-Forwarded-Encrypted: i=1; AL+hErFPR9NIoBWvZsEhHFB3iRDtzZK3BvpONlZrjTU2eWu5tWkrq22zpCJaipJcY1rrKsnkkHkp0ZmDghRHBGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q9IHlpVMMZ+CNh7Km+bJEWW/eNslukVObkFjMB+SRcmw5gBDB
	LK3CVom2SLkNplYN1RvpU6nfySqHtHQKAub1AiDS2a6IG1mHNumZ21ODcn2xXxVQmhA=
X-Gm-Gg: AZFdTZfvPFxpFNt6myUbp7yCQuwCLaOm90uer+l7hHAQk9IrbENZj0fTARCrecvdE+y
	b2L0VGfIJPg7o/DNbahN8bFPm6Yrr4lFeax8hRt7vnqfXBUFSPHP26jis5QpTfRImtbcu29+sCE
	OKPLyjxENlGKUgvoPiKImLRJ9P/8lHKbU6vYtu2RbdnnZh2yKSBiVvcDPZOW05XTCOJHLEajj1P
	yPetYOHsgizPx9hSDiccbirPuxYSXT1ig39ddb5h0ujZo/K6c9jj/GEZqyFW1TNQb7qTqgqNZSV
	y8fpimg7EgTIpHwe95LH+b6tCxit60r/XFMy6t6N9sgBcA7SdU+LAhT1CSwQL59sx8ZU926/KQF
	oZX8cbKxo8w1x14C+ITlJDxU03fSHX9Sqe9wdGTG27Y3o2IVjL2vjQoqmRkqB+mq4Ua3jr6zIA6
	njoio5La9St1DhH3/qzKn2/0QdYvtsQ3oegZvJW2rY5H+lZhaC6y6bs8/DTcfsAbeqBsS4RtA3c
	BHkTXWHzmV1aGgT/TkWoS5J3kat2DoOMzUCi9tMvEVJjF88iWXhO+d7nIYQJsPbbpf7nMBG8Ni5
	DyQM+DjSC4uegyPnTqEQCbsxezc=
X-Received: by 2002:a05:600c:46d3:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4bb88812c9dmr247790145e9.25.1795445644387;
        Mon, 23 Nov 2026 06:54:04 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm663264955e9.4.2026.11.23.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:04 -0800 (PST)
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
Subject: [PATCH v3 23/28] ARM: dts: bcm2711: Add the 40-bit DMA controller
Date: Mon, 23 Nov 2026 15:57:01 +0100
Message-ID: <20261123145728.29082-24-andrea.porta@suse.com>
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

BCM2711 has 4 DMA channels with a 40-bit address range, allowing them
to access the whole memory of a Pi 4. Add a node describing them.

The 40-bit channels see the RAM at its CPU physical address and the
peripherals at 0x4_7c000000. Describe this through the dma-ranges of a
dedicated bus, rather than adding them to the scb bus, as the latter
would change the DMA configuration of the PCIe and Ethernet controllers
too. The RAM window skips the peripheral window of the CPU address map,
so that the peripheral FIFOs are not translated 1:1.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index f475422796d8..d152edc069bc 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -436,6 +436,38 @@ emmc2: mmc@7e340000 {
 		};
 	};
 
+	/*
+	 * The 40-bit DMA channels see the RAM at its CPU physical address,
+	 * and the peripherals in the upper part of their address space. Give
+	 * them their own bus, so as to not affect the other devices.
+	 */
+	dma40-bus@fe007b00 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x0 0x7e007b00  0x0 0xfe007b00  0x0 0x00000400>;
+		dma-ranges = <0x0 0x00000000  0x0 0x00000000  0x0 0xfc000000>,
+			     <0x1 0x00000000  0x1 0x00000000  0x3 0x00000000>,
+			     <0x4 0x7c000000  0x0 0xfc000000  0x0 0x03800000>;
+
+		dma40: dma-controller@7e007b00 {
+			compatible = "brcm,bcm2711-dma";
+			reg = <0x0 0x7e007b00  0x0 0x400>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>, /* dma4 11 */
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>, /* dma4 12 */
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>, /* dma4 13 */
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>; /* dma4 14 */
+			interrupt-names = "dma11",
+					  "dma12",
+					  "dma13",
+					  "dma14";
+			#dma-cells = <1>;
+			/* The VPU firmware uses DMA channel 11 for VCHIQ */
+			dma-channel-mask = <0x7000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a72-pmu";
 		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.51.0

