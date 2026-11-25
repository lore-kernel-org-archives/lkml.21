Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625742;
	b=VQ6VffhJHX6vYJeNbSs/swR0JEfboydIg/YJAP5YTlZHP6XBtWssw711x6QjIuDnSw7h
	 3qJNNUT8yZO3wNES/A6FjLyU7kTrNCb0LYUbpTvD2vu02pbsODj43jmZE8EV37W/4cGVz
	 psHqYq3i3C1HyozjavN0fm5dHTdud7ZRpx1cRfJ91XCB2wLbHeecoiCAvcoaQ+p71RBrJ
	 LDB4euNw/AC9BizfI62bDht+ZrZ43NgWUdPJlRSZYiyfQuUmeHbejit08aeFMx1SH0KBz
	 u3YDBFrNr92UrEcL3k1L+mWl+vQARLLn67Iol//aKhRfQmzmu4MCepjSvnrfQ1L5NVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0A62Mt49jG54fQl7bP/m4esR20VvdRdkwPsuBaQgw5Q=;
	b=jXYcbKWvEwvPG4Z5BROU0FL1zX6whn326KAMwSF4tDHOVu8gIjPqNEO/N6GG+AK2Py3E
	 FPwpFrz/aBR2zprZJrhLSDKeneJyQjBZFKnyU/RF6kd0cvdbY2LzAN33YFqvIUmtfEkdj
	 FLRVPW2+tGyN2ZkZJxKd9rDF+0ZruAObSDF4oHrquwP7a/oAkA3bKInmdfqZZKFFniMce
	 b01wF4oXRCSGZi6vTj6QiqE8ZEgXds5WboOmQhG1xrfXDU2WPdhps8+iz2BnhXh1CRVU7
	 UE7S52OuSdkK/uozXUH/QN8YZKsysiflRmLXPoHMuzxroe9xuU7tB2cWvfBQAof+vQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSM9hb2f;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2791F606A6A9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2791F606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSM9hb2f
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so42159667b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625741; x=1796230541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0A62Mt49jG54fQl7bP/m4esR20VvdRdkwPsuBaQgw5Q=;
        b=gSM9hb2fwTo6VUv/k3z3Y+hTy9dzC5WUQwoUUoXazxEF79YkIqTHxJKrnk95lYTeXs
         cjC2Gt09Ye4NQPbWvEjKgkO6ieJ1QH+ASlHyskZrNyEPtGCFoq3zvy+/9M+tNsqZklXx
         yk+cT2qUzENAT6VKKWlxJM7mKL+z2reluE1PDeKwmn7zEmgSUPfVTIjqJRcsabz2nd/O
         skqtxJw7fEGH43nSDELHVRfii8oTMhn+AiegwHeM6/NWi1Ub2nsuslhY/6VIWcOKpILU
         3uaBBpu4bhweM9iiOU/I6FPU6LdtKevgbP4/fwV3ggQgKAk6gm5JjdPHf3bOTntnYUzZ
         Ug8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625741; x=1796230541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0A62Mt49jG54fQl7bP/m4esR20VvdRdkwPsuBaQgw5Q=;
        b=m+Ef8ImDNCX0/v4qFlHOazv28MH+IZHvRq+I3UpZ6yfsBpDke5IzHo2tDIlhjKvJ4A
         O6aFtgx/Y8LMVLGyZiOd5iH4K1W31+uPqAhHZJnZO+Q0zF06lJUPwGfSM2dGk8zZ+T/O
         pwgjOaV9klezAqbGVNKyi0Pys2iGRvFN0U8b2aomduxwnMjKltcu1OemKFCNFuq/+96N
         9PkTJ+1DFqc04xGY6qiGZUlLAuJXC62zC5f/Rgj8rMOhWJJi40Jv5PpLjts2HrJBOeqJ
         ZGzTIFq8mz7yNfxvAf3rc6fNZJcuJ8RpbpzWIxN6AgLRaf/BDD17TRZwH3H6cn88dGIu
         T9fg==
