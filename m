Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685889;
	b=byw24Q0BviD1e8JutZ8p3AwRkixI39+cYitLqSVIwlMLm5rNQGyzDF3P2X4QTgyxxdBH
	 00A/mxR9c2QKi3+YPI00/oioldzypjTTIc066EVUS36l+DWfvS/7nMQ/Pp3TpdO4atZ7E
	 gYmqOOeqQs83dhTYgVdP3Ql1gvxN1+UojeDI48ppcPWzStcPUBzLtDZttG0SJySy7Ssql
	 752KOna4rk1eFx7SrXOA3rNBuykD3y/YoXzoDto5e8o0p2gMkKVIzNaPOwcUV1xberV+c
	 2a2rILqKzWj7MLHEuvY2SmWwkD1lnSMgtFFAL4wYIKiuru5MRp23lpcESIWgvFj11YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rsNqaj+bXc/v5pLCFTeTs+S9z83Xe3DxebqgKuXb2Ic=;
	b=wjWTwOysF+lQycpd/gtuHkgwJXYvNDvjleZAOjbq6ucrMgeC5ac+qVOcAvdByTzw+WL5
	 UFPyhstIQE3YW1O1HjWLEx9RJa4dl9O95dLbzEX7PI4h9A18rksTUcZCRkM9LyqmIZwtB
	 3JQvn1+DxlszwZhdoOqZMnWp50akuyyd0koew+H1LNkEp369u/WRx/5TtpMA4J2MuiwQX
	 49tThYRlrAldB+6e3SznpYVr6I11FUJqan1UbKdMUAunP7lsbjZJy8KFQ/SdXw7Jyx5EF
	 VpbIsb9QXmoY+WKuqmMMsblR5dbh/Yf7i4+K5KC/xHYD8Hom1l1D+9NufP6m9YFINqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fSw66Vwg;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCE7606A690
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBCE7606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fSw66Vwg
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-14394530ec6so272954c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685888; x=1796290688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rsNqaj+bXc/v5pLCFTeTs+S9z83Xe3DxebqgKuXb2Ic=;
        b=fSw66Vwge0QjmaCrydvktO8QXKG8LEluTa1Zb5fBq+5ZOsYGUtfBQssVIInvAtBD5b
         88Qry4se30oJNGuIyCaEyPctUhFLaA6dENbTmM1wna5wk/YOUEkNVAq/7pOk24x4VTqO
         cWsRFFBIFwDlMT1rdpA7CbvF7NJ8jtU1AWJ0UoJDmOq7NWRUpeQUIcihjzJj9n3fimcE
         l8xVUlwqGYGDIJybc5iyPIr+CFqz4TB6f4RAiJjAYxdgTQQgBzVTHUxYmyWqGwyXGs+3
         iLxaR52q4O/AtS4im9iHZgzxPkEW2yUWSmAOJfTYhjqfnmU4Lgg7/siTjDT0PS5oHVly
         Lgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685888; x=1796290688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rsNqaj+bXc/v5pLCFTeTs+S9z83Xe3DxebqgKuXb2Ic=;
        b=p6IeNJxT5820TwDbtPVJrE8FZ9n6B7RJhX5NocNjD4ALpLEnrL8t6fOBO80iLIrLqB
         Xq6FIRjkQjEhLxuRhGjk+X++HEPsgVjlHCuOG/27wxzFTtCgAfj2ncRaKuA9+KikZnVT
         vr5GzpRIPDD4DlJN0OBGUjadReuOm251dBk33jyaO9C3YQqYAB5bLmeVhISnCgzBO1hu
         kWycKnJhiPwXvHoW9vU4LpZVa3wUlqtBmwJpT8Xbx+qD6T/lcygOElqQl36uUdbPfJr5
         rwYZ7Oetenty5VJi+CNLA96KnLHOzYSXY3az7Edrh21n11FoJJ7xzw+4SGRhZCMQOE/f
         OTtw==
X-Forwarded-Encrypted: i=1; AL+hErFzx08xF/Lc0JHPKJ8kBg3E6LrFcMXZsemKYU6MLcN7hHkRhHRzmJobCisHvXli3OGaPSpa8dfOCdytOwc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3JeOTvqls6owwtXD7/kOii8kdkKuJhkynNtQQjXIBJejUOAK/
	D1vhN5xOhXuB62tbRBRf7J9gyuCMLcTH1Gt/G+uNxYugyst6IaCC55gS
