Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618569;
	b=3b4p6bJQp9mFb0QyDzotNhw+XrGYQk76gd9CZKqDZFh/UdbzviQ/pYoxRwc9zX/nRorS
	 yO8RyMv1VHdxj2nopXEtyt7qtY4nhL8ENdpWoRziPTt+1jXGAeIMmCE+KyMdJnK2ybCRD
	 OTghVUAdTo9wRcUKdkaH/IqlLRb5Etk4QDWJcll/vnf33lbw9lmqOIzr5MbzvXJh26onF
	 mM56dPAQgI9O/6XHRT3wnWG879DOtHeouX/Ir5IDj/BfN0Ry5b5FJ+WeBZJfv0mPWo8gk
	 zjfPRyOAEIDkiYMhFO35thLD0mb1D9lnO7IZ5h2lDDdl0MLQzDTe+VwDvzhD9j3MHlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L2nTfBlCrLMu8yQMZld6sCbquIzEwn5biDFg2eMNzH8=;
	b=2ynrcehhfXvv7cn6B9jvPfs/hv32zFwKfDwW2mMLd4ufvAhyEVqkNnRhzwfnHSWYg9Xz
	 4DDVfzkKd+5IKwqb4nbkmkvRZ2WxgIM5+BkllEuD+KlaLEd7YuNOxIsEKtsoipGCcVnj9
	 +jugsC930z3etrAvS+0CNAk3eKNDSgIjO8V88cnJRCQsv/AYcqpKsn7Ul9Il5hDfTI2DV
	 rIO+ajF/1dsOT1jejb71XSrCO5Xi3ZCeOjh7xoDfB4AAuHG0KGtAKzKagdFR04xkGFcVg
	 YCtvYqzkczXA5S4joYD08QcqPz+grcFd5f+SCeiXoC10YSRcAONymnM9lugGfWo54iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjFADt3+;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFA2606A697
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EFA2606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjFADt3+
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so4547177f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618568; x=1796223368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2nTfBlCrLMu8yQMZld6sCbquIzEwn5biDFg2eMNzH8=;
        b=xjFADt3+MZA2KAQVc+YScEASOKrlOLrSBp0zUy8vuyKuf7rHS0OBVN5x1ja7r2KE8L
         oK7q7BukxXff4eRiBiRFdINHTsc/EPIAaNEsiQ5JPfFO+6gc4SQ2MV+7Fk+u9v3tXWRD
         LVZ5SGzD32dLFKwVhvCqlz2L/2jNGdfuFiq6fNMvBjFSe3t+RCAA97mROvuuJbrR1X0H
         CKMUsRIJELkPRFpF6CmuOrIHN0Fu5bGrvGmnMal4RASOSec/QNer8NerHn++JT914EGE
         4EU/jA41+UBxoqvBgw6nu6Q34FwnWiXjnF8htNjxKjUuyVEu64LPUpDDBFKZ7yMV/xfj
         KDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618568; x=1796223368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2nTfBlCrLMu8yQMZld6sCbquIzEwn5biDFg2eMNzH8=;
        b=rEpqWQxS2B+UeKjjx9ljef2xL2QKRh4Poc/Yy1XYvWmfaF1xIKiFmgrPiELw6qU6Dr
         DYOOQ/z9iMiMwtY/rk2hRgKeZjYBelHE6ZigwF1y8gfvFGjwL+SUaBhWIkqGRt40GVhB
         WKp8InLzsbja1TTAqT8zMVa89W44IjxygI56eFh2IpyZMqhQPkeAF74DxI15kw0O7i3X
         IVncczF91OxvUB+73D8Haz87ih9/C80RPHH8duTY6gBEy4ejUbG2LkBJu8+IsZemHUZC
         sVuZrtZ0n5In9dLQwYMOiBSiSk6I0GM2FoLE2NfLQedmTYZNff1tPwdrGtVjyHSALtr/
         eHbw==
