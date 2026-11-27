Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781964;
	b=x9SnRuE41KfVFRMPH726VsFodCWjCPBCNZrmZIo6TLgQwbCj67TcMClGwww3tNTTDo0R
	 WDQmGYTXHWN0xdKPdN9Sn3pDh8UnbmSyffV+IrBCddK+jdMFHOSGpIBLCTrTAGDQJjwaX
	 D20F+j045JLzi0gEdAmAO5DKoDwvmSU4LeipaMyGfMT9iY8xRqPfF6TBx+gUOj0aJ8/kN
	 n4vP2OuecHRf60dk6tYpa9t/NkNSRTqqNON3FuLrbZ5BFTjoi8iOmTzbUdwGsbqDmdyvB
	 sLwPyG8X2vfweqmqmPFDxVUdC9SlNW698A8yqj8tBS2PCxaVbvjP6i+LG3TBrWkI5YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+IW/uZ0j05LJqVLsSY6Erg+izYe5hqVn60TIR3SgAB8=;
	b=nuCgWFEjOVLwXc4Hgy26ZeCJWhLvQ7v6koPqQLbpQghbdzUgREX3GKYOc5b6thPoPldd
	 dAoJvjkasSWnePL3QAC/hCFE6iwAx+NHupJqGvOvwLXzoB0myPMyXcAGp9vCq2rFiNVXl
	 ET1Mm/t9UE8qy4tPs55XfculxLuFkQBu895iRjdf9ZPsSA9LuGSSv+wrKqgyFWb5jd637
	 hwpQCgxAem/hV+PFGaEFrPVcdh2lbPAy8CRfnwU4DDhaLw9GtL07pIQE34ReqagFaPs0+
	 Kx2wG4iwQnUre/TfpeOQ1npL1FpjB+CgfqMAjaE3ZP4NbSgiRUjOAoEzbKAZjsamVxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RWsFwaDj;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53871606C6C7
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53871606C6C7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RWsFwaDj
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a42b34e930so7034696f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781963; x=1796386763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IW/uZ0j05LJqVLsSY6Erg+izYe5hqVn60TIR3SgAB8=;
        b=RWsFwaDj06AcQkXnUrqX7SDxFULhdAZXBD9zPLiKNyDdmryVwjctfsZP3uWZxFP724
         LLBOw5EONTIxs+Gob63p3AElMXNVIT/hL8T9vgTn6A7NV8/j7bQk67aEGPUt+cWT0MSD
         ve3lQZE7IKp/LNkjT+1w9ndILaGzmOwrpdYz0h85UAXF8eNnGFQgAOCpxNTF603Myr6z
         n5V5QH623ZKLo/NeoFZQof7vWqZV+XhX3mzdwllT+gCk/s0cGvQlT0nF15dAR0wFiG7V
         Bit3Pvegw8CYFTw1yhrcpb8cXZnV3686s0teEUYE2g97T5sNt9X3bog5TTxNVJCBd0ki
         cv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781963; x=1796386763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+IW/uZ0j05LJqVLsSY6Erg+izYe5hqVn60TIR3SgAB8=;
        b=XnPqcNm39eCyndBhEEIGjvbFTtBz43FsMMvkG/OL7qWbhVS+nzsrZ5v7Q7C/vNMcLv
         BGKM5wtRoioyiL6YoekJNJA/a1L3cBe1b2cSKAIZmu+tGtbi+1Q13RbfvpUlLgsBg0Mw
         mXOI8dGDJZ3Ku2eKPRYVR1aDUANA/pG56BltCNUwdsuEo/wpVDVO2sIYLY+dagwGdqJ2
         di6wP71x6caJoeLQI9mJHMA6gz46AHKwwUn6eGGC4p+mKaRjvcsd3tryJRNRbqk8vdhy
         uucEBus4igp+S//hONDpAbOGt/Tkvb+uexrB74T7ZuTWrmwELDxbRyxL/mrWcxGAO7aE
         t2+Q==
X-Forwarded-Encrypted: i=1; AL+hErGrz7Qn3h9Gp882YVtvxNNoFqYnjOZABiRVPHLinPYJzUrf0iBTEJrhO9mUYap2blZTW90l+ti5GpCAatg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wrFPtQXYpB5MaLWNRdKB/Ep1s4WvRlEQWaapeujVnXmTrSq08
	wmv+fNG3cE7fNGlvLZjVr/mLf/NNtibKt7mhSQQrO7qLs/3te+9zUdB1h/IyW3crwOw=
