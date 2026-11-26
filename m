Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704785;
	b=A976Tnb2zKCr36rC/5YzMcPiNjDgEXtouIF3AldeQPdHJIgdqdEBXlVl46nrIJ8VXOQh
	 cbI64UVQOStdRIDxnV3oP0ldDHDQG0aP5+/5Uq+IU/wnUKFJos4CoOJHJ8+a2XTYxBq22
	 7NToFlI2fpl2AY3fSVgvcUhDoKyRV6OCMlVgCw9ry6v3Q82LBON0p4nmbOOWNIkMoxnYI
	 IaTyMbg1SkW3pgKSMYI8/WGNImHtx3bN402JzkCCAslLivVPhT4NBpZzPKvHIFJpHTA9t
	 +on3fryQHjXTRsPX8T8nCILsR3276TgGnQyKtKT2K+Z72N7nLqlfKSvJ20IhPN09uxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=TGfh22Ic+UUZqpUU8zmfI3BWZ3bedmz86wF+EG5USP4=;
	b=S3w/a7PN6hI/R/8ltqDE8TB04xNEt6QcNxRju/l8EyP2j2dkDZLYP0RZJxmQDmPMUQ/c
	 4ncG+Z2/zgPkPifv9Q7dx/NO7bCIvoqLFeaotFRbaDG2Gq1L5wl7Y07H8b3xmlkJ/qSgf
	 PisYc/8Ja8O6V6Yky0GTTSfblNxE1LjiEmrgQ1+NDsgSIDwIVt+Rc1krhtumP929hlGp+
	 BWCWEoOnOtLauoYHwIvMRP4Uj8rLoZmnvunF8+iAtj1fSmlvP+K/xq+QWkN0TiudZsQBS
	 tA1tZm4haY0BOgyTgTicVlH1cSzf+LQLq1xJgd2tp31qMuH62IWES8cFgu9uJLjlJzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=pua8J2UW;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A7E606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A7E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=pua8J2UW
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso71399035e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1795704783; x=1796309583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TGfh22Ic+UUZqpUU8zmfI3BWZ3bedmz86wF+EG5USP4=;
        b=pua8J2UW2SaZdOacz6AlcAycR7hh/svS9ofaLn9PAwxeNj5N7HH8wfVEyNxf7c7FBF
         7AEDexG3i+qG1n7cwREX8lMMYRgINXyLbEDh79ZB3Zowc69OMA7dMF5ITl3Dk0EOzKEM
         0drcFnme9V6UxpV71Aw23ClrrQHcgyZ4Ay7gV0a8+rZFYY8adHaFb8BRegGvKYX4k0ns
         Or3Rh54qDTzUCsvzkWDjtJfoEmiMKJMJE6j5tF21zfbfC3KNBe5tmW3+raRGXcGy8JCd
         iq0z7yJyOtu97+kGQeIj4Bnyc6AaXshYEjNzCUNpm36Yp9gxqyFz7chhEymXnnm5r1b8
         +iNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704783; x=1796309583;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGfh22Ic+UUZqpUU8zmfI3BWZ3bedmz86wF+EG5USP4=;
        b=cN4FX0Sb2eEFslBwl537aM2oBKVHUSU2VpukakXVLmC1MbW7rHUO292UU+pS4OD24m
         KwWG+CFdhcjta+YYoJFVy24jpG1NUGevBmRYFB5cSrOt1/LPvXi2HJYNW8f9MQ3L9YiC
         15Hzy05W7bvhzLVEOYNFfk5u7R7zyqQHgcyJfmv4ymaQMuY8mlo+PS25ZG6dneQ1Ic45
         ZGc5kd2zGrLBGNilQCeuyIFc9rRQb2ImkLXaysDHg+5yI6UdfWaOJ7BAnf0W/rMsLsNn
         MXspv07Eeh90GfldKW42Xtel6SmpE+KOMSJOJg2/rdGpv4iHnbimNz+IdHZmtNzBpINL
         +MaQ==
