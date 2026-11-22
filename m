Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361455;
	b=yjF1N3Io0jBi96LYfP36F188mpdrqgOSBXRCpwQSjopQOpKi5+HrICv+m3KxzPQEMtiU
	 mxtCkP7BmDsVYn4CBxJ3jeJHj8ErZ/PpkS+T1FUOzV/UV9RkIic6n3lH4K0kMpqjdUN5v
	 YK5zS1OiD1jb08EsvDOFVq6P/G+jX55deYLvsHqGf7GH4xSIQnnzW0u5ya/hM9mjXRiMf
	 OENbiMVs5Yi2INl3tHDMrLzXd1jgwYrjXmaKOTKrIfqM8fyHQ1sNNAfEJc4pJkyU/a3+a
	 xVSClACGPjk7f9yLdFo12OOh8Mr4JTkGoJmbuNp1+Q1aoBbFt+B23Xp0LAcflQGltvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GRF7RZylvqUysOgUrH3bq7GJBGa2AYrwd8X7S2pra/o=;
	b=zZmiv+uiUaiQR3v9F3sP7rQ8dgJ3Cs3q+B0Mia+7O56fJNWcfPcBQIERCaJ6rXgbociZ
	 hbxgx4UgNTYVzVleR2DcS58yfQwPJgnqajN6trqiBLmqIp58/8kyAhrIUr4QhsC3b7FtH
	 pYbE6fhl6xti7YFiLm3E1li3jBgioze9FUpYextCrgUbivZxP7mCC9v9wB80d9+rrdIhq
	 /NujNC3HyWtkL87c92qRVPDVC7yZfjwX9k2iWjtBgDzmkB0NZfXVABC8Guiao5r72Gg60
	 9WOmhcO81Su01S0PPGU/D7r5syaHwYTryZTcX9V6gtZ+czvU3FFA6YN5Vj0zM2nUVNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=X6MERMCz;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440C606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6440C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=X6MERMCz
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b467581b98so22265095e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361454; x=1795966254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRF7RZylvqUysOgUrH3bq7GJBGa2AYrwd8X7S2pra/o=;
        b=X6MERMCzOK6feWg/ISV579uhgoB8gXTUupUMDskDHridkbSN9W4y2FfAk+XeGhv9Q+
         9fGXkrriMWn5OglavPuUEqRspquJk4x30oXiWCpZvGZJydEIYFzTgQmSOP1hZ1uDEM/s
         nxd5IyXC4YkU4nZwb6LD5iM3nykMriFAOwYHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361454; x=1795966254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRF7RZylvqUysOgUrH3bq7GJBGa2AYrwd8X7S2pra/o=;
        b=WTzsfZjOAbGQUpjPOF0yp777R6gX6yInob60zm8PpAtLSP8IU2bXPkprA5iJsSlB/Q
         H3Lt6zZn3yphVVw42SWloHelTzMUn8JOFcB6qWwA4M0+5epWCPwiOqGAUpht6m4UO045
         OKGC9gzthOumdDqSNhQUJQHAYqBKqahUJyey027lg8H5WKqsbjgve4wHcgtfqNfrt33V
         Y34tAQgARDDeCrH9ToVFvz6o0r3J/RTtG+SGD7jPLiPZLRM0/9OXGDLQyrPQhMu5mGBq
         iEtUpvRgjg6faA01VSm0mArlals/35vEcrIBUiC1MrIa09hkDfZXn9fewzlEDL4eBetl
         E1bg==
X-Forwarded-Encrypted: i=1; AL+hErHOsPeG794aFJUyFdyyoHbWSba1MWFJX5qa3eILf1U0a0bEDnBXpyBQQS+JlifLF0tChOg9oNvIbRiBGpA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uUFLgOC2oOcV69to3RQFTPk7La19mSsSdK0B2z+Jn1Q+wa8g8
	uA0Kbit0ehhQThrK0nVZCgbZve1kP29CplEtgbpICKbezag7S28ZPTPLd6Ck0Ok0f5o=