X-Gm-Gg: AZFdTZe2jCaaozxWMx3jyXqt+A8BO7fd0FKsjFMneccvYuS5lo89XmGNR27FgZ1tH3e
	5/CkkuQtFvqMcSlVLXTOQReUTMt6C4ayazMcW1w8s/6R7tyihV5nb4W9wqany/cPvjv2L/pB2dg
	vjU6K2ropw0YAQ3+FRYJQ3MMbDjhWsVdFA5PzVbY9YivA5mFFiS8gHl5ayblcMSHiZbAJ93NvpJ
	P8pefWIfink/MySYaZex7Egsb030DmL4LkXswFdiQJfZlVE1/bXkVlYQl8BZM908875ioJ62t7J
	0pnJ2MJOupEd6CUqEKlkXcu0F8bq18jWVx+/R2ZlJJH0b8liGcC6YM91u6Gojxtqv25mrbE8Gsx
	Yq+hmRPyuocBpUl9kO5sTd5XurZi78NvIObodf/j7ZEgspcQPUOiNZnmCGspIpzdXoD2hNLUDG4
	rMd+4+F+K+vaDOo21pBStwHL8GIx7hVUdHkcpHFsr4Z9z2l3YfGOcLHJ26hkl6yijMccLe6dzB9
	AGvibLJDsGiUm1ucCs988Ywf2JC0ggYHFTpb7sCiQbnyMRJBqqFDl3ImMmQ+j8tSII97OqtaiKT
	oDJSydQC4+F5vXZY0m1uOm9mD+UC
X-Received: by 2002:a05:6000:290b:b0:4b7:8363:682 with SMTP id ffacd0b85a97d-4b7836306d3mr23949156f8f.16.1795781962728;
        Fri, 27 Nov 2026 04:19:22 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm48478454f8f.31.2026.11.27.04.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:22 -0800 (PST)
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
Subject: [PATCH v4 28/28] arm64: dts: broadcom: bcm2712: Enable HDMI audio
Date: Fri, 27 Nov 2026 13:22:18 +0100
Message-ID: <20261127122236.4976-29-andrea.porta@suse.com>
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

The HDMI controllers of BCM2712 feed their MAI FIFO through the 40-bit
DMA channels. Describe them, so that vc4 registers the HDMI audio
devices.

The DREQ lines of the HDMI audio changed between the C1 and D0 steppings
(10/17 and 12/13 respectively), while the flags request multi-beat
bursts, wide source reads and the AXI priorities used by the downstream
Raspberry Pi device trees, where these values come from.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi         | 11 +++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index ae4b7c587dbc..80073bec01b2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -8,6 +8,21 @@ / {
 	model = "Raspberry Pi 5 d0 Stepping";
 };
 
+/* The HDMI audio DREQs changed on D0 */
+&hdmi0 {
+	dmas = <&dma40 (12 | BCM2835_DMA_FLAG_BURST |
+			BCM2835_DMA_FLAG_WIDE_SOURCE |
+			BCM2835_DMA_FLAG_PRIORITY(10) |
+			BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+};
+
+&hdmi1 {
+	dmas = <&dma40 (13 | BCM2835_DMA_FLAG_BURST |
+			BCM2835_DMA_FLAG_WIDE_SOURCE |
+			BCM2835_DMA_FLAG_PRIORITY(10) |
+			BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 7ba0fc540257..bedbd7a359f6 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
+#include <dt-bindings/dma/brcm,bcm2835-dma.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/bcm2835-pm.h>
 
@@ -483,6 +484,11 @@ hdmi0: hdmi@7c701400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
+			dmas = <&dma40 (10 | BCM2835_DMA_FLAG_BURST |
+					BCM2835_DMA_FLAG_WIDE_SOURCE |
+					BCM2835_DMA_FLAG_PRIORITY(10) |
+					BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
@@ -513,6 +519,11 @@ hdmi1: hdmi@7c706400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc1>;
+			dmas = <&dma40 (17 | BCM2835_DMA_FLAG_BURST |
+					BCM2835_DMA_FLAG_WIDE_SOURCE |
+					BCM2835_DMA_FLAG_PRIORITY(10) |
+					BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
-- 
2.51.0