X-Forwarded-Encrypted: i=1; AL+hErG8aUe8ccw+1COULGqhGKRrCnR6TV/qYyyObViTf+7Z04EwKG0sEywF7fSEUQPOMI7WHvnimesCrkCLh3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D5OJef2tkLF5qp2neiokPRCNSU/EEXh7+e8SZYp8U332mkU3T
	Xt0pJ5KZHaauZFZzyJzt95SyToK76tpVaJu+jyak7YBg6NV+6OlIhYbqLs4m10nJGs0=
X-Gm-Gg: AZFdTZeoZmJ7a4KJzfTIORfWMysAv2FRL1ldgFAqkdZvNNymsJm/i/zRFx7AP0sHxQE
	x0PnlX3vikBGjlNj1robU23qKxxCwfEwNtiH0ySg5JqlCyiUl9vZG8xgssGWT6T5vQa7fZdEY+R
	6dCnKA584FR+gYeE3KhnFVd9x4URo9ELaMbmbd1YACiJoRhBnHmEheK8ADrF3UKntYifmKeM8yk
	wate69AEgoHztWFht5tJk3Ipq4Now7AwI56vME0YCVQa81lZQg9nM312yDWwgmxVjcIHTVAkqut
	Z1NYt+uxNvRz0GLBynyibkNot/36XM4Eo0vR77hp4Wz8jh3HfaiU016oPCDcqozYjwIBqf2M6nO
	HPQA3D1cW5/4qhzRxEJUUOteY975eP9p0ucG9mAUEiNkPGbnhyQLUXI1URlTrNaK+8Zpv8SZLbN
	gXXltzTuBUYnt5WeuNGEP+eWt8938VD9w10geDmwAwB5OfqllnaVVvEAilBOqQ2jt2cahx9s5UL
	w/R7InEt7JWKcdFKW63eZecA1UMbPbWgPeYnewcd6Rq3ANIqpyScN7ytRdXobwOF9bQ5PMR5kf3
	r19wAQ2TADpHWnFBkK6znUYCQMFttyujV4G41vntMfYI/C/BGMprYuQi4WBCPhzh2g3UNaF7tg=
	=
X-Received: by 2002:a05:600c:828e:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb88785a99mr406595745e9.0.1795704783242;
        Thu, 26 Nov 2026 06:53:03 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm356445905e9.1.2026.11.26.06.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:53:02 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH 1/4] drbd: assume a capable peer for the discard limit before the handshake
Date: Thu, 26 Nov 2026 15:52:54 +0100
Message-ID: <20261126145257.592085-2-christoph.boehmwalder@linbit.com>
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

Before the first handshake, agreed_features is 0, so
drbd_max_discard_sectors() limits discards to 4 MiB, the limit for
peers without WRITE_SAME support. Devices stacked on top of DRBD copy
that limit at setup and keep it, even after DRBD connects to a capable
peer and allows 128 MiB.

Assume a capable peer until a handshake has completed. If the
handshake finds an incapable peer, receive_sizes() lowers the limit
again before DRBD sends any request to that peer.

A discard that DRBD split at 128 MiB before the handshake, and that
DRBD submits to an incapable peer after it, exceeds the peer's limit.
The peer then drops the connection, and the resync after the reconnect
covers the range. A module parameter that rejects incapable peers
would avoid this, but adds a permanent interface for a rare case.

Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_nl.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 3511a943e4b1..efa6e46326a2 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1257,8 +1257,11 @@ static unsigned int drbd_max_peer_bio_size(struct drbd_device *device)
 static unsigned int drbd_max_discard_sectors(struct drbd_connection *connection)
 {
 	/* when we introduced REQ_WRITE_SAME support, we also bumped
-	 * our maximum supported batch bio size used for discards. */
-	if (connection->agreed_features & DRBD_FF_WSAME)
+	 * our maximum supported batch bio size used for discards.
+	 * Until a handshake completed, assume a capable peer.
+	 */
+	if (connection->agreed_pro_version < PRO_VERSION_MIN ||
+	    connection->agreed_features & DRBD_FF_WSAME)
 		return DRBD_MAX_BBIO_SECTORS;
 	/* before, with DRBD <= 8.4.6, we only allowed up to one AL_EXTENT_SIZE. */
 	return AL_EXTENT_SIZE >> 9;
-- 
2.56.0

