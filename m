Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296670;
	b=EfwXRoQfYmSjsOkhBdyzDsebG4pkjRQBpKQgC6CdoLMyZYIMHvB+7NxMjyvsNqwphoyg
	 4DJ1DY8YzVmRRt2p+qqtberZzfJD6q6kMwntwyuqudWpdiTrK6HgVL1fW0fpub8GgOdry
	 sg2zhyI5id8NZdIPBtQGR61YFrDwxVqiMgAV2LnoOGdqJyAHNwi+ZjnHECqIlRFCJpkL1
	 M0kIcboHqqj+PfDxF4vsoJ/UI7n4/mSCGcL8BuH5gP8stEVKni+2STCKOxr9Jdy+r9/oC
	 L0qpnXz4HrDZG3UJo12Tnz6tKGLHYWRzEwVMxrw5yuWwUp25LUzQfBwpvRiinLLjmaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296670;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
	b=1obVnWeUeJv1VEiFV33PiKbefK2kP1Pa/HUiJoKrXBJNAC3fnIxyTq59rH34H/8T4JB5
	 fgK+BL9iYh+cuCv1EeOsJ0+FZJzQCGjxkCbu2jnKV/8qoCG1Li9Rhp8PB+DfwwOGWBIhf
	 TUCOQcocgYrWq5b83OjL+Yn5xPZ3qHFHlGm2sl9WW9fqz/b1anmsrQ7Z1qNeYS2br6YBE
	 0TcEj4RhZ8gYeyOkCOjm5UBjZ3CTnneCxnc997QiiPsVZcj65Y/OsTz2q17wXOOA1YvJD
	 gRJjTjwO+ZkFc8cD2wickkWEkLgjk21WzjooPA6tQWFJQDyr6zVx90FrreJmRuO+KJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD3F606A338
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD3F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490f38e9688so1461449f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296668; x=1795901468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
        b=LRtIaxC0pebGjT5Aj3apjalJzNHf6d9BRoJ18Kwcvjtai8jEJzwAyh5SZqeOo29+Pp
         X48w17RIFhwuoFNR8wcQEM7muACG+0oe+qSwIWWSrVum2nf4rGjvkJyXgFblTvumx7Fi
         18/OXPFD/K1RsoG0MtQ5m/ocVKl1exIGXrdkd7lVQtS6FmoizodAqMaOFkcclC6BchAw
         kTvoLBQhekFjbrbH5Gbh30e/HJieG+QkEwol406k1LOH4W+CvLaYxu3hQX1EGIezaV0u
         kMPjlaBceQ6m+cNrlkWuaPb8t/bRlybZvjHcpN72illRBwdO5Pnj6+wcaKJaz0nGtIzr
         abKQ==
X-Forwarded-Encrypted: i=1; AL+hErE2+MUmN0vpldUQt6gHSHVopJmeIhNNHuUbF0vxMZPLehP7hy5ic171NqKXq2wjiM6Ns+iDEnp3RqHXRts=@vger.kernel.org
X-Gm-Message-State: APuU4Z83vU1GDssWFeC9nQZV0XrXxjiY4oqqQY9zt5s5ETu6NVT+fZ+4
	Ej39llg3jlWeEFjPs+m+JzCDzobK/qtePK3M7cG6tLpSYHaetN/ExVUq
X-Gm-Gg: AZFdTZc3mqA07fgi4Y6V7ndKZZCFOT7wX38Ed2lXBA0rRgn1lNhtY5LUgQaO9xgg3Mm
	K0a0aTPwUacxwMUdXNK90g2m4gQMPJPmJp9UV/qiuYu9rTc/AO9yABJu2oP04JXttH9zwgLJ5jv
	FfzcES2K/ziLwzAi/BI7uB2NAIWJsiaZM5qbshIOiH75sbHCbnoptN1VCItDFsXyHk2daMOxR6i
	MyPSbbPgEAjKm1iU1GL9Vaxi7dsPMbx475zXRjMNhYGgpw8p2sgrmfd0cNfCEkMGHIRhViVzRrC
	iIH+PBP10zCufjO1vW8+ujKDDbCOsbG8RmUq4LzlYiXwBa0p10eMLkGvJJSE/CQdDuSbewACSEB
	+bHdR4DRkdWkNxLBKfdXjO/kFyCkfI3MMB+xRhEtbV212tamsBTl3VFYKUy2Pzo2vnnohzoVWue
	jPDSZhgeyGTGaP0pbk2P6Vldypgxvjq4kCweTwtrso5iXze5Boax0ERHKD9aG8YV6Tc92iX5LKM
	0sDOQzKFthm0LkGpIGnb0Lya0G0eDnRLA4ZOaxoJf3/Q20Rho3hh4U5Bd17+KMvqEBWCm5OnEQf
	/6Dpas2lJRtCU7xC328RQAUMGVdB96dyBXNKP0YCAlaJgiGuUMBbu5Q4FWFLjOURJYfmJEhtWtr
	+vQABlJMMKbMGc1s1eDokmuY=
X-Received: by 2002:a05:6000:2681:b0:4a7:dcc2:a36f with SMTP id ffacd0b85a97d-4aa5a2dc7bfmr22665106f8f.26.1795296668557;
        Sat, 21 Nov 2026 13:31:08 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:07 -0800 (PST)
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
Subject: [PATCH v8 2/4] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sat, 21 Nov 2026 21:31:00 +0000
Message-ID: <20261121213102.143130-3-tanure@linux.com>
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

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@
 					};
 				};
 
+				eth_pins: eth {
+					mux {
+						groups = "eth_mdio",
+							 "eth_mdc",
+							 "eth_rgmii_rx_clk",
+							 "eth_rx_dv",
+							 "eth_rxd0",
+							 "eth_rxd1",
+							 "eth_txen",
+							 "eth_txd0",
+							 "eth_txd1";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
+				eth_rgmii_pins: eth-rgmii {
+					mux {
+						groups = "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
 				i2c0_ao_d_pins: i2c0-ao-d {
 					mux {
 						groups = "i2c0_ao_sck_d",
-- 
2.56.1

