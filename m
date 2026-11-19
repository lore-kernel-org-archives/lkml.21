Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117247;
	b=QTsjGBLFoBQia4JIVMzaS/4zUCEw7cw1dwsWSnHkAkVnu+SbdK65/rN9LiYzv0nHMZ9f
	 Y+lE67bhiVz227DyHKrP8K2tt9XHQf8bc6n8/xDwxeZTQSWLyUavr0z4TiYVOxjx64sbS
	 LIxqOIqBysSyKadfb/pNtsvVTwdhiY0MUIgkJAF20f7DkJW+Z6CHraE0ncDgN3mAsqCUG
	 vDDSRNq4tDeLo1K+IisaCiv1nHNlGAF0rhw82WBgDrfA8SMCdNmaYWob3m9E69E7OWe2J
	 RgoFoIboSjSelAQjLC+l8AYuRzX/FNns6F/m3j9MOUjUI5ElvsfQeO5hyAX99v7CbHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117247;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=1mvb+yJ0V9bRthXaFaY8JY2Kp9Y4oxWNDR+6LMSJ+U0=;
	b=M7pC7+5ndbD0OraPy1Hak+W5j6rSfS+KZdfTJQJcOjdN/x1NQH1os4B7ayDNVpmWJ99T
	 2GbZcvLdNKWaJGfaeSlMMPPDQx5ZRqURu5Rx2XJhO7d2AirYBcB8rdchuzOAIl42BQE0Z
	 WeVOryWL1lsGdmo4O4a0wVj4UKX4VPMD1hAZWN8sTfnevasjLmaSaDGIDhYJp8fbzZR96
	 /+aRxQVgFMQaKC4niJ1gwN5OfLuotu3Fs0MA3SkuNaIMVYhhU1OqlX5iKbU6sX8jOj4Zc
	 okEjDSbO8Djv0+FviVm7ja8uuaNHKNCkvBLo79nekDSNAnG7mY11mQLN+VCPUBjEycg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=FfomT0zR;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1413606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1413606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=FfomT0zR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795117245;
	bh=7UHSHZH71K2fCY13KkeTiiRz6Yk0hssqUYRmhMgPz+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FfomT0zRO6kb8vMU3bdjEslj4N77e1Mmy/hFBNIK2JPmC+3iZoxlTzMG5n9si7T9w
	 5NFavTfe9tcWQEaDFHYQHphmm55C4NFvoWKEdgWvhZlVMyqpQ9BV9LbUiSDf9gk1qq
	 sE9wLYi/J6FpYVRej7N27A/5VM5j/O1evMNQbnw1imzygRNLJw68zyYGm3QyhgdZrm
	 T1af8jrRNP+72B5OJ/GClgwDCe9m56H+V9xEDRqlSo6s4yMiQ/VV55VImZ7p0YaA6n
	 JJYLoa4Xt/zEpThSXoar/0sYRAOmSJXWc59eRUNBYiCp3tkqE2zH3VdxI7acsTdmFv
	 d5DUPczqzXuiQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F231717E0DCD;
	Thu, 19 Nov 2026 20:40:44 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B5C2E480035; Thu, 19 Nov 2026 20:40:44 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 20:40:32 +0100
