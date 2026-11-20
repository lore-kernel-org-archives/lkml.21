Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133087;
	b=N0gcxWaTpqmHc4kzVOGhZZh76wUn90/CNFXH0NAOFCPkT5GfNio25fU5deKP10FINtZO
	 /9RCOqklURm6YdalkpseymJYaC1QN7jgFp2u4DxkqJdS4hDKCcRd4p+94pGWtQ42ZX1wH
	 TYMFddcwBrTvGC5Ish64orqS71YJsV0w42OolGF3+QTs7xEXd3ljhzEVlMJMld+h1kNYm
	 z1YJf1oTrIR5FkMAbsYbqjRmUNNHGaHxrejJkJtrOSxh7kl2sT3Eb67KlKYhLHhwvgcge
	 hYSoNDptsUPdvxDppaK9shhBE3mb58xyHQxXi858HThr06hLIa0LUPFVsUP6ArcWg7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133087;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4XwPrC02m3NZ5L37G0GBqhip1O3/qf/pTTDnwVzEg6k=;
	b=kKKxZtM8OoldC7HFOLoPiOhDOM4iAYPnleRqu72g9MmSrjoB8MMvtdD28jrMrvtl2W/g
	 5FiXA4LkCAaN/e2g+JcRqB6eD+DOrhH8Mjq+1bTstuzIgappSUW/6l6KqzUwxZvR3ih0v
	 d6XCqa2zZBdpcbGwAzaL2LUGtzQnmnRnOdyAFwdAoA/ORObIZiP6Lu7XZWbvZii9EpnV+
	 HzvFd9DsBD55B6jfdQKVedwdo0Y4Ahfq/K6g/oNkjcc23w950/fH9g3NwHX/JjWw7d+KK
	 Bu2RJ2TuV1zoHPfsGVbrtJ+R2sQrCfAEHvPLr4Tn9iE4dyn9EJl/7OduscT4hmoh9bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4634A606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4634A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC7O-000000002Bk-1lNL;
	Fri, 20 Nov 2026 00:04:42 +0000
Date: Fri, 20 Nov 2026 00:04:33 +0000
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
Subject: [PATCH v9 10/14] drm/bridge: it6505: hold endpoint OF node reference
 while parsing it
Message-ID: <70d92703488bdfbe5bfc30b00db0e57650fce07d.1795132452.git.daniel@makrotopia.org>
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

it6505_parse_dt() drops the reference to each endpoint node right
after looking it up and then keeps reading its properties, racing
with the node being freed under CONFIG_OF_DYNAMIC. Put the node only
once parsing is done.

Fixes: 380d920b582d ("drm/bridge: add it6505 driver to read data-lanes and link-frequencies from dt")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # Steelix Chromebook
---
 drivers/gpu/drm/bridge/ite-it6505.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index d0d2bac88a94c..e271ca625a393 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3382,7 +3382,6 @@ static void it6505_parse_dt(struct it6505 *it6505)
 	}
 
 	ep = of_graph_get_endpoint_by_regs(np, 1, 0);
-	of_node_put(ep);
 
 	if (ep) {
 		len = it6505_get_data_lanes_count(ep, 1, 4);
@@ -3395,13 +3394,13 @@ static void it6505_parse_dt(struct it6505 *it6505)
 			*max_lane_count = MAX_LANE_COUNT;
 			dev_err(dev, "error data-lanes, use default");
 		}
+		of_node_put(ep);
 	} else {
 		*max_lane_count = MAX_LANE_COUNT;
 		dev_err(dev, "error endpoint, use default");
 	}
 
 	ep = of_graph_get_endpoint_by_regs(np, 0, 0);
-	of_node_put(ep);
 
 	if (ep) {
 		len = of_property_read_variable_u64_array(ep,
@@ -3421,6 +3420,7 @@ static void it6505_parse_dt(struct it6505 *it6505)
 			dev_err(dev, "error link frequencies, use default");
 			*max_dpi_pixel_clock = DPI_PIXEL_CLK_MAX;
 		}
+		of_node_put(ep);
 	} else {
 		dev_err(dev, "error endpoint, use default");
 		*max_dpi_pixel_clock = DPI_PIXEL_CLK_MAX;
-- 
2.56.1

