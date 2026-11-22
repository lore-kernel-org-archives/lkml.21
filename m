Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378504;
	b=eFrkDQAxaJSpT3Munjl9isHCcRGEbFoRxMeijjlJt3ZpcEWQWv2pfv3waYFfD+/dLH/7
	 OQI0F0mB45EA4ltHSIgfpXNQ091kEYNVMEr+S2boXZceV6mOysjH0ycp7SiOH6W4TYuNQ
	 DjtUPMXLfEsAfy8uHaWF1+OSmdvk1S73N8J8y+5MWp052F+4hVP9rL1lZNeuV3ib387GN
	 QQP/6KD2fVasv4UKwtoCZHiXHBpufNyzpo9zTdqivkde1wn5tmFeIG9kGOUb0spHwAS/b
	 IvDF3Zj+Du6TWPOEx0xS0RJ+lPWfW0EcXM4dzBMpvLT4dh5aW5o7Aw9KDrXqhXWyxow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MaqYWImv02DJ+CpqgjmSJfLLPzjJ2VjogqkfcXMZh8E=;
	b=VBp4RSABPAQmRlXHODT6XVzNQFBZ7gU1eRXlrELlg+4WP64T/tAkxu/lgUr+ZoLQxNrr
	 hG1aaUUaTeuKrHmd268jZ2cRu7vXBoXyew8uaOx4vZuDZod21PVGazPCX2Jfm2m3edMab
	 8ECvOu7lhNFfx4u9r/8VXiYFoQ0jfIVBFgYGe9IFIP14/3HOcivSFbCHFZ4kLXTER2Bw6
	 16qRadeiZ+1Y1awpY1U0tcEzLr277KFAqEXHyo0y5+1KhQ2+E68tw7KgCF8BGuHQ1/X4Q
	 JmEK7/R+3XPDR4t4Hr9E3iL8w3oRWPVqerdnxlDd/jiTNyYmQi0Nskk2HtFz3IOM0Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+tBIyG6;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DF7606A68C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17DF7606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+tBIyG6
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso3408922a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378501; x=1795983301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MaqYWImv02DJ+CpqgjmSJfLLPzjJ2VjogqkfcXMZh8E=;
        b=A+tBIyG6FwKA51lw2JK4ViwReDqsc56mbtfe7BW93tsdunhceN+ejkxD2D0u8vNYyU
         PcO/HRW82JLP1rm439Aljgl4SuoKKPM/PnLDLOKtzRXRE9aHCilcoX/sgIICSyacpAtF
         UNaoQeIdQav/KcsFDCZMe1gERTA65AFO2bS+KRdQi8ENsvTHTVGzaNxmnG2dsWvhBtHP
         PT+UqCHw42m61ldaoGj70KTYsRtdgWPh68Q+4n6ChIz6/4a+xfrNyiAdZLNpB+Wzyr10
         fau0+BG6bLu2DJfS69pAkUHon0HQQ9YL+sxGD5mqV1MVI2Ftuk48oqcu244aCxvaabX5
         96fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378501; x=1795983301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MaqYWImv02DJ+CpqgjmSJfLLPzjJ2VjogqkfcXMZh8E=;
        b=gN0yC4+Jne+5X6mh5If+VeAf3p7enA7hJdgXZAAauoIvGis5ZhOK4MWqq9yD14P6/Q
         E3s2sEmV6Qsf/SCB2oY/7qwkV/kh2KQGXoyo64RqT71weCHGAtT5HmS5lSTFqSL1Zi5g
         ZKJ3+dUGOR/W3xrajOgHTGcX76z/CfWQYag62B5LpF+nJFEkC0WsnKq7JlwroGfDGLhw
         LwvIPWboairRrq4gucRgzsUyVUNECTlrDjTBlu0dVa5vNpCeNuKg/EHjsaiMsIxZIOwH
         yjDLG6gDcdNp9hvtNDoy8s7VDk1iF8Lhppozh20IfZXF0uef97OtTLc3OhZbBiJBjmpt
         F5+Q==
X-Forwarded-Encrypted: i=1; AL+hErFGb03T6ms4HAL9/7YAc5nyoPkYW9jGHCHv600+rG2amGh+6b6qxNtTIeLl4xE8RBoH68AKrUZtYBv6H3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C0hVN1zoa86zDaJBnkPsa1o7YMUqY7Ze6o3F4ynZGDL68i1C3
	qn3BMWwKWuGduxDiUSzTy/Jtu3V4lHqAnt0gwDTiJeYo84+/pj8OINzS
