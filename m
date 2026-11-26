Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692657;
	b=JhP05iBeRPQtcKWPJ/yXY4ZO1PJwjEOL02nUWytGW1V20AWCEpFgIG8PCy5Q246h1qd0
	 zDSqeFpQJWwPCoMgwokiERouybv0zN31aqY/lRVp4AO6zdzmfU0tQJh5EFlZTbcN8Q/7A
	 FQ8yas15Jjhp3bq0BVGZTUGrJ46I7RbGdOdMeqG/HyvwT6LT8bJk2D7fsH4IqKJhi5O5z
	 dWD9KT4Y+RIYWuZUEjGvO4SiCXUx3Fr/8fo5rjPSsoh6utD80pk2Q5WxaCShmBa4g98Sl
	 NaszcsaP50UbMbA+dDgzfp6mflF+azs7EZeu01IslaaglG5uzHUXX1MW+JlMBg5Pz9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692657;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=wcjElR7C5kLPwpw6WHFFLZtd5kPi2983/oSMciWIcTI=;
	b=V/yR7jAqIy0iak+79ba8uCo0QXFXui4Zy0eJf3BPE7805hcJXUCYz0cgpejrXl+7ku0s
	 Y3A/IOccPPvZ8SRSqN7fwA4qHjATNdH9jyejiKjFqRhpieURRPms2Hl7QxX60sSJ+M9EC
	 jGOhw+yBGAwK71fmkzb+vWopLgwkjR5K9ElcYjLQ305w72oiE9KsXsmImSRDqTCZpzJLA
	 AjWRpBEY8fKfYK+iqWduQz1rNBZnjZrygysyQGoXJg0IfF7kPqYuOUBs+2MK5MDgiJHnv
	 4Dkc6MVHcEZS61W5prNv8StuxaOPpsHqVBUjiM5Yxo3TpgQ36ydp4HdTmG3/C2GhyZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BaioBp6H;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEF8606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CEF8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BaioBp6H
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 52E99C2B9C7;
	Thu, 26 Nov 2026 11:31:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0352F60237;
	Thu, 26 Nov 2026 11:30:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E075811E6B371;
	Thu, 26 Nov 2026 12:30:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692649; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wcjElR7C5kLPwpw6WHFFLZtd5kPi2983/oSMciWIcTI=;
	b=BaioBp6Hd94Lv2e9abgFc7GexLy0UnLMrMhCK6dHgROrz3QB84h9nvq0w+dLFiZjdflOaZ
	E5munwHAGyq1FgGYbQU3uScogLACzQ4qB5VPdYGPNU8idE0ZlHfPung0BvJ8t5PNAdZqtx
	CBXNDOqW4BNToGoUAj0qj9w586lGqKUpk3cRpqbu2GGSQSD2GD2BSfIVnpvhUgtM+kFy+F
	ItA0paOufyuWojll79fXO/l07GHnukmKR+mNeGXug4l8aue6/BDki1W/t1/Nh+A1sFdL73
	wBHouXGUmYTyCn4mLtDe6g5lRCb1YLNwrmM5IpgRIcMzsTESMvrIpz++dlV8vA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:28:59 +0100
Subject: [PATCH v7 16/43] drm/vkms: Use enabled/disabled instead of 1/0 for
 debug
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261126-vkms-all-config-v7-16-21194cda2468@bootlin.com>
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
 linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3

Debug information are mainly read by human, so display human
readable values.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index e933d61cb526..e2b656723898 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <drm/drm_connector.h>
 #include <drm/drm_print.h>
@@ -394,8 +395,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 		vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
 			seq_puts(m, "crtc:\n");
-			seq_printf(m, "\twriteback=%d\n",
-				   vkms_config_crtc_get_writeback(crtc_cfg));
+			seq_printf(m, "\twriteback=%s\n",
+				   str_enabled_disabled(vkms_config_crtc_get_writeback(crtc_cfg)));
 		}
 
 		vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)

-- 
2.56.0

