Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327298;
	b=mlcIcktjXrhQFPvQg4vLHYUQVHm1YHa4GGiRzUZ3DTc+zoDkahR8Vhi1gHSTmdiwspSJ
	 9FTFwdb23NhJCd/bq4+9mtXCYzhCQO6527Lkir9xz5i6kMxkltCNFcKv1ja/wN0vbRt7p
	 bkuctsTr5kXglca0oWsfdMIHMNETd0mZOCUWiC76ZdKwe9I4UogU2qxBZR+seiTLSAK23
	 c1f/XB86Pqp+8S5ee+CoQFGsGVVmWLbvXQE5RbZVqlon/dWCiaSSOOy03wxnoMgskrBIT
	 8dr1mORu7RrtQScG3LsQo9kOG8XPd5uYktF5D6Ty8566oyk2ZsBd3eaGOEL4otNiK6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327298;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ke4IgnUz7inY+ONMqxKiiDGn14CGx+ZmqvyLZlExotU=;
	b=zJujDHZMvFJxQ8JZ70YNuHkSR1GJuVxqctbp2TdsYHohg0NvdlBXh1iZd+/794j1WWcj
	 JIzQTYPuGKSt6RjPuFc7T7MK1IzdF9N1REEPaFLF/UY0SzpXwukfsCkVleNZ1/a6/FE0e
	 v7IS/aL03oC5EjtMBfNHMhXy0KmBDEU/Cgt7eE5nQpdBdfZykbEbIGUPMP4+GOOHK0Wz3
	 MX6QS5VI1sOXW7L/dx76WeI4KAZYA1EBDx8ThkvBdgzbGYWuCuaq/+EwKK8vabSJvDkzk
	 Oej/hgKqDbvhHk0cG3eRu8tXHMFRddkESB7j65JdVIEM7PIKlcoEOv85ucpDeFHh+Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=ZJ6pDWrI;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=HYmQ1up+;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C06606A6B2
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C06606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=ZJ6pDWrI;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=HYmQ1up+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795327292; bh=ke4IgnUz7inY+ONMqxKiiDGn14CGx+ZmqvyLZlExotU=;
 b=ZJ6pDWrI1/x9WWyiaPj9o6Vnk7jLBU1xjCilQGgZ5ve2D9MmA4utpVydcvGLs+EiqnB3LfRxl
 eUaKZ7C5o43hNEuKf3Aw+9m/bqbitAS1QQkcCgFAAHkx04exdeKaKf8iECU9zG5IY2boHlDWZaH
 ro3X9ygLUP6kdhANFEjjbRwC0NF64RnT1ArcFQqNTYzjGNbmrYPGwEgJLlDnQGPsjOmQEFAnGP1
 IoGZaZsEXlF+hrQqW3qxkViX1BAMM8i4gLQaCfkgvGG9GM66QEHW+8kC2g2lnAwSW8+Uzcx93FZ
 TraIVahgEil5pV+zq1zkYoWpRpjWQsPVKVaWghKC+Orw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795327292; bh=ke4IgnUz7inY+ONMqxKiiDGn14CGx+ZmqvyLZlExotU=;
 b=HYmQ1up+tT0m7uY9zG0Z02zu5uXeZJLDjTftgnM/HaYaDc8iXpNSj3mbGVXHKouLAqK9dZZOM
 faAA8i4r4LOPLdHexrS3ZMgs5qBmjM3s9X9uPgfohSkLYCLczksXZn5hb9UbsXRTgZ2KWelFqi4
 WuGwhZeKiW51bJHOEB9ynqg=
CFBL-Feedback-ID: 6b02852fcff95ecda8c09329:42337bd3833695854f7a2e6fc72dcce6
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b02852fcff95ecda8c09329
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.37
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 0/8] ARM: dts: rockchip: Add Luckfox Lyra boards
Date: Sun, 22 Nov 2026 06:01:03 +0000
Message-ID: <20261122060114.773624-1-jonas@kwiboo.se>
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

This series adds initial devicetree for Rockchip RK3506 SoC and initial
support for Luckfox Lyra board family [1].

The Luckfox Lyra board family use different RK3506 SoC variants, i.e. Lyra
and Lyra Plus both use RK3506G2 and Lyra Ultra and Lyra Zero W both use the
RK3506B varaiant.

All board compatibles use rockchip,rk3506 in this revision of the series,
maybe we should use rockchip,rk3506b for the RK3506B (and RK3506J) variants?

The pinctrl driver for RK3506 will not work as-is using the SoC DT from this
series. The already merged driver depends on a rockchip,ioc1 phandle prop
that never was described in dt-bindings. The SoC DT in this series instead
uses rockchip,grf in GPIO controller node to reference correct IOC for GPIO0
and GPIO1. A patch to fix the pinctrl driver can be found at [2].

The branch at [3] also contains follow-up patches that e.g. fixes pinctrl
driver and adds USB support.

Mainline U-Boot support can be tested using a branch at [4], it contains
board support using same devicetree files extended with USB support.

Changes in v2:
- Add default pinctrl to fspi node
- Add display_subsystem, vop, dsi and dsi_dphy nodes
- Add osc_clk_out and ref_clk0_out to pinctrl
Link to v1: https://patch.msgid.link/20261119152055.556266-1-jonas@kwiboo.se/

[1] https://wiki.luckfox.com/Luckfox-Lyra
[2] https://patch.msgid.link/20261120201540.672016-1-jonas@kwiboo.se/
[3] https://github.com/Kwiboo/linux-rockchip/commits/next-20261116-rk3506
[4] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commits/rk3506

Jonas Karlman (8):
  dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
  ARM: dts: rockchip: Add support for RK3506
  dt-bindings: arm: rockchip: Add Luckfox Lyra and Lyra Plus
  ARM: dts: rockchip: Add Luckfox Lyra and Lyra Plus boards
  dt-bindings: arm: rockchip: Add Luckfox Lyra Ultra
  ARM: dts: rockchip: Add Luckfox Lyra Ultra board
  dt-bindings: arm: rockchip: Add Luckfox Lyra Zero W
  ARM: dts: rockchip: Add Luckfox Lyra Zero W board

 .../devicetree/bindings/arm/rockchip.yaml     |   9 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |   6 +
 arch/arm/boot/dts/rockchip/Makefile           |   6 +-
 .../dts/rockchip/rk3506-luckfox-lyra-plus.dts |  31 +
 .../boot/dts/rockchip/rk3506-luckfox-lyra.dts |   9 +
 .../dts/rockchip/rk3506-luckfox-lyra.dtsi     | 124 ++++
 .../arm/boot/dts/rockchip/rk3506-pinctrl.dtsi | 594 +++++++++++++++++
 arch/arm/boot/dts/rockchip/rk3506.dtsi        | 614 ++++++++++++++++++
 .../rockchip/rk3506b-luckfox-lyra-ultra.dts   |  31 +
 .../rockchip/rk3506b-luckfox-lyra-zero-w.dts  |  23 +
 .../dts/rockchip/rk3506b-luckfox-lyra.dtsi    | 100 +++
 11 files changed, 1546 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi
---
Based-on: <20261121155810.706866-1-jonas@kwiboo.se>

-- 
2.56.1

