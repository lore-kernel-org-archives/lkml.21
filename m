Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197729;
	b=Eu2NImEgbD7YpUloksZCo+EEiOpw+cKz8suzBU248SYNZI7UzhmPsdEGw0rGn5VEnlQ3
	 EuCBx1CV5MSDCPZ7hM4VDPkDXHVA3sk87bxaGgUA8wgLeMZvs0edpCAIOkOOqfbMEH5tq
	 wMnMSaVvj0lb8xRIO5ObeCjW11QMOPU9WyNtkKboedPA1VOc87OjoZs56AO5tk8U3zkMJ
	 3/5GtTDiq4VIN11AwOqiqqpw0CVr8JZmRi1rrnEnzsQxNRy3lpeUyJC/FSbNUb5Aw+CCJ
	 0kZOrJGz5SQ7FHsZbNWaAAyv75NAxyPPLUD+JjvbZcH2Z32yVEZaN9CMZSrhfhd6vXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197729;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=IpnkLZNaMxYek5cZ29h8ozJDTj+8XEA1hungNpOfDaQ=;
	b=J13zEH03qj169bX0t4NqLLX9xBEhcY2noC4GO9pBs4FYMsTDrtuN3PSYSsOtaps3lbsh
	 nTuMG56S/YG2T/BUPA5LUm/qEBa6xixeA0qNq7t6nsasTLs1B+OSMtMPfOotASqX22aRu
	 jJo5fHLf6YQxH87HMT/3cTyHyOd7VdV7WYEsdm4yPwlS+gcl9N2qGf7ADn+T3uVBwMuSb
	 7GbDYbWeMzvzOXwsHcTifkZutFkh7mqUiLHPDnL2NhPJLswFelV6KoZ78XdEauqDhZ+lO
	 +EONpCnVml7pUf2Ysm41CKp/fUdZU9Eg8ENDGEJTY20c1k/c+4ZMUk3/m2Oh2ryxYaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GVyeaEGV;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEB060A2618
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBEB060A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GVyeaEGV
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7980C1A1756;
	Fri, 20 Nov 2026 18:02:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43DD6601B9;
	Fri, 20 Nov 2026 18:02:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0296A11BC08D7;
	Fri, 20 Nov 2026 19:01:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795197721; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IpnkLZNaMxYek5cZ29h8ozJDTj+8XEA1hungNpOfDaQ=;
	b=GVyeaEGVv0yRiRyuWIwR0RLe+rbXmG90fUy66pXWb3Y1Up+A5P8wo54JVj4wwWSHSIT+q4
	tzUo61Ws5b2ITTaU+Ixmbs0P6G95kx67NDla6e85w7mN2K663QlcFZxugNR2OrmB5+r4qV
	DV/vtIBd83+43ZdkCDAddC/8h7+ZjidbEjJ16ARLIR0MlJdpQhtp+JrchNyofVVNa+/y8b
	0FDStmpOgNI+3GG8iCzB2DnNIewohyWvIL66SngQqGqUOL4WoccMB58U0XHFcDb/woSpqO
	kbUZSiIFxzX+41LZYesoEi9DLaTism38q7YVPspZ31PMPqpxUwpmo51d9eKQDw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 20 Nov 2026 18:58:43 +0100
Subject: [PATCH v6 01/43] drm/vkms: Explicitly display connector status
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
Message-Id: <20261120-vkms-all-config-v6-1-78ace90f4fc1@bootlin.com>
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
 llvm@lists.linux.dev, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=usp25ROFGKzm9V5CeU+dcakDxTPjt0f1kiZiqEKNvQ8=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBrAIr9FdnUuKwpxXYdMKeybLvW/5vqQyvTjaNyQ
 a7e5j5QlLOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCawCK/RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOJOIw//SElHdQMyl+r6J4wI8liuf1bkHUlPEQa
 ntAOqQBrukllJJLMKvEmo60cOjWCvoMKBFbOYmsxFPn8CjOZ2sCvf9ByCRI3uVe9NECUsLjtwRN
 vKlgDs4RDwNDa1K526NRdDGlwVBTbO4MtXACJFO4iNtmLlZicd+TNvY6gPxppHz0yTmv8DrasMh
 KlQVWa7eu93psZtt1thAbgnCSC6PjC8mBantaknPjn7bEdY6lCfN0FgUgZGXtkoSlS8SI8oAXy7
 B5q7BWjiuHaPNXdXwE00GGW9bUKkmqyqArWb5rjOah/rYYVEJYFx5awE/el4aHgwfgGPX1SdWOl
 SvDN36aIlyd7d9eZnsZ0yj9u3gU3QyZKoFwr2roY2x3lG6YjZSrKMeisbRfXulqnsGyh/P4O6V9
 fzGOFm94KEa6c5ch0wrytGekNO9NLPOSX51NBUEDZ2TQrykfK01eoZimQ4ubSYQ6sIGi7zrqlSu
 BpvOex5JyxnSigfY1TBg0HZK6SJ32RNq4zpJVUz5TORhQc0a21bFVtDwTkBtu7pCDrsWRjNxfAs
 hcaBHM+T6tLtSIlHBaaoMxV7BNgNU+nZvqmNsdP9ODbuY+Zsdg+FkegAKbmTzfZ0ZZDvKhQNJt7
 Ewzu1CIsJys4czI4KpYgMrWtN4ljht+3kSUkEFDBzTEnTReGe/Xc=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Debug information are mainly read by human, so use full name instead
of raw values for connector status.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 5a654d6dead8..48c60930302f 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -2,6 +2,7 @@
 
 #include <linux/slab.h>
 
+#include <drm/drm_connector.h>
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
 #include <kunit/visibility.h>
@@ -367,8 +368,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
 		seq_puts(m, "connector:\n");
-		seq_printf(m, "\tstatus=%d\n",
-			   vkms_config_connector_get_status(connector_cfg));
+		seq_printf(m, "\tstatus=%s\n",
+			   drm_get_connector_status_name(
+				   vkms_config_connector_get_status(connector_cfg)));
 	}
 
 	return 0;

-- 
2.56.0

