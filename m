Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704789;
	b=DKsnGGlkhdGkRaUWtTRBMxZLn0tJNYXXbkH88ba01LezE/FLuq256DSijfcgcbU/3eIl
	 131JBC1RdH7CBZiGTdSQqMWAtCiHoavdbNKm7nF6PPqRqT5rolsbSBqAuFtVbULjjiBtz
	 dClFlXF3sFGNTvHLw1LGzXQI9Uq5hb+oQnJMEctkamU12s0RSRgNh2txFjvAaClCNAu9C
	 E4I0OKYlFmapn4z6Xd6alWTLsUmURrKZZZlLUoLGSSynPW/95R0eWsmwfD/E5zg49kFJj
	 ihDLjvP65nzJaX+MvVNhIGjDqLnMnE5kGRTEaSP3/DPiGxTLLR3Y6AwxsFoZlbDwnow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=a1dL6bz0M4wUZOGCZr+O+oOZ/mF4biIKzGjIH6tjykQ=;
	b=nxgfGclCUBZs2SA07ElM6TuQ5G7Oo0oGzlyI7M0Vby8b0MhAqk0VzNfT7fTR061iTbfs
	 yWd2W91j6l6QDaPFAFlINU57Li5zpVLsgqaJ4IgRdtKkP7upVS3i2X3ZPgXTVVJ1fqIXr
	 5Ac3p8Nm3vCWfBXtEe33D2LGpidLegV8gkgYB+pBJKrtxVIsEdwCq8OdhQe1C/AzTZky5
	 d3q0xblDbfM0chL/JtSrkeIMKDuAz70sLRKRZGyZA0e1P12PldduLol5oXHMDpMrMrMM+
	 4XMgH5liKHy7AQTIY4xSUky5FgNXWueUrHMlM6cDM5agNgag7dlnmQUcf6JosKdn0eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b="w5fB/s8L";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6593606A6B3
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6593606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=w5fB/s8L
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so44334755e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1795704787; x=1796309587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a1dL6bz0M4wUZOGCZr+O+oOZ/mF4biIKzGjIH6tjykQ=;
        b=w5fB/s8LWy4/gebkyxo5ZlSKU/UVX0yB58wPFLGzA+Itdgzj+nlswOJ9byZPNZVx0I
         XP3cdxZ+A/e83hu9AhTv4WTqtlcamLeGibCGFewUgQxMe3E+pqjJiUJO4HsaZcLMcJcf
         LsDfxCEWGtFDJEa0RzKzgxdpY5+dkK2xdQkXgusXTBn/+noVePjvCcDywHKeuVgBMyuh
         42I2hA0fo8w8nWJ2hccdIgJemJWF4eMqKugHou/fC7n6+s6WWGcHPqGGmUzal+ZWLDhD
         sykdI7w7y/aE724spA/w9zyxB56VPvckaz+3TW0p1doGeRPtTQR9U9nBdos173lJLW3i
         kiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704787; x=1796309587;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1dL6bz0M4wUZOGCZr+O+oOZ/mF4biIKzGjIH6tjykQ=;
        b=2fv5JFU0EraNSD5svHGjGDXpFb1tCg+TNWz+FoYEJNoVtLGkx+wpfyLjmAOPa3SIOl
         t6JFEziOB+Vdk/eDXgFz6vIijQawggtWmWOz7JnI7lqVVUvNJH+R1u+x90D9jMHOP6CS
         HN9cOxXfJVae6JWc4SaWk4FoNB8L2Vtde93Gd8rS9QYpY/86vr8qYr8bg52LmJqGMOYu
         VNCtt1Hp+rmWoh4mJNHal5V1vF9BDLEru2LjJ2JqJoM3LC2C4OfCGON2wl93WyfXB6oO
         +oinTAmpuhasXAZpJMVgkAckSMlbxGFT9t5GNFFJLp51ClnePQ2nTJiiY8XMShYfVg5l
         8NHQ==
X-Forwarded-Encrypted: i=1; AL+hErEtCLjrx4zqgTPjjCAJmp2iUr+9vK67AIHrWsiQ9lnXnU2/7+pysjmAX0eTWxSkFWE1eW7GwMMNYBnvADE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HiymlMsI2pMRpBhP7cALHdYvsDzLlvLBWU7UMvtTazYf2CYOE
	0A51DkRvbbb2iiXqmUB6NN73jCewddpWX92PDnDA3d9SYF3Hp02cyxsU22Xq6AI1rRo=
