Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.54.195.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607025;
	b=Jg/MpDALVg2jpjCA4+UIc8SjTqjftWFlqxFOIAQc6dDmMqOltvj580wl92JSFE3NJpGf
	 Yte/u4ttshrJrW15LBH9NNZ/NO5tkRvGt7ncKC9TCCRynl2Am832AaEbHt/iuqTc7xf+I
	 C5c1OFg9P5jAIsuHS1Pzpe5SsPYtdkdNUsx243h0GR0L86DJM/9FbcLzKX5vA0WG1XWdK
	 ZPfZvHSWb1uDGtRWSEDeKxzaCj03KKZ50Gd8TtXJRAFdF0JMWj9TLYz2TD2Tb1TxNC4eI
	 nZhA+PXFNaLlSpUMbrbEJ4ih5ZcXcZvm/osdFGriscRVO/hJbwEFZRmMTvwezxaFyeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607025;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=4QRsSpZqW5QD+bTGP0os1bwUCuZCA3yNCNrhSO8mnIo=;
	b=F4MppCoN0Z5jWG5RABmeYPXAJ+pq9zorfX+z4VdplEqOvIJ/kBRT+cBsY60Kx7x/2P+v
	 Dhk47gOAM9FKwHKc0QkNmacJV8SkxPzr6XLMUSwsCYNIlhckGGrb5hB/RRrHpTUoiOI6B
	 u/226+4NVoff2o5DvDDNVfJ9FvnvYWnxZuaeqlROLMNkQsAj27uz6ihvkCykbOMscoNk1
	 tPUgv0YUb9vDqQKHDvEd3Q7WhViV5CaEyyq2TE9BLiy0BNyJbahaWMTjuU2Zp5BY//bvE
	 NIRzp3iCk011gU6j5/7c/o0UIhx0isRRF1g3XBy/c4xgXKLVWFAlyWGFEQhHIgRH3Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fintech.ru;
	spf=pass smtp.mailfrom=fintech.ru;
	arc=none smtp.remote-ip=195.54.195.159
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC73606A685
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC73606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 25 Nov
 2026 14:43:42 +0300
Received: from localhost (10.0.253.153) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 25 Nov
 2026 14:43:42 +0300
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
Subject: [PATCH 2/3] drm/rockchip: analogix_dp: Disable pclk if setting eDP mode fails
Date: Wed, 25 Nov 2026 14:43:14 +0300
Message-ID: <20261125114319.1089186-3-n.zhandarovich@fintech.ru>
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

The eDP-mode register write via rockchip_grf_field_write() call can
fail after pclk has been enabled. To prevent this, disable pclk before
returning that error so the platform power_on callback, in turn,
releases the clock reference it acquired on failure.

Fixes: 729f8eefdcad ("drm/rockchip: analogix_dp: Add support for RK3588")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 3a80600eece1..a9056303a987 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -145,8 +145,10 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
 	}
 
 	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 1);
-	if (ret != 0)
+	if (ret != 0) {
 		DRM_DEV_ERROR(dp->dev, "failed to set edp mode %d\n", ret);
+		clk_disable_unprepare(dp->pclk);
+	}
 
 	return ret;
 }
-- 
2.43.0

