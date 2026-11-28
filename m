Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795887426;
	b=nEpci6ekKkOsSGFZ22Z4GNNu3m/pNeHf099oqBSwCjS2lM8/8s7uAEDqjITXYJJ/VQcy
	 blAW9Glbvo7onojZKghRp+EjdQTho1ADDnMekPmZ4pH7BxYSmjwlGbSWjQs/DT6EakOO9
	 fEui3+H9SzoVKZ1xr8SUq6HB15XKhSdE6Wib62DpdFeDOmkaR4iYUKdTWI/dOD1GT7Rpo
	 mMY6s4DhBAbEi533y1wry5tx79lAB9/CmBpx5wyld4utFE8/EVNLgrqht3ODz2z8MQLyl
	 GazRt4P+deJ7Ket9gMKs94cIq6lOIZyEIhBkhBroeNz9BulyzXkcBTC+luViIsjf7NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795887426;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=aq/8qnWFzJ+ZCCxwgyPl9W6fMdXd//kItDuswrplCRI=;
	b=GXJOrAA876UoaaycnsnNeY5851sSEnt59j8MyvGRELE4uDFDULkRcHaUnr3+8v6TNDgK
	 PPGUn+dtAvuCLvKvzjLd6kmoJ0w7zeNIUv69IOy2KUHR7XaY2KZGthG5sHRW7GiLYJUHn
	 rIY8GAf7DGon5U9UM9fI0IR2gHezZfXKxlJkHKWiCL5dCImJImfbdebCDBJ4bE23igqkb
	 anz38uRVfj/vzwJxSlLwA493CVkswntMtRP88uVJEt8cKCD21RHX+d5P7E+AH74TeURSW
	 oQ+Ia4Fq0wxuiNOVLzj6nFm+X1/tACbZyA9tkWYZcPlXzH+B7O7NoCaovpD3KIDAabA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=azauLUvs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407F5606A31C;
	Sat, 28 Nov 2026 17:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=azauLUvs
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795887425;
	b=KNBjIATJQpX5LsPuFQqX1ULtMupgYmoySlE65eEMeWqgXl6MU/MfanhHk8lURcOd2I0P
	 m24KOshMjgnGwEQxnA762pFny9XexVQAM9ybOBKEam17t69eqkt0+2XFxiZYNNjRE99EA
	 h87ckQCBfI1Qj9+7jrMZTBdbiuRafDnrwlfxCZdz8AyMMIGdrKLsmbcQOW+UzchPy5fcN
	 Oy9ew3QHFoPWESY3EPdrVByDTKIikwuvuGkBW1TCHsjMIq3HuYsRUuvR1cqBffa/f7xpa
	 Z4rCwc9gDkLe/P4hz2NUr1KQnyZLc/iioDWkiGSoo5QCcoHj6w4AkUcnB4vWcwdWWyA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795887425;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=aq/8qnWFzJ+ZCCxwgyPl9W6fMdXd//kItDuswrplCRI=;
	b=a2J1bECqloyzOPGsCW6SdPa5IZ/5XZcPopcnH3bFyN/H+vlKCP7CIhpdlDs8L16xD20h
	 wxkt7UNEUG+9WjqBQuTB67/NvMHp3IysFsJbZJa2zwVsJa5IE+/OOEROqW/rrebgi+Y0b
	 7x9oFfjWWq8Nm/fEUuazG/pi8dV8qLCXZ7riALN/CSksvbdCzYe/cPmqNSziTfm+TLPTv
	 0SPXfdUgdfJvC+LbPr8uckqt8Wgey5K7l7nWgOBoyYtzVUKwqey0j+PE0fxdQn2k6CJWe
	 H52QQKp/vvNeco/TIeKGL9RyiqOzKaukqJ1gaSDzmtlv17hoKstQU2R/YSmhFC5x5ig==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 034F11F000C1;
	Sat, 28 Nov 2026 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795887425;
	bh=aq/8qnWFzJ+ZCCxwgyPl9W6fMdXd//kItDuswrplCRI=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=azauLUvsL2b0EQBONgWZ1NNWqgD2CFi4qA0x5gBFQ+ozbxt/IIGrE7iymkUoOTG5L
	 LPPjLyEhEtJpQc9uS0CnfO0gKFsjsyumAtKPYwpQ1g6p2lAshQCCaRVfbzzLmS3IHI
	 eFG+lITSSTYhY3NRioqf5kdAK/K6fbJjlKKVIr8QFKodcpLI24c+/t4Olvl+hX10jQ
	 LEHfZNv9HpLQSBlAiqX+7SxpmHT7Bz4B2sjnSpFZD95JnBNJIpjadwNOqK53xfQmyK
	 ErNPLvRqIsdLNQEiChEa1uFCcJYQWpaEnowaB7pfM9wPxwWOQXUagbpZQLfP2QNyVD
	 Ak1+l7oqrP1Lw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 89CD24E173;
	Sat, 28 Nov 2026 17:37:00 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH net-next v5 0/6] net: stmmac: dwmac-sun8i: Fix the EPHY and
 MDIO mux ordering
Date: Sat, 28 Nov 2026 17:36:59 +0000
Message-Id: <20261128-sun8i-emac-mux-uaf-v5-0-0869f2ccdb8b@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QwW6DMAwG4Fepcp6nxCEh6WnvMe0QgtNmGmEig
 Kgq3r0pu6AK7WjZ//dLvrNMQ6TMzqc7G2iOOfapDOrtxPzVpQtBbMvMkKMWQiDkKZkI1DkP3bT
 A5AKIxhmjUNhAxErwd6AQlw39ZIlGSLSM7Otvk6fmm/z4NJ+315jHfrht/bPYEv9VzQIESG4c1
 aSDD/hx6Vz8efd9txXMuCfkIYGF0Mil1rpBbepXQu4JdUjIQnht20oYq6RtX4lqRyA/JCrgoGo
 qr7NCBVR7Yl3XB/yk/NqZAQAA
