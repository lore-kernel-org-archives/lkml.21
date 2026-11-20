Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133587;
	b=oWCDBZp81T/jisFL/SJI77DxRb3sLH9usLTtJfJaYXGEfz/bUw4VIcF20JzgF+crUcRg
	 wfKCC/UNaub8S5vnoQhZQtHZqkKIK4fiYmfJQ2XyBVfTWukMTSR5r1tWTTzHEN+CNIu8x
	 gdQQdUHqygo3q2k36/KhxOA/m7AxLZziy0bTWhyOjIdinyYcDoWe1/6sYsPCE8cLyhYtX
	 jcir8xEcLFPmpwcpP0Lx6OnM95Vzvht9vomRfc+4CnVEXBRkCwKPsGPoD8wt9rvgBbEgt
	 MWk3Qn+V9uGmFZyWQTTuJXj2lF7BilaSPyqC5c6AEF+wTurEr6zfUsOeRgFty5TdxhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9SB4EObKSw+tB9P4IbZtGcg+6FkG4Gy4Q2cjVejRkPE=;
	b=1qsSsSh2fHHO8ERx0UZpt0X3QcN8BqwLEOv2BrXjhND+AE8367AVhjgZ3vfYJq5zB69Z
	 tvS1vgWpQF4qOIVwh6Rp2LPSZwpPubGRtbJnfZu6IvgZiN15x9uMTtXqHnI09hnQ/+O2m
	 l7yFfdFDSpq1fxy/h4b8OsNJDhX/FvwiEXoYHGnMwnpStUj5rRBemmfUqTZZpUXZNtCzo
	 I21FUS+8hYaBeyV4DHPlSRnO/nL/qghddO7uRQB7Xdni+Oa3DYQGnp/Lf0PUdevC0cujS
	 8gp7z2is1ZjX0MlU1YcTJuCIh6qTobq066KhqhJ2RpT1aswBQ8heyNWMnTZb+ME6cfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SPB9X4X9;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB470606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB470606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SPB9X4X9
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-949657a20d7so43103985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795133586; x=1795738386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SB4EObKSw+tB9P4IbZtGcg+6FkG4Gy4Q2cjVejRkPE=;
        b=SPB9X4X99PCJkOzgmPj4UGRhE7afdmtnkVry4+D03EDd4zGfx1I4hoDHolxW5E5B3T
         vR/Wexx3zKvzmcxvEc1/Wpw2iVtWCQzTHwu41knk1r29HnGyGqU4SHejC7o2mu/dfNXe
         9SEkKVXtYe0/12eFNX4Om6B5NkYRqtACFsrOW9wD2TcnbWnVm3rF8xTVw4GU5drzKmTQ
         EWpKc87m3or3G0etAhvHov56qU1MqCx0pRO7H5g7igyw8ZxulNqVnpNEyxdU2xp5t9h7
         ttKpkoMGMeAOlA1cOLtkvTJsQmNYBibWKQl2m5mQBwlLeYDTDmy9pj3ZmxD7y4VFusWQ
         a0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795133586; x=1795738386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SB4EObKSw+tB9P4IbZtGcg+6FkG4Gy4Q2cjVejRkPE=;
        b=KgDk214E0SCBYHcfrzAh9j4VIIHbkXIsI42cF77Ygz8YQfsbweP/ThTYMtDmy+nLfv
         r99zv5VqLrn3OHtck4jIw9LUvtzZ4fJXiLlDU+sfwMUJ8/hueb/hrJPGxinqF74x8Rvq
         CpU+sP2YmU4/ypsEz7kpYa6lSqfZhjbbJmXBNn0x9g4z9ME3E8zSNpkceIHpWPni2QIc
         p1QN7FNwHbLgGG2pshLh+RC3mr22jdSOaM5Zfa1Q8WZhlYqF0UBZIrXZWY/J29/F/VMu
         kAjGGPLW4zaeyHlNJrg0UfQK/5N7kdkz0dztwj/As0UEdclMmO+812HauIDyaRxK274V
         mQlw==
X-Forwarded-Encrypted: i=1; AL+hErFNqHFHTBGw1fKMQQVB7dHV9tcCxB912D+HKWoPg3ps6TeiLPa4FI/S+XAm/TQIW+b+OBgvvTWq+WoN4zY=@vger.kernel.org
X-Gm-Message-State: APuU4Z86wAfrtciAwu6eMq+z1tpR81yhUBHhAqwd0I8nwV1qVlQ5nKAR
	byDDsXysabfSz7FpMjZM73b+Ia1AqwymyKkwXB04thJa1Dn4CWrGSMv2
