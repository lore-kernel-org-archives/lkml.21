Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045819;
	b=hmW7NyDwyCgKWNX4XCQTVxfn1PBoU09hpP6eOkdaZVqTYY4O+I3fnpbiOGxfFCrmlTRQ
	 X8Yi/IslntrtGuA42OPxFAc93Ngu7jSYw1DopTsOFhoelF207lYrGlsoJ+HvJHaJyaOny
	 YMlUj3aMRjjF7Z47BXajWmgF8dIss4C6+H/RoPMDrnYYe+8zYT1oMlpb4M1p97z1tCR/x
	 zskIeUmY+3CScQ0Vne5iJ4M1xh3r/LfIMcLCbdADaB/Hgj08YNXO805YBAADtVFw6esUM
	 Yh7ixrXFjZ7E9e2VOxs6+eHDck5vFQBidC3ANAzSMn1d1I3RXCqhqpJVNH//4z+yYmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fduH1+3PZ/9MoDFOHCe3dYefomwFptmBxA3+ByWc1yc=;
	b=SwgY2fw1ExSEoJR5DwFhkzw+NYoUSdXiVDEGpZ3+AGm2UXlRZRDUAvs3LnLjnfAfARDG
	 fjajYVi57gVnY/yuPn2KMMAy89Tp8ZnekfCCvKPmp8OAOwTA3IyW8ZXj64QyL3PMOhD8H
	 H2kU1dwR5AKor/grAbee72YgDIjV87/j7CDMYf6UelDbW+McYMH94FclXLdU76UConOGT
	 9AQ7wXnvFC3aJ+zlp/FZhr4jYNtzlxd7K7UnwVSC21y1D9/KtvTkFc37n6cWMc+LdG5Mj
	 kdKzl9lK5LDeyofXYMCq9+F5yvohJh/TT6MM9XGB/mwX3n1sGGh7rAnRwg+DaNGdPrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GrC4vKpJ;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78E1606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A78E1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GrC4vKpJ
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-847ac7ccd85so1095797a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045817; x=1795650617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fduH1+3PZ/9MoDFOHCe3dYefomwFptmBxA3+ByWc1yc=;
        b=GrC4vKpJ3CsPgqGTknzfnPz9X85IHt+SfYZidKboL13p5Ur3sfNCf+Z7a3dc3RLeny
         9E18YdymITMZ31wvetqb94MdtegskLeOHC9QrjGoPJ+Iqe0JZDT0lmtUNdR6e8DIedCO
         aF3JzfBB0bpMDo/ZO8NBtYN5MYPrdlunidnv0NBNo+cPAT7VeLpW99PVdZsU5ShMdIi+
         Jl4ieKOwKwnf1e+p/8rF3atEuExcPblM4D3v462LbLbEsYhKxSAL2zaw4jyuXHL8vWHW
         cS7uYCTnA/4rPJr255DaUoZZUVSp//5SDt/PYvbx69yWK57r2z/Qi6uF3fvwNxY8Lvbb
         XYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045817; x=1795650617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fduH1+3PZ/9MoDFOHCe3dYefomwFptmBxA3+ByWc1yc=;
        b=HS80/ooJH4VT+6VUh4SZfJ7vckZn+N4/9EHlV6oieDGDAeNCEZtXSPYKfxwa4DeDnE
         ZHfhN5IZGO4cJk/pLBefBp5vRWvE3OGGIIx2NEd+44WLESEzzJlWsFD7gwAIx7sJa4D2
         WysUhZVdVL5WnIXK5M5TheEqGIcyel00U+qeEY1hh59+GzZ0HwZiyVToICx9RcCpcZtV
         0NEyBB6LTo8h7AU99t/JKf7DcGK70NFVe6Qj0NxRrXP/tT0vPQZIyCTZLqCSRzqGsizP
         K4t3WcF6NWs5jBvBZQv/ikP4+0lHAqEko/dK05rgMJz8P5GpZS789mGSnJ44WIUyKgPe
         bY2Q==
X-Forwarded-Encrypted: i=1; AL+hErFim5PpVWUnmQwBq7/bixARak7wFzQ80W93L4A0Ls9mUObwsuuUEiSc7m8/LWNWscrzxx+72VJNd6tgZdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nj7drguXlAhN5e84HJR8Y5JyiivtLN4m+9FNDMk4FDNx2O8rt
	lRnWcnXdx/T/X4WVPcrAV4dwIB51pwjPr+qqVBH/uX+kzaWKMsnkfdNZ
