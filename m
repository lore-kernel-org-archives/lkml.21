Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117249;
	b=jp1x1HD5+VbX6Yylz1jnHcqmfCEXwjO+Qb5mDzqpVgNEtvKdTYFQdaQwb2Ioilld1Inl
	 4GC4m7HemcNW/JxwMK0CDJ5iyh7M6TkMr9U+UrJjnyJwnlC6vrkIARvdB8EVsXlVHEj4j
	 RGm0RnxG8xCNGoo4kP/x2PLM0gQDoIMjsZjyztAgVqpwSSY/NU5UzlPh6WxkOaF/yCVlk
	 zqXfeKl48h+BUWBjiF0jW6ayP8kLLAKKFcOe2/Od5gCKvNTvHjE2s7SA1lTplcTkrXkWL
	 xYSNx4CpXu+wzuEoSNtYS/hbO8F+pvvtikpTwZNOWmuMl1zEeuPbatv7ASila45kj2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117249;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=hsV9AnVg9OEpUyytpCbMtf0xyY3yxUF12MQ/J8+qAq0=;
	b=jbafYSVK0Glnf0SUGZZmAChM0Ul3nsgHzsW23Lpa6BTH+gXEsNZVFDgf2J16R/5LFXPE
	 5rNF/FCGIlyzWs1yzEuCS6yRmm2qPljtLUuwWoOl5QdM/mXlcM763sYEi35muJpPn+IMj
	 zrbdQSAWUj3LGHR1JJbGXH5RGI9+kx41VrGEBdxV83BQ0/dEUsD3xK/12CagUm/XsCSk+
	 tM0yAzzcpcLpdJgZ+OQhMRU7hswGOsHbByeum5Y0IqYlJzzCp8ouO3upS4MuYB0eojORE
	 iwbk2BGHUpBbA7+Hu0Y60gHDiJidG02Uu4tJHSRpVvsxGSbrpPLvgDOjeLJuoqno1Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=aY0IUfhD;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2227B60A2623
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2227B60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=aY0IUfhD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795117245;
	bh=UD+MvinUlfHsugRDvqIwZxdx/6jrogHoWpGGB9OFIeU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aY0IUfhDKbLew/xENqwpGBEdCzDg4Xv/q6G70RuXNbUPMZ4C1DOqGTtNfelRvx2vI
	 X69OXcfGYrxpG66iR3iDzZIDBDHMsJSj7CF9aQH32Oe38bW/KzOU3KZtvyUK6fpZTo
	 bxLG+IN8CfAzlPYpGcjlxN6dCmn+dUiPI0dnaxfGOt+bFFIYfC8IzUw4vhkXNAfqXp
	 JVTVmIJZnp3ojPvrXtvQ76VeDiiYX+Hg3iqKWUDOAg+LkWry4/tw9XHmZpY1ZJA4Jz
	 NltXw8XxSL1iok8XcSungO1BJ7Z/3+apcA7zlrAIzcMnHAmAEn4bMLJ1wpZ8Pdofje
	 b2hwV1KXE7f7A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 516EF17E0E04;
	Thu, 19 Nov 2026 20:40:45 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BB88248003D; Thu, 19 Nov 2026 20:40:44 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 20:40:35 +0100
Subject: [PATCH v18 7/7] phy: rockchip: usbdp: Add DP lane setup to power
 state update
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
Message-Id: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-7-fb325e336494@collabora.com>
References: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
In-Reply-To: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Yury Smirnov <yurymonzon@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=UD+MvinUlfHsugRDvqIwZxdx/6jrogHoWpGGB9OFIeU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr/ULx45TuEFAjpP8euUVII85OZafc5lPLYG
 LLLW6PxXqheaYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/1C8AAoJENju1/PI
 O/qaf0oP/RXGAQwihHDu/vzkVWSff4WGwfZrcOsFwe6l+i8nS+f3tXiyMl87OC+VcJaZ7K9tgEB
 MC42459ej4QbPdDNlQzqnPpkG62xEx6mWk4qIM3vi4sOFDfdqtf9PNcVTqhmV/30XXzvX6uvqjm
 cO8IMONXWKuKhziX++k8mQ1n/cEIdlgyxSCJt/nHopeRrFgAlIe6B5D6GY/75SD76BqT6UreOHt
 N/upzKfZOYSdzw0oOFMtaDK18iIDb5qq2NBVfw0ySaoTaaJH8LzDEQ0swzgnVUPZLS7PEN/UNgS
 tQJc+iu/3u0NnN8q2TAnHCibT8IiBURFqdFccXyqUG8L1BF4pVrxTebZxem9RIaZbGhIkvqIcJ2
 UP7GBRl4pgN3mhD7LI1q+vK0LbBuZXmBi4tgfeaySL/hw2tG/ybnf7XqcCMErmR5Q+6c/fCorQU
 cCxhO7ufh8B/WM1U7p0ZbIdgtUHINmF2JKtR4DXJMTUuW3AG5gcCxRWkNRoz84+HU7a4fWT2xDc
 /7bFlgv3CdJBqMUbam7tmEefff155Eb75INQbj1HM4rLE3mH1ogQb8ROzMqUOnp3k3E9q5vxI5A
 oXjoFe45xqRfFXkJfSWGX7p5CkpiogYKUNJAWaCssv7DWtbt8IMOQn7yWUsD//dO5HwD2xknkiI
 E21XPWKIp5iXeddMsKiwvNw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

DP lane map and AUX orientation are only configured in the DP PHY
power_on callback right now. This means when the DP controller keeps
the display enabled after a cable is unplugged, it will not come back
properly with the cable re-plugged in swapped orientation.

To fix the issue, we update the DP lane mux configuration in the power
state update. This gets some special handling, because calling
rk_udphy_dp_lane_select() accesses the VOGRF which needs the DP
controller's power domain enabled. It is active while the DP controller
has the PHY powered on.

Apart from that VOGRF may lose its state when the DP controller is
disabled, so we keep the DP PHY power hook as-is instead of fully
relying on the power state update function.

Reported-by: Yury Smirnov <yurymonzon@gmail.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e72752ed4968..7a37b63ea51d 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1115,6 +1115,13 @@ static int rk_udphy_update_power_state(struct rk_udphy *udphy)
 		}
 	}
 
+	/* Setup DP lanes and the AUX polarity */
+	if ((target_mode & UDPHY_MODE_DP) && (udphy->sw_mode & UDPHY_MODE_DP)) {
+		phy_set_bus_width(udphy->phy_dp, udphy->dp_lanes);
+		rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
+		rk_udphy_dp_lane_select(udphy);
+	}
+
 	/* Ensure USB3 support is enabled when supported */
 	if (udphy->sw_mode & UDPHY_MODE_USB)
 		rk_udphy_u3_port_disable(udphy, !usb3_port_enable);

-- 
2.53.0

