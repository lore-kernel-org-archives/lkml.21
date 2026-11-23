Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445649;
	b=sYL9b3wK1PEdI7PuNMByoxFlrj3aNMS0qWNwkxlb75kqpwGg+PBcX5ySPRr1PbILjBND
	 /ZJdmxBhus0tQLuqFOe93hJCnwaPeu9rZuYEaIDNj7yKP9Bm6FAa3lJvoIt3zFwKwJcP0
	 ULaxia+w5Q9R4+hNpdxjk3iIr3Zc2To4gbzn1EVSqzOC2xxdffkFyjbrVREUmalCkHPZN
	 W9KKaFXK1zm42gO/Q4kKSjTyfZuOjngCGQiPD5pFndafMxbhCjNGvX2hur5BnPOEals0G
	 u6G+Xuy5LJu/GEwbBdjndPPtSufeUzVGdqT7okYNixPUpe0OdJ5gKE8UM2+3uEjZsMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
	b=naX+2mecjskrnRgmxsR1Ij4J1ZJ9mMEf1p+camPAKVGV6G+r1s/Whadw+wSfmD2exJh8
	 KhWX+BwSQpo2zGkoUod6RhgZwQfpoDz2d5acG+ln0ZfmrkPi/i/gIKvBKjDKRVrGG+lxz
	 IoTggrixwfX5B+XP9/KNnQFoNct+fSJrjWSG5vMW7yXLX89iYvvJPmv0avdPJg1/0jwUC
	 +eImHnFj/JBdKem8wz71946ZksMl752DjAIuZBv1IXYlMiNTKfIh3U1TZhUrL9we67vBs
	 tPEWfb1tR+ma7v2BxiC7/FxPOf8YRd0IoLl/kaVlLa3zPGwui8pCEad7Smf1UrxyqgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZHm8I3Rl;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934CE60A2638
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 934CE60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZHm8I3Rl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so21773235e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445648; x=1796050448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=ZHm8I3RlPULgupz8zhDeBLJOtUroOq1eF5fwGhlR/FevpHDlyFVhNHnOu1bYZWhiPf
         99n1B3FA73S5Jifn+cYwa0DOOKKCQgjKC9VVrfKUA/gnXFtOJwH5crYBb7q3bgfWCuqN
         CEXS290uLgButbzC0JcaHHDLZvZ5OjYySbC9T9bauGm65dLIcdXXSglpFk6NiW1tk+wO
         rbLXvEabhaVAQv425dgRqkf/9FM5u69Lk02l2VdzRYqTuSGj/Oeqoimhg8d1ZamyuXqr
         ziNKhyXxj9AFKGvliUYu7VlF1KVJVfCtAqmId4qmAnVaFRawB6jjZXPXNqchSLUHF8ze
         LScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445648; x=1796050448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=ckkwj1ghTZgjF6GPVNM4bYE98+tUl5xrxbyPuMQBIEoRzYepPQIZqT+OPqIaOJRDQS
         WUZtj0gzLZ/E3BoBA4SQEatSwzoSrYrl2XgSJDCIU2EdXiUDqdHccG90HvRZUJAP9txN
         18CHcSxAED1w9AeeIzTLjsntNPCmdtNK/rrLnRtsOTdaTL4dCLO/dm+/tcPn7B1S7a45
         BNGWF/FeHrbLM5GGG4V7LT8JBJ47Sd9oOs5U14go/RJVNTMYLYW3i9dVDarpiQ2GHI5M
         ReTwmNSe7K+2gDtCbs4bbRszvamo1WIBmwWiZem9mPKaMXBOUUiMm1vpFxmJYMzAu6zV
         Nt5w==
X-Forwarded-Encrypted: i=1; AL+hErHv6A59xPInUmLsFqN49vmXQtl50Nxswo//AjGUrsrZ5ANkIx3msw5bd26wbIjUUT5ky96TyULu54Ml9Rk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mgy39pJruvrYFdrWf6btEMJsYTA49bEyNifLZQPqzukIhwT/a
	0JI4LY8IZ8JR+N8IpAkh9vBS8BYUdJMh6/+3sPshV+GOdPQ8eQ/3Jika2CiHSpr8le8=
X-Gm-Gg: AZFdTZdYbSl/oaFVb5s5x4JmmpLTriGVjeuM2AqrVRlfIPNYukJStbxGOJ9XnW72hZ8
	5NTqUMbmXpExdVT8fDgOtio88PFRcfT8PKXZ1fq6pFKqZ/ND5H5a3netXcP4lELG9OOmHRXNKr/
	HmbDqB2Rva3oKAuWgS1aHk5u/2G2cT50CTpI9mSLlAVnKI8nttvQ24yCwHCVrq5ZayD7kRjYHO8
	XXEhR5XzfnHBF/YLoun6VdacgRSI2LX7bHJ8nudaajKYXiEh0hCwdlYk0/z+ZLZ+CmlNNOsgJdF
	pZvOxgPfjFzadWdECOTqZMVGbR/SNXZ9iC+UTJsLB63XjiCwd9dASrwgPyBMugWTZgknFuOeyKM
	IuXGa0f/t1rKM15O1ZqP68rC5lhFjWQCpuWN7ZC7U9tZ/G26yyuNyySrARBIxLpss0v1uggRnCV
	cFtPhz2dX6F3FE/0AkNY1qC8AZPxxTBYxQ8SAKbZReGO+m7HesjarDX7ktqw1+GJapXcNuq4lNr
	pzs2sKwogE/eHIOKH56BhVosO+ok+VdPfD45PwUc/IiMAo40QNbNHauhUfsZzb0YR75P9zDvQPD
	oKmbVfUEVdhh7TCA7Zg1ijEql54jnpQMaNo/j2+8V6BCmVN0
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr287799025e9.12.1795445648030;
        Mon, 23 Nov 2026 06:54:08 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm422624865e9.6.2026.11.23.06.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:07 -0800 (PST)
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
Subject: [PATCH v3 26/28] arm64: dts: broadcom: bcm2712: Add the 40-bit DMA controller
Date: Mon, 23 Nov 2026 15:57:04 +0100
Message-ID: <20261123145728.29082-27-andrea.porta@suse.com>
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

