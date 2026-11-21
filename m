Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294803;
	b=KzjP5Ot4kwRBwY+KW69J5MCOIyEO7KeL95VNz20FukQlEH+vTHMlMADlijl0+nZCJJtu
	 5OZEvyNEhlkn7zLK9e/h0N5FL/zzGT3/kpOoJuIltDETG7HgUn8g7XKphsgSEpVJvFYDb
	 pPc++jnynL91IL7qENZ1GkNliRtp8XMG1CI3pPEhQci79WHxbcuprAuRZjmvT1GuTnWxx
	 g1lyu/lY9DlgRjflTgef9LQonrj59orjJD4NODtY+FWjbtK+4QyRDOKXSZKeiSqhqRDj9
	 ONFQTPXS13Oshzx2epLXWIV2hsHpEFJjKEEDDxEex961ywXDsRqyEP/sCjZUiGN57wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=URe94R238TU+IoDx/sw1PfxXVYgbhspV5wPkapxLInQ=;
	b=QbJBb3iNtybVlCXF5kY3ht3cxEN0W8PH0P81/qF0vaCF3OdonqpmlEUeN6bHqemZET0+
	 jg39mMm+vt5gd624hvAu1jfJ0FaQHsRcyJkrxVZsikH4p3OnN0KenEp0rEFKFSIZ5Mqoe
	 rjJnstvnXq5/McNl7t8/ZpzH8BI25D5FhgPNl2CfXV2T41K2OqpmeJPK4JVMqqoQfIOnH
	 flqSNbMlGy2jve51OZ/oQzi0bPK7CFHIxMJapa2YnMHPpp9LGptrJ9e8tvLRJYKSV0QPv
	 5vcrRgjY+s+0wo1QKBoA5rNCDB3UUPHENSv1d3HMUgta9IkuNB4V1XqJskECDH7MtAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oz12oVn+;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE17C606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE17C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oz12oVn+
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so19909615e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795294801; x=1795899601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=URe94R238TU+IoDx/sw1PfxXVYgbhspV5wPkapxLInQ=;
        b=oz12oVn+YvZq41jcYdXULQ0W/98XAI+4PAAp3qhsl+4K47IXf4QYhAfy7UVyN78Y6W
         Y4Kbr1c+lha04BX+hx486YlmP5WEqHjYqweXairkkH6YqVlkF8aZZFERSOSDF3a8xMBD
         VByTo1qiadeyTVaBK8dA2GmeodOndIf1VnY+Zn+nYkF5rh9tHufYd0o0fYvY2Glab4Bz
         U+caSemnKw4HKuOhLjrHs3g3zCC+08SLUNZ+hWRJ3iV+eFpt0eKxBS3sTEYmjKQuWuyG
         WTSM6sTruRLYYoDwH95IL6E1mqwQ3L8fXeFFdX7iw1gah3tZItBMLj7jYMYXO1+nC7z5
         V2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795294801; x=1795899601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=URe94R238TU+IoDx/sw1PfxXVYgbhspV5wPkapxLInQ=;
        b=o4jtZXnZZHZqd8oaz1j9z6SVugM6tIm4jT7nWAOzcY3tUdMMgfN3h8YLwIY0XcMyGf
         heLTU5tMG1jXZkevOI7HFog2C4lk0d3YcsM+N51/KSMoD3Vl4PoRZiIhok9UPvfPOiSF
         V9qWQVtbaPXtheGlDJE+SpQTwjngU0rn5TAasogMcg4xIjFQyPAvn3GgyUJCvuXG0o8t
         Rtrcsr5d9frLIgEurBvDPW7yihzeG2aDmrXkd3l49MvdcRoH34S6MvPdJufAFNsItgJs
         l/ckyT49wxdVXoPb8nu/HCmRjD+yu7nuMWcc8lTWmwb3SsrdbHkg/uBFifyKYrwbutqo
         cJLQ==
X-Forwarded-Encrypted: i=1; AL+hErEadLzNyooVhb3gA/0dDHJkDf7yGQtPhdz+OeOOq/Q6I3JgnIF4axDyWePsanPpeyH0bgPUZBfIzEsshTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ag+xyNfKfQFET3SN2ELSkHY7LhzF37s7PVRDcyTQJNEmcFYhY
	K1X5zZhv1zOqLg3GbBtjODKjwc2OLtlq7ZihPgyDQ2+ac4e2hKboGwk8
