Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797861;
	b=PjyfWoqcFLUY2tbQFfeU28QyPgBnd7oqdkUE+GGHlokHEueOhC7e8dk0FWfK7F1jJKO9
	 75uyJWJKRJQvyanbRrA+tx5MW0xHLzBEj4cjcfnHcMqXqbmxFRP7UXMQoXsIFtkXA6MDG
	 KAAQJgHJBYZmHWFZFXAce5qprCvE1CW54LC5o1BYSboPtNQhVALG8BWKp7VRzzmVBhzId
	 e1wDnf/9FMrZLnsYVRKN6cOlsJbHd+BGzOZgqo2H9W2w6AHHU68cKYo6wZLmlS8/dtMbr
	 edYOyaAP8DVNuaIojZG9XZUpk3ytup8Wu8QudhSsqQm65S5oy+pIKelZzavA2XFJBLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797861;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:DKIM-Signature;
	bh=hMzITDPGY4WIMS/pDC1S3GbvxdAxOLkqpcyo/6nyvuk=;
	b=vGrPw6lCpTVvOfQqY26ZO5gaLw0ki206uDIwcNCXM2uI+rawL5JykFw/AoQn8CMt4uRb
	 x7k3OBu0JDgKpFez6qLLyVt2GYOUt0zPNzQu0zKubFb1OCwt7aX+JbfDDlvbAWEydPg/g
	 lPkm7NFQY41M/uH2GN+bNmxFJztfY3lQl+9/xZ/gHIITgL3bOiYtwW8UlsLiFnb3L+D+L
	 wrkOFLpWh2c7Nf65mWYIfbehIrabiRNRyYmQXdG+G9SCtPJifd239XuiMDfq0N6nYulET
	 DWFjxA24YPEzIN5N/MprDblEKNUtIJlnLwQQ7j2rbuN9DS8YoOoOmFubjyysHbvOjQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=cOoWx8+u;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F769606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F769606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=cOoWx8+u
Received: from abreu.molgen.mpg.de (g44.guest.molgen.mpg.de [141.14.220.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id BFFC64C442F971;
	Fri, 27 Nov 2026 17:43:36 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm: panel-backlight-quirks: Add Dell XPS 9315 FHD+ panel
Date: Fri, 27 Nov 2026 17:43:29 +0100
Message-ID: <20261127164332.55148-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1795797817; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=hMzITDPGY4WIMS/pDC1S3GbvxdAxOLkqpcyo/6nyvuk=; 
	b=cOoWx8+uDzW9/EcU8/MVFlacrH3b8ksGJ4igsC0+fuQjwYuJGkeW4UqxGF8W7AQDmbd4atBhJDKN
	HI11NRgKSs0yDS/xgOFSnnmE5lXV8oZ8g8vAjhsUXWC24JkzaDpTX6ZzQH/F1dRDE5vnOVwbc6bhn6
	xt6UPT/lW+lccgdeLuin5fM1YO3CNweQVK46GKbjB60JfMF/Zh2qwJ6aGsFjtR5YpidNX9hUj9Bi8Z
	cliR8MSpq5TK8GqlurItngK4c7gf4G9dGuEpB7dB1v3jvoynxhH3Z1MIeWO+3hiwWxFgbZ1QyVek+Z
	c37E/eywWMDRKuoxuKyblZD/nB7UL2Fg==

The Dell XPS 9315 (BIOS 1.26.0, VBT BDB 253, panel_type 14) has the
same problem as the XPS 13 9310: the VBT sets the backlight minimum
level to 15/255, while the other 15 panel entries say 6/255. With GNOME
at its lowest slider position (1 % of max_brightness) the PWM duty
cycle is 6.8 %:

    $ cat /sys/class/backlight/intel_backlight/{max_brightness,brightness}
    96000
    960
    $ sudo intel_reg read 0xC8254 0xC8258    # BXT_BLC_PWM_FREQ/DUTY(0)
                                        (0x000c8254): 0x00017700
                                        (0x000c8258): 0x00001997

The panel is a Sharp LQ134N1 with a different product code
(EDID SHP 0x1548) than the one in the XPS 13 9310. Writing the duty
cycle register directly, 6.8 % is still well readable at the lowest position,
and even 1 % is a little brighter than wanted; the panel is usable
down to 0.25 %.

Add a quirk setting the minimum to 0/255 for this system and panel,
so that GNOME’s lowest position becomes 1 %. Note that the DMI product
name is "XPS 9315", without "13".

Tested on the Dell XPS 9315 (BIOS 1.26.0) with v7.4-rc4 + this series:
"[CONNECTOR:676:eDP-1] Applying panel backlight quirk, min brightness 0/255
(VBT 15/255)", GNOME lowest position gives PWM duty 960/96000 (1 %), was
6551 (6.8 %). The eye test values (0.25 % wanted) were set with intel_reg.

Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---

Notes:
    
    Prepared with Claude Code (claude-opus-5-5).

 drivers/gpu/drm/drm_panel_backlight_quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index 85c2ef791d116..1d959a31562e6 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -62,6 +62,15 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
 		.ident.panel_id = drm_edid_encode_panel_id('S', 'H', 'P', 0x14f9),
 		.quirk = { .min_brightness = 1, },
 	},
+	/* Dell XPS 9315 FHD+ panel, VBT minimum 15/255 is too bright */
+	{
+		.dmi_match.field = DMI_SYS_VENDOR,
+		.dmi_match.value = "Dell Inc.",
+		.dmi_match_other.field = DMI_PRODUCT_NAME,
+		.dmi_match_other.value = "XPS 9315",
+		.ident.panel_id = drm_edid_encode_panel_id('S', 'H', 'P', 0x1548),
+		.quirk = { .min_brightness = 1, },
+	},
 	/* Steam Deck models */
 	{
 		.dmi_match.field = DMI_SYS_VENDOR,
-- 
2.54.0

