Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197909;
	b=TUvqJs6wZCGLpqkAz3UT+jQe21wZOiXPHp91M1mbk1cEZMSFWXmIPPe+AltBWFu6AeHv
	 6Nx7HQepjFklqIDLoTb7yzBAqcVOe3s+8y43NJ5TKmUPR9bSbgzVSD0KR/Uif4BSI4K/K
	 e0GD94qI12/LLAajC37wnsNNDaU5jd5KB4l1Su93dhOMdYB7S4Tf56fqPm9bknj2IvM5I
	 9AdPEATTmaDU+jSMMuu1T5uw43F3Xne2FhsUpd30Tu0rtlwYDyS95xE5+CkyrAOG/hVqA
	 o6AD9rsG1yc/rIN9fBNKYWJI9SuEwFVxAq9oWKHxeP+SurWrxw97jZDoLapivuhvUVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197909;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=hx0DuM8OzUdLqU/ahGBkmzFisoaTWK5v39m0MWVXalw=;
	b=4k7vg0HtinPMW/JDq9tw/NLfOMOadcCh4zzDC+LhbtL+P1qZZHpAHUVQpyfjzXnP73fx
	 dzjnKUFmdKd4xHqzJgKXFh6DqLRgIZ9rpzf3Gmzbxnf7BWUvRUC0XEc300ZRYGYxXAAOA
	 aBhMIJwCEZkOK/NF5cRrdWgLXYi1hXcr/p6n7ACJBHTyxwbsdiqVCayzpdLEkggqWfK9Z
	 JlkW5E04qL/Tqeq2/PpZL8sPb9PErO1r0OswSZ3tHcMYVdFZRurMayX/xox/2GnUeIfo7
	 GUrpjRq4l9YXx7Dsdc+xxiYANKjRivNeLmtEUeAGDU/azERW4A99q3PT5M7wtKx+KZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=v9y27KY+;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3C860A380C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E3C860A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=v9y27KY+
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8A3B1C62223;
	Fri, 20 Nov 2026 18:05:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEE22601B9;
	Fri, 20 Nov 2026 18:05:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3403111BC0627;
	Fri, 20 Nov 2026 19:04:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795197900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hx0DuM8OzUdLqU/ahGBkmzFisoaTWK5v39m0MWVXalw=;
	b=v9y27KY+JjyrqMct3vknfwuq6WjpZeCQzAcO+t9K1xMgHUP7LpVAWhX1zPSSGxW7vDX1lK
	isXFcXCaszQp1FFOdMSJb9uRK/+Y5rFmaDkyziEQhmAVE55SZvh1nV8Fbm4RKpypJTEidZ
	+t5ciSVucWn16/d6S5ETbyuvCnlGVFLllzmHFxHxFZHqfFYi63Otuz+NkkfIJVgIdN3tQK
	fX6Ybe6ELPJUx9pObcZAFwJu2lYIdoHUivQpV9980DBjAFaqYNx4pUTjNHKCK6iXOU2vPw
	s1WwY9SvjG8WAQp6PLGTbeqO1EEbCt8YTvVLd2yWg83uxEBhWdVHzzy/uOEeIQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 20 Nov 2026 18:59:10 +0100
Subject: [PATCH v6 28/43] drm/vkms: Properly render plane using their zpos
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
Message-Id: <20261120-vkms-all-config-v6-28-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
In-Reply-To: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Lucas De Marchi <demarchi@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com, 
 victoria@system76.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>, 
 llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2841;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ihtRy27F7YtJoaXolpAkwqcRhG7V5U2QjwBxEjJLYFA=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBrAIsBTTjLVfb6OxzT4Hfk9dy+1qdJOMihte5/C
 3KajyzhEbWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCawCLARsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOL49w//UeJb8TugHHdEMJ43xwBnV3YKH0ENcir
 J4KCbH40FLz2ziCIE0DdyZvgn38LPxDU7Wjr7mrTa6jmuijLk5nChpDoKr1ufxpZxsnIdEJ8gJR
 c8zBZaXwo8wXM744ypi/xKlf7jTgK1tVji3P89BdQOZeRj6S/JnGY/ciPPl43mfhto50s9IHESQ
 emLZdufcKzJae3wiepE9ujJZa/1X+0LmRGS/yY//rJyC3+lh5ByaVcNP/EW2gGI4OxPE4lkM2G1
 o6JhkXAHvIzTowKFEhN6Oz8GOhV+2vBMOROo6rJtBO870uutdRDsEdw7Ij4q6L4f+FLU/yutQE4
 J0wuyPsrgCGdcdAfxL2chx0JCJyM4Qj6DsZKBgLuzIxlMEmFZGXDpPlLmnl63k+eI2skLfcN3XH
 O2FIHxEgzO2QHGqwsnNI74JliqB9k9xCEfwf7A7PpuRORykKNYECFzhYuw/zLDD/w+kRQe9Mq1e
 b7ayFYgK0MrC2ViDltLYMUGO6XmJfZELmRqDHQWQzvYbueSx3BJg+4zTdPwa+XLMBpJJB+CHdUU
 vOzGHDD3a34bmNWxNbUhGnWxdmcdhMZY2rX91H8th6MesRdmjKFjmZdzfyWTAFWBybft9IH+z/Y
 Xr8QrhHnfBBPcJXouLYYDgsoj1/coRxVapm+4ndB1saiU8fT2PkM=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Currently planes are rendered in creation order. This is not an issue, but
with the introduction of new zpos configuration, it is required to
properly render planes.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c |  3 ++-
 drivers/gpu/drm/vkms/vkms_crtc.c     | 16 ++++++++--------
 drivers/gpu/drm/vkms/vkms_drv.c      |  2 ++
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 0fc915a954ba..6259017c5d69 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -505,7 +505,8 @@ static void blend(struct vkms_writeback_job *wb,
 
 		/* The active planes are composed associatively in z-order. */
 		for (size_t i = 0; i < n_active_planes; i++) {
-			blend_line(plane[i], y, crtc_x_limit, stage_buffer, output_buffer);
+			if (plane[i])
+				blend_line(plane[i], y, crtc_x_limit, stage_buffer, output_buffer);
 		}
 
 		apply_lut(crtc_state, output_buffer);
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index fe17f49305a9..ffd1eb5f1976 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -133,9 +133,6 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 		WARN_ON(!plane_state);
 
-		if (!plane_state->visible)
-			continue;
-
 		i++;
 	}
 
@@ -144,15 +141,18 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		return -ENOMEM;
 	vkms_state->num_active_planes = i;
 
-	i = 0;
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
 		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 
+		/*
+		 * normalized_zpos is computed by the DRM core and is unique
+		 * in the range 0..n_planes-1: use it to index the array.
+		 */
 		if (!plane_state->visible)
-			continue;
-
-		vkms_state->active_planes[i++] =
-			to_vkms_plane_state(plane_state);
+			vkms_state->active_planes[plane_state->normalized_zpos] = NULL;
+		else
+			vkms_state->active_planes[plane_state->normalized_zpos] =
+				to_vkms_plane_state(plane_state);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index a4bc3d02a6cd..a60aa6bf6913 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -155,6 +155,8 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
+	dev->mode_config.normalize_zpos = true;
+
 	return vkms_output_init(vkmsdev);
 }
 

-- 
2.56.0