X-Gm-Gg: AZFdTZdgB0WAYFlDVwee72k30IHESsVAkI1p/FPfm5iDw8m0fTVt655ZhOSHoflP3C5
	6rk7qikhsAe7FaCkPljG7aqp1AKV3XMuZTWA3MXCRRXAYJ7VHSvYXjg0r0TIEX+x8UbLc9EnyzB
	IPR6s3IWk5QIVwvlEYoRFZV4QIp778Tchs8OcXd6kIb5z0pQzws8v26CIC1KwcarOnmy9UaGqSc
	bvlHPB5LxjI7ANpJZabcKAy/Dp0cygIjxaV4SYPO1/LcmPmcYG6/X9s1Ji0Z7hun1a6emObj/VB
	/SOI/p0MTAhsMtbLN3sp7fPhTVIEwMtJgi+9h7SLiQPw82VbtVAPO8HE21RSGd3QoQs+YTgPAGv
	60N2aTf0CFxKSB24Y56t8gERHKohBgDNvzxkyAko5OX/o7YZrGGVLg/8QKdmBnC4JnjnS1pBR6G
	upPbTCd+oMrlr5BrNKXVs3qdbsmwyQzxsc+8h3Jh2vacB++C3unsPgzYaYNkKck0YpKgs9/2PSg
	kltSFveHAfv6iOPKJn8YMMxKx+dRqBC2exToNWy7mu2OWj81/arq+Q0dTl9+QQaWbi/tglAKlDM
	+/Lr9rTwMXoHaDSfosDc2ZCkH3iaBDbUhhfIzfo0fhXyBRZj72R5DIwOVu9yABDtQdqkBCqXXt3
	guDu7A8NJE2vvwU3ttVFs4n1ZJkyTum94rVYuwhP+q17wd+cVYWSPwljXXg==
X-Received: by 2002:a05:600c:1c1b:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4bb887e2677mr177415985e9.4.1795294800892;
        Sat, 21 Nov 2026 13:00:00 -0800 (PST)
