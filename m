Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296666;
	b=xToSqnSvwJJToBtzN5Uvh3swxlte24kBg+8CUsU6S1Ft6ZpPWtW94TrYphqphBZVhI4v
	 S8uFNO8AypgCLnCqdTzYdhJBvkjJ0Qcyd/rDjsTfQ/B2iZGyVdBiUowDhcTjI4yXQ35PZ
	 Dqck/m/XFWd3WR+UGkUxT//cYaWqoBhiduOwME84jsuKUj2Zo/sc/J0IZY2Vr4v/knEzJ
	 fmFQ+n/MsNtvirT+uXyRLdBZldiK3rjML9R474uUFWxjjrkpFOL8YYnkuJkjzE1xifq+d
	 VInEXFAh23NW9m2xIQYS+aVji5Go874mAiCANXtgtRNhHNgcA0PatyUPY3BwwUh8cNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296666;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=C93fQcPXxnOGbGKaXQAkMtOoh58jzuHpLH1rCb798RU=;
	b=g4C+S6oyllxHs7bgjmKYGC55e1fzH02Njy3ZwvlKRRZ5k7oPw+R1gJNkeaAUq12VPMdk
	 RaJg+ah7gvLpzMMQ9VjSL5fo7fU6X5bwJUgHa/pU6aJl2SuptVjCbS6lHgkqNoM5hUe92
	 O8XSGZjfv2Qm6PbYbEgJDjgBUa0IwQylN6uwk2O0ci4rQ1qi7RqaeQ2X4llQHosWQoKQZ
	 cPMMEesfCcNmTMfv8OIm9iRMimHE7ASb0kgHQIkUvKgI0FWsmw1HijeYzlRLBN+768zpO
	 RLZ1161wUhK2wpRIyFxUZ51p28y0lljWvdeXK8UlxbeOAmOgvpdOe5z8PaeXtJRShTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3722B606A333
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3722B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so14094405e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:31:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296665; x=1795901465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C93fQcPXxnOGbGKaXQAkMtOoh58jzuHpLH1rCb798RU=;
        b=RgzsYvTT3zqZSN3Wn4KRRgtX74pHVFCcvrcZ7HctHWE0lE3/Csd+hed6MerN3Ops0O
         Psxn9+siKZmwnaoE9QCSzakLn06m/MWwElwOpQKfwmEjUFeabFt6Y1KL0cQIuMCU+hna
         HdQqS3hw+WfoJXNYI0zGQ11E/4BSHJXJoRhM0DDfkmiCS6n656pedPJb1rW77LeJaBHd
         yLU21K+X3jLYn8nPAAm8Q0Cn6yc0OBod+g5aqIvvfhdwh1/PXGnF3OUnuv1he2IweuyZ
         mWmldJfjo/4WP5SAAFF6kf15kffwbkfVJ8xyM8S4xsrwF6ogypiBjF8tt7kMpQR9jFVN
         bliA==
X-Forwarded-Encrypted: i=1; AL+hErGNMwIVdsIZkiFhRI3iTge5ZCKm2RCxRaJL0V2Fhp6c7MtfvGM3i6DIc1E3PCzM+W0z7thvHJn4m+vrRgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qrxUXxyVGgW2uW+Xzv+7YMh+Be7V//WGLjLsgSR8EK132HwGq
	ykfi1rLXXYIwImdi3t+dPhf2Tyj4dI/YzwKTkZnRwnC/2Imam6Ax7l1q
X-Gm-Gg: AZFdTZf29Te3r/3K0M2dRLn9D7RWdIOPC23otZQzRQ3C6wztMqIkDe7VUnKbAZ4CRAs
	VfEmuZPlMQ6pTvA7p5K4RrrLPNB6CPqwj90n5lKXXPa+81kX138vWM2dsbgDeOym8eWIujOnCFL
	gyI+x+pZCjM2460367rwoU2MNk6nGcP5Dnj/1APOqkKmClbOmLjsZUPlWegzfeUXodOsJ2UzCf5
	oGaum7vXOycvvFXLSqp6BpPt9tWgVJMfDU5A8ybur0JjaNFMbX4AIXjps5qqX7ecXEWfKT4+Nit
	kWMg2bgXG26HYHBtZK5KSgAez1Yi05CMPF4m4Q5OSrFu2K9AGkALEWwwWCWlUtqSCWOyvGVP9zO
	XPeyYi3D5uiAPS7rhraVEUgK2mX03ZIz6aaeJ7whfJKA+yVopzSO7WHI3oilyim4biWlaLb0AnD
	SPR7F4DdZcCbPio6XsCbTjjExYTDNLvb3Y1witsVFLnGNkWMNgehKD3jLbdGxm+h9pX8hy95Sk+
	xudExiKah6pOUJjN2PKc+9Rj7lXUgaIj2n7sk004XqKGd2eL+2264DYskZ8fQoWKkQnFTM6d7Cd
	Ags7b+89SAcy0VghrejT579eN0M5uLyBQucvyhaIDkJcSXGkWDLbUpxEX6Zwlh6d8z+bLLlrMk4
	BkAcmeGaRCyh50SqNykBOMu0=
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr167527095e9.26.1795296664478;
        Sat, 21 Nov 2026 13:31:04 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:03 -0800 (PST)
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
Subject: [PATCH v8 0/4] Add ethernet support for the Amlogic T7
Date: Sat, 21 Nov 2026 21:30:58 +0000
Message-ID: <20261121213102.143130-1-tanure@linux.com>
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

This version carries the rest: a new binding patch for the MDIO
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
PHY at 0 and at 1 and nothing else.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7."; I will drop or rebase whatever overlaps once we agree.

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