X-Gm-Gg: AZFdTZcT7tc66NyjxsEa8C5MW0S7ZkiFvWz8FiaHV8NKwPKKjSO7phvqe7qW/OxZ/nc
	JQrhZZslqWjQIn8LP/ecS1R7rZnC+OclspLhk6ghjUv8tOhIbbAFohmAdAsOvPWzlFBnzU/JDDV
	1RxjetHc2arvXWvNPt4fPk48uC2OyzusgcwwOjKZUAtscRkRpehFyeQhWH+8hCnCXRS/c0MiSrP
	32x6OfLPbDmwz8W3dFUPJCxdazRjkOpLjmwXLzJapG+7orAu4fpFjK4/oksmXmXOlQXp89czVeU
	DIUkC7eh101RSvk8Jt2jjHoH6SLDgRbIEo0VKTq1qdSNWEDGNAdWD1E2Fg2hCBDB7ThLQiVhi86
	zjZNBpWSuVtvSRAAbXkIutFe1D+tSqBTWnbBOpcdHP6E1U5/my1913Kh7iPOR36C3RsYRjPex9a
	maPclz/RB4p4bxhCnNjZaVN2UJm7S0zZ2J8heu21nX0nstRDYIzs9JY/lBox3IRLFCyG2V468oU
	mXzhcnwowDxUE4c6/NO0aMHniqyPn24P4UK7I6lsgWs680OAcIxhhd17lpHKr7uYt88er/XhJjn
	fWKPdvLL4fOCAY5wa9Y5ZFrDjUTCyDGGW4iwLTTs9CUrccmWVTJAYF9fHWjAMSq3hGmy9RlYEA=
	=
X-Received: by 2002:a05:600c:4585:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb8881b8e4mr439545255e9.17.1795704787080;
        Thu, 26 Nov 2026 06:53:07 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm356445905e9.1.2026.11.26.06.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:53:06 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH 4/4] drbd: refuse to shrink on resize unless an explicit size is requested
Date: Thu, 26 Nov 2026 15:52:57 +0100
Message-ID: <20261126145257.592085-5-christoph.boehmwalder@linbit.com>
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

There is a check for implicit shrinking, but it was only active
when _also_ changing the activity log on disk layout.

Make it active always.

Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_nl.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index efa6e46326a2..5c8a3ab326d7 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -981,7 +981,7 @@ drbd_determine_dev_size(struct drbd_device *device, enum dds_flags flags, struct
 	struct drbd_md *md = &device->ldev->md;
 	void *buffer;
 
-	int md_moved, la_size_changed;
+	bool md_moved, la_size_changed, al_layout_changed;
 	enum determine_dev_size rv = DS_UNCHANGED;
 
 	/* We may change the on-disk offsets of our meta data below.  Lock out
@@ -1009,7 +1009,6 @@ drbd_determine_dev_size(struct drbd_device *device, enum dds_flags flags, struct
 	prev.al_stripe_size_4k = md->al_stripe_size_4k;
 
 	if (rs) {
-		/* rs is non NULL if we should change the AL layout only */
 		md->al_stripes = rs->al_stripes;
 		md->al_stripe_size_4k = rs->al_stripe_size / 4;
 		md->al_size_4k = (u64)rs->al_stripes * rs->al_stripe_size / 4;
@@ -1064,8 +1063,11 @@ drbd_determine_dev_size(struct drbd_device *device, enum dds_flags flags, struct
 
 	md_moved = prev.md_offset    != md->md_offset
 		|| prev.md_size_sect != md->md_size_sect;
+	al_layout_changed =
+		   prev.al_stripes   != md->al_stripes
+		|| prev.al_stripe_size_4k != md->al_stripe_size_4k;
 
-	if (la_size_changed || md_moved || rs) {
+	if (la_size_changed || md_moved || al_layout_changed) {
 		u32 prev_flags;
 
 		/* We do some synchronous IO below, which may take some time.
@@ -1098,7 +1100,7 @@ drbd_determine_dev_size(struct drbd_device *device, enum dds_flags flags, struct
 		md->flags = prev_flags;
 		drbd_md_write(device, buffer);
 
-		if (rs)
+		if (al_layout_changed)
 			drbd_info(device, "Changed AL layout to al-stripes = %d, al-stripe-size-kB = %d\n",
 				  md->al_stripes, md->al_stripe_size_4k * 4);
 	}
@@ -2861,7 +2863,6 @@ int drbd_nl_resize_doit(struct sk_buff *skb, struct genl_info *info)
 	struct drbd_device *device;
 	enum drbd_ret_code retcode;
 	enum determine_dev_size dd;
-	bool change_al_layout = false;
 	enum dds_flags ddsf;
 	sector_t u_size;
 	int err;
@@ -2936,8 +2937,6 @@ int drbd_nl_resize_doit(struct sk_buff *skb, struct genl_info *info)
 			retcode = ERR_MD_LAYOUT_CONNECTED;
 			goto fail_ldev;
 		}
-
-		change_al_layout = true;
 	}
 
 	if (device->ldev->known_size != drbd_get_capacity(device->ldev->backing_bdev))
@@ -2955,7 +2954,7 @@ int drbd_nl_resize_doit(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	ddsf = (rs.resize_force ? DDSF_FORCED : 0) | (rs.no_resync ? DDSF_NO_RESYNC : 0);
-	dd = drbd_determine_dev_size(device, ddsf, change_al_layout ? &rs : NULL);
+	dd = drbd_determine_dev_size(device, ddsf, &rs);
 	drbd_md_sync(device);
 	put_ldev(device);
 	if (dd == DS_ERROR) {
-- 
2.56.0

