Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361451;
	b=JWkvSI+8WfW/LctETL9q8MO+ILkGfwwwBipLPQBG7dYLnfx5kRYHRHpkWQXgwgVVh5dZ
	 z0g6r4gRqPIC5RK7XcDY/W4D3HWGsOAyJlOmSJfXVEapXImJuejjFc1jDLYr+dw8X5713
	 toQYC2RTfIjL0Um+Gi831vDywxe7O3jRLsYrTMHRgG9KVzuA1eHRhBORn1f+FNjOxAF+U
	 XvFeSNEeMSp7QXSfYwZN4cRfQV4rNigHG+8tsVUyUuPYcGJuDqvUwreXyPRCE1BO8td+q
	 Sbk1bG52GqOr91iFWCcToYiLY0gpts+d9bHviq0jN6JnoBsvCa9NHKVANw+Ki+MxN+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ir0OKyo+y1SL2HEj72iu85DZejzl7//zFmRmBJel+xA=;
	b=F+j1xBz64xVGZasNv4QQmNXc/FBwFoGG/FV1/oTUPdRcHPG1asWG+i7dtRgetRQrx2ch
	 VUOYcEZ1ScLQWTrhuCQTzrdmSSftf0akFP4BkF0jcqd6945TNpN69daUJYmaZM11ssm+r
	 dx9OlSvDG9KbcsZ6cV6JAdYfWFOmoQJjnga+ZMvkP2ebSxYZjanqRmn+PPf7o3+lyAWju
	 GGAf+AjG8gkdgNuJFXQFTUawGUY3hupB67k0B4guykdfzneMdrbMdk2myZreByiLYa50W
	 4OtTy3LMZAeb2M1u2s3a0AgaqX7Fvj2kw9vGuz2z8xJs4MI8tsh3ceZAdNo+wHcBKlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=U8XxT1VR;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA54606A337
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA54606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=U8XxT1VR
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso29184715e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361449; x=1795966249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ir0OKyo+y1SL2HEj72iu85DZejzl7//zFmRmBJel+xA=;
        b=U8XxT1VRNWVijdROi/+gm7Pi/t9Wbvy7toufooMq+dDIvM+TYbwwsa5PEGb5iE5PAD
         tZ5hgPEW9b2oI4Uzk9b/SeCqi7V9ZVPW/TPunjX+qAG0k1jJvO8RFIHtSv+Gs4eLTs6v
         KOZS7elOHTEGMmH/huOJrtwR8VzcqoeqXPX5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361449; x=1795966249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ir0OKyo+y1SL2HEj72iu85DZejzl7//zFmRmBJel+xA=;
        b=Q3h+p9hisAk5l1eRrn3eI+MgHPBhUyUYhQ8+YC32Ro9H4x88esriaAxQIPY/4G14tX
         CWV6SWUE9f3sdH6ogNd6zHbmvAjfhOOZ76v4xxx+JiuvJsEkKc+ftyg88HcZV8UtanFr
         5ySShN6t46DfY23J7y/XtAT9Aj56hfXWkL1bHOnMJoIDaGd1OjcaAp7E4zzQl7lSn9CB
         eINvOZt76A279tnHu89rTYqSCA3SM4co6egkN2W5R8fnV7K1avxK7DtEsAIq5uMJP7U6
         NpZts9iv5kv3NAq3cAJS2ff3u7hahDYiIc7KDjMVUgJaGqi8JD4VUa++cDKMSIifXXmG
         VVrw==
X-Forwarded-Encrypted: i=1; AL+hErGr83tFZv88xRjpxM0juWTi9zGjkn1g0qgM0XFU1gnf6UZzOlGMp3dRs3Me4zUP7yJdrYiW5m2ETKYb1sc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C7uBAqse+4s/bWWIESwVXPmbLRKLh++XYvAvaHXLOWAYSisHc
	GoZsnYcgTfyj5+cPdKqXs67zYfdKZnhSmNPI8PlN3lLgylCS2g1ZY3xhz9sMIKTsX+A=