Received: from localhost.localdomain (dynamic-078-054-132-179.78.54.pool.telefonica.de. [78.54.132.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm181291265e9.12.2026.11.21.12.59.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 13:00:00 -0800 (PST)
From: Maxim Muzafarov <maxmuzaf@gmail.com>
To: linux-mm@kvack.org,
	Kairui Song <ryncsn@gmail.com>,
	Tianyi Chen <hi@tychen.cc>
Cc: Maxim Muzafarov <maxmuzaf@gmail.com>,
	Kairui Song <kasong@tencent.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Yu Zhao <yuzhao@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] mm/mglru: MADV_RANDOM page cache never ages and thrashes the oldest generation
Date: Sat, 21 Nov 2026 21:59:52 +0100
Message-ID: <20261121205953.30737-1-maxmuzaf@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119082441.196139-1-hi@tychen.cc>
References: <20261101160427.85701-1-maxmuzaf@gmail.com> <179502478384.194898.8139869410612997037.streamfolio@tychen.cc> <av3vMMhFbiaop7zA@KASONG-MC4> <20261119082441.196139-1-hi@tychen.cc>
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

Hi Tianyi, Kairui,

Sorry for the late reply. There was a lot of new information for me
to digest.

I've checked the reproducer you provided. It tests a slightly
different scenario from the one I mentioned in my first email.
However, I managed to adapt it [1] to my case and tested everything
with the same setup (x86-64 VM), and I also reproduced your results.

The key difference [1] is that I added two new knobs:
- SCAN_PASSES (default 1, your value), how many times each scan page
  is touched
- SCAN_MB (default 96, your value), the cold scan size in MiB

This is important because 300 MiB scan forces reclaim to reach the
pages during the first pass, which clears their accessed bits and
evicts some of them. The second pass then gives the scan pages a
second visible access. The reproducer from my first email also reads
the cold data twice (--loops=2).

So the idea is to get the cold data promoted to newer generations
and watch whether the workload recovers while the oldest generation
is thrashing.

With a 300 MiB scan and 2 passes, neither MGLRU nor MGLRU-FG5 can
recover. FG5 handles the 96 MiB scans and the 300 MiB single pass
scan.

The Patch
---------

Kairui,

On Mon, Nov 02, 2026 at 02:02:33AM +0800, Kairui Song wrote:
> This code snip:
> + /* Set refault as active. */
> + if (distance < total / 2) {
> + folio_set_active(folio);
[...]
> That way, even a random folio will be put to the head directly instead
> of keep thrasing on tail. And placing on head or newer gen will
> trigger aging.

As I understand it, the refault distance series will break this loop
on tail. However, will the loop survive when the hot random set
is much bigger than half of memory? E.g. when its refault
distances exceed total / 2 and refaults land in the oldest
generation again? Should we in this case use the aging logic from
this patch as a fallback?

Anyway I'd be happy to test the refault distance implementation as
part of this work when it's ready.

I also rebased the patch onto mm-new (25fee5b1762b) [2] and on top
of the MGLRU-FG5 branch [3]. The patch applies unchanged to both.

Please, let me know if I need to send v2 of the patch to this thread.

Setup
-----

The same .config, and a fresh 4 vCPU x86-64 KVM guest per kernel.
OpenSearch and a cold mmap scan (96/300 MiB, one/two passes)
share a 1 GiB memcg with no swap. Median of 5 seeds,
lru_gen enabled=7 vs 0.

mmbase   7.4.0-rc1-mmbase+, mm-new (25fee5b1762b)
fg5      7.4.0-rc1-fg5+, 25fee5b1762b with 17 MGLRU-FG5 patches [4]
age2     7.4.0-rc1-age2+, mmbase with the patch on top
fg5age   7.4.0-rc1-fg5age+, fg5 with the patch on top

Results
-------

First, the good news. I can confirm that FG5 keeps .vec in memory
with a 96 MiB scan and MGLRU doesn't. With passes=2 it also
looks fine.

My guess is that at 96 MiB reclaim never reaches the scan pages
between the two passes, so their accessed bits stay set and the
second pass is not seen as a new access? I haven't confirmed this.

96 MiB scan:

kernel passes LRU       p50   p99 refaults .vec scan .vec late
fg5         1 MGLRU     1.1   2.6        2     117.2     117.2
fg5         1 classic   1.1   2.4        7     117.2     117.2
fg5         2 MGLRU     1.0   2.1        1     117.2     117.2
fg5         2 classic   1.0   2.0        0     117.2     117.2
mmbase      1 MGLRU    15.4  69.0   510691      75.3     102.2
mmbase      1 classic   1.0   2.2        3     117.2     117.2
mmbase      2 MGLRU    16.6  73.4   558370      70.1     100.0
mmbase      2 classic   1.1   2.6        3     117.2     117.2

With a 300 MiB scan, .vec is fully evicted during the scan on every
kernel, so these runs show whether it comes back. With passes=2,
MGLRU-FG5 is NOT able to recover, and this is where the refault
distance implementation should help?

300 MiB scan:

kernel passes LRU       p50   p99 refaults .vec scan .vec late scan late
fg5         1 MGLRU     1.0   2.2      413       0.0     117.2     115.8
fg5         1 classic   1.1   2.4      409       0.0     117.2     104.5
fg5         2 MGLRU   156.1 248.5 12548335       0.0       4.7     292.0
fg5         2 classic   1.1   2.4      686       0.0     117.2     157.5
mmbase      1 MGLRU   146.3 227.4 11247224       0.0      15.0     293.5
mmbase      1 classic   1.0   2.3      409       0.0     117.2     102.0
mmbase      2 MGLRU   150.2 248.9 11643192       0.0      11.3     295.0
mmbase      2 classic   1.1   2.5      547       0.0     117.2     157.2

The patch runs aging when the oldest generation is thrashing, so
min_seq moves again, and both MGLRU and MGLRU-FG5 recover.

300 MiB scan, with the patch:

kernel passes LRU       p50   p99 refaults .vec scan .vec late scan late
age         1 MGLRU     1.1   2.4      571       0.0     117.2     152.8
age         1 classic   1.1   2.3      410       0.0     117.2     106.5
age         2 MGLRU     1.1   2.3      565       0.0     117.2     150.8
age         2 classic   1.1   2.5      866       0.0     117.2     153.8
fg5age      1 MGLRU     1.1   2.3      410       0.0     117.2     112.1
fg5age      1 classic   1.1   2.3      407       0.0     117.2     102.2
fg5age      2 MGLRU     1.1   2.3      430       0.0     117.2     143.0
fg5age      2 classic   1.1   2.6      955       0.0     117.2     154.5

The full results are in the gist [5].

Links
-----

[1] https://gist.github.com/Mmuzaf/263806a5bfae85e75c3331467f85353e/030e6f11096e1980303aa153da0a35b220b4eecc
[2] https://github.com/Mmuzaf/linux/commit/cbd48001580bf1ad8a8767b1afd8e4ad969b3432
[3] https://github.com/Mmuzaf/linux/commit/1e889df5c555e99d437c608e25c22ccb5286ff8f
[4] https://lore.kernel.org/linux-mm/20261120103250.1241429-1-hi@tychen.cc/
[5] https://gist.github.com/Mmuzaf/e87acbefc15acc2cac40c2181de984dd

Thanks,
Maxim Muzafarov
