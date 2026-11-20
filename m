Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178806;
	b=Ap9SGP7DqPC4fGnMHU6/iVdrarFnP4CDzDHWbZvRtn8hYRmWEB+eMcjQIl9y8oRJRGKy
	 frhUpmNsr1dLkhlaOr/A81Tm4UZsflUDCfto+xYc6KYTzFbH54Tbh67VjvBynoM8PFJf3
	 khm3br+2o4fje9k5NGlOH/tRQWcbIfflqWcHh4Kh6x5l16fi8Fw4sB5JkaeTy4MWz0UCI
	 YSNONsnZsYKn1+zVb+zxfpfDt88XSfvwKHRgueOi4mk3cYQVBjQIPGBZ9ovSAFi2mFj+f
	 6n7Dz0v5Wal7tBRFvemslFUtFGwmEthZpEoCjoPMq2H1gsxBv5sWJDA0ysEysIwp+0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cGH1JnI2N42c7qdI44e/87ummMnaVGLzf/yoQwalmeE=;
	b=bx8Q0qkv5PSUYruJjNiMFkYk8c54pS9ZmkRpBuB0r8GT63hHfCu7o5OdUrK3Lp8z4e/U
	 GB+FhJAaDQqlv7Xfv7bUUFBix/C8MNRp109mFES4+6W+mn5u/T/ka+VsZjACPYjzGFzoj
	 PhPrY89kcZyBx0xjmhkTQgIAE1IhjVYACIDoJd/TQfQa0PFsuMBh+CVJQk+UWvEzqFBah
	 HEPQXCJr3fYJRhCiHgxAeop4lVvjTxm7XO/bZT6lBb23qWhABRT4p5yhrKg0v/FQDmk7q
	 QgiIFlfdPTf7cXU7IpEeixJ2CaTSf5MfqaiD361srFXO+eN5WeAjlsnKrhQ0A8KtWnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oCgZpz5R;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A626606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A626606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oCgZpz5R
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38564b4b017so847548eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795178805; x=1795783605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cGH1JnI2N42c7qdI44e/87ummMnaVGLzf/yoQwalmeE=;
        b=oCgZpz5R907eoM2HIsbQigiZeLGuNbt6gkNA+BEZ7g32B9Bt5tsdftKlf1fvB2QRaI
         AXyDaTJhXGV/+pW3oJLlhnC3BTKNZ5tez3R8jSib73+TZpT4GLIKibCGNpq1TJunIWEN
         0R579MvQBjeq6cksncn1k8wcf7svlPNPv21ANfBsfmTmKEE3B21j9N6k0P7myHsWceeL
         GVmIqprjo/6P8/78ddd59vzw8VCvLGJAMzpajAPz+nvcTZC5iaZbQU5YjsSepdcvi+Jg
         Js5Ao8DoYPzeBxQ9STn33728oaO30uhfcdRhEbC4m9JNCd6IOhpPBI0eJvGiZ53ufqP/
         PRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178805; x=1795783605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGH1JnI2N42c7qdI44e/87ummMnaVGLzf/yoQwalmeE=;
        b=WOylnx8G2uYDMZeWz9UFV08gmxSIgH5pPpd3N6tjslpC8mD2CWRmAzp0cNCVxJOo+u
         AOpGISOop3SOv3d1mKEhcWBcay6LEqzQ/vZLN1yNj5VL0nQ4mnpatzi7dt2sevUCQQcx
         sp8r3UPrjRXOJkcJdghnTXpEZmK15vLoVrItWVleMoswPA4DRKQLk9qJIlfBppKeU5iY
         3WmE6TzsabYCGfw/oS88MuJXhKgCVCISeUs+QvjV9Vgru4repZG6tMXyAiBag4edFPZn
         oGhLY4g2AfLNwKVXDh12DN9K6GXHJFgMxwibUUakyi6SXH1koitLNS/593gA88oT4AjS
         1nsg==
