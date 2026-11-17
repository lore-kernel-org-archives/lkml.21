Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937114;
	b=gH6zjya7Ze333XOuI5BKE2DiW+SD6RSXd2DpVs5qtS9Zu9rjC8ZCgCKO/1B9UT/ezvL3
	 pB5dymWoi2641QRpQIYtKhcBzaEHBZkKo38UgTkpeoYRWZFaKbqfnyQ73aM8/1Xunn3Oh
	 x5F3EK0NFaCbgQEm2sXkdJfDtYPQpbfJdVF98HNjbaJRy+soqVm1XQkhBPXirIlD+8FYx
	 h+rUUaxTv6f4Jw92EhVWrhq98mUjFo08r0gHrmemKaFS9TGgQnj0drIDT6B9I4T6FEUGB
	 tRI2oPucssxryTcWJv9vo0/zAwsu4qkUBtcP8sbABtcAt397K4P8q//gA7vviQD6gmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=SSX+d+qRWkdn91G1pK7BnTwO8tnOwfNEC8664ApeNmk=;
	b=lO8TV8FLFAxLKqgYLEP0LtCt+gGQEJF0g4i7uwhgvlO1LevLIeDbqTGTvojzhAirR47R
	 HQ/b7MdLJhBYKT+CX/YNlwLd2q+ccLQNCU6m61y1uNJTO+ysqQ4AMtttVIvuP9fZ0jV4e
	 tqHB9HvO/sZnks2oOdMZ4iaf49F1T9t/B3iyHJO//AHoRt3L5dBydoSHq3Cn+qhRtRQNH
	 nS99mwGnQiv+uCyQ0ULt5NJImmjlM9FAkTqNbq0GNpQTO+d+NYN19EUQo/pAcqS0GvJme
	 1DoIYEJrGvDUiaZOgBYT4C/A5X7CCjJ7P3gWdKJEozUjpAMwbbwQB8RjViLZuN1vOLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8lY2Afx;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19CB606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F19CB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8lY2Afx
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37071c0f42aso248981eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937113; x=1795541913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSX+d+qRWkdn91G1pK7BnTwO8tnOwfNEC8664ApeNmk=;
        b=x8lY2AfxwiNYg7IpNbQCiyILCpiANn+42LaeNRKECLogXhMVGvCdemTyxpgGVVxq1m
         XrugsJSex2OH+YGY/0yNpu6PxKeaXRokdkaGeXtIrN+Fm5b23bR+JFGvwv4dhCTY48gX
         /+xIndzKuykcxo0voMeBfw0iqHoY51A2l9csG8sJmoEFVxV3Go+l9pxPxXH53taNjs58
         ZVLGf6fYwvR76sKUTNLWJFsCE/iuOIuZW7j46mBpdQfCruYGiGnxjdGwUKo5TZFaMB3N
         EsXqvNF+xPqHS9kuMGsLBxpWvrg+3zY/1iabuknjQXbefzeNcnplI9ClvJWXfqQGSpAL
         t/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937113; x=1795541913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSX+d+qRWkdn91G1pK7BnTwO8tnOwfNEC8664ApeNmk=;
        b=VfG7hgblQAT8MQPQGjQ7qHSnBMf2+DWjWgCzPJVttP+d23iid6SlCwE7dafIEAe6GP
         +N7PGplvNkENgytpNtZvYhM1rt4I133ltxHTJ16beewEpyDj13LiRrZG2uX8LBNJ/PyJ
         i+EqB3FEjRRZ6l0b+wqkja6aK4dweWCAIYGr3mIuAKV85RCHVNGG0CFj4b8I5XJI/4KS
         r2oqI8LbWp/M1SiHWO8wt33qYpAPIicOkAcbodTvk3lUYaSXC+8aTbXc6K4XDvhC4LzZ
         lbutssWDz/9ugVzBhqHxNkso7g9g3OvPOqBqaY4hWKZA9Aw97luHa6ntCrwu8OmUrcQv
         6e3g==
X-Gm-Message-State: APuU4Z81Ef5Ek1nS5Twg8huYEZH7EkhjvKbO97IMQ/c1kxnmXoOt33EJ
	rqQ6xKDfjlLwODgjQrvXWQEfDXclOCTXSq8d1O6WD2lX2/irX5xwrvf7PHNr5g==
X-Gm-Gg: AZFdTZc0gBmgGmWKWGya5PJr1Fq6zoeSQcGmXCRNHrywyL7dlDk1q6pxvv2rERohvwK
	CLpNuAFKFE5cEnQwJ253/MK5NJMr3tKnxFJzNQH/+rjd3PF8GwRZI+clw1GVvqUvVbnbhzrBL2S
	/2TLRqNUVOy9TPOaPwiYpw4gyYj2M72XFyFG6MelG5ffJ6TN/BvaOzlzVLn1U5JE0+40gialOLm
	pSOCScEuabUxutS013tf/50YqJG8fotPYYxHyg0rs+TTqKlm6EI7IhD10JVBttfDl/Z0xSIM3D1
	RCTODhQF0fBx7lHFaAqNq9lKTrjFdfDQjYHb1McnQJqZRiADNCHO5PKDVXrazLGmkCcNyIA5YVd
	0SeURD+VWQwnCrtKKMGt8JHQQMP2Fr7ggobWamx9f/e/2cUK5lv0HR74FvVyIryVtACjOS9jC/a
	quvxIfkRrzHXbF/2q7lde72pqx9u19Te2Rg6NXnPf3EJ7EW7A7fWopFntGiisADqfGYnimesHIk
	YDE1jnktqiQS9uCxDPEo+eBTmprzUh4TT01hIGTqYfb55cVt/M6GtPmhQZigrcILd45QQUIw5Gt
	3RNMjD8J
