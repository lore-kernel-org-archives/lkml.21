Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781961;
	b=v4nTBuDeCyaDXX8Ss4sp+1WyAz2lVMR+aF1iA8LX9pZTDm1262vM6O5BfW9HqpXFgIKE
	 LnddIuygM60rRiTea6imCnhP8+NqLJ5rtH2fBYxCD36UNZG8Mk38so9Z/x5ZPuVyOT79f
	 lrc6astAFyNzbpBLyKRKn0b6sJAnI7qJJh4ST6t9TW+1erBxfU66nR7ClJ8c7Io9P7eFn
	 ntOGc/uCreS5/LRXCqjhVKwpoW/ixFrAwSJCoA4B4M3L9EO6ZYeCRfNOECIA/9L2JaqOS
	 bAjG89IhEzKtERTfyr/Sw9HgFmUt355TKCy3gtyHPM/nGiJ4qk1hkMR5WfvtQHpZkXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
	b=5r4bXPKKtKlCXRWzXSIiHHz5gpPrhbl+kqC3eC3K1JoVyzDBepc9DsqmUU2/nTk8KI/x
	 UQsgaEnN3vU1tsvyRPQfqWC68dJZSdr/zXFcfxDSwFzrOErmDDEor2ujYHrNbJr9w5xVG
	 tU0avItqFIvUNs2hGTFlsZTd5YrCDsYJ9L0bc6x/IWEanVfxpQVq7p/+ucFNDNYMzcf6s
	 /McrJeUthBhSCo1LLOWRgI5L0b41HXOAFhyPnXuyYGDLFY5HAg8lQRx1PiB5HAhDb3SkL
	 mmLdNTuPfRHYCywvy5iW7VEhDWYtSKsgQ7z/8DWDRnBf5/InUlcrGvlW7wg6fkNgo9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MQ9lQQJL;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1F560A6F79
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F1F560A6F79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MQ9lQQJL
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a42b34e930so7034659f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781960; x=1796386760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=MQ9lQQJL9N9Hsur/539YVDoKAS5MaLP2BhDa1btEqFLdswuokZguf2Bz9VTkPXSHi1
         Yc7NUOMB95y9l4QECTegd/FLy2HC2P+bwPexKDaZd16a68gaXsFzsSW3tH5gGS/zUxrE
         J5mUtzMA4hNEUDqXO3Kl1dMAOshGfzSyf5FjQoUbkk8wg7aKjit3tutPoNODFhP/LWcA
         YbEc9fqp5J4j+cQwI0Q93MM3jOVucW2MIC4jNI6Wvk0NLOnelPwuwClFLDk2/f8Tn61K
         alN6+Y5FxfAePD8RrOm/1fP79SCu8J7yw0pB91moaT7wNaWY7hC2hYK4Y2SP3SRrjYaW
         h08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781960; x=1796386760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=ebZsBfptERG/rW9UhsLZV+yVAwiuSpE5Y+3Z4UVZ39tlut8B4Ugc9M9Wgw/9/LSG5a
         kHIyQ28YD5BKOsluog7USglgBB13K6ltV4SPFQ7hhETfPBBE7tVRQMgc9TTXl0hDLBzQ
         X+gfSxoVvvfi8wef9wHfQZ+7XztTRRbW2S8Mq27SZlAPo+bhiX0lHTg5e/U1zTPR3ryJ
         u347u4WFjHwgq+foMiODk/tkrsDf0bsUo2i8dcYROenigniNHxLUGVo3mpGuCq8B33Oz
         xQyrI3czST1kaHwcKEVbt7y9upE+lXG09054w24h6TRoo3hSJOFTxhWDizlEhsIMGm6y
         D7tA==
X-Forwarded-Encrypted: i=1; AL+hErFaOdoEKdIeZVTQkQKe8T3njmDOLS2YLyb01GZpw/GUZwfbGSRSoulWt8olwXQC03eq6gnjlxNpNUGa/Vw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X5mHnGzK1wKBH7oGEwTnaqDJKTnb9XA56tJZVgA+7ihuaDB+1
	h0rdRwvAsuwZ3CIuPKe33c6fd31uIviGiLTW74+l/QZ4QvBK0Fh7P5SaXkpH2ljCYc0=
X-Gm-Gg: AZFdTZe2fzUs4s4bZLdcBirZLruSUZoruONUdl5Ivp0cjtEcF14jz4wf26SBXls7Mc1
	XndJSVrFhYmgCA1fFwl9JG4QB4jMxSI1jx3IFm59lOB0Tt1pOSNaS8L9dYnQOum60wmEQwKurCh
	+vfvbVj+2bKzi/V0+tJl0LoC1yofubYZXG7k14lvEGODdpOIjnim8Q5+JdZcDb5Uyjf9des0eOA
	H7Z2H07imjZeHFGhkE3icTnY5fDLnNca4yuGNG5ZnaE9RAAjUluDIq5PYYi6ZA47vU0jkcNMESo
	nKu3REYcGQy4NabjHvaApIcKT2v/mho5qPUQHcNizZKpRSJ+zRRHHmFxvYJx6/jxqJw0l9f9tZK
	0wqMUiOk+noMCwtwNyKfWu8jnEtZZEbW6wI0Co6EF3u/lSxKyFZz7EkSquQVpu+XNwVgz5PcEBH
	8MLqPIBsQbnjDHfdHm8Eh67v9E2WqrjFj60pFNA97Rtt6NBm9GNgWs5J+xoHs7kkLop5tRFMpwB
	CbFpJ9b2Jc5kdXJa3Hp9ctIBvcHcZ28BFI5gl82bzO/ZFfSSGM/+dKoHtMDycsBtR/3TiXUcJCm
	R45LfBijbVWtsWMqrZXmhJ9GKcyQnnn4DV2WIErJKs8BA9i7bA==
X-Received: by 2002:a05:6000:2489:b0:48e:2108:4d28 with SMTP id ffacd0b85a97d-4abb1baaa3emr48985418f8f.13.1795781959788;
        Fri, 27 Nov 2026 04:19:19 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm47186924f8f.52.2026.11.27.04.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:19 -0800 (PST)
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
Subject: [PATCH v4 26/28] arm64: dts: broadcom: bcm2712: Add the 40-bit DMA controller
Date: Fri, 27 Nov 2026 13:22:16 +0100
Message-ID: <20261127122236.4976-27-andrea.porta@suse.com>
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

BCM2712 has six DMA channels (6 to 11) with a 40-bit address range. Add a
node describing them. The axi bus already describes a 1:1 translation for
both the RAM and the peripherals in its dma-ranges.

Channel 11 is used by the VPU firmware.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index edae2f3584a8..7ba0fc540257 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -676,6 +676,26 @@ iommuc: iommuc@1000005b00 {
 			reg = <0x10 0x5b00 0x0 0x80>;
 		};
 
+		dma40: dma-controller@1000010600 {
+			compatible = "brcm,bcm2712-dma";
+			reg = <0x10 0x00010600 0x00 0x600>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma6",
+					  "dma7",
+					  "dma8",
+					  "dma9",
+					  "dma10",
+					  "dma11";
+			#dma-cells = <1>;
+			/* The VPU firmware uses DMA channel 11 for VCHIQ */
+			dma-channel-mask = <0x07c0>;
+		};
+
 		mip0: msi-controller@1000130000 {
 			compatible = "brcm,bcm2712-mip";
 			reg = <0x10 0x00130000 0x00 0xc0>,
-- 
2.51.0

