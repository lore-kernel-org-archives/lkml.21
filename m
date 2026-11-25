Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629808;
	b=I5CU78sYBJja9o3Gii4l7elWs+8xnxxUJSb3JnG1eduaH/nqeEPNypB8r1R+U2WtYX/g
	 tt+EKEDzFNyXuwDHr15BHbGYsfbVjQTNiOhKwxvpNFw4zGgR6yj72qqgdgVTHXMiYp+Gk
	 RHuS5K9QdXxZTOE4Eqm4v0zE5A6fWU01QkROvV/n+IYdZx9kOo5W6rM/UUVnBNbhnj73N
	 8R98Qv3gAKSYPoal/yDGVvKyn5W3dYpcfH65c9f5BbEWf3a73+5WL2UXtsMpWWiAhU+tf
	 Uj67jgcx4Z7Lca9JUXpyOTgWFq89NKJn+82GWQJj97fJsQlZpyEXf56ylXX+GzC0B2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9SB42I57ppceG6E1W7wOKk3sONGmJq77q2GPQ6ZHdGs=;
	b=b4oJYOfLscEeosnWxtPuuBDImqTkqsDIhCUCGCLml0Sbl+/t1C/LLljy/qEKn18rpy02
	 qieLZ+biv/iq6mtJpdc8IotwEKmP+IP0WsYxCbfVD/O7twN7GddSSyzO7AiwpOf/GK31S
	 oT/34GBU4MItKChMKsWdEoDBjGhgNioPyL9siD6PtCOPjq4E22CcwInwUbQ/WVc77ZdsO
	 1hDvQ24vH+4pyWuch9FDX5v0wH8GdHOTT2I9yLL4x+TN1qK0IyT5S8nQrs+NAyBYxroxa
	 GnYH8pty1CDMqfWpk2SqBYNbhBjkjs5Uic1l5XY3B6o093+ifDeBz7suaKg7rCYFQSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=h3sDblAN;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F6C606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F6C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=h3sDblAN
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dee593f18so5679900f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795629806; x=1796234606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SB42I57ppceG6E1W7wOKk3sONGmJq77q2GPQ6ZHdGs=;
        b=h3sDblANI2RVIH4Yr1D2FwtABrU8bG7C5+5LH6yS+nJ97AEgYBfR7aMEQxPGDgO95Y
         Zr2DOHNRZr0pXgomunrD7vqyUhO83dYa9b16yM2JuS3ig3q0qwRAYn3LpTAJoA/UvUGE
         jXlvsx55c0FAot7DH5NCm+PYK0hwOnNVlIy+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629806; x=1796234606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SB42I57ppceG6E1W7wOKk3sONGmJq77q2GPQ6ZHdGs=;
        b=Bzrk/KxqLAKrHtKI/l/xK8rDWrQbghWzWTDdF3I2/GJXJI7F8cmAEPVduAWRsVFOns
         C9fguFvhLNnIBLmgF3h0edAl9P/vquug2w8g5l10Wc8DkPOiiYeptag9DiAm+n6QPjXK
         /nOD6X1AH+T20ft87EhDa+jevm2latp9zUuky8h9ClWbT/sC6/K/63x2eEoBWVtFCbS4
         8A9t+OttWZPxUUgByZWwKVdsJvXoX/9lXJp21n7jLxZPZsTvf8ocs3G6tSJ59IEGR2NP
         LcKmE/BlYU7IWfTABwV7vA1sEYiV0NjhA2MZo0wj2NY9D7klHO8MUEC33eAHW68VVLmg
         aDjQ==
X-Forwarded-Encrypted: i=1; AL+hErGIIupfG8IMHvj66HE5Ff7kq0m9b3qxFlTUDmr7BAjN5YFM7C6zljv6iBZLfRgQMR8FlUgX5OrorkJs8cc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5aRdiawWFHg3UFLByr1b/MbHiWwAAIEGQqitl86xN8zdTw9Hk
	Kcz8SjuxF5lIesO9UwkdUVPLtNyaPRWg2/W1FzYPodRPEOHcDjMXCqRWnV4NiUNNnUA=
X-Gm-Gg: AZFdTZe0EFoa/7zsZbeIqCuoKRnO1B3sdUmUq2t7nn+rEstdlw3lpb3DGzuh6JXVP7i
	Vcne4xWnS/gDHw9h7MLFNTvBp0P2lvE81pXTEoErR9CbBh5mp+Z+NwVjRTw2U4Q0Ww/NPUH1x9W
	lQ7CQio3SolHT7KdY51x7EKsXBkRUlwvn6bVtE6hja+KEvzBHqhKLWFQ15eru7Vn+p/vwCRo6gi
	lAekRxIaAzxdNzVRWsuEJ2QGK2K5zzJ4CjYcvAkV+mb0NCqK8a6ewqIMvxSE5YnUfr/uBRnlZmj
	BXzSjUpb/ZmDUa7X9dXINm4ceFmoi/YsuF3G0oS3I/+rF1nPsYlKxCRRqflBnlf5v+xMg+xnNMC
	ecB463xuuQDHbfm5MHBAtwaQnaF4OF9Vbuv2eExywg1mfw1pk9C5niV2wigxn+jM0FIsa2DASTK
	YtvORxj6/Iu4CmVSIXdNqoDxD79fOS1tOvRAob6ciLHddsBNIyzJe04xlz566VrhVVZ6hwKld2Y
	mh4DovynsKjWnwl/xze0I6SBkwCYVLf+MIc6OSpCjRzBfB0vQpuAz24iCF9LZQMJ5YaQyNg/koo
	Ha9mrhMOPifv3DIYVaymr/3lqw8KQu6JTKLY3eTWgR9iea5b26ZwrXnIN3pVx3QU4r5zIMmNpEf
	kGGJ6GkJqb2e7p9pmS9NuqIkaNy8/YGIsUydUF4tXkBZ4Pv/nL2Bkpvb7sz3ax26pZ4n3dbuSeh
	dfVvCBbnX0zrgjkFmUxmjA
X-Received: by 2002:adf:e00a:0:20b0:490:1881:80ec with SMTP id ffacd0b85a97d-4abb3a4d2camr26718119f8f.36.1795629806160;
        Wed, 25 Nov 2026 10:03:26 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm19644251f8f.19.2026.11.25.10.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:03:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Akhil Narayanan <akhil.narayanan@in.bosch.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Florian Ager <florian.ager@bshg.com>,
	Haoning Cheng <Haoning.CHENG@cn.bosch.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Qiu Guochang <guochang.qiu@cn.bosch.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: imx6ulz-bsh-smm-m2: add boot phase properties
Date: Wed, 25 Nov 2026 19:03:11 +0100
Message-ID: <20261125180316.882220-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

Add boot phase properties to the resources needed during the boot
process.

The BSH SMM M2 and M2B need UART and NAND access.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Rebase on imx/dt

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
index 96f084b6ade4..c1ab536bb1c2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
@@ -17,6 +17,7 @@ &gpmi {
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
 	nand-on-flash-bbt;
 	fsl,use-minimum-ecc;
+	bootph-all;
 	status = "okay";
 };
 
@@ -33,6 +34,7 @@ &uart2 {
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -75,6 +77,7 @@ pinctrl_uart4: uart4grp {
 			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 		>;
+		bootph-all;
 	};
 
 	pinctrl_uart2: uart2grp {
---
base-commit: d868355562901bd5043b52ab903811bd95a7d65a
branch: imx6ulz-bsh-smm-m2-bootph

-- 
2.43.0

