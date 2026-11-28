Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850176;
	b=0cl4eyTgJIuQOPOvdfglwshaQIRFGlqYwoxrKa4N85fAVz8khYcJQjRb/Jprg9uwUIs7
	 Bjg3+mIRF6K3ipOg/SFigZPFrPCjnX9PcIe2xfee0FBXCHg6X14EAjGadeoiVefpz3wbX
	 bthoKmZgy4PH6nFLMDm2dUpFVGARckSjl26voYfHeT2CG4SGH/wdqB6hH7TAYW417cfaf
	 gpEilzd4xKJZyAf5Bv8hGd7K/Mky+G07oOd6+YekExKgeWZpaXPW/RHwyy/CToNT8t/7h
	 hIwYyAx7WjZ06GvBwGDdGGQZWAB+gebEXSLExZDy0v5dznnN7gKq51gSmBp14EqI/jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850176;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
	b=3mF/hj0/eNTY0W33tVPU639/W1UnGB+y+qaxr8H4o3/uxTxS3E59K9ZZZb0tjyx1INQl
	 d8+qz5eBR6cwStjVb8E5fYD77iOBOnbx2Ree9hB0JOnXBQCjAD4tk1fSKGzHGHcwMH7C2
	 Fk6Mi9RyS/2TnB/JWIE/mUwLlPOVFZZVhE8WfbBixn0hE1tGcVCUR9DxGySwZgFpDytH/
	 8OP4nnx/22cncAFm+dbZQibmGgKOi4EJjf4W/S4ycBcz3IE8/5flqAFoe9WTIW+1ZzPp8
	 mz9sSsBdDenmo7PxGKEYvPYW4fBYGz2c7C8VzW6Qy+VYLmzrOzS6Zbwbr0B0M8+1pmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AB8606A68F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11AB8606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so90028445e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850174; x=1796454974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
        b=KWB01Jqnz83qbq7nRoqGW6ZjvBq3d1SHZJwBH4MG3rfQi7aVTGrkbdfXgOIvlCdtax
         mhh4jLcvJxyKoRlUhCP6jdhZVbtOAnLl0WILywGWN8FFpmVkKDOX7W8wOHpRA30BqLu2
         +x5XggnJwZz3J/MO2H+uFwOZ8UawjuaChokJzjRHERoy5XvJcv5aEAxXyKNA5QCuAAnm
         TG/0WI9HB5IySTxh6LnlijI8IsQ5aBAmzlyhO4YOVJqcbPkXdjuXe/o0jDwTif8TH7gN
         ErgZ5VzVwRHcuFLRCqc2+5XMMrfnMYPgkozjiBYYiW7k8obqkyouUFpmTiX/96uAjB1M
         wuCQ==
X-Forwarded-Encrypted: i=1; AL+hErE4OJ/VIs8LSIwN6epjUeVEA6KMWvsK9KnesqF9DLdMcQvgJ4hR72UbEyNJ8jARUb8xwntauFHl9d2F6j0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KmIxo2/DY02/mo6mC6CWtV1+DlFUC+rILwGwOchvAPEutI/kj
	aBp89WYOQWLtek0O2x1LofIFeTfoh60kbXHMwesTU/1fVzpgItGFBtBq
X-Gm-Gg: AZFdTZcGw67tRdzT/OWQMrNV0WCZh135YEjvdCYpfzNmhBq3PiomI37XgmR3jQZ3/5p
	BqwH/9eYWacWMF+ak4iDFepCo1GFoBA5sG1r8sg6CrF1yPC3BA1syClTDrhq0NZcXfEPau0zEG0
	OHiiJWpwoiK9hDRCSWuClLUq6D3tmqMJMCGwK9E1zZa8yUBN+KUBsyGMQdWSq/RH78UyhxZqOt3
	Jm7NVZ2ySn61Y4BB9d3ha93SHXO4xumnAmrH4su/PO2t5V3XuLeiVqgR3I60BD3wiH1/gkAk1YG
	XnSjBPjiUtSvY7SrYV8v4WwC7t+9SNg7D3ftKPPf54l+RIfEJElscwiioUhiA0A6S1cb4kvrd+0
	Ke8y20UwxiqrntRNXfJ5WXXVy3AqkRzzXdlc3CKQwuNOHXOsaRR9g/1IXdejesKdVdcWLOTNf04
	GT01zpP2mh7iFKXWZP7mN8kF6iR83WNdgoduT7g58KBNvfG0U7IYW1ilLLJCyqO1QwG6U5k3XlL
	MJs/zBnsLuTXcl/g+1mmoLO4ZD25ivnLjWMqQ/dE3+BDCXMtzlGmjMatzBFyyeNveBlIFSSeYOE
	MjFR+wTJ+HFOqCwWDRENgYmD58TGJOnL5DmPk5JhmQBe+UMDEA7L3og7/a+rZQ+cWlv2m74myKv
	61otxIGGHQYrdoNPFFVc9pZe7+MgThA+/ql2jwzRDdL9+
X-Received: by 2002:a05:600c:154e:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb887c3b63mr570429285e9.4.1795850174257;
        Fri, 27 Nov 2026 23:16:14 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:13 -0800 (PST)
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
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/4] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sat, 28 Nov 2026 07:16:08 +0000
Message-ID: <20261128071610.27855-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
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

