Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781956;
	b=3gbPaf3JUqYrMAcf2IYzvpjX4nEU47d84OY6Hw0fXKG7SrOw3ZfbA5mvy0SrucfP08PW
	 pPgsSogkdXv+JE/SR8sUa4HqnvqFkIFARHMxWPAmujbKa/6RiTUZ8oxPuEgIVlEwi428n
	 tzSIFoyDdZpKN0j1r0fscX7l7+SVd6EEK5Pbxlm6bJI9s7aiAuceclcKDSyflCCsltAeA
	 LHUtxLYx8g/UoxvC1wYVX9MjtRoKrFIX5HpFLMJ3AZyUv4ibSTH4kEo6c69URDC4I+M52
	 PZokxlDOY5PJhOeaY1ZMEt6HjZslbukgr/ynRZUr6e85k8HAJv9Et/rAEn279jSXLZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T2wzmkkVZfBCgK0gyDtXImqh4zosYpUCndScJCPC2/A=;
	b=JMDJgCvX71DSiLNn7ZREveWkuaVQcIx9U7g2ZcEi6MmBirdkgtSlvXxzisUHgsxPMcQM
	 BRpZEArfI/v7GSt7B23dbXRbaGLkqWKaof8Vhx60Jrz2x8fPIgXscJ3+5EA+Tuyp+INkL
	 nI0YVwsVAL0Rn6vXc8OaGX1JNIJWDIo9IlPPQAXNOtgrIiJ8qIL9JyZPmsrnGvGgS9voN
	 kSDpWzG5ve0Z1me3HLqvuvZcmYGPMVwJoCPqh/4m9wNo0uJkror+J+RZV2gbYh/W+5L12
	 na0bUt3mOoD+NTZP4CoWlz7KWdkfMswHuLSYlrITno/jpxZAJT99IJ3oDxfryMEOe8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=K5XMeS2F;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A531A606B81D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A531A606B81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=K5XMeS2F
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so102800905e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781954; x=1796386754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2wzmkkVZfBCgK0gyDtXImqh4zosYpUCndScJCPC2/A=;
        b=K5XMeS2FYjKidBWHlWThP2dCMDaWsyj1ULF+T3aAs2fLzGynYIIzaauoGFpCQfy1BU
         k0CqWpzUbXuKSBSbYnnjtGzxIHrEZHgKLo/3bghWoarl3Jg7RijxcloYVaO78CAFGpd4
         Wlo3wI3v00lCeh821rs9CrBkQD9i+Y1iXTj+CRW17XnTPcE+OUnc/NeBoPmPqVezf27q
         bQoT7ZezQB9IAyNH8WE3FAnALIaTBLchV9svJKlpaM5kE32jf3/hmeSHtRCXBHS6mrFR
         dPiFAz+ON2XxwkKAZDrHwb7cgOeKPunXpDyN4IeMFHejmO5SPeFUSudjRz6tNiruX+yt
         wXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781954; x=1796386754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T2wzmkkVZfBCgK0gyDtXImqh4zosYpUCndScJCPC2/A=;
        b=Fy2o9AI3A9aMeLoBmLn7jzu4jfQ6IiNtECyuBqmud+SVvbvHErrtzIGp5+XzHv+E+a
         adVmh78FOC5jUYfo02VpXn+KjD9NoNlsJoGkKT7kLtSEMqG5m9j/zsUZ4L3LFGyFWmoV
         te9v009xOSdhEhX0PXW14dKN0nF6eIl2gbyslNsbVx+UUh9WXAZL0YF94COM4jFCXcqN
         s4AFDMpyshcBGro4IGlwARBvZzQUEIHzpf5bB8WIl1JbKqpmCY6nYLtm8ySLjAzeIDf3
         EiMw/5i0PzCqib2gpNk0eITWQMQUmxR+6DwJEPD4mY3LQfBtNr501v8NaCnvatyIJezo
         U4lA==
X-Forwarded-Encrypted: i=1; AL+hErEUVOBPC59aT8zt9BophOu2Y+XpRE0MeG+fFea9kvVkMMEqXwKgAFykgfiKePxWbu4SmxFwTn5nLCwFLSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J/90Xvok1QCoPqp7iWRWvPij7kbqXxyFLDiYE46msE/Hen+3l
	rW1cfJwv12QntUrMbzgFhk0vP6q+0mVXPy2hxmxrx51okf0HdO1rVYJlaG6cPOuwIY0=
X-Gm-Gg: AZFdTZeoWbruLMBUAoqX/lTdTiRyKwOfwlgy6dSr3sCn9qBXshLKVtRftqaMyeuNdoq
	IYM26ofokeI17q+D39cgSa+Qj003ziXCUFx3NZpE0+IqxCE8Tz2TDD+QMqiqTZrPgkacqxuwDGC
	664cAfCGEQN4AGfwtPuKoBp5m4OuH50qomHOIYuDts6VuVA9hSD9MDHaNRFatWLtnRiUia06J50
	3Jk60RO8yl/5hMcTtu46YsGIXxhDQU6lpNxpM1BEbfPWwQcszU48zRzwExESIdwXireFfNZI04K
	twkSme6wewDkPo8mtRpLeXhqQSrHJo/6jz9aYQlkeS8wjxeWmIjahV9F7bAw6I2RjF+lnynQNQI
	hQkrnAVwB3vEMlrjahYB93jCVE3EpCt48ITuWgQtZz9bg+ZxVRdnDfamTK/eXdQEIV8CVo2DgEH
	cSPl2Mbq+8i7SYqzJmlVPzSk2nPSu+/01ZIrQ+4HdU++OZ3DUVoPci8z/bVvMQ+TZ8upi8W2cgq
	xycIZcqgkmLFY2HxDcHqCUr2e5xnzDkqvBf6PuYJCrbM6xCzH9qUqU8szzsGIuQNu0eiLRy5JYL
	A4tR2+HlawSDUn7WbfQL8D/H+7zG
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb887fb678mr459954025e9.4.1795781954018;
        Fri, 27 Nov 2026 04:19:14 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm746847685e9.12.2026.11.27.04.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:13 -0800 (PST)
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
Subject: [PATCH v4 23/28] ARM: dts: bcm2711: Add the 40-bit DMA controller
Date: Fri, 27 Nov 2026 13:22:13 +0100
Message-ID: <20261127122236.4976-24-andrea.porta@suse.com>
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
index 5e3b4bb39396..390b8853696f 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -432,6 +432,38 @@ emmc2: mmc@7e340000 {
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

