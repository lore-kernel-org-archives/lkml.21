Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.54.195.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607024;
	b=rXSEhUPhyJziZ/08Bo0ocuCGsO2aO1/b0P2rGG/NM9jAEwo+gDSYgtGLHVjgauVJUSEV
	 wcGyYbD11LbXacQizpA7iZRPoXTIbxVQQYO9HfGJRuUIKtoxCf8DbxnpOokOWt5UDZTIO
	 HKqkPmZy8szPEl8qoXSjHjXl3EAxsbwQCVB0ZyDcje9opj4IffpnX8mSfzjPBbfGlMPGE
	 7cbapNxshvE0sSQNEFySWghohzxq7Qt3oc/0xFCiPy73nyDcZjgY6A2cn51gVo+nDD3kd
	 4rdhyVemdQbk13ZfEFXvC565GbdzrLwTaGVPgx6EIz4nAnBsvEN2g7M+l6SE+UUboUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607024;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=TVsxVXOB0tBfCCPyIxSXgdNyoM7T2Ytock3tTxOs4kY=;
	b=XkXNnFcMF3BRzdvHk3jlIBGZ0q5DV7ciEfCm5GKDbaq+xT4IMrFBtWC+ID/NdZ4jqLGR
	 X0K6+Wb0jO7AmmXSnsYARLV1ctRXLxry9DilHDCC/AFRX75wWMhA7AUIX2TtCmeAOZKvS
	 jX2grszypUkKgghmR6zy/RR8H6xVnee/ADZOFGqXAYqbHZqxFBS2cv8oDQFJWvjf/ib6l
	 eHxWTbSm8SV4eO0QLxC2bnWJnKXdodUft2/0Q4/s3RhcvsYoGq1kNJoMj4B2fKYBo7cph
	 vhaNd+PCgghyNwwfVVSSebOLLudX2ttf1j6sulQ2jgjSDhmwLIL9xCX3nhanAHf+tjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fintech.ru;
	spf=pass smtp.mailfrom=fintech.ru;
	arc=none smtp.remote-ip=195.54.195.159
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCB8606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDCB8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 25 Nov
 2026 14:43:38 +0300
Received: from localhost (10.0.253.153) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 25 Nov
 2026 14:43:37 +0300
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
Subject: [PATCH 1/3] drm/bridge: analogix_dp: Check runtime resume before accessing hardware
Date: Wed, 25 Nov 2026 14:43:13 +0300
Message-ID: <20261125114319.1089186-2-n.zhandarovich@fintech.ru>
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

Check runtime resume before continuing with the bridge's initialization
or accessing AUX registers. A failed resume may leave the controller
clock disabled.

Therefore, use pm_runtime_resume_and_get() so that an error return
does not retain a runtime-PM usage reference.

Fixes: 3424e3a4f844 ("drm: bridge: analogix/dp: split exynos dp driver to bridge directory")
Fixes: 8fb6c44fe846 ("drm/bridge: analogix_dp: Grab runtime PM reference for DP-AUX")
Fixes: c8f0b7cb01ea ("drm/bridge: analogix_dp: Add support for &drm_dp_aux.wait_hpd_asserted()")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6df6963740d2..9d77c1d54a6d 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include <drm/bridge/analogix_dp.h>
 #include <drm/display/drm_dp_aux_bus.h>
@@ -994,7 +995,9 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 {
 	int ret;
 
-	pm_runtime_get_sync(dp->dev);
+	ret = pm_runtime_resume_and_get(dp->dev);
+	if (ret)
+		return ret;
 
 	ret = analogix_dp_init_analog_func(dp);
 	if (ret)
@@ -1360,7 +1363,9 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
 	struct analogix_dp_device *dp = to_dp(aux);
 	int ret;
 
-	pm_runtime_get_sync(dp->dev);
+	ret = pm_runtime_resume_and_get(dp->dev);
+	if (ret)
+		return ret;
 
 	ret = analogix_dp_detect_hpd(dp);
 	if (ret)
@@ -1383,7 +1388,9 @@ static int analogix_dpaux_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned lon
 	if (dp->force_hpd)
 		return 0;
 
-	pm_runtime_get_sync(dp->dev);
+	ret = pm_runtime_resume_and_get(dp->dev);
+	if (ret)
+		return ret;
 
 	ret = readx_poll_timeout(analogix_dp_get_plug_in_status, dp, val, !val,
 				 wait_us / 100, wait_us);
-- 
2.43.0