Subject: [PATCH v18 4/7] phy: rockchip: usbdp: Fix power state handling
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
Message-Id: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-4-fb325e336494@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7690;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=7UHSHZH71K2fCY13KkeTiiRz6Yk0hssqUYRmhMgPz+M=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr/ULy2dUoVLIzrBHC2bTZKV8eEECiIaW5Mf
 GUL4k8oJRNX+4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/1C8AAoJENju1/PI
 O/qaEMYP+wW+KSqJkteoQtViVEbVtDkfYy65hta1PGWMW3XOgI57fZsdi4v//yH6lVsG+Q27kFv
 CPuF5mzCwN2uNbjKw5B0oFNf/OzC/ZEDBK3LLeVYVnGhjofcr0P1IOphJ/bZot0zLETBD3H59qt
 NFU3weTecnYgCMnJWpIl2gB4T+kMDhhzdYTD2ISx6pOvh0Js5/kOTkdudwjODavEQdrsYXmI9Eb
 eHONrLZitG1NPFQHF+tAz5Yq6hhd1hMzWjPbylkgCu2wmB0ONszbfwsO9pbMWaKMl8yUSyrkIBj
 ZFlkNH2qz8mlEa8fnF5tSQh7T1VzcBL/etR7rw9dUHHJ9Z6rkv/VB//6A4gNoX0Gw+MLFjsP4UO
 PJl+hBSPwWrKhcrm12r5OrpMj+U84FlY2bKvI4Bn7tCzyJGnLEpXvwI5D3ClcbSNG7CgX6nuZ/3
 QWW+Fz5psxcVtQATWiX1WdWZSvCVZ2aD0n4gggM5QCvtE0Mmmwv+hIGNtFbFEXvyNv6k5W6xTPM
 YotHs4v9nOy2f7n+Tjz60p26nTSLoy2BduliITAO1bxpLiH9O/nkICd+/2jhg+Ij/5bvhHEvfqZ
 CJsk2Piunzny6sJU0h/Wu3fNZ3/0y+mlJ98jkHmviHjZqs13cKKlh0YfxPandCpeTc8oLdphgPS
 rpx/2XU6PmZrB0+iAEaQxEQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Restructure power state handling, so that the function uses sw_mode and
hw_mode to figure out the actual required hardware state. This allows
any path updating either of those modes to simply call
rk_udphy_update_power_state() to get the right hardware state.

This makes it a lot more obvious what is going on and also fixes a few
potential resource leaks identified by Sashiko as a side-effect. For
example if USB3 is requested by software while the USB-C is in DP-only
mode, things are decently handled after this.

Exiting/power off the PHY will ignore errors from the power state
update. A full power down will never error out. If re-init fails,
the error should not be propagated to the PHY framework, because
it is effectively for the other PHY.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 128 +++++++++++++++++-------------
 1 file changed, 75 insertions(+), 53 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index de8f01bd0467..140bec887a5e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -173,10 +173,10 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool phy_needs_reinit;
+	bool phy_needs_reinit; /* lane mux changed */
 	u8 hw_mode; /* modes currently supported by hardware */
-	u8 status;
 	u8 sw_mode; /* modes currently requested */
+	u8 status;
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
@@ -1029,70 +1029,93 @@ void rk_udphy_register_reset_handler(struct phy *phy,
 }
 EXPORT_SYMBOL_GPL(rk_udphy_register_reset_handler);
 
