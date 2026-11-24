Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521906;
	b=hVEOEXBar2RuuIcwScPECIA3T3qZ5sPoZZBGl54+8jN6WSV0AooCCxMUfBpePienk7VR
	 pi/HsAOIm5qDRGpdWI8B0LBjfDNNB6abRrWjWLLcpNBv/E88acfanVCbBikpxoFFtlWFB
	 aSm2UECbgqWT3G8+qXmDprmqklGYnC6nmXDkJ6AxfuFFWFoenD3SYklO0Wd7mTpQgrM+q
	 ICK/pvN/eeq/nn87gGQtoHn86uJbHxbVmhBNNX6Ih9eXJLi18nn1+HGeLmPgYrtRZusl9
	 zvtr4szPv0Z50KhYbWfDKT2EyrUV9KfhODl94JlOHZkxvLN1LPMajXI1yISpoYsy8yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EJvIXWSNay6+eoioVal9zFgh6NBH6xoDfIbKyCb3bL4=;
	b=i/lwTlU6F8z/KS2FEX34EOTCZBN8IA7w55ppv9n6ob72VCxCqwD6ycE0sKFHiPDyv62o
	 BUyXsARpXl7ZwP7cOmRDx29V7x3/1Zc++Zjg79GXK6OdRZe3NohUYLlcQo8ZrOxU16vBb
	 kGJ4CV+QzNc+P+Nyf48kngY08nsFRWQX6AW2OLSWEqIyjNT3U5oYiosBjHLBCg7e+4rVn
	 SLyzOtrAJrEFm3oiUyDpvaGUKZcpLWWOANSfXWJmoGSexLD2Hpa7skvD3HSo6SJ2miHFV
	 HPGqQMoZUWohkjQRzzY9ZcyOVjt1jfUCsJMZAr9pExxXxtWXAIwu36ajrwqG1jYBHJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=TsbtPaxe;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AA3606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85AA3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=TsbtPaxe
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so37684435e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521904; x=1796126704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJvIXWSNay6+eoioVal9zFgh6NBH6xoDfIbKyCb3bL4=;
        b=TsbtPaxeVCoTgdwSm/a8nEcqMfW6W9RjrBpAv7QKzpWQAfHV0wxxOfNEYZWfuoIM2U
         z1gkIZKi13A4xXr+1AkfXZePC6umukWNkLy/xXW9qjtT32X+5A12clS/uqWA8ChrA8q2
         i9rxmIydregBEZEDVIlwhzrj8HlGKnRQLvICyC1xxfif1KjvisMweIpyliDQY7A5cwb/
         VT6q3e4YV8IETr4bRi/bEfMICIYcP34xeuFO3ChNjR9eATiq+svlF8clsd69GcG3u/FE
         zwo4LPt9mX1XbMR9BlTYMAkNIodaYSVhFce4nq0Im5/zEXJDCzbHYVEqb1t0WTYSgACT
         qACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521904; x=1796126704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJvIXWSNay6+eoioVal9zFgh6NBH6xoDfIbKyCb3bL4=;
        b=WiDUnf88qVpdxsY+A7oMrNAgUEcsrKo+RqCheDNkctdTAzxqcSnHFppouXLUENMb7f
         m8QuTp3cXgSS2TVPnnIXEf2qcTczhu9HuJ26lQk5n2H6Pf7XYlYI20ViC7jKbWn71eOx
         Bqu6q9IoarhQL7RCzWZ0hf8Y+DPA8keao1YIFZgXbhpBO8ceIuU5q9AikdxYYAH+J78o
         yd0s0HtJxTrH2h89LTqPH6Et98BpZ7rEKoH8QOaOYckS4epIJBkNZGPV2hOJcHT6THgt
         ORTyREkOiMoJRq016hbK5VNAQ9Eof0XZ4oJjWVQWPCwkoHfU3zyGZr/kwO8j5Xs04+sr
         /GXg==