X-Gm-Gg: AZFdTZdHNSDIF5NalgGCtotDAdItp1kAE6ucGEGBjHLThEVAqb7ycGrV9nzUQcYU14r
	6iApehGdeBw6xA9mAW/RfxTIfdIiK6+6vpjBeKIfBxJRRTGa4XgMZpYnIvp/s/h9BZwYpglVGh2
	1s8LBmq3KjSj/kHLPGx6mUQ0fYjC01d91+AApFhcgLG2CcjfqRP52G377O2EfcHACBb9Bz5MIpT
	uC8E+hPPe0ikg0NEpPvfIesPjacwoAr+fqf0sYqnp9BHAbk8Go86p7wxBkt5R+pfoglCvpo391i
	TQkLmVR4FqMU0Xwolr+Noc8FgAMmqNDkhaYZbO5yMv/LD5eqSyQ0d+kXdtc1tn2WSWcV5GdM+jh
	QSV5ZIeibZUpNEx/JXjVaHxkoHgcR51/m5E0b8HpIzskZWPcVY/CbtOBsAbtRvFsYpSqemcQGJP
	P0XNFV9Df05v05hQDWLOH7Qt86VipEITUvzv0yG/FVv8cDQJZN/4JawAzUYifFKKsVNqIGqInBy
	0G5oRUj0Izi3m11G5lq4wM+g0lpc3pQ24ZGDPv89Y8TgxI+cYkYVh3IbAgM9LSXHhqWqkn264+L
	wZLopkunITZpDnSqvT/SWz7jPijcEIqWUQE7zQnanwvomjAkSuZ0j3ESgMQvY/4Ekaq0z3WCAzC
	5gDJT44u2NKA2lQ==
X-Received: by 2002:a05:701b:4502:20b0:152:9e88:daaa with SMTP id a92af1059eb24-1b55690040amr20145598c88.36.1795685887798;
        Thu, 26 Nov 2026 01:38:07 -0800 (PST)
Received: from hyeonjun-ThinkPad-X13-Gen-1.. ([124.197.199.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm46845363c88.15.2026.11.26.01.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:38:07 -0800 (PST)
From: Hyeonjun Hong <hyeonjunhong330@gmail.com>
To: Coly Li <colyli@fygo.io>,
	Kent Overstreet <kent.overstreet@linux.dev>
Cc: Jens Axboe <axboe@kernel.dk>,
	linux-bcache@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyeonjun Hong <hyeonjunhong330@gmail.com>,
	Seojin An <love09010224@uos.ac.kr>,
	GEONWOO HAN <gunwoo9643@uos.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH] bcache: fix out-of-bounds write in bch_data_verify()
Date: Thu, 26 Nov 2026 18:36:55 +0900
Message-Id: <20261126093655.393608-1-hyeonjunhong330@gmail.com>
X-Mailer: git-send-email 2.34.1
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

bch_data_verify() sizes its check bio from bio_segments() of the original
read bio, which is an unsigned int.  bio_kmalloc() takes an unsigned short,
so the count is truncated before bio_kmalloc() compares it against
BIO_MAX_INLINE_VECS.  A read bio with 65536 segments is truncated to zero,
passes the limit check and gets a bio with no bio_vec space.  bch_bio_map()
then fills in bio_vecs from bi_size without looking at bi_max_vecs and
writes far beyond the allocation.

A single read bio of this size reaches bcache through an io_uring
registered buffer, which the block layer attaches to the bio without
splitting.  Reading 256 MiB from a cached device with verify enabled on a
KASAN/KFENCE kernel gives:

  BUG: KFENCE: out-of-bounds write in bch_bio_map+0x132/0x420
  Out-of-bounds write at 0x00000000cb5c6057 (132B right of kfence-#252):
   bch_bio_map+0x132/0x420
   bch_data_verify+0x3d2/0xc40
   cached_dev_read_done+0x6d4/0x890
   process_one_work+0xafd/0x1ee0
  kfence-#252: 0x000000008ee01c90-0x000000001f8e8fd6, size=120, cache=kmalloc-128
  allocated by task 12 on cpu 0 at 63.371786s (0.000577s ago):
   bio_kmalloc+0x45/0x80
   bch_data_verify+0x2be/0xc40

followed by a general protection fault and panic.  A 255 MiB read is not
affected because its truncated count still exceeds BIO_MAX_INLINE_VECS and
bio_kmalloc() returns NULL.

The verify path needs CONFIG_BCACHE_DEBUG and the verify attribute to be
set through sysfs.

Check the segment count before it is narrowed and skip verification of
bios that are too large, which is what already happens for every other
count above BIO_MAX_INLINE_VECS.

AI tools assisted the source audit, reproducer construction and patch
drafting.

Fixes: 0f2e6ab851ae ("block: turn the nr_iovecs argument to bio_alloc* into an unsigned short")
Reported-by: Seojin An <love09010224@uos.ac.kr>
Reported-by: GEONWOO HAN <gunwoo9643@uos.ac.kr>
Cc: stable@vger.kernel.org
Signed-off-by: Hyeonjun Hong <hyeonjunhong330@gmail.com>
---
 drivers/md/bcache/debug.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/md/bcache/debug.c b/drivers/md/bcache/debug.c
index 2691a5da3368..fa665b4628b1 100644
--- a/drivers/md/bcache/debug.c
+++ b/drivers/md/bcache/debug.c
@@ -112,6 +112,14 @@ void bch_data_verify(struct cached_dev *dc, struct bio *bio)
 	struct bio_vec bv, cbv;
 	struct bvec_iter iter, citer = { 0 };
 
+	/*
+	 * bio_kmalloc() takes an unsigned short, so a larger segment count
+	 * would be truncated before its own limit check.  Skip verification
+	 * of bios which cannot be represented.
+	 */
+	if (nr_segs > BIO_MAX_INLINE_VECS)
+		return;
+
 	check = bio_kmalloc(nr_segs, GFP_NOIO);
 	if (!check)
 		return;
