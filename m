Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108245;
	b=q+hKpVEPgcitQc6kCZBFoSaPivvVVToQRgTLBqHtiSUiHpAtsTnYTDKz+D3Qp8/zytuH
	 zy4SUA688CNlanvaFbCkz/O3M2vwC9c2bZ0tKDQBe+dlSQfZuoQ6uxKs6xKdR0cU8VQpy
	 7zGbvoQOFc9wWqKc5EUdFzt77ybmQ0K70spnrM7AXFjYnx/a+B4q5cR4etelvZKr6XxJG
	 NJLEEyoLoA9QttzAhG6FhBO7IeicPmfjueDoX1Jwen/bJHEjvSG5XMDfZvZtMADgbyAxK
	 +QSvyvIBU/7akrw6EcKBWJU+bvxkhBm91M2pYCWmELgKZ/3S8/dGfKCi0B3E/iHXdyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Wf/5Oq5mchrTyiDMKcWORLhQhELf6w7llq5mVEibG3E=;
	b=QPd9UdQtJxiatYxiqXAPaTEN4vwzztt6gtTrANVCxUAx0dP5CDXLEULBIodZSxfbbEfw
	 UAlHmE7Zp3GJmx4Ehi3pvNt3JI1STwpkTeSZtzFGm29Tn/y09PiSgZabwxMpFefora/gN
	 4ZVwSvtXsQr6wMLdM3yoNbhrLDeJ+T8A8uU8OJvsSIbLpJq/yjjPP4pqr1vmvhsgZMLXD
	 y/mVElGtFYkGDVviAy5Rz0lewPU8Hj3X83U+YVky8SiKYqxz7cQxBRzdHSSMPYKMG5EGH
	 F/LR86oS1noM5/Z97Nq8z0nk01ltHVeGPxM7wZy6szUVCoxNSTF7vbhiMaHOpDx5C/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RinQ6zDc;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6330860A6F4B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6330860A6F4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RinQ6zDc
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b41333cb47so41298a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108245; x=1795713045; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wf/5Oq5mchrTyiDMKcWORLhQhELf6w7llq5mVEibG3E=;
        b=RinQ6zDcnikuhWPzvqE2nMWX+tjy0J7UfmrjWhh38mPrezR6hKGrBHIlKLrfxzguzS
         OD5znsxtD//Kg+Mp77h4UCiG10hT4jAwVV21n1M54DO0d9fM0SdLQtmNkA7OeRcAMkHW
         0S0wCm8SHMhG3X5KdnUvxMP9RvRIWVjPHiIkfDB7Gq7ftbCsPcY1LJ+nrSNG7cE4DuIz
         9IMjC9Mf2/0T0g8JrsitADyLJ9ovG0vBU6h1KP/9XxdLNuJTinlwV4cBKPKuSlR72SQU
         q/RC9si2a1NSXvXqGfKPWjIsE3TydtfSkzXzCgKe9QvgH2Y76LNmiG00RXrPGOh7BHjD
         oTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108245; x=1795713045;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wf/5Oq5mchrTyiDMKcWORLhQhELf6w7llq5mVEibG3E=;
        b=tO+LIhXt3TP2Jf8aN1fDyXJeiwOkxLaLSbd34WvJaoFH6sOlGEAt1/r1wS6zJyZsEE
         eKftrgswd9D5vd5AxwujnR9t17XMwps3HxkmQpHImg+vTGM87Tprrtm1lZSXrOG/JxA2
         9MF3hALaw115PSDImwLQ69VVXbreiaT1b3ZsCYSyIczWBF3FG03KUB0cPg98R4N3r6G3
         CMAgFAgLiLUoPwCBKle7ty+K0O5h7pIYHqHPRadzQJSJ9eCZl1qvE9jUBRqu1tm53Sqh
         E+6zkjiSq4USH+3BPdTEnEMa77Dw9DjQKi1ddFxwJRsK6ZUBvXyYN7kGB7ApwHZsaymT
         2sxQ==
X-Forwarded-Encrypted: i=1; AL+hErHh4zqrmm4RVjE8nL1wUvoMxlyQBjf+LYylP118zD9K/tUrDQ0MO8qAR8wXx19yp1M1u4bN1EaCHtXrxOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LgA0JwuigbmeIhVEhm3n+CaYtc883meuIXhU6MBlQ1w+FRTGb
	GZKCvkrJjir/EfpXY8SBlkUfR0EouVgKbD1/Sqa1KR/EU6lDJ5naOTwII13A7GdHLtkWKReLahr
	j419j+/QJ1g==
X-Received: from pgfv9-n1.prod.google.com ([2002:a05:6a02:8749:10b0:cd8:5a84:95f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d10:b0:3ac:a1c7:20fd
 with SMTP id 98e67ed59e1d1-3b41c7ac351mr40117a91.4.1795108244548; Thu, 19 Nov
 2026 09:10:44 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:41 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171041.1536322-1-irogers@google.com>
Subject: [PATCH] drm/tidss: Return drm_mode_status values from tidss_oldi_mode_valid()
From: Ian Rogers <irogers@google.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

tidss_oldi_mode_valid() has return type enum drm_mode_status, but
returns -EINVAL (-22) when the rounded serial clock differs by more
than 5% and 0 otherwise. When drm_mode_prune_invalid() logs rejected
modes via drm_get_mode_status_name(), status == -22 computes a
negative table index (-19) and triggers a WARN_ON().

Return MODE_CLOCK_RANGE and MODE_OK instead, matching
dispc_vp_mode_valid().

Found via Clang -Wimplicit-int-enum-cast on an x86_64 allyesconfig
build. Verified by building drivers/gpu/drm/tidss/tidss_oldi.o with
LLVM=1 W=1 (-Werror) and -Wimplicit-int-enum-cast, and with a
standalone C reproducer; not runtime-tested on TI DSS OLDI hardware.

Fixes: 86db652fc22f ("drm/tidss: Move OLDI mode validation to OLDI bridge mode_valid hook")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 62c9780f7855..3b5046628642 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -322,9 +322,9 @@ tidss_oldi_mode_valid(struct drm_bridge *bridge,
 	 * we use the same 5% check here.
 	 */
 	if (dispc_pclk_diff(mode->clock * 7 * 1000, round_clock) > 5)
-		return -EINVAL;
+		return MODE_CLOCK_RANGE;
 
-	return 0;
+	return MODE_OK;
 }
 
 static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
-- 
2.56.1.708.g77570a6a1d-goog