-static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
+static int rk_udphy_update_power_state(struct rk_udphy *udphy)
 {
+	bool usb3_port_enable;
+	u8 target_mode;
 	int ret;
 
-	if (!(udphy->hw_mode & mode)) {
-		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
+	/*
+	 * Initialize PHY mode according to the hardware setup (either described
+	 * in DT or negotiated via the Type-C controller) instead of requesting
+	 * only the needed PHY side, because that would break the USB/DP data
+	 * streams when the other PHY is being requested. This is not an issue
+	 * during the Type-C negotiation as that happens during the hotplug phase
+	 * and not during normal operation. Also disable everything if the
+	 * software has not requested anything, as there shouldn't be any active
+	 * data streams in that case.
+	 */
+	target_mode = udphy->hw_mode;
+	if (udphy->sw_mode == UDPHY_MODE_NONE)
+		target_mode = UDPHY_MODE_NONE;
+
+	usb3_port_enable = !udphy->hs && (target_mode & UDPHY_MODE_USB);
+
+	if (!udphy->phy_needs_reinit && udphy->status == target_mode) {
+		if (udphy->sw_mode & UDPHY_MODE_USB)
+			rk_udphy_u3_port_disable(udphy, !usb3_port_enable);
 		return 0;
 	}
 
-	if (udphy->status == UDPHY_MODE_NONE) {
-		rk_udphy_run_reset_handler(udphy, true);
+	/* Avoid to re-init disabled PHY */
+	if (udphy->status == target_mode && target_mode == UDPHY_MODE_NONE)
+		return 0;
+
+	/*
+	 * Inform DWC3 driver, that we are about to reset the PHY, so that it can
+	 * assert its PIPE reset lines and avoid DWC3 getting into a buggy state.
+	 * This is intentionally done for a PHY disable, since that also changes
+	 * the clocks routed to the PHY.
+	 */
+	rk_udphy_run_reset_handler(udphy, true);
 
+	/*
+	 * Disable USB3 port, which among other things re-routes a DWC3 clock to
+	 * avoid SErrors when the DWC3 registers are accessed while the PHY is
+	 * disabled. This is only done, when the DWC3 is running as the accessed
+	 * GRF registers and in PD_USB.
+	 */
+	if (udphy->sw_mode & UDPHY_MODE_USB) {
 		rk_udphy_u3_port_disable(udphy, true);
 		udelay(10);
+	}
 
+	if (udphy->status == UDPHY_MODE_NONE) {
+		/* Power up (incl. clocks) */
 		ret = rk_udphy_setup(udphy);
 		if (ret) {
 			rk_udphy_run_reset_handler(udphy, false);
 			return ret;
 		}
-
-		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
-			rk_udphy_u3_port_disable(udphy, false);
-		udphy->phy_needs_reinit = false;
-
-		rk_udphy_run_reset_handler(udphy, false);
-	} else if (udphy->phy_needs_reinit) {
-		rk_udphy_run_reset_handler(udphy, true);
-
-		rk_udphy_u3_port_disable(udphy, true);
-		udelay(10);
-
+	} else if (target_mode == UDPHY_MODE_NONE) {
+		/* Power down (incl. clocks) */
+		rk_udphy_disable(udphy);
+	} else {
+		/* Mode change => re-init */
 		ret = rk_udphy_init(udphy);
 		if (ret) {
 			rk_udphy_run_reset_handler(udphy, false);
 			return ret;
 		}
-
-		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
-			rk_udphy_u3_port_disable(udphy, false);
-		udphy->phy_needs_reinit = false;
-
-		rk_udphy_run_reset_handler(udphy, false);
 	}
 
-	udphy->status |= mode;
-
-	return 0;
-}
-
-static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
-{
-	if (!(udphy->hw_mode & mode)) {
-		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
-		return;
-	}
+	/* Ensure USB3 support is enabled when supported */
+	if (udphy->sw_mode & UDPHY_MODE_USB)
+		rk_udphy_u3_port_disable(udphy, !usb3_port_enable);
 
-	if (!udphy->status)
-		return;
+	/*
+	 * Inform DWC3, that we are done with the reset, so that it can deassert
+	 * its PIPE reset line. This is sent in pair with a PRE_RESET allowing
+	 * consumer driver to do paired resource requests (e.g. clocks) in their
+	 * notification handlers. As we reroute the clocks, its also fine to
+	 * send this after completely disabling the PHY.
+	 */
+	rk_udphy_run_reset_handler(udphy, false);
 
-	udphy->status &= ~mode;
+	udphy->status = target_mode;
+	udphy->phy_needs_reinit = false;
 
-	if (udphy->status == UDPHY_MODE_NONE)
-		rk_udphy_disable(udphy);
+	return 0;
 }
 
 static int rk_udphy_dp_phy_power_on(struct phy *phy)
@@ -1105,7 +1128,7 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 
 		phy_set_bus_width(phy, udphy->dp_lanes);
 
-		ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
+		ret = rk_udphy_update_power_state(udphy);
 		if (ret) {
 			udphy->sw_mode &= ~UDPHY_MODE_DP;
 			return ret;
@@ -1135,7 +1158,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	udphy->sw_mode &= ~UDPHY_MODE_DP;
 
 	rk_udphy_dp_lane_enable(udphy, 0);
-	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
+	rk_udphy_update_power_state(udphy);
 
 	return 0;
 }
@@ -1346,15 +1369,15 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
-	udphy->sw_mode |= UDPHY_MODE_USB;
-
-	/* DP only or high-speed, disable U3 port */
-	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs) {
+	/* high-speed only, disable U3 port */
+	if (udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
 		return 0;
 	}
 
-	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	udphy->sw_mode |= UDPHY_MODE_USB;
+
+	ret = rk_udphy_update_power_state(udphy);
 	if (ret) {
 		udphy->sw_mode &= ~UDPHY_MODE_USB;
 		return ret;
@@ -1369,13 +1392,12 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
-	udphy->sw_mode &= ~UDPHY_MODE_USB;
-
-	/* DP only or high-speed */
-	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs)
+	if (udphy->hs)
 		return 0;
 
-	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
+	udphy->sw_mode &= ~UDPHY_MODE_USB;
+
+	rk_udphy_update_power_state(udphy);
 
 	return 0;
 }

-- 
2.53.0