X-Gm-Message-State: APuU4Z84EjfwkQ06oa3VwmBqcNARYw5t5+Tc5VOuF6Wnej3ycpbjoTVB
	Wjhms+4rG8qbW/uN1MXZWWdUHPliX+zMYkt56nraBs+acf/lt3ay6/ygfVEa3QDe
X-Gm-Gg: AZFdTZdQ3PLCXDW4qnFOnVC913s9ZAkda/sM4bf8amYYjeKkA1CwrMFcUcRUvT5O0O1
	ssjQklRgjz9Vr9oIRpzQiuOIB07kmnm925aGeY9mwf+AXBWhKd6vj8Ch9qK8ENVJSD07hCogO8C
	Xd4XIs7uDOf2ZmkWCIAAlNGn2igwOklY3AjwKZqSsxSGdmoEC5j47HhjV2Z/xnJOeIz/07ct721
	zm99twuxr7Q6bkLHjTLDpY6Aw6b2RjgMFjp6V3fDrG1F9l8vBmvnbdqbnuVFuEzHUbYwzat56Kx
	iR/EzkE9i6cUvLGRSOxhSjRlxiHbIwFzCqrSD9CS0+EeGsJYOAgK5X8eyzURkHip4rLRlFCGrLh
	8ozgigrSs/gsWZNTzOjMnLrlEyDECnQxjhlRsJptqpzO7EO6BxZmYfeCjP55VC35WMci+U9QeMh
	/t4ruFX/OIKIjTA5SB4QdOaGNoovLadRnxSZe3Cm6fOHPvctqFR3Zz6em+OAaYaOu81bqpAxrqZ
	npnpWXkfj9fRIR13LEwF2foCb26UCU1Zr7DsAflhDabJ9E1mKW53Wa8KNXPPzkaVkk34vMu2Q+L
	pMUz0eEw9BBCUYVhRcnpxMmkkWSRlhOYF8iW8geCctV9Gt7WBgM=
X-Received: by 2002:a05:7301:182e:b0:386:1901:d994 with SMTP id 5a478bee46e88-3861901db11mr1238177eec.5.1795178805435;
        Fri, 20 Nov 2026 04:46:45 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.88])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm10150364eec.11.2026.11.20.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:45 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: pcm: Avoid reading beyond ELD monitor name
Date: Fri, 20 Nov 2026 12:46:07 +0000
Message-ID: <20261120124607.2799-1-sreekuttan2156239@gmail.com>
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
Content-Transfer-Encoding: 8bit

snd_parse_eld() checks that mnl bytes are available in the ELD
buffer, but passes mnl + 1 as the source size to strscpy().

When the monitor name is not NUL-terminated and the buffer ends
immediately after the mnl bytes, strscpy() may read beyond the
provided buffer.

Copy exactly mnl bytes and explicitly terminate the destination
to avoid accessing a byte beyond the validated input length.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/pcm_drm_eld.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_drm_eld.c b/sound/core/pcm_drm_eld.c
index 1941ee520063..556e5a43710d 100644
--- a/sound/core/pcm_drm_eld.c
+++ b/sound/core/pcm_drm_eld.c
@@ -362,8 +362,10 @@ int snd_parse_eld(struct device *dev, struct snd_parsed_hdmi_eld *e,
 	} else if (ELD_FIXED_BYTES + mnl > size) {
 		dev_info(dev, "HDMI: out of range MNL %d\n", mnl);
 		goto out_fail;
-	} else
-		strscpy(e->monitor_name, buf + ELD_FIXED_BYTES, mnl + 1);
+	} else {
+		memcpy(e->monitor_name, buf + ELD_FIXED_BYTES, mnl);
+		e->monitor_name[mnl] = '\0';
+	}
 
 	for (i = 0; i < e->sad_count; i++) {
 		if (ELD_FIXED_BYTES + mnl + 3 * (i + 1) > size) {
-- 
2.55.0

