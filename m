Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629156;
	b=na/X3sTkRrcDcOS93L0ZQUwhUjsI7QIhjmrAiNSYWDaDh6TFC4wCXOEK9aCjXu1IZKgr
	 abWJKHoXL3wlJyYsfchP8gNsppqcFia9eGQxtlMWtWoGldF8+2aL5tXJZGuzqsNUEXPOP
	 ldInV4qPe0p6TAYPeCZCaR+igyv7Ikm9n/8f/wk9GRUNrewQjFxKeu8tOCyk5JYe2C5Pg
	 hu3ni8NkFbdsO+nnS2FudPQ6mlB6mtbs0eR8ToQWS6RyzZCIT5J1ZzPOTG9pKUGb4Ue0Z
	 C9njnPaF2k7E7tivl6UKyIGnYHb1Vt9pRH5QO9ceBSzOu6B20pRM+/SdbGz4fpAxnMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629156;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=K/q1yAvr6XkI84cojadbVWLoEVrZ2+B7AbCD60d4iaI=;
	b=aTAWVO12M+UtAqIHpVbs4KlLpMUNDkHfzfEBss3b15YfZQ8hG507xqagGGGIheVf9UE/
	 JHWmEPFT2X7ar6uYHc6Pvz2wEDUfKMDFRnpvrTkq8FO9yUNTyHHB/IU0TuDmHsk6G9Jjy
	 +lVtiltwg0stzCq+ub0AMt8f+PmRP5bVdXItYay7P7ZJLywANvcJPTrTYykjeGR1qLeOV
	 2snQg3+fhf8Z6rjtC2a7Tk124P2mI8JQYSaqRqDZzbE4nb/oeomLKe/PSCsUhAik7O89g
	 UWres8YzycJm1KsbblvYE4o3iDmQCWl38u/vEgB2X1NgEjMhqiRrHwQdJpduhUhfCRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=shAo7SdN;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A97660A2613
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A97660A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=shAo7SdN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CF2A74E41786;
	Wed, 25 Nov 2026 17:52:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C9E060480;
	Wed, 25 Nov 2026 17:52:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC1C811E6B0D2;
	Wed, 25 Nov 2026 18:52:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629152; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K/q1yAvr6XkI84cojadbVWLoEVrZ2+B7AbCD60d4iaI=;
	b=shAo7SdNlXc1r7UxuO7i9mk83cTF+LUto5PoOa2Brwk0Lh/A4DY7a7ccttQQT5RQkbb0iJ
	2pmbSAL7oZzDwTgL6bjk7ia4uvxzzSVYWPzUVMKDgWQzbN3YZ19ffD2MQV913semqpp5Hy
	dbPxW8nZmD7O3c/mZo2Bdo0rT2PJl9M4w02p4cffcXujcf9elqOZeqScq2xo+U7FS3R9pR
	xMUYgP6VM1Uboea7pPAR1cMarXhawpG3/++O+fqJ7tpP9jyOFVrboJC21kQ8JPU9cxr0Pc
	gnM6lZLsuurXaFuXdc1fqUYVKPCxZUrKN2TVBk4SFjYszvp6NVnhn0+aeQI0Nw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:28 +0100
Subject: [PATCH v4 15/32] drm/atomic: drm_atomic_private_obj_fini: protect
 private_obj removal from list
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
Message-Id: <20261125-drm-bridge-hotplug-v4-15-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
In-Reply-To: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Currently drm_bridge_detach() expects that the bridge private_obj is not
locked by a drm_modeset_acquire_ctx, and it warns in case that happens:

  drm_bridge_detach()
  -> drm_atomic_private_obj_fini()
     -> list_del(&obj->head) // removes priv_obj from
                             // dev->mode_config.privobj_list
     -> obj->funcs->atomic_destroy_state()
     -> drm_modeset_lock_fini(&obj->lock)
        -> WARN_ON(!list_empty(&lock->head)) // warn if priv_obj->lock
	                                     // is still in ctx->locked

The expectation is not respected when introducing bridge hot-plugging. In
such case the warning triggers if the bridge is being removed concurrently
to an operation that locks the private object using a
drm_modeset_acquire_ctx, such as in this execution scenario:

  CPU0:
  drm_mode_obj_get_properties_ioctl() // userspace request
  -> DRM_MODESET_LOCK_ALL_BEGIN()
  .  -> drm_for_each_privobj() // loop on dev->mode_config.privobj_list
  .     - lock the privobj mutex
  .	- add priv_obj->lock to ctx->locked
  .	  (list of locks to be released later)
  .
  .                         CPU1:
  .                         drm_bridge_detach() // bridge hot-unplug
  .		            -> WARN triggers!
  .
  -> DRM_MODESET_LOCK_ALL_END()
     -> for each lock in ctx->locked
	- remove priv_obj->lock from ctx->locked
        - unlock the privobj mutex

Fix this by using DRM_MODESET_LOCK_ALL_BEGIN/END() around the list removal
in drm_atomic_private_obj_fini() to ensure the two threads above
(CPU0/CPU1) cannot happen concurrently.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v4:
- fixed conflicts after commit 6386ba453468 ("drm/atomic: Fix private obj
  error handling")

Notes:
 * This patch was sent separately in the past [0]
 * The issue is still happening with hotplug without this patch
 * The issue has also been reported by sashiko when reviewing v2 [1]

[0] https://lore.kernel.org/dri-devel/20260324-drm-bridge-atomic-vs-remove-private_obj-v3-1-64deefe84044@bootlin.com/
[1] https://lore.kernel.org/all/20261001130542.A40D11F00898@smtp.kernel.org/
---
 drivers/gpu/drm/drm_atomic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 1c3fe07b327e..096f85419b36 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1106,6 +1106,9 @@ EXPORT_SYMBOL(drm_atomic_private_obj_init);
 void
 drm_atomic_private_obj_fini(struct drm_private_obj *obj)
 {
+	struct drm_modeset_acquire_ctx ctx;
+	int ret = 0;
+
 	/*
 	 * Some callers ignore drm_atomic_private_obj_init() failures
 	 * and unconditionally register a teardown action that calls
@@ -1117,7 +1120,10 @@ drm_atomic_private_obj_fini(struct drm_private_obj *obj)
 	if (list_empty(&obj->head))
 		return;
 
+	DRM_MODESET_LOCK_ALL_BEGIN(obj->dev, ctx, 0, ret);
 	list_del_init(&obj->head);
+	DRM_MODESET_LOCK_ALL_END(obj->dev, ctx, ret);
+
 	obj->funcs->atomic_destroy_state(obj, obj->state);
 	drm_modeset_lock_fini(&obj->lock);
 }

-- 
2.56.1

