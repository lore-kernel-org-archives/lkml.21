Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445641;
	b=Hp9JSlB60EXopPjm6ICTJpQQuS2N/sxpq3SkZwl66YGAT+ZU06fMXgy7XOe9+AE/jGvq
	 rlP/YbcWjPjLfkE5TFjeoCzXGUE3ta3cyvH45SwrwHLxAitn6TA0YuGDuF/oJft3ceAsy
	 qdlfQetxTtf5VbwaYCHQjeNaJxPWODCULyxSQvSMab/llyj9Ytr93/206RJ5J7WG0Idvv
	 9J9J8TNtkegIHps7X1syzivLgu7ygDVlMaMT+aQZbVr1SluGY560JyMJqy5D4H/eh9MF1
	 E2vwyZfl9kviD1yrMcHHTqm/iif1tFesu2ZLOPQEeXjh6E3rbcc0tY2Tjg3LxKa+oLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tj2oyeqk6b69KxFWS01t2IbQgu2lmmzdv80iMVDCm4w=;
	b=B4ArAT/+oB6l5v0wHhTb3qlTBTVbt7psTakJqq7hZ103CpAPJXTyXts2M5DF9hi1GDs1
	 BqosXTDw7mnLNVd51XiXzAIvF+Pe4Eng6WPgu0Uj/eu6uUqlhc1Af4IgVEZMvCOANP4QF
	 TE82pVAivRp2Xyj4UuFYJ7+XOt+sN8Q/qEKNYg4n0QBRuTq03AZrnfCwj/5gAv77PoJ8E
	 m6og/do7bAdfgcRj38bXP0q8xsJWTlrDoT9ueWzDkHaRlrxPF0zOPF3f/elLERETNifQL
	 Fp4IuJIentd5j6HgWKCxI5mujXXEmFCvBIyMQVAFsmQm5F7tptl+6lm5ddQ/65MeFbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VZvSaB9t;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293AB60A6F7A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 293AB60A6F7A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VZvSaB9t
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so24543785e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445639; x=1796050439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tj2oyeqk6b69KxFWS01t2IbQgu2lmmzdv80iMVDCm4w=;
        b=VZvSaB9tF6Ty5DLiTMl2c9D0Ccghyv1P7rffdqVNLDtRDzfGPX7k8Eyx0dZFmcuouf
         2dY3ybu/aq1EISw8yaRXEhTd+UR5AxRdCuoxZQ7V96cWkMTZIwgZfxTt62IS7DqK6K+U
         xICre3QevZeTBW7W90i1HAVVGJXMDkUKlzY8JytG/Phu2WkGXrSdrt229K7ovkFKcVHc
         7xzq59ImKS//GC94ZtOGtN/6VY0F8InOJm47Iw2ajaEvyPqVoerHJwktxPmB3pLFAbRP
         nFJjHrGkW6Jw9bdMs5wA8mEyC2L0xOu+/IkPEtGSVTc9GGCs+ZjScW/FSKFP4MGiO4TX
         N/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445639; x=1796050439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tj2oyeqk6b69KxFWS01t2IbQgu2lmmzdv80iMVDCm4w=;
        b=1EaR4uGF1sOiEUIlYBYBwKxFFBL6W/MzrbNXBZBfJPIdtBlu4c08QT5gQW5aUWek/h
         kN4FmTCSSdgI2N44l95iupu9Py2XMCOPEAWiDHvkUxdth8+9wIU7Dn0urUKGSUpVefrt
         wgXS8R+N0kQcves7011O7Nd231s7iEMhiFhdKCqzHwVbgfEw3ESKU2ZiyK/i+BcAtaAh
         Z8qNpm9EfJkfvQmBu7jMJzVQsq3qSK0cF3yy9vKjeMrEEmsJ7jY25H9xVqnM82hHeOUn
         3cmDkDVIKtRm3tadggIdX7GF5/oVcgFZdIH0KF5kZEhi3+2cYn2pNgUaNtHDl7hTg9QP
         pSvw==
X-Forwarded-Encrypted: i=1; AL+hErEjkNhqIIRO1ucnpzpa7A+WpnndB2DiqHl/4080WkJbZeISQRsfXPO3Bq47WmJ+Sz7ZGRZoaFJV6uBtiqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/53YE5gm7Z6/swlbJYJqAETQPkDxzcTY75H25CoWFV0CrL64UG
	ARFPh+Vf4QUp1AkHlWi+3RTFQTtZHAO2fD0OTg9RXnvceMIrEv3ENT5KeFjMlw5R12Q=
