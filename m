Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850174;
	b=AOgbQQ4NT2ROG0SMOSUzpiVAv7NOedEui76+W/zcl1wkGq1RWROdMqNIMhcSL93lj6eq
	 dTxG328UMVAJmUr/gs4x2zIptgnW2IG3jmAS8I5B5fZxYJokTStrTjZJsXuMMKLJpba2e
	 jxQ3FQvnnzxru7AosGD+Dzwo9tpGCyjIpTjIOnsocD/ARSDBH8eTU0yO6gRVEi+JB2kQx
	 3zAd/GbeHZ+fv+8b9fUuBzmXqCrnpfMJkFFk6FaEGKLuCCIzgi7VgCcs1oPkkRNB9rwAy
	 4BdYhymocMPH4m8qYTiN2oyuavqlOkwCIp0bSJYnW7eZcBe85aKWI6j/wbNjLC0SFsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850174;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ERr2QC7rdG7HmI8A9Z/kyJLwr/9Pp1mSeDB8spKj1IQ=;
	b=NiAd5T/jeHICrcOBXMN9yF9V5bDB2DwWuKsZ+UYDgoUxGbw4ejT2qCciRp7WpZqq5JXF
	 15xByfsmTP1AqPDdNaLjUQ50tXjWFEwOB3jLYSy++4cp2idZQ3gjohKAEHMP7suunkAgM
	 m1ptwJ7UnCAs2Mq0Eb5hx/52bT5Vfu7Pzkaap+WGbf2uy/oaY4iYSFGXpCZIW386Lyyzs
	 sCegtaidjCQtWrMKL7Bdxest2ud+0IULssFuNDVGpq05ewaE80Askx6YMm+Zp1emVn1or
	 Zsao4Iaae0BvYP8xrkbnGZSJMmsOKNtBK0BJ5osMu4j0dHXyhfrRTw9WU58pfVd7/cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55B5606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D55B5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so51344865e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850172; x=1796454972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ERr2QC7rdG7HmI8A9Z/kyJLwr/9Pp1mSeDB8spKj1IQ=;
        b=2dRW0y3UXXvWYEiazBBsI5ZIHJ0JfVHD3t63K0p+yDAd2SyXn7cLZXq2fNWVA7aBP0
         hoQQqUS1OfSWyEwznn/fEbnecp4QLVMO7El39R7WUmdQu4LEYmi0HQQam8cQ9MIUMMp6
         RcxLUr7cueSLfbszXscwHKmPhr4BNZ94g7WtU89XWJ/S+YLcyzofx+IZbcR89ynKspnq
         xRS+qviiO46RiBMU0Bdk1ZfhpquS8VPwdWLphnjmeZCx8Jq8sjaNRlz58ORLq/RSswFO
         K35v4bvs58BDbHEAkx1AEgLeAX3OBruVOWTqV04uI16yzGP0qj+7Y+2LjW/96NAxdsP1
         WugQ==
X-Forwarded-Encrypted: i=1; AL+hErGxubJZko8taPnPvbLSx1yOln0Xc3QspqfLQYWtuHozjWvi+GmA+mxcdeKM0uOSxlawVnheyx1t0NVOcYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/NOsUmL9+UGIrBxstX7C4Rjq3oGaUsLdBpj/bRk82Sn/I2j7v
	ieDxIpYH1kSrupurc+vvJhasPI6Mopxwdh4hMBZAfTqfRQlXb7bDzYor
X-Gm-Gg: AZFdTZeQKw3ve1DAn6FIMo2D0z7JUILxdkE+oo1wEzmvJ0DeDhcMZgqQAmEnjsC5fdt
	xqZj29M7GgISngs0p4BLaaoIwvqmBrLtwUB7aG55aR2GgnfvJn1cGHWEJkfFXU8xK05l7nKG8kL
	obOZlIdqIAAiA/8ALGOhSd18UWMK/zXFvnDtzcb9VKHuIZH6H2H0w85uTrvgbUXUixO+GpYbHQe
	2QjUoMe5YvM98jRE23/5bgi1++nPhIEd4Z0WMCcbO8JW2f2A0peYzUdHjo4daQ69ctByjolIlPC
	LxAZ3DuLW4F/mm2ft0bxqgneXdlOJ8+8c1VzKWrM/Kt4ZtXp7WHwOBNNFQLduETImTKhR+TNxIi
	tMyx+LXgmQF8Pje+IfkFHPJAuhsUIsN3/70tLf890gTn7UYbqgVNE2rhPjzQ/JT81wrZPOIi4n4
	nNdQzLYHbYe5r3fpJBS2TV76jLSL2aYkhFmecM1BXtPaSv92Fa42g/bzRcL5MyLF8pVH260uQ3H
	RFWmoCldc4+9H+/mU4NNOVdtyzlGFWLO6ONUv4ZvuPmVuMuVgQkvD53eMy39ePZ/Gle4Ywh2QrY
	zS8x3A6w7LAKkAsRbqlU+nYzLKRTv6FF1dhO9j1+QOxZMC+uaiG6KLXnEEyMsQaZfKK4ADxuEja
	Xx+vjI12CPAWusinkYnT6F85L6vYzPzzpPKRL5B8eoWYh
X-Received: by 2002:a05:600c:4f48:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4bb8893ab9cmr572089445e9.29.1795850171873;
        Fri, 27 Nov 2026 23:16:11 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:11 -0800 (PST)
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
Subject: [PATCH v9 0/4] Add ethernet support for the Amlogic T7
Date: Sat, 28 Nov 2026 07:16:06 +0000
Message-ID: <20261128071610.27855-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
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