X-Gm-Gg: AZFdTZddg81Sl6ZG0EJvsPRuj1H5FEOr7mzHaCZKH0ybIPzF/3id+WhlwPS7JVuP8Rq
	MKSRxfRzTr41R6vJ9aByUOurEjJPq0XFguxKhAd9rVnmi93ilIOchz9tODbkC92RaEAijdKQHcp
	Z4osTMbCWiLx5e6PDa46BhyI32vCdeSxPgo3Cya6Pnen0mVC+8SX+LGFVxfPrKyhTKPLYAdLu+A
	lDS3lfI1A3oE2l3NmuTr9zegXw1+gUiUYnQwFcOB/RFPUcDqVNXkquVvuAiGyZaX7WO94uaOy1j
	bI6cs5EhLcxWGEFI4ZqrLWKstZtulU99ZXtpWLS1LxzDbVA43CJeCeKi6jjRwxCCvA50LvLALN4
	yW2u/iCKf/RBqniODW9c7L4TZMh68gVGKOraQEFQ+by4huyTJneytf69w1aNQvBbZEU2vNoshot
	D+CKgfSFSlJ3OlHTqSHPnY6xv2bikvAZJYhjWpDxhNFQ2WZ698eQC6RWnLFkGSFgCsb3ARIe/zO
	pt2sdPid8QYYzfOu26k/Thzq+Te4dt5l6HO3pacBODYfS8/nTwBM9wpSqv2Dtuj2UCAqPGvo7b6
	S+uUDS0Hxb3erqoXSI/uK8mQHO/oVPVhHE4d+ycx9WWEdx3w/6N28/DyiO8rNauXIEQ3KmAIGfc
	D1qa3ZadRSA==
X-Received: by 2002:aa7:da08:0:b0:6ba:144f:ae49 with SMTP id 4fb4d7f45d1cf-6ba37e8b7cemr4884943a12.27.1795378501279;
        Sun, 22 Nov 2026 12:15:01 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:15:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 16/18] ARM: tegra: tegratab: Update aliases, chosen and memory nodes
Date: Sun, 22 Nov 2026 22:14:05 +0200
Message-ID: <20261122201407.23742-17-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

Add the chassis-type property. Add RTC aliases and place the aliases node
first. Drop redundant configurations from the chosen node. Expose all
available memory in the memory node, but add reserved memory regions to
avoid touching TrustZone or bootloader firmware.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 44 ++++++++++++++-----
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index f6b167dc8d338..1e9df07dadc98 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -6,23 +6,24 @@
 #include "tegra114.dtsi"
 
 / {
-	chosen {
-		/* TN7's bootloader's arguments need to be overridden */
-		bootargs = "console=ttyS0,115200n8 console=tty1 gpt fbcon=rotate:2";
-		/* TN7's bootloader will place initrd at this address */
-		linux,initrd-start = <0x82000000>;
-		linux,initrd-end = <0x82800000>;
-	};
+	chassis-type = "tablet";
 
 	aliases {
 		mmc0 = &sdmmc4; /* eMMC */
 		mmc1 = &sdmmc3; /* uSD slot */
 		mmc2 = &sdmmc1; /* WiFi */
 
-		serial0 = &uartd;
+		rtc0 = &palmas;
+		rtc1 = "/rtc@7000e000";
+
+		serial0 = &uartd; /* Console */
 		serial1 = &uartc; /* Bluetooth */
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	firmware {
 		trusted-foundations {
 			compatible = "tlm,trusted-foundations";
@@ -32,8 +33,31 @@ trusted-foundations {
 	};
 
 	memory@80000000 {
-		/* memory >= 0x37e00000 is reserved for firmware usage */
-		reg = <0x80000000 0x37e00000>;
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,cma@80000000 {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x80000000 0x30000000>;
+			size = <0x10000000>;		/* 256MiB */
+			linux,cma-default;
+			reusable;
+		};
+
+		bootloader-firmware@b7e00000 {
+			reg = <0xb7e00000 0x8000000>;   /* 128MB */
+			no-map;
+		};
+
+		trustzone@bfe00000 {
+			reg = <0xbfe00000 0x200000>;	/* 2MB */
+			no-map;
+		};
 	};
 
 	host1x@50000000 {
-- 
2.53.0

