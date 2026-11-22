Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335124;
	b=Qyk8y+vHuQXLF8PGFr25vs1w+mwNjs2SYrqqcRs9Gb3Bko7Z572ZLOd7OxeImzDfyfL9
	 Uo/EaBcMAQy7d5ZEtAXjZPMaGDfNAxuvwWHt1GRWuMtW3rCRiSsEqxC1pLHKUsy3dSyuO
	 SpOYyFZrt48Kq+2EQfof8oA5glAYIaWVPvX2P69/u0PDaXrjswxYVFYkQcDepz+C4n+Jr
	 0Y4NbP/bnggjO2Y3H4N/2wTWvzianeEB0785BV1Dfsvq8XIL+rRHasS7BVWrLpGyUJy7Q
	 qFiwbZfRB7GOyiUlPZg0GAiC+En3YXjQddvzRjgrEGSqmcShTIeKG12kZDG6mKdbu1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=SR1QHOHLnA6O+j3b87UO0XVNyCNb+8YNztvTvFnfbDI=;
	b=2UDt7706JCsNTU7FrNdNMIzxgHX/FvtGd4f1awK6FiGgQZVjjQhmDjZJepwZA63xGUdW
	 IsS0wE8HuQoKH6TqzBRO+Sme2DMVJj6t105Jz+/RqhcACytX+cveII7xE6Flb7tiw/7x6
	 UngBLPeuGNzuSHCa7lHc/ABfFVTfShEjeW2YUSGlOfLdflWJ9+ZwhLl1Z4CqfMSbVXMPm
	 xOecP22zria8XwcRxS8WyO2t/CZm80wgl3evOlcmshflCdb1tK2+FIcHXhBy7GYbudoic
	 wK65JoWVqpJ5ASJf6ug6vF2d2QGr4vvVxbVsoh69cd0ZL6q8Ui5fALjKptb8Bvlqmhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FU4069ue;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FAC606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7FAC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FU4069ue
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6d290b10a35so895082eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335123; x=1795939923; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SR1QHOHLnA6O+j3b87UO0XVNyCNb+8YNztvTvFnfbDI=;
        b=FU4069uekgKFJ+1AEXrQ1eIQ7x3lie/J8IM48RXpRB4PQKrh0psGQd/Hz+STEE3dIH
         QErmQOocHWI4M3BxTo2taWnRI0yAmkVr3ZosS/DjEitcmWvDf8w/tzmX2bAxU0zXZV3v
         dVvSlcfBM76THtL1RBJgFbC8FM4Juajjhd1MhRjhluUx9kHViyJyEjpSP2zIu8m0DCPM
         JG84/NzPqqKWaqHelTXDDo/Mc34ZnOxAmFZhGvKHjMut7CHbp4JYaYMsqQyLz3r+utft
         nYhNQppSNMN+9xSdEniyfDEeufIPclCEIKKsYC8K7tdfKEANfD9UBsHMsClyt6qxl1Yv
         YRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335123; x=1795939923;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SR1QHOHLnA6O+j3b87UO0XVNyCNb+8YNztvTvFnfbDI=;
        b=eHWZlSAAARSfEYHlc0AjJSBoKpCUvmn1xMf+LUO5dPk8S9FHfWEXNaQNkdhfOd48lA
         zFiCwH7IHPlEybQkH1mmPX/gi7uPNRIkLVrchAXYwH7EWZz8HMSjYdyCHGcX9X50EW/q
         iJ/OHobP9fsAh6ozhGcywjojK1BlO83ud3eGe6FgTmOdozc34ldsIFZWPZMxXagbC0+D
         Cz8bvxgvfySLbpc7/gZhy1mhY6+AoafeoJYo79SVgTSWTz1v6AxBoQ6GBgbzW1QwhhYn
         FJXwGG2gFI3QDqC+o23vTY2183L+SxR2LWNKk6XfblC/BkmW5rff9kqjk18OYNnzeoLU
         x6tA==
X-Forwarded-Encrypted: i=1; AL+hErHaTn1Fdnz7SOQHV/uv7Be6OzK3QoSpVZN4ma7cZ/t0br7N7yNprovoFhCEolzQxDxzhbZLksDUhCNI4bE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ujQM9P7CPnF1SLZWVv72dvzaST4yq+FN1zP8jAeTQ6FAtu9Bc
	WuJ1AWCELLTMIe/WulRQyFcLiiNY7Bcq92lKNLFxJxzYtz1yK9k4t9CC
