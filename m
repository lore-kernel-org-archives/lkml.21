Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704786;
	b=AwCIk/iPAjUaonusmK+1D05CbED4zDQyTn2s50JogpRcYMoAvNKdnxv9Zpc+FwZUaElP
	 2uq2RYOSzEULJ1tZ5FPzZv9FHPSix7NGZ/UYrA859EvrLRhbWsHMkRFS3FCsmxfOWsLa9
	 YzriyaWewQcCO5f8/MMptAM4X49655WwJzQ3cG+MxPSEvqEEw1nyO3EqdrYkXyLwKZ5lL
	 wvXmoj7DcoVE15/njXwookcAyoYYcr3GZ1YCrwBhSFUeHtSPxhrIDQ7yBh132pjWNGpIz
	 mco2KXVPmgu1bEsPKHAzNeP5YK9jkkRdNT84winSTszs5ODoMwx0WtHTICQdUm70y0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qRPa/B8ERbaRnXSclOcrcXc2SQlwZ7vaaTwPPh0UliM=;
	b=SOe5VXWO8axNBgeeWnU9EeuPBMjizSU76Y1ncH6b1LW4hOfDrI2rvc7CTLj9CXZgHCIW
	 Phmf4N+4o1gdiOPxLcXWh6Yh67D0W4110M50XWack0Yr1263ZngD6uGwvqdEAODUAJ7jq
	 /NUP8Xsxx57m1EFBYfz3WVjGaaBDNwP396DVGFWZnRVQk/0qCsEDbr6FbD/oKfQcKPyEc
	 4U7YevRY8Tpd3EX4THG5K/r/fvh4S5tF+Y9LetMrozNB9AjdM3ENXLf66Aohpkcmi572H
	 Pl7OcL/C2NeYxQivorot8pShGVDT/yE4LRiwNFptvw95v5L1SjcCGB64H1TM/dcn7UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=TJ2U6Bz0;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9C2606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA9C2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=TJ2U6Bz0
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e46e449e8so4623646f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1795704784; x=1796309584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qRPa/B8ERbaRnXSclOcrcXc2SQlwZ7vaaTwPPh0UliM=;
        b=TJ2U6Bz04qwUZdgPNp+lr2ozjrvqp7QDyf9E2kAMAGN10wwl2GwK3q0b3cXmS7iEal
         RARM6l5UNj677zLvyxws7yXUaO+Oag2VSIGAdtwO3SNs3qZ6ISvNtLg6qSI4pZ6k3NUT
         pNWL4KXck1IB5h7+lFLVKtJq599GWYkOYexodNMl9Lecy0uIx10gt4Kkepr35xyakmYN
         mv9S2STxYPpVtzNLK3oLu7xPxWBVqbebYhtQP6DOVayWlfxO6D7BqoqDTqh0/x2AobCl
         7ZPhDSay78qTyD9eZkymjiTgw39p6IiRQwJNAFdDp64s+nSjk/cG+/jgn1XryIOvf7YW
         lxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704784; x=1796309584;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRPa/B8ERbaRnXSclOcrcXc2SQlwZ7vaaTwPPh0UliM=;
        b=tsfmGBdzcjkIKvxshrhecqehqSdopTBNVawQg+btc2Ona64BcSNcOFh/qZff6gtf45
         MNIyiwfYLeoEF2+BswrCzRjvKsAKO2PWGUPyYGO04T4b4vGUOaeqmrN/WrBUA6Y+Wo8h
         drqjJKFwLmZMznGXaZWH1B6fZ6T8dE30s3BUYGDAS7u/MJkIS3wPH8+LG5t/WmNNAPd8
         JesnN3na2+dHMvZAgJNAIdGmJOJfaYoCGw4iIm16lOVXKLR882rRzaOnqiJpoI2nXAl9
         AuvNFeQCbRZYLiB98ib3L/Sm5gMDPwvc9akiq5SRDq/sA9wkCbOOb9O4awdd5cZU9ova
         8l9w==
X-Forwarded-Encrypted: i=1; AL+hErGQjSRn1WYnKGf8t9u6f/qXuSOfJlaFeaQWeQvbEManNKTwHFqctfDNDLYzJEf4xrQuRVPpl/zVt8mom1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W+3uIzESK/oaW3wWpi9jGxovUaMIDas9PjakywG/gZSW615M7
	Pr+hD/yzt2LJsil8AB9Cd19uCq3y2p5LB2tUkUlw7QtFYmu8TwXyAZ/d1nlnmdRjcqA=
