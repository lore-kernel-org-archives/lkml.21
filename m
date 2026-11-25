Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.54.195.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607029;
	b=Dl5evwbo1Z6Do64F00V2V37Zkmo5ifa9qh47RVMwJa5nJgzOZFnwj30JajxHfIEM/9di
	 6gufOCy1t2+zXZi8Oxcl1lrmWYTCEzUyEt8DlhzMcy5Jy5NA/FZhCaRGaMfNeUV96ZXHt
	 XxYVAGNFD/FBgavfifSTztLS0Si6WPW4WjWfn3kbNxl8olZk3zpcD7bsJX/XPk+bFHRFs
	 EZFMlx5JaZOjhHQzjiiHUDduRjFF8enMn51IfvE/lyIkGlTNbw8rBNG95bSXpoD7XkW6K
	 nq8w1LMLnRv00Fc/0HwCSxr65r695+Bl0zAaKMvi+8t4jqCBboR0bFBjw13Z4GsjKeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607029;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=wKpzHZ7L2zAkn9UdAVy+8MnE4gMumt/s69X7gH2oLP4=;
	b=P/TO7c/NB8Y94H9Subc/CqNhXlUO+jIxgI4TXoDojK1Ua2+0jBlDeassnyu7CK4b7zZF
	 6ripaamgbeV3rgXhF5ow2kP0+kHzbrOz3jivXTpfIuhMzeODSGvUiBfdzv1wddRoDnWGE
	 1I+PIo638jrhsGdO2Zzj90MYgNgmLA6N01sfVkdKRRQ3lwVj3hbdqXlVU7vfm0ODoh3s3
	 4uIL4uIIlwpA9H0uUMsZ22M8K2nVHCgurEwSvGaJJBvNo0aLgs0cTkSS0K64/8yt5djIY
	 uxouWjHX8VvqlQTSVs+LjliMYAsagAf5sApoNdqPRiQepZUYh1pZDwCOujlUcKtaO5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fintech.ru;
	spf=pass smtp.mailfrom=fintech.ru;
	arc=none smtp.remote-ip=195.54.195.159
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E2A606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E2A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 25 Nov
 2026 14:43:47 +0300
Received: from localhost (10.0.253.153) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 25 Nov
 2026 14:43:46 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
	"Jernej Skrabec" <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Sandy Huang
	<hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>, Alexandre Marquet <tb@a-marquet.fr>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, <linux-rockchip@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH 3/3] drm/bridge: analogix_dp: Propagate errors from runtime resume
Date: Wed, 25 Nov 2026 14:43:15 +0300
Message-ID: <20261125114319.1089186-4-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125114319.1089186-1-n.zhandarovich@fintech.ru>
References: <20261125114319.1089186-1-n.zhandarovich@fintech.ru>
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
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Stop controller initialization when platform or PHY power-on fails and
return the original error to the resume caller. Unwind the platform
power callback only after it has completed successfully, then release
the controller clock. Do not call phy_power_off() after a failed
phy_power_on(), since no successful PHY power reference was acquired.

Also stop and unwind platform power if setting the PHY mode fails.

Fixes: 3424e3a4f844 ("drm: bridge: analogix/dp: split exynos dp driver to bridge directory")
Fixes: 2c0883459ed6 ("drm/bridge: analogix_dp: Add support for phy configuration.")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
Depends on patches 1 and 2 of this series, also on Alexandre Marquet's
Exynos pipe-clock conversion [1], or Marek Szyprowski's equivalent [2].
Without [1] or [2], propagating errors from old Exynos power_on() step
may break AUX access.

This is an updated version of the patch suggested by "Pengpeng Hou"
<pengpeng@iscas.ac.cn> in [3]. It takes into account issues brought
up by Sashiko, specifically, an issue of possible unbalanced clock
disables. This patch was prepared using dependency [1].

[1] https://lore.kernel.org/all/20261027-drm-misc-next-manta-auxbus-v1-2-3a45c3cf531d@a-marquet.fr/
[2] https://lore.kernel.org/all/20261119223843.3694307-1-m.szyprowski@samsung.com/
[3] https://lore.kernel.org/all/20260828091334.5793-1-pengpeng@iscas.ac.cn/

 .../drm/bridge/analogix/analogix_dp_core.c    | 23 +++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 9d77c1d54a6d..3326b51aaeb5 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1538,15 +1538,30 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
 		return ret;
 	}
 
-	if (dp->plat_data->power_on)
-		dp->plat_data->power_on(dp->plat_data);
+	if (dp->plat_data->power_on) {
+		ret = dp->plat_data->power_on(dp->plat_data);
+		if (ret)
+			goto err_disable_clk;
+	}
 
-	phy_set_mode(dp->phy, PHY_MODE_DP);
-	phy_power_on(dp->phy);
+	ret = phy_set_mode(dp->phy, PHY_MODE_DP);
+	if (ret)
+		goto err_power_off;
+
+	ret = phy_power_on(dp->phy);
+	if (ret)
+		goto err_power_off;
 
 	analogix_dp_init_dp(dp);
 
 	return 0;
+
+err_power_off:
+	if (dp->plat_data->power_on && dp->plat_data->power_off)
+		dp->plat_data->power_off(dp->plat_data);
+err_disable_clk:
+	clk_disable_unprepare(dp->clock);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(analogix_dp_resume);
 
-- 
2.43.0