Patches 1 to 4 of v7, the bindings and the driver, are in net-next:

  2297f88ce0b8 dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
  18029931478b dt-bindings: net: add amlogic,t7-dwmac
  c4c851a3325e net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  4fdc7da7e13d net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7

This version carries the rest: a binding patch for the MDIO
multiplexer, and the three device tree patches. Patch 1 is for netdev,
patches 2 to 4 for the Amlogic tree; the device tree patches build
without the driver part.

The T7 has the same ethernet glue as the G12A. The glue registers sit
in a block gated by sys_ethphy, so the controller node lists that
clock as "pclk", and the pipeline stage between the controller and the
DRAM has a gate of its own, listed as well. The MDIO multiplexer gets a
T7 compatible with the G12A one as fallback. The VIM4 is plain
rgmii-id, with the PHY at the address its pins strap.

Tested on v7.4-rc2 on the Khadas VIM4 with the PHY at address 1:
941/944Mbit/s with iperf3, no error. A scan of the bus shows the
PHY at 0 and at 1 and nothing else. On top of linux-next, with the
on-chip PHY bus enabled, Igor Velkov's multiplexer fix keeps the
external data path across an access to the on-chip PHY: 942Mbit/s
without a dip (details in the v8 thread).

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7."; I will drop or rebase whatever overlaps once we agree.

Changes since v8:
 - patch 1: commit message cut to the fact (Krzysztof); Krzysztof's
   Acked-by and Martin's Reviewed-by
 - patches 3 and 4: Martin's Reviewed-by, no change
 - patch 3: the on-chip PHY bus still starts disabled, a board enables
   only the bus it uses; the line can go if preferred

Changes since v7:
 - patches 1 to 4 of v7 are in net-next and are not resent; the
   numbers below are the new ones
 - new patch 1: the MDIO multiplexer binding gets "amlogic,t7-mdio-mux"
   with the G12A compatible as fallback, and patch 3 uses it in the
   multiplexer node (Martin)
 - patch 4: the VIM4 PHY node uses address 1, where the PHY is strapped;
   address 0 only worked through the RTL8211F broadcast address (Martin)
 - patch 2: Martin's Reviewed-by

Changes since v6:
 - no Assisted-by trailer (Krzysztof)
 - patch 2: the T7 gets a binding file of its own (Rob, Sashiko); the
   pclk description names the glue registers (Krzysztof);
   rx-internal-delay-ps as constraints, default 0, maximum 3000,
   multipleOf 200 (Rob); tx-internal-delay-ps stays false, the
   meta-schema refuses "not" on a top-level property, so the reason is
   a comment above it (Rob); "snps,dwmac" dropped from the compatible
   list (Rob)
 - patch 6: "snps,dwmac" dropped from the node (Rob)
 - patch 4: Andrew's Reviewed-by

Changes since v5:
 - patch 2: the T7 block follows the Meson8b..G12A block instead of
   splitting it in two; default: 0 for rx-internal-delay-ps on the T7
   (Sashiko). The explicit false lines stay, as asked in review.

Changes since v4:
 - patch 4: the old delay code is left untouched; the T7 only gets a
   callback of its own, and the probe parsing it shares validates the
   RX value (Andrew); no NULL check on the callback (Martin)
 - 0 accepted for rx-internal-delay-ps, the T7 joins the G12A list
   (Andrew)
 - comment on the deprecated vendor delay properties (Andrew)
 - the MDIO mux and the on-chip PHY bus start disabled in the dtsi; the
   VIM4 enables the mux (Sashiko)

Changes since v3:
 - phy-mode untouched, the PHY adds the 2ns, rx-internal-delay-ps is
   tuning only, tx-internal-delay-ps not valid for the T7 (Andrew)
 - 0 dropped from rx-internal-delay-ps (Martin); vendor delay
   properties explicitly false for the T7 (Andrew)
 - init_delays callback; patch 4 renamed (Martin, Andrew)
 - VIM4 without tx-internal-delay-ps, the PHY TX delay works (Martin)
 - Meson8m2 moved to the dwmac-3.70a list; its boards warn in
   dtbs_check until Martin's dtsi patch lands (Martin, Conor)
 - the delay table in ethernet-controller.yaml dropped
 - Martin's Reviewed-by on patch 3

Changes since v2:
 - T7-only delay path (Andrew), PHY mode from
   phy_fix_phy_mode_for_mac_delays() (Maxime)
 - tx-internal-delay-ps checked against the hardware values (Sashiko)
 - vendor delay properties not valid for the T7 (Neil, Andrew)
 - no max-speed on either PHY (Andrew); VIM4 PHY interrupt on GPIOH_6
   (Sashiko)
 - the T7 node owns sys_ethphy as "pclk"
 - no longer RFC; Conor's Ack dropped from patch 2 and Neil's R-b from
   patch 6

Changes since v1:
 - the driver honours the generic delay properties; VIM4 moved to
   rgmii-id with tx-internal-delay-ps = <2000>, Neil's R-b dropped

Lucas Tanure (4):
  dt-bindings: net: amlogic,g12a-mdio-mux: add the T7 compatible
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,g12a-mdio-mux.yaml   |  6 +-
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 88 +++++++++++++++++++
 3 files changed, 116 insertions(+), 1 deletion(-)


base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.56.1