X-Received: by 2002:a05:7300:de4c:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3828101de20mr123080eec.20.1794937112971;
        Tue, 17 Nov 2026 09:38:32 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm44098373eec.29.2026.11.17.09.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:38:32 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Paul Cercueil <paul@crapouillou.net>,
	stable@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-mips@vger.kernel.org (open list:INGENIC JZ47xx SoCs),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
Subject: [PATCH v2] drm/ingenic: Allocate and register the internal bridge separately
Date: Tue, 17 Nov 2026 09:38:20 -0800
Message-ID: <20261117173822.1816385-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The LCD controller's internal bridge is embedded in an object allocated
with drmm_encoder_alloc(). This initializes the encoder but leaves the
bridge's reference count at zero. Since drm_bridge_attach() takes a
reference, probing the CI20 display produces addition-on-zero and
underflow warnings and fails to attach the HDMI bridge chain.

Allocate the internal bridge with devm_drm_bridge_alloc() and register
it with devm_drm_bridge_add() before attaching it. Keep the encoder in a
separate DRM-managed allocation: encoder cleanup can drop the final
bridge reference before it has finished accessing the encoder. Find
the internal bridge through the encoder's bridge chain during mode
setting, and use the bridge argument directly in bridge callbacks.

Fixes: 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in drm_bridge_attach/detach()")
Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # CI20 V2a
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
CC: stable@vger.kernel.org
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v2:

- collected Reviewed-by and Tested-by tags
- added CC: stable

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 31 +++++++++++++++--------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 625ec76cf04d..520912f9ed0d 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -121,16 +121,15 @@ struct ingenic_drm {
 };
 
 struct ingenic_drm_bridge {
-	struct drm_encoder encoder;
 	struct drm_bridge bridge, *next_bridge;
 
 	struct drm_bus_cfg bus_cfg;
 };
 
 static inline struct ingenic_drm_bridge *
-to_ingenic_drm_bridge(struct drm_encoder *encoder)
+to_ingenic_drm_bridge(struct drm_bridge *bridge)
 {
-	return container_of(encoder, struct ingenic_drm_bridge, encoder);
+	return container_of(bridge, struct ingenic_drm_bridge, bridge);
 }
 
 static inline struct ingenic_drm_private_state *
@@ -738,7 +737,9 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 {
 	struct ingenic_drm *priv = drm_device_get_priv(encoder->dev);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	struct ingenic_drm_bridge *bridge = to_ingenic_drm_bridge(encoder);
+	struct drm_bridge *first_bridge __free(drm_bridge_put) =
+		drm_bridge_chain_get_first_bridge(encoder);
+	struct ingenic_drm_bridge *bridge = to_ingenic_drm_bridge(first_bridge);
 	unsigned int cfg, rgbcfg = 0;
 
 	priv->panel_is_sharp = bridge->bus_cfg.flags & DRM_BUS_FLAG_SHARP_SIGNALS;
@@ -799,7 +800,7 @@ static int ingenic_drm_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
 				     enum drm_bridge_attach_flags flags)
 {
-	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(encoder);
+	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(bridge);
 
 	return drm_bridge_attach(encoder, ib->next_bridge,
 				 &ib->bridge, flags);
@@ -811,7 +812,7 @@ static int ingenic_drm_bridge_atomic_check(struct drm_bridge *bridge,
 					   struct drm_connector_state *conn_state)
 {
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(bridge->encoder);
+	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(bridge);
 
 	ib->bus_cfg = bridge_state->output_bus_cfg;
 
@@ -1303,22 +1304,32 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 			drm_panel_put(panel);
 		}
 
-		ib = drmm_encoder_alloc(drm, struct ingenic_drm_bridge, encoder,
-					NULL, DRM_MODE_ENCODER_DPI, NULL);
+		ib = devm_drm_bridge_alloc(dev, struct ingenic_drm_bridge, bridge,
+					   &ingenic_drm_bridge_funcs);
 		if (IS_ERR(ib)) {
 			ret = PTR_ERR(ib);
+			dev_err(dev, "Failed to allocate bridge: %d\n", ret);
+			goto err_drvdata;
+		}
+
+		encoder = drmm_plain_encoder_alloc(drm, NULL,
+						   DRM_MODE_ENCODER_DPI, NULL);
+		if (IS_ERR(encoder)) {
+			ret = PTR_ERR(encoder);
 			dev_err(dev, "Failed to init encoder: %d\n", ret);
 			goto err_drvdata;
 		}
 
-		encoder = &ib->encoder;
 		encoder->possible_crtcs = drm_crtc_mask(&priv->crtc);
 
 		drm_encoder_helper_add(encoder, &ingenic_drm_encoder_helper_funcs);
 
-		ib->bridge.funcs = &ingenic_drm_bridge_funcs;
 		ib->next_bridge = bridge;
 
+		ret = devm_drm_bridge_add(dev, &ib->bridge);
+		if (ret)
+			goto err_drvdata;
+
 		ret = drm_bridge_attach(encoder, &ib->bridge, NULL,
 					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret) {
-- 
2.53.0

