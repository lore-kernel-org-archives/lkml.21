Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448158;
	b=ubt62HrMT7r0shhwYEd3JwDJ9LQH9D1KVehuP3wJuwCD6x1y95C1OVKq2ARLGf9rghor
	 k4uF6/ro/Oybgz1A9gu+Qnf4AQRHEP0NAzRCfjV4u61NR6lkPCgiXN/yyRLkwU94lgfLI
	 IIE/tb+uIrORYDIEsh6KI31VyGx2NOVN+vIBWhdBUpdOCjKo8+j9eGrbkeT03bk1fHdBf
	 1S/ogDald1XlwGx4pWrdY8Am6zvh7RMWUH/tk/WEbweKbv1Xq3FUZHxI7mV2VWUmlIgSr
	 uBIXF9L1cFZcElo03D73EXyPMdZJRIGazJORfmyLEQAYOfocDeFbnv5pR3/lQuF64Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2Bm8YhjZ0v5Wgz4QHj1tEV+DcKGiAEMpJ+IjKH6ZCa4=;
	b=nfY4pmqF4e5UZ1gtuWP4bl61+LDB0B7mgZCaRHwEmkqjAaj+hyHZs7NgC0eSLmhOmHwX
	 AbB5fMf9+qxBXeNlK3XNVcN6MxSz2oUBhMIiGJT0ZSwntCU/TzCEDmB2Lu4S9dZ9m9nGc
	 Y5FsuN1CDmYVQsNcd4oVTAkh6dWQkhn9XRYmYb7Zh3MNG+7KgW+jNDCKHaXUL1y/obWIh
	 +QFHoNRTtuj/LwToK5jgi4+yOJp5D2q+tN8nF3MtCOm/ZBqsGtl95+0p0S7K+tP5BFfoc
	 nxrFYd1tYkHdtIkdYJ4QywTVpoqMBI6cY2atgWyATb8cGfBRzwzmTNeYnUTQPfuLZJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="v6+m/aL2";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93932606A687
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93932606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=v6+m/aL2
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so29251755e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795448157; x=1796052957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Bm8YhjZ0v5Wgz4QHj1tEV+DcKGiAEMpJ+IjKH6ZCa4=;
        b=v6+m/aL2/WbufFh0dUa0DVlunwQsl+tRHhNYaTNB4WDOs7VqAZ5RndLklBbQ8vwVyS
         QTO6jHYjuvcDRmbp5efUt/7MqgJboT6V2OIu+s1s2kHe/oJBSFacjvDQiHOFI/4iBMni
         3CD5Jbdp2y0Z2qhGr/KdN8GhCpTEW45LH5oZot6Tmrf2QBxbIMUmtExUNzqKb1FfZGgR
         +W/5SOGjs1S6qQAefI99NSQk8m0HVmxwDvyCT1nF/KrrrIwfR6ceR+9LZqhG4RaYAxMR
         DKeEuTP2sHBUTzf7N8gt7cx3WksxRrAKAEek5x6lvGrcksAmQGCIjh4D9/YFwAItgdVX
         /cgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448157; x=1796052957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Bm8YhjZ0v5Wgz4QHj1tEV+DcKGiAEMpJ+IjKH6ZCa4=;
        b=IQdXZRVFBNLOrUdcFKzjEmxaQ+Z15wr6U3V5dCGjXJLd7f+SMhSAUTVCzRxEQaLvbC
         qq3nJolfaEJ8+v25yqnJb8oOISrGLDM7mWoydQzx+ura9SjFARBV9NvoR542QKtz9CH9
         ZKWOmrF4CpIXaiMt4P/r0udF1yN65aKxDEPGloYbaNfjm1b6BpbYyPnTugQdh6T70Uwr
         OQBDF1UZEwrFvdD33k4pVcFDLNZYkT52ALfrGO9/bRmpzEsSjdZ8+Ko5fsJqcnVDBkat
         qt9RKyZlWQnD3VP7TBJ7EV/QLYKDqSdgIJCEvzHyKXQU4LNKwIcgICslE5GzzQX0QlfS
         hGbg==
X-Forwarded-Encrypted: i=1; AL+hErFQFqmM2iO1AA51vs4kOrT3id8JfvrD+Vst+yPw/eMVF74LO+5BUcIz9kc/bdtfeMU8gztFrpuqxGS66Tk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yuMcwzLt8jf6GMEnpoAE9EUggmVwWZuMBHMkFKbtAbZph2Q1W
	KxHTWNHKChfWd+sGY6VEUB75lbK/gNH7PyuvTcUEbgEdEjMFihU9XKNiIDBaq6Ii1NY=
X-Gm-Gg: AZFdTZfZWTpLeL5vIBeECb5rruowvef4Jcwi9BuSmjvR8aI84b8pPev9wIE6viMI9bx
	3tsm28RdqVntqG1vkL5kRfdPLGo00b+MYaMgPu+0gDeARmTGDohpJlT3VRv23h7UqJi/gE6gzce
	8cCgbKzTJL/7gHcWUFAuP/sx77hcpV4Pwq+wGfiMwK/4Nzm7CKhAxYuPv41bHoOjB8kUeYeKEjl
	MSp5wL6+wAnwpFVphLeUv8ugbRLsvzfCwkBMdVEQ1L2/a5ZqA8PXrptVqNt5fdbt5UzNVk1krA/
	Gd8WD0qLSPiU6UprlZyInItgJ0Z4+r4TBd+j8UJLwCA3ocOFQM5AFJwDk2ZHHbvm1Vu0MKwuJcA
	nJYYemhYBx5OdvuWqglahnstN6xugL/hsEWBvXbzgV00+TSWLZ/VtLXReTev9zdEe9uOyoHnNfd
	L02Ymn23gQkqU5A1nQFZc8PAoZ9VzVm4/1X5i4iqZ/vR9DTkSgebtXhh+HQJvb2TL8yTVvVvmxD
	6SjBZZyHm7D6s68FcavQmIX30NBpEzdGqPPqG7DNiSaIniB6/RqQpwAuX0fN3jp7MQDQrqZdkMI
	3n73w+haCWvGffpAR65xqXQJnYNRAMGRaBs/60PEPgVUhNQDSAzAQIwvbDT54cYBrz+B5gGykTl
	Epap1np4/Kg==
X-Received: by 2002:a05:600c:820d:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb887c33f7mr242774325e9.4.1795448157034;
        Mon, 23 Nov 2026 07:35:57 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm305917455e9.9.2026.11.23.07.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:56 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 19:35:39 +0400
Subject: [PATCH v3 5/5] arm64: dts: rockchip: Derive GMAC MAC addresses
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
Message-Id: <20261123-rk3576-otp-cpuid-mac-v3-5-40c756dcf36f@flipper.net>
References: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
In-Reply-To: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=alchark@flipper.net;
 h=from:subject:message-id; bh=B51uTVva+acdeOakuNpTV/eDMYtXnyGK/UsKvNUIWqE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzxHq13EuasOKLxxHXhLcnC+Kr38/Iz1W+Eq/Fdidbd
 sMRptS7HRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx1oADDf1dB2d9yu7fbyiT9XO70gFkwc/vXlRfMBOtfnVWdOWMOhxjD/9IKLdX
 z4vqJtRflKjxyGLqVW3NEFnEfzwhIPPrvVNJ7dgA=
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
index 6f9fd73d24d6..1f9441394a8c 100644
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

