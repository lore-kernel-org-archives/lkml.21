Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020775;
	b=aL//2eGPwIv17V6KntikaJjlBOdBxMqLkdtoHJxUNtfLz0EHNnygX5DheVq8mAqKZEyq
	 e1LUpXXvRkiJkRxWZNb5yS1c297pE0jLo6CSDnLa+/3gZM3g8P5/FoIl/J5XZZ/LcVeY9
	 Hp4GGBuhCWkYOJ9R95Bvpa117d8BzViZdg9ZFEQ+jYE9W9SpQyL8BWBzalkfv1VChVb7o
	 8Zu8Yghw4QayvO+jg/0dWtVV3aQCgVx9KIfD3dvawjaAK8A/1gfUMMpRvUw+1JXDFLmga
	 CqM9hJfmCeIMsC+PW3Gya3SKf97cGqM2ejGLFvF6T1utAoFYzMEQf8WUC58NBgBXAFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020775;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=/HnlVAW6G7yyYKcY/kk5wSZriSWdbWjxLxb+Nwookac=;
	b=1CgTYBuEM6s8LpsjLa3HnM6nzojAUKadhFJ2F6M2UZ5oo3Z6VJtjZfeyVI3IygdpkzLl
	 2kjOt1+wDH+v37ma4HCYS7d7vkxi/fC2DpbPtHtjG4OIK0sC+hsYL/eif0JHLuDDd59XA
	 cspgu3MljKZo2DAddTatunj/0sx87KU226Rw0zfSvItsGal9nqYSIMIa0FLhbpwH4zDna
	 KI+5Vlg6gLruEQAAlbohcttndQ23DijVo4qdBWwHhrXYnbXcCfV4us+BgYvSrObZ0qsgo
	 0imVuPTixD4v3JRZuIP+hSxfF99+tq6cc4Bw9S4e+4oAmD1fR38Ep/zkASZ3HpYy3uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pg2rL2aQ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296A560A261A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 296A560A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pg2rL2aQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 12F931A16DA;
	Wed, 18 Nov 2026 16:52:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC8635FE9B;
	Wed, 18 Nov 2026 16:52:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D05F11BC2905;
	Wed, 18 Nov 2026 17:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/HnlVAW6G7yyYKcY/kk5wSZriSWdbWjxLxb+Nwookac=;
	b=Pg2rL2aQgEgUYYgGfbvY/vb4l3thejC0dtg0+91G50Zki/FTEo1py6ZaBw/e329vfbsW7Q
	fhle3MUb18uSM8tzAVe0BKfEfGN2KEP3HAVMSzVH9LEwbl2RcHAuzHtrASE/2nJrV+SfH9
	cfR/dtROk8avGiZdrdOl8I1JPgvOn4w/WKFqCg5Z71WG16qvyFQMxYcvp4o82XCNpzLsaK
	Ox6OZ+DVYOFBQ1iZquvq4htdzdAwz/pN2Isls0+exSd2UtFWe0bYMgt5gc6R3nZsaNoGga
	/3AzVGOGjGV8caWVFdP/+7JdNBDPcjF8pBDEtCbM0i9B5iDCXSrZc46nZCxvnA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:09 +0100
Subject: [PATCH RFC v3 26/31] drm/atomic: add drm_atomic_shutdown_encoder()
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
Message-Id: <20261118-drm-bridge-hotplug-v3-26-44bb3b4a828f@bootlin.com>
References: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
In-Reply-To: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

To support bridge hotplug we need to stop the components of a card that are
affected by the removal of a bridge: the connector, the encoder and
possibly the CRTC (unless it is still in use after the removal due to
cloning).

drm_atomic_helper_shutdown() does it, but it disables the entire card,
including unrelated CRTCs for multi-CRTC cards. Moreover it is in the
drm_kms_helper module, which makes it unaccessible from the core code where
we need this.

Add drm_atomic_shutdown_encoder() to drm_atomic code, doing what we need.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v3
---
 drivers/gpu/drm/drm_atomic.c | 145 +++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_atomic.h     |   1 +
 2 files changed, 146 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index ad2099b4dffd..7015ee18462c 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -2148,6 +2148,151 @@ int __drm_atomic_helper_set_config(struct drm_mode_set *set,
 }
 EXPORT_SYMBOL(__drm_atomic_helper_set_config);
 