X-Forwarded-Encrypted: i=1; AL+hErFEnpvFojg3TC1+w9sAGSoqEpQjBwO8o6JE7mgkbp+DJnQoBT3cmKEa/jIx6/ikgFC9pmtoXiN1jwrr0SU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UhqRPZFYcnnJru/w0Zb5QrZ/KJMQDYJBI2QFU4g0aWY7Z430F
	zq6ODGOy+glwU6S/MbH1t3du0qvNa/iKdKD0wJJrOvLThEJGkkpxGjSll2ixq+kA3Ps=
X-Gm-Gg: AZFdTZcvnxsZaiekHz8eUW5LKPw7TSDVzVhmsM0DszAr18GWzHZsF08htkS1g0rn/mz
	ukJM/E7xlCH+dUTytSuTUjPfLBhj1osSJODrNo34khNWjLEPEFF4CtIEKhlRlh6nVnHC/rycei+
	uq5spHedpwlQj/9hGFjW8J4J+yJb+YNN6ym2sTV1iuuETGMmfzPojgi2kZL65Iu/bsB6AR/H69X
	6GHWYFfGscWoc0ukHrRjwvF9ejipSkRr3vZgdNE24FIjg8+yAjzzKVY33ewE4BdJxSdw5p2IQ+Q
	ugqFh6x7KmS/BdXDZLWhZcvS1gari7XPIqPdD9ouxHyiT+aXUVG7/ibdNxVeTp1OLv/w+gY0PZZ
	beMy6De7E2b957C6Kavw486MMAFHFyHKBSN9GonMo/x68ywh8L4uLgdd/cx2+FpbGdtN8lMgCTt
	7BavDMh0Kq46IKvFrr+SPfacWz9a8Rfb7tQRS/cMr9SPHP1cA/W8QuUjk2aj0XyR776tc/CEA0s
	ANFrSW0FpFamSzMoSH3MNH7CSjJSGOW2oOZog6vrU8EzKVH/g+NItWYCE7sL3P5wg7wThfGBZNZ
	17xkN2/CaOBUtsHNWfdXdSADtBkmW4shT5fn0wjLihXk/WdGMxZAABSyIrLEmJDY9Tx/9Gd/mK9
	jEisEqIsD
X-Received: by 2002:a05:600c:530f:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4bb8892a21amr273175025e9.34.1795521903923;
        Tue, 24 Nov 2026 04:05:03 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:05:03 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Nov 2026 16:04:35 +0400
Subject: [PATCH v4 5/5] arm64: dts: rockchip: Derive GMAC MAC addresses
 from OTP on RK3576
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-5-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=alchark@flipper.net;
 h=from:subject:message-id; bh=tZOur1/QC2p0pVqmEykIV1YH8t0mT0OobMPfGwIip6s=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSz1gZzMG2ZIVa1VaHNpl5i+Uabx29mRjirng3cKjfv8
 przth/OdUxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVrQmMDLPE63JuX70qZ+aS+dFd/8Xf5FePN6WYKmtVc1981MhzvoeR4WagBYe
 7mGGu3MfyE5uP9na396055ZHrZC64m1Eobu5dPgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

RK3576 boards without dedicated storage for a MAC address only get a
stable one if the bootloader derives it from the CPU ID and patches it
into the device tree, which not every boot flow does.

Mark the CPU ID cell as such and reference it from both GMACs, so that
the addresses can be derived from the device tree alone, whatever the
bootloader. Boards which store a MAC address of their own can override
the reference with a cell of their choosing.

Note that the GMACs then depend on the OTP memory being accessible, as
the thermal sensors already do for their trim values.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 2e83a73ddbb2..55892f4afe60 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2070,6 +2070,8 @@ gmac0: ethernet@2a220000 {
 			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_id 0>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC0>;
 			reset-names = "stmmaceth";
@@ -2118,6 +2120,8 @@ gmac1: ethernet@2a230000 {
 			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_id 1>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC1>;
 			reset-names = "stmmaceth";
@@ -2317,7 +2321,9 @@ otp_cpu_version: cpu-version@5 {
 					bits = <3 3>;
 				};
 				otp_id: id@a {
+					compatible = "rockchip,cpuid";
 					reg = <0x0a 0x10>;
+					#nvmem-cell-cells = <1>;
 				};
 				cpub_leakage: cpub-leakage@1e {
 					reg = <0x1e 0x1>;

-- 
2.56.0

