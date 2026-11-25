Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.54.195.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621216;
	b=aaDcneixmj3REw0E7+iOgjGPsht5t9Iol0NZW31S/ZvhAQNNbPZwGzQ1hylEFMAjW/yR
	 wU7qPM2UMLUzKSOUiSabboxMLucUcwUHvNYRjPSxjQKXndi94rwguAV2kC4qRjcxXk2US
	 hCp1XMgfBfpFE6qU1GS3I+OjjIXsOcnjjqrYKIVGFqTvrYr+i5S+GQOTLi9GDEHh3x2fC
	 ldfU8OR9UYDzkT03WkzOhY06ImJa8+N6G/jKQ1XmiA5E78EhVt1DuY+KZ+8BR7qe2tPW0
	 tf1iMUP4e8dS3F/EDmzOqquPH2rMk17a61nIs7A8cXWBmOsIST2qGfxPrJ/OBOpXrCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621216;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=17njXQ7Tet8iwZqoG19brC1XCP2klxjEKEJ+60r15+c=;
	b=5NeB4jWrbr66OSdaQZn+QzqyWd+pWFudAgO+GovWWGcFUrnHfZzS0CBXjnyQ0Dmm5nc4
	 +S/NRPId6XgQoaHcIalSksXW/lybG5yCuqpP30qSwd84jyfQ6s+jLbD/SSs7GiMAFxZhP
	 0J+2kY8opLNrTj9iV9Y1hVkCgzaULjGo7ZMSmwVB0pBNUxb9SQyr7qQ2KCgKOXro5DLz8
	 UkpoK1TsvrvO5Qc192Ome0eveq/4zs8/pNfHLdXQRPHkFbZMyAmLf4+viAr4YDslZn8v3
	 QQi88Q+Yx0qPJWQ9yO0Zn7KLVs/k8NT32I384PogutD3UO3XKkVvg6BllCA+aPy2N+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fintech.ru;
	spf=pass smtp.mailfrom=fintech.ru;
	arc=none smtp.remote-ip=195.54.195.159
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C00606A6A6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40C00606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 25 Nov
 2026 18:40:14 +0300
Received: from localhost (10.0.253.153) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 25 Nov
 2026 18:40:14 +0300
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
Subject: [PATCH v2 2/3] drm/rockchip: analogix_dp: Disable pclk if setting eDP mode fails
Date: Wed, 25 Nov 2026 18:39:46 +0300
Message-ID: <20261125153958.1349811-3-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125153958.1349811-1-n.zhandarovich@fintech.ru>
References: <20261125153958.1349811-1-n.zhandarovich@fintech.ru>
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

The eDP-mode register write via rockchip_grf_field_write() call can
fail after pclk has been enabled. To prevent this, disable pclk before
returning that error so the platform power_on callback, in turn,
releases the clock reference it acquired on failure.

Fixes: 729f8eefdcad ("drm/rockchip: analogix_dp: Add support for RK3588")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
v1 -> v2: Use goto label to avoid repeating calls to
clk_disable_unprepare() per Damon Ding's <damon.ding@rock-chips.com>
suggestion. 

 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 3a80600eece1..8b24918cea64 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -140,14 +140,19 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
 	ret = rockchip_dp_pre_init(dp);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dp->dev, "failed to dp pre init %d\n", ret);
-		clk_disable_unprepare(dp->pclk);
-		return ret;
+		goto err_disable_pclk;
 	}
 
 	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 1);
-	if (ret != 0)
+	if (ret != 0) {
 		DRM_DEV_ERROR(dp->dev, "failed to set edp mode %d\n", ret);
+		goto err_disable_pclk;
+	}
 
+	return 0;
+
+err_disable_pclk:
+	clk_disable_unprepare(dp->pclk);
 	return ret;
 }
 
-- 
2.43.0