+static int drm_atomic_disable_encoder(struct drm_device *drm,
+				      struct drm_encoder *encoder,
+				      struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
+	struct drm_crtc *crtc = NULL;
+	struct drm_atomic_commit *commit;
+	struct drm_crtc_state *crtc_state;
+	bool crtc_still_used = false;
+	int ret;
+
+	drm_connector_list_iter_begin(drm, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (!connector->state ||
+		    connector->state->best_encoder != encoder ||
+		    !connector->state->crtc)
+			continue;
+
+		crtc = connector->state->crtc;
+		break;
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	if (!crtc)
+		return 0;
+
+	commit = drm_atomic_commit_alloc(drm);
+	if (!commit)
+		return -ENOMEM;
+
+	commit->acquire_ctx = ctx;
+
+	crtc_state = drm_atomic_get_crtc_state(commit, crtc);
+	if (IS_ERR(crtc_state)) {
+		ret = PTR_ERR(crtc_state);
+		goto free;
+	}
+
+	drm_connector_list_iter_begin(drm, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		struct drm_connector_state *conn_state;
+
+		if (!connector->state || connector->state->crtc != crtc)
+			continue;
+
+		if (connector->state->best_encoder != encoder) {
+			crtc_still_used = true;
+			continue;
+		}
+
+		conn_state = drm_atomic_get_connector_state(commit, connector);
+		if (IS_ERR(conn_state)) {
+			ret = PTR_ERR(conn_state);
+			drm_connector_list_iter_end(&conn_iter);
+			goto free;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	if (crtc_still_used) {
+		struct drm_connector_state *conn_state;
+		int i;
+
+		/* Some connector still uses @crtc, keep it and its planes enabled */
+		for_each_new_connector_in_state(commit, connector, conn_state, i) {
+			ret = drm_atomic_set_crtc_for_connector(conn_state, NULL);
+			if (ret < 0)
+				goto free;
+		}
+	} else {
+		struct drm_connector_state *conn_state;
+		struct drm_plane_state *plane_state;
+		struct drm_plane *plane;
+		int i;
+
+		crtc_state->active = false;
+
+		ret = drm_atomic_set_mode_prop_for_crtc(crtc_state, NULL);
+		if (ret < 0)
+			goto free;
+
+		ret = drm_atomic_add_affected_planes(commit, crtc);
+		if (ret < 0)
+			goto free;
+
+		ret = drm_atomic_add_affected_connectors(commit, crtc);
+		if (ret < 0)
+			goto free;
+
+		for_each_new_connector_in_state(commit, connector, conn_state, i) {
+			ret = drm_atomic_set_crtc_for_connector(conn_state, NULL);
+			if (ret < 0)
+				goto free;
+		}
+
+		for_each_new_plane_in_state(commit, plane, plane_state, i) {
+			ret = drm_atomic_set_crtc_for_plane(plane_state, NULL);
+			if (ret < 0)
+				goto free;
+
+			drm_atomic_set_fb_for_plane(plane_state, NULL);
+		}
+	}
+
+	ret = drm_atomic_commit(commit);
+free:
+	drm_atomic_commit_put(commit);
+	return ret;
+}
+
+/**
+ * drm_atomic_shutdown_encoder - shutdown the pipeline behind an encoder
+ * @encoder: encoder whose pipeline should be shut down
+ *
+ * Stop the output currently driven by @encoder. Also shutdown the
+ * connected CRTC unless other connectors are still attached to it
+ * (e.g. cloning).
+ */
+void drm_atomic_shutdown_encoder(struct drm_encoder *encoder)
+{
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_device *dev;
+	int ret;
+
+	if (!encoder)
+		return;
+
+	dev = encoder->dev;
+	if (!dev)
+		return;
+
+	if (!drm_drv_uses_atomic_modeset(dev))
+		return;
+
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+
+	ret = drm_atomic_disable_encoder(dev, encoder, &ctx);
+	if (ret)
+		drm_err(dev, "Disabling CRTC for encoder %s failed with %i\n", encoder->name, ret);
+
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+}
+EXPORT_SYMBOL(drm_atomic_shutdown_encoder);
+
 static void drm_atomic_private_obj_print_state(struct drm_printer *p,
 					       const struct drm_private_state *state)
 {
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 3ae35b09c0cf..5b6d5e8423a5 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1409,5 +1409,6 @@ drm_atomic_get_old_bridge_state(const struct drm_atomic_commit *state,
 struct drm_bridge_state *
 drm_atomic_get_new_bridge_state(const struct drm_atomic_commit *state,
 				struct drm_bridge *bridge);
+void drm_atomic_shutdown_encoder(struct drm_encoder *encoder);
 
 #endif /* DRM_ATOMIC_H_ */

-- 
2.56.1

