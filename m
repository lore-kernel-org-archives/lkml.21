Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132995;
	b=hjb1aL/tsmNIL2K9IB1rDWrdEm6h8jTr9LCO/0wdAGndncQf+PgBALTjv9FnTAI5a5FQ
	 qWYMApyY8QEL8eJ68Wg5kDpvcSk0rQCm/Iy1g0tbtlsPZANRMvkJ25dH0EZWT1EOpqAgK
	 YiJ8mc8FKnvh8NYqiZKWCc/1pd3PX3DC5f+BEYIX90SeA6prhAyCHOUOcT0Tysf6g09w0
	 9TUX1iUIl2mzd239dhixXyUyXG1qowbcAbNNDjtwFw0WLWFfURc4niSWVii2GymASnlRR
	 TPFVIkff4O4EaRx5u0YcxL35oXvEiP05XEmNaFqXElsbX5jDgrmnz8obgDqpywroNeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132995;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zaP3dJT9GASJhzOQde12GHB1bhBJ7BJJjkpUN4vQWMQ=;
	b=WNCcPWiYLyvUqAfVfLQ+lwcAMMS2ruUFzbe2fO59d9Yz6oNspAA0KRJWgBZ4Fwgp3DmR
	 fqfnrGV6RPwQiXPHX1AlEvxRGh8vgxtiGqY4ZHU+wVtSr9QtweaOgFo/30Ty3gso410Cj
	 5qLKMP1DmplZ2ZK/br4lwirm44jZFePazIJPk1MVGLSgSMVQTJ3d/kTFheQqfhvgTsML2
	 Aaff9R7koWkLR5pSuFmBq9haH0YRqH/aAGBOty8RexRqlbVVEu/Wrq1icjAQCQIdt6+yH
	 1fX8E9/yGiPzldK7iTKzQIAXzsnhnPOSIOA9tMzYNNs+T0MvQsorI7meh3teZb+TQUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8361B606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8361B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC5t-0000000028C-2Pgf;
	Fri, 20 Nov 2026 00:03:10 +0000
Date: Fri, 20 Nov 2026 00:02:59 +0000
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
Subject: [PATCH v9 06/14] drm/bridge: it6505: bail out of the IRQ handler
 when status reads fail
Message-ID: <ce2a90cbb7a9de693d0b260dcc90572a473c9aab.1795132452.git.daniel@makrotopia.org>
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

When reading the interrupt status registers fails, the negative error
codes end up in int_status[], where it6505_test_bit() sees almost all
bits set: every interrupt sub-handler runs on garbage and the error
values are even written back to the status registers.

Read the three contiguous status registers with a single
regmap_bulk_read() and return IRQ_NONE if it fails. it6505_read()
only adds the powered check on top of regmap_read(), which the
handler has already done. Acknowledge them with a single
regmap_bulk_write() as well, and switch int_status[] and its users to
u8, dropping the casts.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 37 +++++++++++++++--------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 249c616300fde..434a4fa39a911 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2639,12 +2639,13 @@ static void it6505_irq_link_train_fail(struct it6505 *it6505)
 	schedule_work(&it6505->link_works);
 }
 
-static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
+static bool it6505_test_bit(unsigned int bit, const u8 *addr)
 {
 	return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
 }
 
-static void it6505_irq_video_handler(struct it6505 *it6505, const int *int_status)
+static void it6505_irq_video_handler(struct it6505 *it6505,
+				     const u8 *int_status)
 {
 	struct device *dev = it6505->dev;
 	int reg_0d, reg_int03;
@@ -2655,11 +2656,9 @@ static void it6505_irq_video_handler(struct it6505 *it6505, const int *int_statu
 	 */
 
 	if ((!it6505_get_video_status(it6505) &&
-	     (it6505_test_bit(INT_SCDT_CHANGE, (unsigned int *)int_status))) ||
-	    (it6505_test_bit(BIT_INT_IO_FIFO_OVERFLOW,
-			     (unsigned int *)int_status)) ||
-	    (it6505_test_bit(BIT_INT_VID_FIFO_ERROR,
-			     (unsigned int *)int_status))) {
+	     (it6505_test_bit(INT_SCDT_CHANGE, int_status))) ||
+	    (it6505_test_bit(BIT_INT_IO_FIFO_OVERFLOW, int_status)) ||
+	    (it6505_test_bit(BIT_INT_VID_FIFO_ERROR, int_status))) {
 		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
 		flush_work(&it6505->link_works);
 		it6505_stop_hdcp(it6505);
@@ -2684,7 +2683,7 @@ static void it6505_irq_video_handler(struct it6505 *it6505, const int *int_statu
 		return;
 	}
 
-	if (it6505_test_bit(INT_SCDT_CHANGE, (unsigned int *)int_status))
+	if (it6505_test_bit(INT_SCDT_CHANGE, int_status))
 		it6505_irq_scdt(it6505);
 }
 
@@ -2705,35 +2704,37 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 		{ BIT_INT_AUDIO_FIFO_ERROR, it6505_irq_audio_fifo_error },
 		{ BIT_INT_LINK_TRAIN_FAIL, it6505_irq_link_train_fail },
 	};
-	int int_status[3], i;
+	u8 int_status[3];
+	int i;
 
 	if (it6505->enable_drv_hold || !it6505->powered)
 		return IRQ_HANDLED;
 
 	pm_runtime_get_sync(dev);
 
-	int_status[0] = it6505_read(it6505, INT_STATUS_01);
-	int_status[1] = it6505_read(it6505, INT_STATUS_02);
-	int_status[2] = it6505_read(it6505, INT_STATUS_03);
+	if (regmap_bulk_read(it6505->regmap, INT_STATUS_01, int_status,
+			     ARRAY_SIZE(int_status))) {
+		pm_runtime_put_sync(dev);
+		return IRQ_NONE;
+	}
 
-	it6505_write(it6505, INT_STATUS_01, int_status[0]);
-	it6505_write(it6505, INT_STATUS_02, int_status[1]);
-	it6505_write(it6505, INT_STATUS_03, int_status[2]);
+	regmap_bulk_write(it6505->regmap, INT_STATUS_01, int_status,
+			  ARRAY_SIZE(int_status));
 
 	DRM_DEV_DEBUG_DRIVER(dev, "reg06 = 0x%02x", int_status[0]);
 	DRM_DEV_DEBUG_DRIVER(dev, "reg07 = 0x%02x", int_status[1]);
 	DRM_DEV_DEBUG_DRIVER(dev, "reg08 = 0x%02x", int_status[2]);
 	it6505_debug_print(it6505, REG_SYSTEM_STS, "");
 
-	if (it6505_test_bit(irq_vec[0].bit, (unsigned int *)int_status))
+	if (it6505_test_bit(irq_vec[0].bit, int_status))
 		irq_vec[0].handler(it6505);
 
 	if (it6505->hpd_state) {
 		for (i = 1; i < ARRAY_SIZE(irq_vec); i++) {
-			if (it6505_test_bit(irq_vec[i].bit, (unsigned int *)int_status))
+			if (it6505_test_bit(irq_vec[i].bit, int_status))
 				irq_vec[i].handler(it6505);
 		}
-		it6505_irq_video_handler(it6505, (unsigned int *)int_status);
+		it6505_irq_video_handler(it6505, int_status);
 	}
 
 	pm_runtime_put_sync(dev);
-- 
2.56.1