X-Gm-Gg: AZFdTZdvHlFF/JV1hZIpnQxxyslWraX64QXfM4TxNrlzwyVRkYTgj4xqiYUaWCFK/XS
	zWVTNddVHtllkellbugCp7ICgIAAxnYWEMzNLLzUg8WeJidlmQC1kzEiqJzEVLVjqzginsq7JBJ
	/2SkKxTs+T0U1fqqIe5gkqMFb4CpE2hWUMT1rNyaxF2HpczFgw2h3Yde/4p9dbNBWSe/KRaoXT5
	LwOZETOyuSrMV0ng3QZwPaKzyEqAH2SAISuOj8+mfiaBuuV3GDbzUXEtQLu/vThFj58HzIoeWam
	Mm9BHeysNlRbEfXXdRB49TamdgmIw7fMgAe9wUSAZtc0TvWN/vTcwibSJ/DRkq6zSxvbSpSJpk3
	GsgclX5jo/qvBjPMjUIG6IXDiwSiHbEuA8tDKeueh22lYF6bohnOshtb4Ro3tYYU1YTe2H0XLVh
	uObSaGezdlVF8oTnCmyyXr4f5rL29GttLvcMnlR27BC4N6m/W7tmSmvmgLPxVZcgo4EwRT7/V9l
	aEfhSkDdzSBJL3RA77eqbXIeSCgJFpSUMG3Ph1Nq0OSPgXZ10r0uCE9YjYn6iyqN8OOBaC7TF+I
	bBAKacPxib3IcEzkI4grE91QQ/PdnnF4TMekRbc8if/Vyeh33fi0/gVx6lUTc+05x731i391K3C
	a6DeyJsiepJ86y+5iS7vnwCoybV/VzJOdtY8GB92xSTObRXRdzSTwfDWRTYtpghpOx5ro5FD6Or
	Oq0aCzRqmfsHCpfl1h0kSunrGuuK88mGV+GwS1P91Kv6Ky1oIQGVO+ZJ7INXje9vX5Y06YCzAx
X-Received: by 2002:a05:6820:a098:b0:71a:de33:922c with SMTP id 006d021491bc7-71b394b4a81mr4884048eaf.45.1795335122136;
        Sun, 22 Nov 2026 00:12:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b38058102sm4871236eaf.6.2026.11.22.00.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:12:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 01:11:31 -0700
Subject: [PATCH net v4] net: stmmac: preserve RX checksum capability when
 offload is disabled
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
Message-Id: <20261122-submit-stmmac-rx-checksum-capability-v1-v4-1-b729bef2695d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOsQ7CIBCA4VcxzGIKtAhOvodxoHjYU2kbwEZj+
 u7SujROmrAcuXz/vUiEgBDJbvUiAQaM2LV5KNcrYhvTnoHiKc+EF1wyxioa77XHRGPy3lgaHtQ
 2YK/x7qk1vanxhulJB0bBSVlWW6W05iRrfQCHj7l0IC0kcvx8Zu8CNk2Naa3BmLrwnO8Z2Lz8d
 zq/3DdcOiOk0jXsz97gbWM7P1cHvnS3v7s8u0WlnS61tkLJb1csXF787orpXg3MnVTlhCqW7ji
 Ob3lYyBClAQAA
X-Change-ID: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Disabling RX checksum offload with ethtool and reopening the interface
can make it impossible to enable offload again. GMAC, GMAC4 and XGMAC
return the IPC enable bit after programming it. A clear bit is expected
on disable, but stmmac_hw_setup() treats it as a missing capability and
discards the detected checksum type.

Keep the detected type and pass the requested setting directly to the
MAC. Check the result of an enable before allowing RX to mark packets
CHECKSUM_UNNECESSARY, including when the checker is first enabled on a
running interface.

If the MAC fails to enable the checker, mask RXCSUM in feature
negotiation until the next MAC reset. This leaves unrelated changes,
such as VLAN stripping, available even when RXCSUM is still requested.
On open and resume, reconcile the active features before starting RX
so ethtool reports a failed enable as off and a reset can restore
offload if it is still wanted.

Found while investigating RX checksum offload on H616. Maxime
Chevallier reproduced the capability loss on AgileX5, CycloneV and
STM32MP1.

A host test with mocked MAC registers confirmed that RX checksum offload
could be re-enabled after opening the interface with offload disabled.
When the mock rejected checksum enable, a pending VLAN stripping request
remained unapplied on open and resume without the second feature update.
With the fix, both paths enabled VLAN stripping and left RXCSUM off.