X-Gm-Message-State: APuU4Z8B3/0DxN0aIuB2D2GJRMOWk8a6IOMizPb+9uF6O3OOOR6M8n5B
	cwBBeZSmraWFml2gbgVJMAGnjBif0gsVF6gUBFPw8hT5T4Bhzrm9oLv42r0iO0s=
X-Gm-Gg: AZFdTZdG94SmmhR7LSLhy+6bkrqTh+lUDvxh6befwd+ppSAs+WpCLOOzWk7OaEbjHUa
	3snW1ptNMBIub5qdyt3HH5l7WFtMKLbeNbZAG020GElDkiFDOB7YL1vxRxQKHb7g1W7fNABE8un
	52qaKlbOUCwOj9K1CEoxYI2l70DD47zMAGRe4hLP3Mi3lcGZk5HGe2Sq8kapB23429ws1p7yKFL
	4KKB9aSYWCVc2EkFKwtCfeSurjU3nAXAlQ+/7UXkQhDkeLcM0CFsiiFAK2fPm/Tr7uICYXIFPZR
	7SlYmh6k80RswOa8jv2Gyl1rrabmnwgOL9LwYRPMg3ULRJHi89HWI4TEV+MlkhZb5HoCBwO4baR
	yIfogaCAq18hoFsPrJgK7P060OZPWLmwNfrwJRSzRczEt0HKbLWqyYwA2Kc1R5o1a7LyJ6GOr8a
	q/jaYx9olgeHetzmRRaAagThv2LO7APln44h6TrUoAkS4I05tnfygx2NoznV3ztr2HMCpopntq2
	8RFS2sb3yagiQbXboD6sO5GCVxQFzgUXtr69qp0rCYPzpjq6SPof79LuYF5JWHg3w3aJYMlnoAO
	iP5rfYEK0BcIwg==
X-Received: by 2002:a05:690c:998c:b0:8b3:5121:3d44 with SMTP id 00721157ae682-8b52046f394mr81347737b3.26.1795625741130;
        Wed, 25 Nov 2026 08:55:41 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bf474sm74766167b3.21.2026.11.25.08.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:55:40 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] MAINTAINERS: Move MAX77705 HARDWARE MONITORING DRIVER entry to sorted position
Date: Wed, 25 Nov 2026 10:55:35 -0600
Message-ID: <20261125165536.792563-9-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125165536.792563-1-svav2021@gmail.com>
References: <20261125165536.792563-1-svav2021@gmail.com>
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

The MAX77705 HARDWARE MONITORING DRIVER entry is out of alphabetical
order. Move it between MAX6650 HARDWARE MONITOR AND FAN CONTROLLER
DRIVER and MAX9286 QUAD GMSL DESERIALIZER DRIVER.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 MAINTAINERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9217708367ddd..bf2817dd595d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16386,6 +16386,13 @@ S:	Orphan
 F:	Documentation/hwmon/max6650.rst
 F:	drivers/hwmon/max6650.c
 
+MAX77705 HARDWARE MONITORING DRIVER
+M:	Dzmitry Sankouski <dsankouski@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/max77705.rst
+F:	drivers/hwmon/max77705-hwmon.c
+
 MAX9286 QUAD GMSL DESERIALIZER DRIVER
 M:	Jacopo Mondi <jacopo+renesas@jmondi.org>
 M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
@@ -21340,13 +21347,6 @@ S:	Maintained
 F:	Documentation/hwmon/pc87427.rst
 F:	drivers/hwmon/pc87427.c
 
-MAX77705 HARDWARE MONITORING DRIVER
-M:	Dzmitry Sankouski <dsankouski@gmail.com>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/hwmon/max77705.rst
-F:	drivers/hwmon/max77705-hwmon.c
-
 PCA9532 LED DRIVER
 M:	Riku Voipio <riku.voipio@iki.fi>
 S:	Maintained
-- 
2.47.3