X-Gm-Gg: AZFdTZekL/IFbUdoAEG7g5HGy+vz+J4IsKIWGUyUz2pC31Az3cP9MLA0ztx2MZzOdnL
	AjDpP3l+MKlfQMPflGqTlE3q4k+Sledpx+BKmUdqDahIO9+3aSkLPzYCDGqbSR/KYEYGUeaxGfg
	cQ96h8iCT8wTTHZeI2KFuQ2qKsgWCTp5OY9PmLwE76Oa+VmZwvKic+YLJPxbxGMv78VELrY+pOl
	qiiH6FbQd4y9NWMIt9PYsK+eqxfHU6NqDBjaxUk595wDEv4M/c4uS/uigpJUgs/FTruR159enKI
	cL6h5lKLy0NIO8hD0yOPPuGL305mcQ+AEe5BVkW6qUPN1TZGSKDU6hk/7BMJfMfV0w/8y9RsPP5
	dDDXjB6limR3cMyRGCKmCeimuLrM98OKXFwktigrpC4LshvPGcBlw1vzZ0jCIyPTz3bK5i6XjJn
	u5J/1GqrdDcskfrolN5VEUxtOZmoV7VMCUvYvcV4jUdFhg+9+35dSekqrFiPB4FsDf6a+OwMG7q
	+1bd8jRW4r9D9H4WLgs1TRLS/fpD3Dmyy5AgroL8zwoCIIblMg42Nrs2ctwXu2vQDEpJcDzYzjH
	BwbgSl8OCk3pPQ0W9vez8hggIhi1IDdjQLiLd67N7TllSLfK+gFDjbmMK8a3TzrjXaP0gaKClg=
	=
X-Received: by 2002:a05:600c:6290:b0:4bb:741d:eba with SMTP id 5b1f17b1804b1-4bb88824a5bmr425912685e9.13.1795704784215;
        Thu, 26 Nov 2026 06:53:04 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm356445905e9.1.2026.11.26.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:53:03 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH 2/4] drbd: fix lost bitmap-work wakeup on weakly ordered CPUs
Date: Thu, 26 Nov 2026 15:52:55 +0100
Message-ID: <20261126145257.592085-3-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126145257.592085-1-christoph.boehmwalder@linbit.com>
References: <20261126145257.592085-1-christoph.boehmwalder@linbit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lars Ellenberg <lars.ellenberg@linbit.com>

  drbd_queue_bitmap_io(): set_bit(BITMAP_IO); read ap_bio_cnt (req_lock)
  dec_ap_bio():           dec ap_bio_cnt;     test_bit(BITMAP_IO)

Both sites decide whether to queue the whole-bitmap work by inspecting
the same two locations in opposite order. dec_ap_bio() does not take
req_lock, so the lock gives no mutual exclusion between them. On a
weakly ordered CPU the queue-side set_bit/atomic_read store-load pair
may reorder, so both sites read the other's pre-update value and neither
queues the work. BITMAP_IO then stays set and application IO is frozen
until the connection times out.

Observed on aarch64: a source-side reconnect parks in WFBitMapS,
drbd_send_bitmap never runs (no "send bitmap stats", no WFBitMapS ->
SyncSource), database threads hang in fdatasync/writeback. Not
reproducible on x86, where set_bit() is a full barrier.

Order the BITMAP_IO store before the ap_bio_cnt load.
atomic_dec_return() already orders the dec_ap_bio() side.

Commit 22afd7ee94c1 ("drbd: Fixed race condition in
drbd_queue_bitmap_io") added the req_lock on the queue side only; it
does not close this reorder.

Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_int.h  | 3 +++
 drivers/block/drbd/drbd_main.c | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index 40be382b24d2..20899a0d7e45 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -2213,6 +2213,9 @@ static inline void dec_ap_bio(struct drbd_device *device)
 
 	D_ASSERT(device, ap_bio >= 0);
 
+	/* atomic_dec_return() above orders this against the
+	 * set_bit(BITMAP_IO) / ap_bio_cnt read in drbd_queue_bitmap_io().
+	 */
 	if (ap_bio == 0 && test_bit(BITMAP_IO, &device->flags)) {
 		if (!test_and_set_bit(BITMAP_IO_QUEUED, &device->flags))
 			drbd_queue_work(&first_peer_device(device)->
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index aed1d1ab6d0f..fd83fc492a79 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -3497,6 +3497,14 @@ void drbd_queue_bitmap_io(struct drbd_device *device,
 
 	spin_lock_irq(&device->resource->req_lock);
 	set_bit(BITMAP_IO, &device->flags);
+	/* Pair with atomic_dec_return() in dec_ap_bio(): order this BITMAP_IO
+	 * store before the ap_bio_cnt load below. dec_ap_bio() decrements
+	 * ap_bio_cnt and then tests BITMAP_IO in the reverse order. Without
+	 * this barrier, on weakly ordered CPUs both sites may observe the
+	 * other's stale value, so neither queues the bitmap work: BITMAP_IO
+	 * stays set and application IO freezes.
+	 */
+	smp_mb__after_atomic();
 	/* don't wait for pending application IO if the caller indicates that
 	 * application IO does not conflict anyways. */
 	if (flags == BM_LOCKED_CHANGE_ALLOWED || atomic_read(&device->ap_bio_cnt) == 0) {
-- 
2.56.0

