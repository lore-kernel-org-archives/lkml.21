Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940850;
	b=UKaw8KUTHU4RTINikQ+j0TF1sIKhTnjxsaSn/uTtC1dh7sRqq6UOASKgCzB171r8oVeI
	 sx3Ca9mAeXS8AO+Ix/ediIiyqHpJKk6uIxW6i/E7T9vUhzlZ3BkjHqHVuCnZPWgTnQR5x
	 r14JbDgLdjtgsyVBohswMBzxisSPHolmqO7jrDVsd7mgqgkXSCOnLZzZfUmUc/A1lDtab
	 pxIep5IGn4sbqwKaq/2gZfQPfJ1RcePo63Wp+bs1n2clWjGVUeWr6Xhqn03qWQadvxojt
	 E02eW6qKC5r3zw2SdZgiSwpPYMbxHwLRbsjNNKZW69pYVJ+1IG3P5qzXmelVrGoDCXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940850;
	h=DMARC-Filter:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I51Cm6Ck9h4Ru+oeZIaLxqVx575L3vwgMDr+fkw6O44=;
	b=NWbEZ6InOt3GCz7xUctpzd7RQFjPqArO2A1laYxdiv+EPAtnD1s7S8rdAE3Au+L52vHG
	 l3Td/t0bDk8GijKfPStCTSyTVTaXDmZlRA6TKSkNVu8yF8c6aRjg+eVxDnqYZrqyx3g6P
	 65AlhJh+hOh90ded52v0Jlz+Du6oLmV2wzVfEDYWWLR9F4drmayL7GxbPi0++ZZdExKqY
	 nODCpfLelN1+KXwfo4w7lNBIUrUuhQrVRgeqmB0T5jj0qQKUjnn5djJUzH/tHbbzF6j6F
	 oThTnvAsdJhsYj0FRzzkc9/JzD0rcJofHqy+Z28J3R+4VEYMq3M/lsr/bN1w5QfU3kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b="Q5Q/Al6F";
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF6606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6CF6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=Q5Q/Al6F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=I51Cm6Ck9h4Ru+oeZIaLxqVx575L3vwgMDr+fkw6O44=; t=1794940849; x=1796150449; 
	b=Q5Q/Al6Fk/4LhJuCk87SDAWHbAfd/lwTYmCzN3NttqSitYYwjgKhMLCMBgx9wHL1Q235TZX5DAn
	YIt7iPmGkHKyBWbDKCRJeN/DH/PMe4eOfvoZNcKfWcrgZfgudfVOrg8Fv0b5uEk3l0IkVAVhB1REP
	mD98t98NYazAcBBJHpJaE/0OgDPLWuMN11bmUvEjL7MMnGEIdW3URjA1aIT5tNQiPCUL6E5IfK//2
	r62sQamr6gDHYDRVrsAk9gFmg6F82E/9DWsciV1YsfqP5xxe4Y0C6Mi9vyrfz4TyHrg4bHQ/FcOtZ
	rFOqUYHmBqx44+MowinUrOnSPvN1OiOqJpKA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: tomi.valkeinen@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	luca.ceresoli@bootlin.com,
	andreas@kemnade.info,
	louis.chauvet@bootlin.com,
	aesteve@redhat.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/omap: dss: simplify omapdss_device_init_output
Date: Tue, 17 Nov 2026 19:40:19 +0100
Message-ID: <20261117184019.430513-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
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

During reviewing of a regression fix is that function, questionable
possibly unbalanced drm_bridge_put/get came to light. Sashiko
review pointed out that of_drm_get_bridge_by_endpoint() does not return
NULL, so the questionable code is simply unreachable and therefore does
at least not harm. Remove the dead code.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/gpu/drm/omapdrm/dss/output.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index b5cef5093a883..cbb9b2f1a2133 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -20,7 +20,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 			       struct drm_bridge *local_bridge)
 {
 	struct drm_bridge *bridge;
-	int ret;
 
 	bridge = of_drm_get_bridge_by_endpoint(out->dev->of_node, out->of_port, 0);
 	if (IS_ERR(bridge)) {
@@ -34,20 +33,11 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 	out->bridge = bridge;
 
 	if (local_bridge) {
-		if (!out->bridge) {
-			ret = -EPROBE_DEFER;
-			goto error;
-		}
-
 		out->next_bridge = out->bridge;
 		out->bridge = drm_bridge_get(local_bridge);
 	}
 
 	return 0;
-
-error:
-	omapdss_device_cleanup_output(out);
-	return ret;
 }
 
 void omapdss_device_cleanup_output(struct omap_dss_device *out)
-- 
2.47.3