X-Gm-Gg: AZFdTZd+6qjigQRRCyWcBuCdYNHw+t7nFkBtIgNjicgNOOhTlmUAGYAz/T+UAC2SvLa
	sSIalbIbRkZAzzT24+fbLRE16XlvwsoV6Evqs29yKEHYcx9SJ79J7d0DxDfOIqjVqddQaZtpaAa
	zsBBB1hy63AjxuKwz7FJKsx18/Bidpz9IkhPRTdIVVpA1Yozk53UzcYwMf7NGl+/Kr/2yh59Aqa
	E3e24RKUdc9qfCuFaCt4WthRIMmMVuQg7MSwFvp0N7ZvhzJuI10PtzlwMmwfh7I93H/xajy2p9y
	TccG8kQHuEjKHHdQ+v6+MZUGJGKLm2UVOGYIDTbyU9S1KaBRkKllyoxJ0NgRXPq8kPejayhgnhM
	TXH4Gxs1bwW3w7njYqVwadz/Xh2j700e4Qq4Xa1fNfS+oQT284Zz18UX2bjeuzKeyJD+J3aRSpT
	AD7bae4VOxQvA6VPFmx69VExepAXUq32zbKrwU+IkuKybbMQAAk0l+siSi2pdNTYFNQ4a4t/Z74
	+r8notKr0iLBvLaqh7kbzY3pIvQid6HQdTeo5TYVFE3oqfKWu1qS4pjBRS5DiqCxi0rroTHipJA
	AJbVpKvIUb6IR/5gaKhfKlMiW/sL
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr237377065e9.32.1795445639349;
        Mon, 23 Nov 2026 06:53:59 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm280462825e9.2.2026.11.23.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:59 -0800 (PST)
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
Subject: [PATCH v3 19/28] ARM: dts: broadcom: Describe the peripheral window in dma-ranges
Date: Mon, 23 Nov 2026 15:56:57 +0100
Message-ID: <20261123145728.29082-20-andrea.porta@suse.com>
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

The DMA controllers of the BCM283x family and of BCM2711 see the
peripherals at their VideoCore bus addresses, i.e. at the child
addresses of the soc bus. This translation is not described by the
dma-ranges property, which only covers the RAM, so that the DMA engine
driver cannot translate the CPU physical addresses of the peripheral
FIFOs and had to rely on its clients providing bus addresses instead.

Add the peripheral window to dma-ranges, mirroring the ranges property
(minus the ARM local peripherals, which are not reachable by the DMA
controllers), so that dma_map_resource() can do the translation.

This does not change the bus DMA limit of the devices on these buses,
which is still given by the RAM window except on BCM2835, where it is
raised from 0x5fffffff to 0x7fffffff without affecting the DMA mask
derived from it.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 8 ++++++--
 arch/arm/boot/dts/broadcom/bcm2835.dtsi | 3 ++-
 arch/arm/boot/dts/broadcom/bcm2836.dtsi | 3 ++-
 arch/arm/boot/dts/broadcom/bcm2837.dtsi | 3 ++-
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 5e3b4bb39396..f475422796d8 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -41,8 +41,12 @@ soc {
 		ranges = <0x7e000000  0x0 0xfe000000  0x01800000>,
 			 <0x7c000000  0x0 0xfc000000  0x02000000>,
 			 <0x40000000  0x0 0xff800000  0x00800000>;
-		/* Emulate a contiguous 30-bit address range for DMA */
-		dma-ranges = <0xc0000000  0x0 0x00000000  0x40000000>;
+		/*
+		 * Emulate a contiguous 30-bit address range for DMA, and
+		 * let the DMA controllers reach the peripherals
+		 */
+		dma-ranges = <0xc0000000  0x0 0x00000000  0x40000000>,
+			     <0x7c000000  0x0 0xfc000000  0x03800000>;
 
 		/*
 		 * This node is the provider for the enable-method for
diff --git a/arch/arm/boot/dts/broadcom/bcm2835.dtsi b/arch/arm/boot/dts/broadcom/bcm2835.dtsi
index 15cb331febbb..3a9719e2fadc 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835.dtsi
@@ -35,7 +35,8 @@ cpu@0 {
 
 	soc {
 		ranges = <0x7e000000 0x20000000 0x02000000>;
-		dma-ranges = <0x40000000 0x00000000 0x20000000>;
+		dma-ranges = <0x40000000 0x00000000 0x20000000>,
+			     <0x7e000000 0x20000000 0x02000000>;
 	};
 
 	arm-pmu {
diff --git a/arch/arm/boot/dts/broadcom/bcm2836.dtsi b/arch/arm/boot/dts/broadcom/bcm2836.dtsi
index 783fe624ba68..4ab7769c056a 100644
--- a/arch/arm/boot/dts/broadcom/bcm2836.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2836.dtsi
@@ -8,7 +8,8 @@ / {
 	soc {
 		ranges = <0x7e000000 0x3f000000 0x1000000>,
 			 <0x40000000 0x40000000 0x00001000>;
-		dma-ranges = <0xc0000000 0x00000000 0x3f000000>;
+		dma-ranges = <0xc0000000 0x00000000 0x3f000000>,
+			     <0x7e000000 0x3f000000 0x01000000>;
 
 		local_intc: interrupt-controller@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
diff --git a/arch/arm/boot/dts/broadcom/bcm2837.dtsi b/arch/arm/boot/dts/broadcom/bcm2837.dtsi
index c281697142b1..ba44cfb07668 100644
--- a/arch/arm/boot/dts/broadcom/bcm2837.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2837.dtsi
@@ -7,7 +7,8 @@ / {
 	soc {
 		ranges = <0x7e000000 0x3f000000 0x1000000>,
 			 <0x40000000 0x40000000 0x00001000>;
-		dma-ranges = <0xc0000000 0x00000000 0x3f000000>;
+		dma-ranges = <0xc0000000 0x00000000 0x3f000000>,
+			     <0x7e000000 0x3f000000 0x01000000>;
 
 		local_intc: interrupt-controller@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
-- 
2.51.0

