Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133027;
	b=CNpu8ferjS3nmYD/fYkn2Nc6qfS/9v6bvZBI/znl3ri5ifu/UxHqKCbiMy107kXa+/sQ
	 0JlI9JEtCUBW+3FA5or0wcAmhBMlFhub5WUoOSm+OYHPG+D8JIJM7JOvjdUkkp4Oxrfdk
	 1z6wW3/BdrIBwip8CtWHW5Tj3F6kzh/kzUmJzZ67kBiiJhpt0XgIDHIoxcBgkdsTO4Ocr
	 zkA/zt13EANKInBB+M58E00J92mNwH+R6OEKDarxuALkU217lTi3WNVc86YzwICZ4lTuh
	 48GdrsmBwVnDImv/1I1AfYfCa1Bm5AK1powokQDB58qwujHArOnmoL+1OEMTUWlp+aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133027;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=w/ED5GzwMsQqvzSvdU5jIiuxw2t+L7/vsfzIdgE6A2Q=;
	b=fvPSwYIJvv2GFkccZvq0uinv/D8ieSABVAl/ZtNT8QuPrI2C9Rdj4zTf01oQkjg6WLEY
	 s2HTRcDiAF6PdqsApDGdxRaOCs7Pqb4je+pBrpBRJsyLdr1V8og2kA5f3dz6LU09Agqyi
	 w+XAtuTqWALpZZN3MYeTf8QWYLepRBlur/fPSQX5CB556RyCwNd5Iu9t2dSeKxNkVyvwP
	 702rQn02cVwZcGcRsXbySUM0DzOkszibuFYpcWVSyNLpQJnmM31wtPyxcC9aU6595Vu7G
	 AjIOZL9tcZbskNsKgMZqIjaGfZDtOIhXUK71TLLl2b8mSvKmRCYYq9P5Z7DTmQzGTlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DD7606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7DD7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC6P-00000000297-0Y27;
	Fri, 20 Nov 2026 00:03:41 +0000
Date: Fri, 20 Nov 2026 00:03:32 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v9 07/14] drm/bridge: it6505: avoid division by zero in pixel
 clock calculation
Message-ID: <8e1ee42b7861ccaff9c14aaca1390c3f094b2b22.1795132452.git.daniel@makrotopia.org>
References: <cover.1795132452.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795132452.git.daniel@makrotopia.org>

it6505_calc_video_info() checks the sum of the three pixel clock
counter samples for zero before dividing it by 3, so sums of 1 or 2
truncate to 0 and the following pixel clock calculation divides by
zero. Divide first and check the result.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # Steelix Chromebook
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 434a4fa39a911..9357996c2eb38 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -753,12 +753,13 @@ static void it6505_calc_video_info(struct it6505 *it6505)
 		sum += rddata;
 	}
 
+	sum /= 3;
+
 	if (sum == 0) {
 		DRM_DEV_DEBUG_DRIVER(dev, "calc video timing error");
 		return;
 	}
 
-	sum /= 3;
 	pclk = 13500 * 2048 / sum;
 	it6505->video_info.clock = pclk;
 	it6505->video_info.hdisplay = hdew;
-- 
2.56.1