Fixes: d2afb5bdffde3 ("stmmac: fix the rx csum feature")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v4:
- Repeat feature negotiation after a reset-time RX checksum retry fails,
  so RXCSUM is masked before unrelated requested features are applied.
- Link to v3: https://patch.msgid.link/20261120-submit-stmmac-rx-checksum-capability-v1-v3-1-e9e1fd85f380@gmail.com

The sun8i checksum-delivery fix for net [0] renames the RX IPC callback.
When merging, keep its new name and body, and add the bool enable
argument from this patch. The RXALL series for net-next [1] also changes
stmmac_set_features(); apply the RXALL setting after the RX checksum
change succeeds.

[0] https://lore.kernel.org/r/20261122-submit-sun8i-rx-features-v1-v2-1-24a2564f6edf@gmail.com/
[1] https://lore.kernel.org/r/20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com/

Changes in v3:
- Check a live enable before reporting hardware-verified checksums;
  defer requests made while down to hardware setup.
- Keep a failed enable from blocking unrelated feature changes and
  recheck the saved request before RX starts on open and resume.
- Pass the requested state directly to the MAC and document the
  callback's return value.
- Link to v2: https://patch.msgid.link/20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386@gmail.com

Changes in v2:
- Correct the Fixes tag to reference the mainline commit.
- Add Maxime Chevallier's Reviewed-by and Tested-by tags.
- Include the discovery and hardware confirmation context.
- Link to v1: https://patch.msgid.link/20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |   4 +-
 .../net/ethernet/stmicro/stmmac/dwmac100_core.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   4 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |   4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 119 ++++++++++++++-------
 8 files changed, 91 insertions(+), 49 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..d7dd6c5d95d4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -699,7 +699,7 @@ static void sun8i_dwmac_get_umac_addr(struct mac_device_info *hw,
 }
 
 /* caution this function must return non 0 to work */
-static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
+static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw, bool enable)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 v;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 66337cfd9824..767836e75a10 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -77,12 +77,12 @@ static void dwmac1000_irq_modify(struct mac_device_info *hw, u32 disable,
 	spin_unlock_irqrestore(&hw->irq_ctrl_lock, flags);
 }
 
-static int dwmac1000_rx_ipc_enable(struct mac_device_info *hw)
+static int dwmac1000_rx_ipc_enable(struct mac_device_info *hw, bool enable)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value = readl(ioaddr + GMAC_CONTROL);
 
-	if (hw->rx_csum)
+	if (enable)
 		value |= GMAC_CONTROL_IPC;
 	else
 		value &= ~GMAC_CONTROL_IPC;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
index 94d24d355d95..e9492a853c0d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
@@ -48,7 +48,7 @@ static void dwmac100_dump_mac_regs(struct mac_device_info *hw, u32 *reg_space)
 	reg_space[MAC_VLAN2 / 4] = readl(ioaddr + MAC_VLAN2);
 }
 
-static int dwmac100_rx_ipc_enable(struct mac_device_info *hw)
+static int dwmac100_rx_ipc_enable(struct mac_device_info *hw, bool enable)
 {
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 259e2ebed8c1..87b25b3d9c3b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -329,12 +329,12 @@ static void dwmac4_dump_regs(struct mac_device_info *hw, u32 *reg_space)
 		reg_space[i] = readl(ioaddr + i * 4);
 }
 
-static int dwmac4_rx_ipc_enable(struct mac_device_info *hw)
+static int dwmac4_rx_ipc_enable(struct mac_device_info *hw, bool enable)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value = readl(ioaddr + GMAC_CONFIG);
 
-	if (hw->rx_csum)
+	if (enable)
 		value |= GMAC_CONFIG_IPC;
 	else
 		value &= ~GMAC_CONFIG_IPC;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 6b2bfc241109..e76294120bbb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -65,13 +65,13 @@ static void dwxgmac2_set_mac(void __iomem *ioaddr, bool enable)
 	writel(rx, ioaddr + XGMAC_RX_CONFIG);
 }
 
-static int dwxgmac2_rx_ipc(struct mac_device_info *hw)
+static int dwxgmac2_rx_ipc(struct mac_device_info *hw, bool enable)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value;
 
 	value = readl(ioaddr + XGMAC_RX_CONFIG);
