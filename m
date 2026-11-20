Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199589;
	b=OUpb75ThUEENuqwKjBsROeE/UCZVd2ClssAv7gITMGNx5lKX7ghmXDiks79NIFvJRfgr
	 0Vo3VD8xj9JqJsNHgSiLudqfFHs0gvoOSHpbPoVESYyf1MweXz748VNOvk8WCEaJFWgiF
	 O9+j5wA75Vm4msiF7dKcmEbeYoCvOeuYXYc5BlEv41NFGZuzaD9EEyQ9GN7tgMNfC289p
	 BkjfoncvHNxxSySaSblYqEzM6XxttgiXd9NXApRZnj+424ubUqu/FmfamLKtKP+XtcKiW
	 1+LWsPxkHYyyGDX/pgto9wbxr+letoHJrv+SPIgFBQ3Z/LkDwaKP/gVXJhSFraBTpEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=KuqFw3GDTo/1W2MSio8rD5Tgg5f6ICzWtWhjFl6bOWM=;
	b=E+tOPW/f9S1My7Nroy+M4UiScimveReq9tWSORMstucIPke8vT36yIl2uJP3aQ4koyL3
	 TP6V2571kAbOm7YvcxNUjjGqLGWU+ftvNfweZMoqiVPWWKLcFvk74Tbl64D5n7IBOjcSw
	 al3J49lbZFAqAQxJf1RQAsDdpEYJ2jasPbztDv5KLItsExKvYePY2x5pXdBF5dFG3sARm
	 3L0m/8ATA6mfqthnrfKM23/JNA6wz0//rBwYmGgA/OiXVTXJ13WgtfuBhuC9Xux63wL/p
	 L7eHqAOzPEPYOJXEPhpKzS10vmdF5PS0qvHYLpyVcPiBkQDDSHDdzGbW4Ao1/ZxyIwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=whtBZANh;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0300060A2611
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0300060A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=whtBZANh
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492690dd5daso909100f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199586; x=1795804386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuqFw3GDTo/1W2MSio8rD5Tgg5f6ICzWtWhjFl6bOWM=;
        b=whtBZANhTOFLHBx0DostdUUZaimIL3igpxHXN4/z4kty2QlmHMBDaJwuKel1F4CJXz
         crIkRtv97QHqYzUqUws9u7GUaNpxe/t3tuYwkVkdn+ktKV0pVkmydLPYbN+959+/yLl+
         ZYG3P7El/Vg6auKy8aOswlWLgqJ7zRVzvkMxqqsDKYkUQhMbA8r3drqXnc5kHIrU/rGO
         /Dg2+N2fOTbuMOvtHezz/iqFXZR5TsHhhugcv3N8y56EB/twdJlC14TYey/TxADa/5JC
         GzpvcQSaVKeS5cOMYXAKbvK/cCbni3Jp02BcXeqS2T3u2kzOivJE9u4McM6sbILsEjm6
         Ui8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199586; x=1795804386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KuqFw3GDTo/1W2MSio8rD5Tgg5f6ICzWtWhjFl6bOWM=;
        b=DL2Kku3RoqjKuoQ+1OYTzzUMCcYpCEq9kQHEYtV8/z10t8s1RR1Qx0rF9ompeHSb3y
         fBAbmtn1xi/bPAQI95Zxyh5DCzT3Jph5Nj6lZN8+tArxUR5iqFaUrV5ZQOY8Ik/ExD87
         2tiBYTetDKzFRrT5jh8+iL2k3QI528RWqGMseObSNZQ/V8lNWzdqyE+tmLPv0MaHJXI5
         VyWCQ9+rb7mAte3PNhqVQqCjIVvSiMCiM/sPGcbLEk3fywlNh5/XOnMojib2mSBhavuh
         S8jtfwj/aNz5ilumdn2hL4TNJFmtScsupAepcNh8voN8tlG6hIFOMYy9/BpiiLNrRFwS
         Zrbw==