X-Gm-Gg: AZFdTZeRFZ5IeAdA5Wtkrr78SF4ozg592krbLdDjVM4UII0n5JUNMiVjDgQPWOXL9+R
	HnUhdi+Ru+srWSc6Pw+WX0v/UuRVzvf5l+vC+hmD8M21A3BT3zPCRUx+hHAp9KIMZ/6OsKgiAl/
	AkO8m6IWlkoxK+tCGqPSHFuHRF9x68SEXmRwiM0kah0qYPfNMXuXND7MM4b14c+dmty161/H1sf
	vtkjN4HXvaDy7XEM8QUO7zID/e7kFj7Ew+1zIrPrjd4YiS2tzbzCyQ/XoIxGkY+RNcR6qCDNUlJ
	3o6hqg9lLVGuMk2tdF2T2fYrYm+o7xGAR8h6Si2cd0W7DUGn4ugr6K0/E6OdkoJCXW5et/vkE+l
	MTO3ChnAIfj4YoiMwvIMPRTqpKan70NXTQnirXMYe+jA6ENrJ+IXWu6R+KZUwb2Y9aU2sTJaVD8
	szCy3lu7c5zHkIPgEY2SRK6tjcwZoMEzv8lqvIlvkP/EndzUBv6jlR9D2PsKwo8Ck6ucJxe/C/l
	OuAC5oTi75MqiJOzPTYG085HtezFuipQnFFGk+E49T146GaxpGbz17ir8lvMrX2uyMDMle/0VC1
	ucSL2bIfAPZdjqL9Gu5wMNPWU6XGPd3NJ+COvEaazNgrJNOcmWPR4DqlA0hpCFJjnnQIKIxRnfY
	mnoeJ9ImQAYKqX2rKMICVr+TYM3AgyNCL0QNksagtcFbQuV0JEUtR5e+OyjHthIsJlSLqrlSN5d
	wYNsSN+93jSV/I2VePmbM4fMKinA==
X-Received: by 2002:a05:600c:6219:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb8880badfmr181373425e9.18.1795361449293;
        Sun, 22 Nov 2026 07:30:49 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:30:48 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/8] drm/bridge: Add atomic_sro_install_state hook
Date: Sun, 22 Nov 2026 16:30:01 +0100
Message-ID: <20261122153032.2782768-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
References: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
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

The CRTCs, planes, connectors and private objects can acquire the
resources needed to keep the hardware state active when a state read
out from the hardware is installed. Bridges can't, even though they
usually hold a runtime PM reference and track their enable state
while the pipeline is active.

Add the atomic_sro_install_state hook to the bridge funcs. It is
called only for the bridges of a pipeline that was read out as active.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/drm_bridge.c | 41 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     | 20 ++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 81174015309f..f4b66a3b38fc 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -637,6 +637,46 @@ drm_bridge_atomic_readout_priv_state(struct drm_private_obj *obj,
 	return 0;
 }
 
+/* The connector and CRTC states are installed before the bridge ones */
+static bool drm_bridge_sro_pipeline_is_active(struct drm_bridge *bridge)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
+	bool active = false;
+
+	drm_connector_list_iter_begin(bridge->dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		struct drm_connector_state *conn_state = connector->state;
+
+		if (!conn_state || conn_state->best_encoder != bridge->encoder)
+			continue;
+
+		if (conn_state->crtc && conn_state->crtc->state)
+			active = conn_state->crtc->state->active;
+
+		break;
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	return active;
+}
+
+static void
+drm_bridge_atomic_install_priv_state(struct drm_private_obj *obj,
+				     struct drm_private_state *priv_state)
+{
+	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
+
+	if (!bridge->funcs->atomic_sro_install_state)
+		return;
+
+	if (!drm_bridge_sro_pipeline_is_active(bridge))
+		return;
+
+	bridge->funcs->atomic_sro_install_state(bridge,
+						drm_priv_to_bridge_state(priv_state));
+}
+
 static bool drm_bridge_atomic_compare_priv_state(struct drm_private_obj *obj,
 						 struct drm_printer *p,
 						 struct drm_private_state *a,
@@ -682,6 +722,7 @@ static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
 static const struct drm_private_state_funcs drm_bridge_priv_state_funcs_with_sro = {
 	.atomic_sro_compare_state = drm_bridge_atomic_compare_priv_state,
 	.atomic_sro_readout_state = drm_bridge_atomic_readout_priv_state,
+	.atomic_sro_install_state = drm_bridge_atomic_install_priv_state,
 	.atomic_create_state = drm_bridge_atomic_create_priv_state,
 	.atomic_duplicate_state = drm_bridge_atomic_duplicate_priv_state,
 	.atomic_destroy_state = drm_bridge_atomic_destroy_priv_state,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index b73f3424ed62..eb65e1807410 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -341,6 +341,26 @@ struct drm_bridge_funcs {
 					 struct drm_bridge_state *a,
 					 struct drm_bridge_state *b);
 
+	/**
+	 * @atomic_sro_install_state:
+	 *
+	 * This optional hook is called when a state read out from
+	 * hardware is about to be installed as the bridge's current
+	 * state, and the pipeline the bridge is part of was read out
+	 * as active.
+	 *
+	 * It allows drivers to acquire the resources needed to keep
+	 * the current hardware state active, such as power domains,
+	 * clocks, or interrupts, and to align their internal state
+	 * with what a regular enable sequence would have left.
+	 *
+	 * This hook cannot fail. It is called during
+	 * drm_atomic_sro_install_state(), which is part of the
+	 * hardware state readout initialization sequence.
+	 */
+	void (*atomic_sro_install_state)(struct drm_bridge *bridge,
+					 struct drm_bridge_state *bridge_state);
+
 	/**
 	 * @atomic_duplicate_state:
 	 *
-- 
2.43.0