-	if (hw->rx_csum)
+	if (enable)
 		value |= XGMAC_CONFIG_IPC;
 	else
 		value &= ~XGMAC_CONFIG_IPC;
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 8ae95e91a36a..e7eeaa83acfb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -319,8 +319,8 @@ struct stmmac_ops {
 	void (*irq_modify)(struct mac_device_info *hw, u32 disable, u32 enable);
 	/* Enable the MAC RX/TX */
 	void (*set_mac)(void __iomem *ioaddr, bool enable);
-	/* Enable and verify that the IPC module is supported */
-	int (*rx_ipc)(struct mac_device_info *hw);
+	/* Configure RX checksum offload and return whether the checker is enabled. */
+	int (*rx_ipc)(struct mac_device_info *hw, bool enable);
 	/* Enable RX Queues */
 	void (*rx_queue_enable)(struct mac_device_info *hw, u8 mode, u32 queue);
 	/* RX Queues Priority */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b76acfe0d958..042a78ebbee4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -269,6 +269,7 @@ struct stmmac_priv {
 	bool tx_path_in_lpi_mode;
 	bool sph_active;
 	bool sph_capable;
+	bool rx_csum_failed;
 	u32 sarc_type;
 	u32 rx_riwt[MTL_MAX_RX_QUEUES];
 	u32 tx_threshold[MTL_MAX_TX_QUEUES];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a685ce4638f6..739c6aca447e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3675,25 +3675,51 @@ static bool stmmac_tso_channel_permitted(struct stmmac_priv *priv,
 	return !(priv->dma_conf.tx_queue[chan].tbs & STMMAC_TBS_AVAIL);
 }
 
+static int stmmac_set_rx_csum(struct stmmac_priv *priv, unsigned int rx_csum)
+{
+	int ret;
+
+	if (!rx_csum) {
+		WRITE_ONCE(priv->hw->rx_csum, 0);
+		stmmac_rx_ipc(priv, priv->hw, false);
+		return 0;
+	}
+
+	ret = stmmac_rx_ipc(priv, priv->hw, true);
+	if (ret <= 0) {
+		WRITE_ONCE(priv->hw->rx_csum, 0);
+		priv->rx_csum_failed = true;
+		return ret ?: -EIO;
+	}
+
+	WRITE_ONCE(priv->hw->rx_csum, rx_csum);
+	return 0;
+}
+
+/* Recheck the wanted features if this reset clears or uncovers a failure. */
+static bool stmmac_init_rx_csum(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	bool was_failed = priv->rx_csum_failed;
+	unsigned int rx_csum;
+
+	priv->rx_csum_failed = false;
+	rx_csum = dev->features & NETIF_F_RXCSUM ? priv->plat->rx_coe : 0;
+	if (stmmac_set_rx_csum(priv, rx_csum))
+		netdev_warn(dev, "RX IPC Checksum Offload disabled\n");
+
+	return was_failed || priv->rx_csum_failed;
+}
+
 /**
- * stmmac_hw_setup - setup mac in a usable state.
- *  @dev : pointer to the device structure.
- *  Description:
- *  this is the main function to setup the HW in a usable state because the
- *  dma engine is reset, the core registers are configured (e.g. AXI,
- *  Checksum features, timers). The DMA is ready to start receiving and
- *  transmitting.
- *  Return value:
- *  0 on success and an appropriate (-)ve integer as defined in errno.h
- *  file on failure.
+ * stmmac_hw_setup - reset and configure the MAC before starting RX/TX
+ * @dev: network device
+ *
+ * Return: 0 on success or a negative error on failure.
  */
 static int stmmac_hw_setup(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u8 rx_cnt = priv->plat->rx_queues_to_use;
-	u8 tx_cnt = priv->plat->tx_queues_to_use;
-	bool sph_en;
-	u8 chan;
 	int ret;
 
 	/* Make sure RX clock is enabled */
@@ -3738,12 +3764,16 @@ static int stmmac_hw_setup(struct net_device *dev)
 	/* Initialize Safety Features */
 	stmmac_safety_feat_configuration(priv);
 
-	ret = stmmac_rx_ipc(priv, priv->hw);
-	if (!ret) {
-		netdev_warn(priv->dev, "RX IPC Checksum Offload disabled\n");
-		priv->plat->rx_coe = STMMAC_RX_COE_NONE;
-		priv->hw->rx_csum = 0;
-	}
+	return 0;
+}
+
+static void stmmac_hw_start(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	u8 rx_cnt = priv->plat->rx_queues_to_use;
+	u8 tx_cnt = priv->plat->tx_queues_to_use;
+	bool sph_en;
+	u8 chan;
 
 	/* Enable the MAC Rx/Tx */
 	stmmac_mac_set(priv, priv->ioaddr, true);
@@ -3806,8 +3836,6 @@ static int stmmac_hw_setup(struct net_device *dev)
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
 	phylink_rx_clk_stop_unblock(priv->phylink);
-
-	return 0;
 }
 
 static void stmmac_free_irq(struct net_device *dev,
@@ -4216,6 +4244,12 @@ static int __stmmac_open(struct net_device *dev,
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		return ret;
 	}
+	if (stmmac_init_rx_csum(dev)) {
+		netdev_update_features(dev);
+		if (priv->rx_csum_failed)
+			netdev_update_features(dev);
+	}
+	stmmac_hw_start(dev);
 
 	ret = stmmac_setup_ptp(priv);
 	if (ret)
@@ -5233,7 +5267,7 @@ static unsigned int stmmac_rx_buf1_len(struct stmmac_priv *priv,
 				       int status, unsigned int len)
 {
 	unsigned int plen = 0, hlen = 0;
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 
 	/* Not first descriptor, SPH enabled: buffer1 only carries the
 	 * split header of the first descriptor, so it is zero here.
@@ -5264,7 +5298,7 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 				       struct dma_desc *p,
 				       int status, unsigned int len)
 {
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 	unsigned int plen = 0;
 
 	if (!stmmac_rx_check_buf2_cap(priv))
@@ -5569,7 +5603,7 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 	struct stmmac_channel *ch = &priv->channel[queue];
 	unsigned int len = xdp->data_end - xdp->data;
 	enum pkt_hash_types hash_type;
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 	struct sk_buff *skb;
 	u32 hash;
 
@@ -5872,7 +5906,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int next_entry = rx_q->cur_rx;
 	bool in_progress = rx_q->state_saved;
 	enum dma_data_direction dma_dir;
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
@@ -6372,7 +6406,7 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (priv->plat->rx_coe == STMMAC_RX_COE_NONE)
+	if (!priv->plat->rx_coe || priv->rx_csum_failed)
 		features &= ~NETIF_F_RXCSUM;
 
 	if (!priv->plat->tx_coe)
@@ -6400,18 +6434,18 @@ static int stmmac_set_features(struct net_device *netdev,
 			       netdev_features_t features)
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
+	bool running = netif_running(netdev);
+	unsigned int rx_csum;
+	int ret;
 
-	/* Keep the COE Type in case of csum is supporting */
-	if (features & NETIF_F_RXCSUM)
-		priv->hw->rx_csum = priv->plat->rx_coe;
-	else
-		priv->hw->rx_csum = 0;
-	/* No check needed because rx_coe has been set before and it will be
-	 * fixed in case of issue.
-	 */
-	stmmac_rx_ipc(priv, priv->hw);
+	rx_csum = features & NETIF_F_RXCSUM ? priv->plat->rx_coe : 0;
+	if (running && rx_csum != priv->hw->rx_csum) {
+		ret = stmmac_set_rx_csum(priv, rx_csum);
+		if (ret)
+			return ret;
+	}
 
-	if (priv->sph_capable) {
+	if (running && priv->sph_capable) {
 		bool sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
 		u8 chan;
 
@@ -7650,10 +7684,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	}
 
 	if (priv->plat->rx_coe) {
-		priv->hw->rx_csum = priv->plat->rx_coe;
 		dev_info(priv->device, "RX Checksum Offload Engine supported\n");
 		if (priv->synopsys_id < DWMAC_CORE_4_00)
-			dev_info(priv->device, "COE Type %d\n", priv->hw->rx_csum);
+			dev_info(priv->device, "COE Type %d\n", priv->plat->rx_coe);
 	}
 	if (priv->plat->tx_coe)
 		dev_info(priv->device, "TX Checksum insertion supported\n");
@@ -8575,6 +8608,14 @@ int stmmac_resume(struct device *dev)
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		goto error_unlock;
 	}
+	if (stmmac_init_rx_csum(ndev)) {
+		mutex_unlock(&priv->lock);
+		netdev_update_features(ndev);
+		if (priv->rx_csum_failed)
+			netdev_update_features(ndev);
+		mutex_lock(&priv->lock);
+	}
+	stmmac_hw_start(ndev);
 
 	if (priv->ptp_enabled) {
 		if (stmmac_init_ptp_clk_freq(priv))

---
base-commit: af6737b9066832a2017c281159950ba92385ce00
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
change-id: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

