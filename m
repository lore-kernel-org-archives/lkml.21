Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692634;
	b=hxMNqUUIESrtamujZqYBUsFkDg552I43BKHf6Dck4DmdKJb65GOxVqe0s7KbkiOwJSMm
	 Kw4eFtfJ+eM5fN8AET2/DMP/ulp4UIUKaeoO7KyFb0kmTnpx40M8uMXPPiJUfG3/NODZF
	 SKXyuVC3BnBnfnooVdDL0DThwQHJ3sErXSRgJRaHYoZTZvL1xqvHilBa9bUjue/1BiaoK
	 S254iQIUSVYTmcukHKedYbMVAKJ93X0TDj+TjgbxNvP+NkPkSJ5x+zRZ1pRR4LlLo7TA9
	 VUi8GQ2CTRxlKuo3PRIFw2A7AOscgwOE7afHI0DrLw43Mr6NoAZucm/cvVRiAuV0kAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692634;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=vEFe+b0XHUTcRb7lamkS3KgU9CnhzAK8Ewm/PeTsK6E=;
	b=kExRtISf0xN2eB53WOWelehOS1E7nxrkFRa0LHqaCWDTO/Cg+tdjTTOmlTiJn4BVJd0m
	 NUfeFANYJiBiox/WSedDLeWNQ6i13INRjzH797Jd74o2uxYf8OvmmRqEMevvwcQpfcwTr
	 3MvJ8tjVZVyMmZvKvfm7kT+P1ePlOBaApOGhs4oBwZHyjyVNKUi709AWFx9M+kNNnwd9V
	 3si59BC0z5PlV2ovwzMmWCKCp/mQhp0KkcCwiYuG/YGCjfdej8wJeU64c/gFp0DfGAbej
	 JMczn88b0S/LFkoMof0YumVQR0qegZ1c+M4nIa6vQRQWveFHZlhfNE0yRXBSWz2V6Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="ipcyOxV/";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A20F606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A20F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ipcyOxV/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9B940C2B9C7;
	Thu, 26 Nov 2026 11:30:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5454F60237;
	Thu, 26 Nov 2026 11:30:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 651AA11E6B367;
	Thu, 26 Nov 2026 12:30:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vEFe+b0XHUTcRb7lamkS3KgU9CnhzAK8Ewm/PeTsK6E=;
	b=ipcyOxV/x8mGsTmwZ14nGnjH3Uc29mPff+BbkbOo+WbSZPoVzBHY30iQeTESEDa4O0WArB
	Bxb7gNux40jo91kTGTbBIeVm0lE680suJyf/OWjyaG9uL6AOvaucjgBIPmnTLGD52LH+2K
	FGyrlq0KJu5rBZm+GwVGbWvHysyj//VXAOPy1lU/aPdAZXPO24ZICkumwMYY4F3ct3FRp6
	aJM8BpgdG8Aq4zmwzmzEmPt7rDcuUmV/cXxWq/jPyiaMh6gx/S780pWta1/gu1BANiXo8W
	qRsRg598Ow9jE7Wd0i8Amb3Rd/L1UxdKIdrKn3JK+EQWDHfwKx3XfwKKS44k+g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:28:56 +0100
Subject: [PATCH v7 13/43] drm/vkms: Add error handling in plane config
 creation
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
Message-Id: <20261126-vkms-all-config-v7-13-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
In-Reply-To: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
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
 linux-doc@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3

Properly route the error path of vkms_config_create_plane() through a
fail label to simplify future work.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 12 +++++++++---
 drivers/gpu/drm/vkms/vkms_config.h |  2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 8cd4fe6551fb..c5d90f7e934a 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -421,13 +421,16 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device)
 			      ARRAY_SIZE(vkms_config_debugfs_list));
 }
 
-struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
+struct vkms_config_plane __must_check *vkms_config_create_plane(struct vkms_config *config)
 {
 	struct vkms_config_plane *plane_cfg;
+	int ret;
 
 	plane_cfg = kzalloc_obj(*plane_cfg);
-	if (!plane_cfg)
-		return ERR_PTR(-ENOMEM);
+	if (!plane_cfg) {
+		ret = -ENOMEM;
+		goto fail;
+	}
 
 	plane_cfg->config = config;
 	plane_cfg->default_pipeline = false;
@@ -437,6 +440,9 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
 	list_add_tail_rcu(&plane_cfg->link, &config->planes);
 
 	return plane_cfg;
+
+fail:
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_plane);
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 95e5c3694742..8f038562afd4 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -314,7 +314,7 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device);
  * The new plane configuration or an error. Call vkms_config_destroy_plane() to
  * free the returned plane configuration.
  */
-struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config);
+struct vkms_config_plane __must_check *vkms_config_create_plane(struct vkms_config *config);
 
 /**
  * vkms_config_destroy_plane() - Remove and free a plane configuration

-- 
2.56.0