X-Gm-Gg: AZFdTZeJFNqNBh+vvke7/9xtFO97iZH65Vz9cEg+lY1uYHmYR6ruN2qMxospFLZX3b+
	bncnEZNA/wPsE9koGUDBWIXm+YmXIiUHbvk8kVGtaSexHPKaiifGQBrO3q+W6D9sRHPw00+NImj
	5cjSxMrSyfpppo96VysDU6BxA+UDIkLA8+rv72qAUL+C8YradcXFUe9HzQWjqwvhAug6erd/aNh
	uaOTfeaW/Cp8l1NvbNP8q4RtoaBFq4w5WjDPV5q3/c7eF0Xs8us7QgrP8JwombPlOet0PspWbN4
	8yHHGtgfgv5lYAnOIVt6b610L+63Rnz0J2w5MImUyiRML1he8YoU1yesdNUoZzq4IX+uXczpzd/
	lAbgDmJJHGGlp+CItx5OLpNFkO3JCKi+btSz9oeOZRuyPev45uV+EeFTfWVFGSY0wy96k3FGRjg
	XRbZcdb+Y4dP2UyrSKoiJ2jdXb+eY+u7p+xx48loFsjJ55XvrWQPdLhwwpqlZmm2pd+b1Q8Zim3
	Qnq7IsAOxgN+3F3qD7qBHqprgjBBXmYZ+Yc3JyPidz8HAf57frLqiDgVcxRRjYfGMQKOcIXski1
	cBqG04w4kKkd50yjF34NMnUT6A4TNZz7AUMPyh8+lblSN0YiAwmO7oNqJ9wC6215tJeGNn1CRkG
	YJwqYV6tDzDFnkfVjFnRMcA0i/ttxsMEsVqgRoA/TcrEHMKvNR7XfZbBivxQ=
X-Received: by 2002:a05:6214:3a84:b0:921:3171:b604 with SMTP id 6a1803df08f44-92134b48c88mr23359986d6.54.1795133585733;
        Thu, 19 Nov 2026 16:13:05 -0800 (PST)
Received: from FKXX2DL94F.bytedance.net ([72.29.204.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm8311096d6.41.2026.11.19.16.13.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 16:13:05 -0800 (PST)
From: Yifan Feng <evanfengff@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/damon/core: fix damos_walk() hang with zero watermarks interval
Date: Thu, 19 Nov 2026 16:13:00 -0800
Message-Id: <20261120001300.11809-1-evanfengff@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261119014247.119946-1-sj@kernel.org>
References: <20261119014247.119946-1-sj@kernel.org>
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

On Wed, 18 Nov 2026 17:42:46 -0800 SJ Park <sj@kernel.org> wrote:

[...]
> But, this could make has_schemes_to_apply has false positive.  How about
> calling damos_Walk_cancel() when has_schemes_to_apply is false, like below?

Thanks for the review.  You are right about the false positive.

I tried your change.  It fixes the hang, but has_schemes_to_apply is also
false whenever no scheme has reached its next_apply_sis yet, so it cancels
the walks of activated schemes too.  In my test (one stat scheme, default
intervals) 18 of 20 update_schemes_tried_regions writes got -ECANCELED,
and two selftests fail: sysfs_update_schemes_tried_regions_wss_estimation.py
and sysfs_update_schemes_tried_regions_hang.py.

What do you think about cancelling only when no scheme is activated?

'''
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3492,9 +3492,13 @@ static noinline_for_stack void kdamond_apply_schemes(struct damon_ctx *c)
 	struct damon_target *t;
 	struct damos *s;
 	bool has_schemes_to_apply = false;
+	bool has_activated_schemes = false;
 	unsigned long max_region_sz;
 
 	damon_for_each_scheme(s, c) {
+		if (s->wmarks.activated)
+			has_activated_schemes = true;
+
 		if (time_before(c->passed_sample_intervals, s->next_apply_sis))
 			continue;
 
@@ -3506,8 +3510,12 @@ static noinline_for_stack void kdamond_apply_schemes(struct damon_ctx *c)
 		damos_adjust_quota(c, s);
 	}
 
-	if (!has_schemes_to_apply)
+	if (!has_schemes_to_apply) {
+		/* The walk cannot be completed while no scheme is activated */
+		if (!has_activated_schemes)
+			damos_walk_cancel(c);
 		return;
+	}
 
 	max_region_sz = damon_region_sz_limit(c);
 	mutex_lock(&c->walk_control_lock);
'''

With this the hang is gone, 20 of 20 writes succeed while the scheme is
activated, and kunit and selftests results are the same as on the base
kernel.

I will send v2 with this if you are ok with it.

Thanks,
Yifan