X-Gm-Gg: AZFdTZe9yLfuoD4qKdPmuDYRDtVS+LKOyVnzBpkxIYiPKu/MPIoyIoQ/TIX5M8Q4CkR
	KfvPPXxqziOJ5X9v1p3B9lV0gcGeLCq0A7bh1cML6nQUAM+m1niq2Wvqt2YyvxmWUybb4Byi6IH
	qID8XX1JbeK3JkHTnYz3EJpRmV3lhanQW5QXGgRYIizBA0FbVfS92oYu++K/siwE3+Hs5qDi4lL
	PSYMQnNQ6ZqJ51a22zI8jnZflW/U1p6RNfuWIazxEZSnlDsLw+QEKtOnWEjMmn+HM4kMMBXGMmu
	vz0jddLGYLGNrVCDFSVB79n67cUefk+/MuXVEwJjVCQ9H3+QZjlZMGCIm7/5pK+GC9z/e0eNuEn
	u9fwCzhLlTiwnknypX1T7gSuu4Vjlr3E+ac6sck3rz+Ui+TRjtkm6lfBKsVAnAy/tMS21sMV1QY
	03KvpCVUiANtftLPl9USRQtoRKzbFaJ2/3UW2twhE4JQvEKx2fmk4wFykT4Useo7BSTzxLDVQab
	IT/aiah5cFaBzvrGls4O7WfOHJ48yXmGlYvJvydZ0wdsvVJmpcenymZjzl+ziGjLaDhWRI8wqSs
	OYn2x3pEnqCrfaln8qN9fQUq41thW7RPooI38r+2tZbKNA5bUJ2ZDLKwonbCD/NyvnHP5Bq2zHD
	I/P2DJ4PFOc+cG1e1whPlFXBKY/PwtgdVgmp+LG5mdosibOQYVVUHbsrekeQntGMDHqYNlz3Ca4
	s8/ZHjVPvWpxJy3iPuNMSSjQltXA==
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr185114295e9.10.1795361453840;
        Sun, 22 Nov 2026 07:30:53 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:30:53 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/8] drm/panel: Add sro_install hook
Date: Sun, 22 Nov 2026 16:30:02 +0100
Message-ID: <20261122153032.2782768-3-dario.binacchi@amarulasolutions.com>
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

The panel bridge assumes the panel is enabled whenever its pipeline
is read out as active, but the panel is left marked as unprepared and
disabled. The following disable is then skipped, and the panel driver
never gets the chance to acquire the resources it will release when
unprepared.

Add the sro_install hook, called when the state read out from the
hardware is installed. On success the panel is marked as prepared and
enabled.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/drm_panel.c | 16 ++++++++++++++++
 include/drm/drm_panel.h     | 10 ++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index bef0e6af73ba..daccf98e5513 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -346,6 +346,21 @@ panel_bridge_connector_readout(struct drm_bridge *bridge,
 	return 0;
 }
 
+static void panel_bridge_install_state(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state)
+{
+	struct drm_panel *panel = drm_bridge_to_panel(bridge);
+
+	if (!panel->funcs || !panel->funcs->sro_install)
+		return;
+
+	if (panel->funcs->sro_install(panel))
+		return;
+
+	panel->prepared = true;
+	panel->enabled = true;
+}
+
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
@@ -360,6 +375,7 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
 	.debugfs_init = panel_bridge_debugfs_init,
 	.atomic_sro_readout_state = panel_bridge_readout_state,
+	.atomic_sro_install_state = panel_bridge_install_state,
 	.atomic_sro_compare_state = drm_atomic_helper_bridge_compare_state,
 	.atomic_sro_connector_readout = panel_bridge_connector_readout,
 };
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 58113ea7d63a..66f9fc0828f1 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -148,6 +148,16 @@ struct drm_panel_funcs {
 	 * Allows panels to create panels-specific debugfs files.
 	 */
 	void (*debugfs_init)(struct drm_panel *panel, struct dentry *root);
+
+	/**
+	 * @sro_install:
+	 *
+	 * Acquire the resources of a panel found enabled when the hardware
+	 * state was read out, without touching the hardware.
+	 *
+	 * This function is optional.
+	 */
+	int (*sro_install)(struct drm_panel *panel);
 };
 
 struct drm_panel_follower_funcs {
-- 
2.43.0