X-Change-ID: 20261112-sun8i-emac-mux-uaf-1ba885219fee
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795887420; l=4310;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=diqyOokNxmNMXVp6r/2ll5hIionfItCESuvwZR7mZac=;
 b=iaaHRECaQj0T/wPlU+ecYtNIym+zRISillh5j2gvc+L9GN2+SJiS+T0LfYUatFdAGxUXZXq8J
 qV2hk1ak4UyCMrzVrQsdr1nlxjJokfKDa0M+vXOQYs2wsHjNL4OkHvk
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

Chen-Yu Tsai pointed out that the probe error path and remove() put the
EPHY clock and reset before sun8i_dwmac_exit() uses them (patch 1).
Sashiko and Maxime Chevallier pointed out that the EPHY lookup and the
mux registration run after register_netdev(), and Maxime suggested
registering the mux in the MDIO setup (patches 2, 5 and 6). Patch 2
replaces "Defer probe when the EPHY clock is not ready" [1]. Patches 3
and 4 make the stmmac probe error path, which a mux failure now takes,
undo runtime PM and the resets as remove() does. Patch 4 also asserts
the resets only after the MDIO bus is gone, so mdio_exit() runs with
the MAC out of reset.

Tested on QEMU orangepi-pc (H3, internal PHY) with KASAN; I have no H3,
H5 or V3s board. On net-next, a test-only mdio_mux_init() failure gives
a KASAN use-after-free in clk_disable(), and unbinding with the link up
oopses in phy_stop(). With the series both are clean, an EPHY clock
without a provider defers before the netdev exists, and unbind/bind
cycles pass. With patch 3 the MAC runtime-suspends after a failed probe
and rebind (usage 0, was 1). A test-only emulation of a bus that enables
runtime PM before probe keeps it enabled after the failed probe; PCI
itself is untested.

On an H616 (Orange Pi Zero2, external PHY), a forced -EPROBE_DEFER from
the MDIO setup leaves runtime PM disabled with usage 0, and the MAC
suspends after rebind. With patch 4 the MAC is in reset after the failed
probe, and a test PHY ID read from mdio_exit() on unbind returns
0x001cc916 (0 without patch 4).

Developed with Claude (Anthropic); I reviewed it.

[1] https://lore.kernel.org/r/20261113-b4-sun8i-emac-ephy-defer-v1-1-12a8591702fe@gmail.com

---
Changes in v5:
- Patch 2: say why the lookup moves; the deferral fix only matters for out-of-tree DTs (Sashiko)
- Patch 3: disable runtime PM only if the probe enabled it (Sashiko, Maxime Chevallier)
- New patch 4: assert the resets after the MDIO bus is gone, also on probe failure (Sashiko)
- Patch 5: document when the hooks run
- Patch 6: name the hooks patch (Sashiko)
- No Fixes tags, as this is net-next; patch 6 reverses the ordering from 634db83b8265 and 529254216773 (Sashiko, Andrew Lunn)
- Not changed (pre-existing): get_ephy_nodes() needs an mdio-mux node; stmmac_dvr_remove() disables runtime PM unconditionally
- Rebased onto net-next
- Link to v4: https://patch.msgid.link/20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com

Changes in v4:
- Put the EPHY clock and reset after stmmac_pltfr_remove() (Chen-Yu Tsai)
- Get the EPHY clock and reset before the MAC probe, defer on the clock (Sashiko, Maxime Chevallier)
- Balance runtime PM when the stmmac probe fails (new patch 3)
- Register the mux through new stmmac mdio_init()/mdio_exit() hooks (Maxime Chevallier)
- Now a series, new cover subject
- Link to v3: https://patch.msgid.link/20261115-sun8i-emac-mux-uaf-v3-1-c69d4189539d@gmail.com

Changes in v3:
- Drop the Fixes tag (Andrew Lunn)
- Shorter commit message
- Link to v2: https://patch.msgid.link/20261113-sun8i-emac-mux-uaf-v2-1-6203666b2687@gmail.com

Changes in v2:
- Target net-next instead of net, drop Cc: stable (Andrew Lunn)
- Shorter commit message
- Rebased onto net-next
- Link to v1: https://patch.msgid.link/20261112-sun8i-emac-mux-uaf-v1-1-308ae7e6fcf2@gmail.com

---
Arun Iyengar (6):
      net: stmmac: dwmac-sun8i: Put the EPHY clock and reset after the MAC
      net: stmmac: dwmac-sun8i: Get the EPHY clock and reset before the MAC probe
      net: stmmac: Balance runtime PM when the probe fails
      net: stmmac: Assert the resets after unregistering the MDIO bus
      net: stmmac: Add MDIO init and exit platform hooks
      net: stmmac: dwmac-sun8i: Register the MDIO mux in the MDIO setup

 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 82 +++++++++--------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 17 +++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 11 +++
 include/linux/stmmac.h                            |  3 +
 4 files changed, 60 insertions(+), 53 deletions(-)
---
base-commit: 8f0f7f39913e8b1571f2e6a8295a700356492f2a
change-id: 20261112-sun8i-emac-mux-uaf-1ba885219fee

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