X-Gm-Gg: AYBFou0eHGIU+EIIr/XwicR2VjFDvhCyxMJ53+CIxG5smcgeEvgC5Y3EkhL3KnieLui
	MFF1PQ+6UitM5U/KKug9QJalUx7y8gqs4tuRmTD47u1W8LzV0PUoHnMU9MeiNeXE3lUKfHMF0lw
	/2Rylxe+BKi2PpX//IMoMw7EW/0G6+H/ZjAJhhLbgr3ZfDkWN7qKm59tGUuJ2Jw6f3AcAYtjRuX
	7N2Zg0Z4eXybsgDEkcnNNsVF+1HqTJ1qL4z7+3SF5m+m46RCcxtwvw+bR6ImP4N2AKeNUfDd4d7
	euCEYLwpBUCWVV8HFxghVkhf2edFLCpQExW6MUA++cEyIabtJ94f/9JCefSK+THVRLDa11xGx3C
	rxVnHLQ5N50kWevnbYXuJLw3nr/Y2q0Ue9QHkRsKdejDojY8Zh6f5mxKAiwO3uy8JyKLXzMQdVc
	Ao4yfw+oT8QvYLICuVA6G7fmvyOc1+reEClq1IENg2fmh7sHsD8hi8z08Gce70+RhEXMNIj39Rf
	4tMV6zvhFc18XGQwNkwRUKOS9T7CA8ADh3tvhReozH49A02E2LHQlOAHe2zbeUe/oie/WLuvENc
	MHmycNubOvkkrHP25b29KSJoxjL8v6n7LFvR2eudx3AP9pZQ72UsbRn15XiShTqkgBJRyr5vE9D
	LnlSzjpxg+aK7LeioeKZcE7I+1IzdeGwpSOVWvw==
X-Received: by 2002:a05:6830:254a:b0:843:cc20:9d07 with SMTP id 46e09a7af769-862f093b805mr5979128a34.16.1795045817527;
        Wed, 18 Nov 2026 15:50:17 -0800 (PST)
Received: from FKXX2DL94F.bytedance.net ([72.29.204.230])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f023a1c7sm3148912a34.23.2026.11.18.15.50.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 15:50:17 -0800 (PST)
From: Yifan Feng <evanfengff@gmail.com>
To: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Yifan Feng <evanfengff@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/damon/core: fix damos_walk() hang with zero watermarks interval
Date: Wed, 18 Nov 2026 15:50:12 -0800
Message-Id: <20261118235012.14859-1-evanfengff@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
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

kdamond_wait_activation() cancels damos_walk() requests while all
schemes are deactivated by their watermarks.  But it returns without
waiting when the watermarks check interval of a deactivated scheme is
zero, which is the default of the DAMON sysfs interface.  The kdamond
main loop then runs with all schemes deactivated.

In that state, kdamond_apply_schemes() finds no scheme to apply and
returns before it calls damos_walk_complete().  The walk request is
neither completed nor cancelled, so damos_walk() waits until the
watermarks activate a scheme again, possibly forever.

For example, with a scheme that has the free_mem_rate metric, zero
interval_us and a high watermark below the current free memory rate,
writing update_schemes_tried_regions to the kdamond state file never
returns and cannot be killed.  The writer holds damon_sysfs_lock, so all
other DAMON sysfs writes including "off" fail with -EBUSY meanwhile.

Do not skip the deactivated schemes when deciding whether
kdamond_apply_schemes() has something to do.  damon_do_apply_schemes()
still skips them, so no action is applied, and the walk is completed
with no region for them, as it already is when another scheme is
activated.

Fixes: bf0eaba0ff9c ("mm/damon/core: implement damos_walk()")
Cc: <stable@vger.kernel.org> # 6.14.x
Signed-off-by: Yifan Feng <evanfengff@gmail.com>
---
QEMU: the write hangs before, returns after; kunit and 13 selftests pass on both (2 need drgn, not run).
Found and written with the help of an AI coding assistant.

 mm/damon/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index b8678a53b0a9..12578fc3280c 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3498,11 +3498,11 @@ static noinline_for_stack void kdamond_apply_schemes(struct damon_ctx *c)
 		if (time_before(c->passed_sample_intervals, s->next_apply_sis))
 			continue;
 
+		has_schemes_to_apply = true;
+
 		if (!s->wmarks.activated)
 			continue;
 
-		has_schemes_to_apply = true;
-
 		damos_adjust_quota(c, s);
 	}
 

base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
-- 
2.39.3 (Apple Git-146)