X-Gm-Message-State: APuU4Z+KOjqGbB1GMhsyXg8ExRQ/Qrm/94Npm+1NF05BdE5HeyolYVgi
	IyBX2vFGcy4JeooHT6T22NophIJufCrr9ICriMXM73Ua5rljkOJH88mh
X-Gm-Gg: AZFdTZeZReu41+zMqAiThPTmy7AWaI4ruT+N62cbvkmaFW5aIzF7tw1ZOHflveviGCF
	WBmn+/jB1zImtLSnRbhE6ijUoeDRemq97IfCf4o9jQh4T4K46V4aCPXIww7OyUCQ2q8a23EeEaW
	SAVuXL8aYNrsfwYzR/TOXzyU3v2Q2wQQsc1E2rXpiabldiu1uGogt7vyFWgNMWLG/AgHBZO/Y46
	PJFY6AsI+AHOmnlBG+6Yj+NaLR3A364mWOLcf+t//5k2d4dXkgLDeLDeoow+qGN1/nJ+X5D0F2i
	AXaUGgHYw3shX+0m5mzpxunGR3cqJh6IvrGDjZy+9CM/xDiQppQYH60rUvBdUYhAzEzizNVZBLg
	SpGqz4Lb/UmptBjP/v6PyH4DjFyemFm1w8aePdfa8syK86BrWFrG9eQTtVqUKsMihrEaH0hysdb
	WWPoCEiizeayeFkEy3x3mYFWAEMkc/QiWNRYJLwJbVq69EHm7CMg/tkZ0mfTcRXngUAumRXps/i
	1PtVS+zwBDxBl/WueouXGX4nC+jDzr6szvK5wmRNzbCjDnEA0bEDw6gic1yDmM6cf3aG0cVE+25
	W+vX8sTiWIqotY/i6tL7Ix1bc+ZUcFyasvpAK2pN51OVtcXSPxgAvXLgpQeASEAz3TVGvdlXhaI
	d8YIC/nILqFvnZ677dgm74KoBEXBj9+5EmA==
X-Received: by 2002:a05:6000:47d4:b0:493:8c32:94 with SMTP id ffacd0b85a97d-4abb400ae31mr23328733f8f.38.1795618567632;
        Wed, 25 Nov 2026 06:56:07 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:07 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/5] arm64: dts: exynos: Enable USB in Exynos7885
Date: Wed, 25 Nov 2026 15:54:55 +0100
Message-ID: <20261125145458.2594179-5-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
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

Add USB controller and USB PHY controller nodes to Exynos7885 SoC DTSI

The SoC theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we disable it in device DTS.

It is though, perfectly capable of USB 2.0 high-speed mode, both as host
and device.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Keep dt nodes ordered by unit address.

Changes in v3:
 - Move maximum-speed property to device dts.

 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 6b994b487107..33899f5fc5e5 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -480,6 +480,37 @@ i2c_7: i2c@11cd0000 {
 
 			status = "disabled";
 		};
+
+		usbdrd_phy: phy@135d0000 {
+			compatible = "samsung,exynos7885-usbdrd-phy";
+			reg = <0x135d0000 0x100>;
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_ACLK_20PHYCTRL>,
+				 <&cmu_fsys CLK_FSYS_USB20PHY_CLKCORE>;
+			clock-names = "phy", "ref";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
+		usbdrd: usb@13600000 {
+			compatible = "samsung,exynos7885-dwusb3",
+				     "samsung,exynos850-dwusb3";
+			ranges = <0x0 0x13600000 0x10000>;
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_BUS_CLK_EARLY>,
+				 <&cmu_fsys CLK_FSYS_USB30DRD_REF_CLK>;
+			clock-names = "bus_early", "ref";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd_phy 0>;
+				phy-names = "usb2-phy";
+			};
+		};
 	};
 };
 
-- 
2.56.1