X-Forwarded-Encrypted: i=1; AL+hErHvSWw1DJJ+/O2egKbRSmqWWMe0R2HXswHoNauCYZaGKdniU66Q1vFVyW0v7UiCe8Q5qkuXKED2A+KWSnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vNlxtZwqvnVPu6nbXMNIRTW7asI188V76XmmyoXXcz+7G04/a
	CuaUAOj0R01IDRdU6SyG3gcArJn8NHCOhVMOjLtXULwM7Dq0NCPYN1Zv
X-Gm-Gg: AZFdTZfmcDeIeg7PLRuMRcvmdujTXw0Uje+a9STUHzy9vVbJT7kWFOMQLVD5mgvVb1+
	CNKAD3aHHKPDAvoQcBVxbr8d5Pwzeftn+gfofbFtehVuv0qnNl61QYpR4/556nsLLaJ0NxD3VOv
	Muvq1+LeAh0kRNWY/wDtW81AP2YvC7HriEUvCdbzSATN9bMz8vkcbWRm+FLZNy81ifnSpRJmlKG
	+JNGYMpIhbdGURpqH057nb7FH6vbH1nOS2E6gAhUsp5NDpMiH84AIRZoqqnl1SpxGAjKBGPnYCd
	ATtfe/VMmb0KSwRi4BFaL3h9Osuqe/HB1Hb4FQ16hRmI5CU2VwQJndFGTRUDvuEtG1J6PDW+7Kw
	kW14KQV3zF9/0COwofrmn7+WzqTgjGYf5CMCStzU8G9iNQr0BWn2i8PH1O6JfogSCQnz+0Khbry
	CeDJWDSPpqJfQA5uIpZcs8zNx/pKT5AJQNgZ/QIH4pN0dBvlhDRurKMo52w4gm6BefkaluQBXVM
	/pStIv5MtsrNtUuesBB44cAzJ7Mcmm/50NCuOTbN315+uBCONfDxiMy88MX6/SogHk/Akvuu8sN
	kLVfw4efZkzwOrUc/hoRwVWCVPoeHZBdzPBJL+fc0PbxD1a+lhW6ijPZ+X7xMY2ceqkGNvhM7jo
	0C4cYc7NKQC9MhZ6Y742zMNCTWwpx2Y17X6IxJ37keh1rrv45rfTPLNX9Cld+ZmfSw/og
X-Received: by 2002:a05:6000:4541:b0:48f:88ad:7b54 with SMTP id ffacd0b85a97d-4abb2169969mr6420016f8f.19.1795199586192;
        Fri, 20 Nov 2026 10:33:06 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:05 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 1/3] arm64: dts: freescale: imx93-var-som: Fix resource table address
Date: Fri, 20 Nov 2026 19:32:28 +0100
Message-ID: <48a008ec1a785f96f25c3b6eafa2869ddbdee0ff.1795197853.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795197853.git.stefano.r@variscite.com>
References: <cover.1795197853.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX93 RPMsg firmware copies its resource table to M33 address
0x2001e000, which maps to 0x2021e000 in the Cortex-A55 address space.
The reserved-memory node instead points one page later, at 0x2021f000,
so remoteproc can look for the loaded table at the wrong address.

Use 0x2021e000 with the existing 4 KiB size to match the firmware.
This also matches the resource table address used by DART-MX93.

Fixes: 4ce623d9f1bf ("arm64: dts: imx93-var-som: Add Variscite VAR-SOM-MX93")
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v4:
- New patch: fix the Symphony resource table address before extracting
  the common configuration.

 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 1f0954620195..78b19d8918b7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -107,8 +107,8 @@ vdev1vring1: vdev1vring1@87ef8000 {
 			no-map;
 		};
 
-		rsc_table: rsc-table@2021f000 {
-			reg = <0 0x2021f000 0 0x1000>;
+		rsc_table: rsc-table@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
 			no-map;
 		};
 
-- 
2.47.3

