Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296673;
	b=C/RwlH83ZlM92FF8pr3DL3LnxKiJvIycVuJtdxOrTTAAn3sl0hIFlEC9mBQBBjgf3eT/
	 CgqwOK++xl/ULn/NKgUI8hhqUvLE9+zmi/QgQKXYtWCDE4cT3llPL/JZ0XURrqpkrjY/f
	 BlnBADFy0ncCsiE+PdIgY1kvdLtB6LedUpf6Xc5BtR2ppqBU3m+gXCabTkbBAU/uOn+HF
	 XzKgNPYW7yDMtwD6J5wQRw2+fkwCekfXLkF7JZTZzkg6SQpN285aIK1lcUE1Yi9FtCDRo
	 b9UhJZGugP1kUrQOWlx45PqWcNeiY/syZDHx3NbicsJB/0/YAZfj/myUflgR6lil6UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296673;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
	b=y4tksERdOZPhCEAj1Xvm8fp09TUDcN2yX8lqj2V0Gr3s6h8s1Amoo3eBPKcaqID8Qih8
	 TQRVivwUPHc5VlpuXmkJ3sJjYSlpfcojkNi9jDrYYC/x8hPrYtKCSQYwT/oKddk1rqL8s
	 viTmLo+PlYvkyHgqEVeW1lR0CbXOA++w7zIG5SqfgvtSlqyLthMCrNjvragBgXcSfaGau
	 Bf3iS9fy/k0p9+NQY8edSaZMRMOp15U772+/S9ZwObeoYE2/jL/PZG3GIstLRDMRs7kGT
	 8sSyrji3rk5wbfraMYQYulRBprilU5sT7xJdCgwG8q70YFQwUeIYgK7AH7mtvNzd4lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064B3606A6B3
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064B3606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1419887f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:31:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296671; x=1795901471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
        b=gLz2B6Gy2rzVX45PfZ/XEOtrybD0alSV4J1F6TEXD1bu0BsneO5qPVY5XgatarUw5l
         klaUsaQj8k6kyhgeSOa/XM8oD4a+7yK+LxY4wI466LqK05j36lRQY+Ndi8CRlcBcwU2C
         Z2B7Xj1hF7Jy69sE4nDFqGkFDz8uJnr6/VBzptTeJFPfYWBfDl+CGFxiAUdicreQZIYK
         X67pxiZEq3CkJJF2skBUl/Jkw2f4OhJCQj1gfEcP4TwPJL7sAPRjzXVbcaLdl/Xl9XoQ
         ch2GPG+msjYmaWmW0gtDNI80FaXBOLSE5Ok/TKD85jVzgYYHkJr485Wz36YzpBMrtKOO
         JJgg==
X-Forwarded-Encrypted: i=1; AL+hErGS4Lts6uujKVYt19erVIqsnEIePFtaxtIP/37Pt5ByySc7GY1TYjxZlTkrKzme94MAHPDvZ2plVLNvBqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eqL+MecxxBJXCFZTIFo36sBXvzPKi41SeWRedV2JWJjqO0lr7
	XnPSkcUVtrN22LQVACBwxqzPa6VO/w1cTeBNJLzzI6e9y91LD/BGhLx5
X-Gm-Gg: AZFdTZdKjrvtOEb7KrVfO1z09eaKLfK8S6GnUjAi90aUgDZ5xytrb3IQzicnkdDGVd9
	E2gsXws2RHvAX37EO0tkFaegCT2UXP3+QTzsH1dZAaG83qWjjMXpCfibeUd75BWeu61J3kHWnCg
	W9K9Duc5B1SR8xg48lFyCrkss+Q2xrFxhrRsThn5zLBTOAMTl5l/7KdWq4Ml8z6R8Tf84mI4zal
	/yLsJAE2qaMhKr1Kh/l//xNqCsvVlDl341pQeAeN2sanvcge0bZrjTVqkXQCJlnuz5Nu40I4Wca
	FyqxQikgpm4u6PryHOu2kxzQFhbDkcfJ12uYsybp+k6FDaP83UfzPQy2E7cbzs1uUAznXLR54es
	YPtL/cllLVQZsRpo5qi0xN/IMjeuFSoQmz01Pu3c0vDpbhc+MZNssqN12Z1grvojujnOU6h33b/
	Vf42BUQCcMlzyDWDlHe3tcerKNOHqjXTn58YMl0+/apcGq0YM94g5/etUIDJNDrcIZgywdIwIBl
	Uor+LoHVZPKVMB1cqpvfKELydEU3V/fsJf7pSMrcWRrLUN+in47O55KvYqL9ITDP4XZBjiFOXF8
	6TWTxazOUX+n+S88bkuqC6Aj5+rSjY99J9JUnK3YCD6h+Y49nSdHVU8quiNl+qAaYKILspHb8cw
	0ptRtrmfwIXiqy6v1G4gBhNU=
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id ffacd0b85a97d-4abb59e2898mr14146074f8f.53.1795296671234;
        Sat, 21 Nov 2026 13:31:11 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:10 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sat, 21 Nov 2026 21:31:02 +0000
Message-ID: <20261121213102.143130-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
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

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII. Its address pins
strap it to 1; it also answers on 0, the RTL8211F broadcast address,
so the vendor tree lists 0.

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY. RGMII needs a
delay on each of its two clocks. The board traces add none, so the PHY
adds both, which is what rgmii-id asks of it.

The PHY interrupt is on GPIOH_6, so link changes are reported, not
polled. The reset is an RC network on the board, not a SoC pin: no
reset line.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..7b86ab2579aa 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+};
+
+&eth_phy {
+	status = "okay";
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@1 {
+		/* Realtek RTL8211FD-CG */
+		reg = <1>;
+
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOH_6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.1

