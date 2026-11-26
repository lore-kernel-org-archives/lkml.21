Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704788;
	b=FrQb9IVfshkZ4KOxqEUu36yab6Mi/1ccbGJorWD7uITRAzCCvyzcJwJgUCFTNoFmloln
	 jmh6Ggpy8ogCZ/jdPwSTKxgL9NWiybf1OEbYnH5CKpotluuLrsPCu0vPcZhOcdSoZj7RC
	 Ek5KN59mDxeSfR3j5jsh/GoTxRz2rbljG9rVT8qZpmGws+pI8wGRoJa8MYxvlri8SMEtY
	 vVq+y/xGpwRp7A5LBnqIIWuF9vcES+8Thi1TLp9SjW7GYUL/xPQxF5eIwuNbFQ7A4uVTO
	 gINk8qsJj8Q8ouiD2TGBSQAgNU2IZSIsedV1P3ae1uvmnlXxrlBH9HPQFEki0glD9gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KxeOng6tNZx6tK0gchpIz6DNn1HOF5OU8odsnbpqQQ8=;
	b=WLovvhm0/dSKfvPvYXM0qr4hKhS2St+EhR9LBeC1oFea/K7uMYFrZe308YJ9jybKf1cv
	 kcQgAEeVH2doEqJQACqkD770oGr7rBG2Tl9spzlDvPDKi8ID78/R+YUSiiT3S/hseAg0H
	 aRVGnZ1/RXi0F73Xh2TwB9mLVPo+SN2LCdueqQfSE39Lr/ZnOq1RJJgzd8qCs2DpiHSev
	 8BwyoGYpXKzN4DmCmKVfBONXl6388JWSB1aUl3HtYXqLHBScmssw/NIE6Sng9rbtdEgNe
	 iyEByeSls28p0cAkfgEcl5clC9G2GbJm8dy+5ZwDSxwSCQix4o7YtiT5zK0Tui0h1Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b="ob6qi3K/";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FD2606A6AF
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7FD2606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=ob6qi3K/
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so17931105e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1795704786; x=1796309586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KxeOng6tNZx6tK0gchpIz6DNn1HOF5OU8odsnbpqQQ8=;
        b=ob6qi3K/KtHx9j06TrGaW5rMXWkSUgZiK+4LwwQxGWqcucs8NL/awrZliJTgBmfpJ0
         32GozPndyf89pudrruNvXTebUOHPe1/aGqUFRUTsShxusomMVEvQNGKnce6NhDzglaDB
         PK7Bz5xhp+GEZUQewy2UeV1svF6VNACyKabGRFkdwbYRCeGfOEWwElY7D1kn0X2+Tq1k
         E3j3qv/KHDIcfB18lC0cCVhI2nx47NLktclMm2llFBt5LwQ+7A8m3on/oiH1cEDaXzVf
         w1S554OmWEH1diK2ZQblR/sbwbTuU6TK30H7mrHODt/ubH5ENqhxT2DC8yhwUl3IRkRc
         ycWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704786; x=1796309586;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxeOng6tNZx6tK0gchpIz6DNn1HOF5OU8odsnbpqQQ8=;
        b=YcfijtokVH7V0k2WkSCnPXkTcdRpgfrMJX9HBLHk7qWI8H0o7XvPHS0RFcikUP9Rbl
         6KCSI5dY2y8j8+txwJ35sXUSqnFCuJ+qa5v8rMepnKIni/lGUn39MAEc82+2RD7Tju2k
         cBA/YTMqZeXMtAMi7znkCG1FTJenKZErFt2IP2f60BWX786ulky1LW4qIyZuEMzseoG8
         UjYj/p6+tVqpctMkG7z/1wJhCQ+ZcOs3I59Em3AO6g9bdl+PwNPoEyhMosZncWCPc2eq
         g4Ns/j0k10h4bP/wZ39TZ1oT3+JVS8wYW4zWqrPZbMCRhji92P5+1CEuQPJXd/7744rd
         kIGQ==
X-Forwarded-Encrypted: i=1; AL+hErFLLBf6qT4c9blB+L+X0nRFrS59sYXYck1/Xn6KOL8bV+xVNmdsGFIOFo84E966ElfIiEcr+NVVYrRFq0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W79qUtCF9GrIulp0RAbafXn54uAX2coqFJ9N4tYDtrA/oUOHp
	s8Qevl07qqH+hpTg4c+xiDon00c0bdiFRK5/kL1aB7sfXlsKI3n6Zw56ol5c3IDHmbU=
X-Gm-Gg: AZFdTZdGKDBbq+Q0X0N5OUx401dzs4PCinQgzfHQhH9lIo19ITex86WPoniqK7GM3ZP
	kBdYxCJrVbbwkfGzUivbsPVRo4hCGyieLBfopqQpb9R6S9+hy3W8gamIBYKk0n79V9UAtT+SPGi
	+ON8CZlThCrXmeuDczOjZuOPwAQiu1+YVaNL8Or09YcDuN0RcWXihbybkHKMn/kzf2IXICTzY/X
	T6tPZ60Pdm3D9pdp8m1Vn0syj5jFiCrJbBTOURT7jTnfbmjYd0vWyaJrTZpSmP/SCxOgV09jLD6
	KEfbt9kArtslcI1+QAoD6tWykaTPUQ+iTJtg2VvPjk2KsGvBdCzWS9rGi2yDdTZ1pam4W1ItQpm
	xlY1cw5V+KLQM6/eGV2HzAe9jzdbnP8shu0Cx0txIh9/k/RS+5GyEhAajomgiaMnQchP7QPnUh0
	F9/+JB+AgxrQPaoQMBF2Yu7B+Ed8on/qWB5yEDxsQ7EyADrn9z8Xj5xfzodUB9+EtujDUcLSc7i
	crtnfUIT5aziLg9cay0m+/Km4rztZJUs6CkFmBSMnbnAKcUKR4FcRczljejBG6k6h+Q68oLuM5A
	ZO79cAeg31vZQ8u7d3NeG4aWPz7Toq8extfp2K4yqDJBOriAWWB4B8dneJDUkvVh8FRbJNN85Q=
	=
X-Received: by 2002:a05:600c:828e:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4bb88786ddemr394721475e9.0.1795704786159;
        Thu, 26 Nov 2026 06:53:06 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm356445905e9.1.2026.11.26.06.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:53:05 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH 3/4] drbd: resize: do not silently "truncate" the effective size
Date: Thu, 26 Nov 2026 15:52:56 +0100
Message-ID: <20261126145257.592085-4-christoph.boehmwalder@linbit.com>
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

During the connection handshake, a node with an established "effective"
(aka last agreed to) size can detect that a peer has a "too small"
backing disk, and refuse to connect to that peer.

Unfortunately it still "caches" the maximum size that peer could
support. We remember that size so we could still grow to an agreeable
size on an unconnected node, if this node's backend size was the
limiting factor and the peer was known to be able to support more.

Now, if we remember a size we rejected because it was too small, that
same logic will silently truncate our own size if we are asked to
"resize" before that cached information is properly reset (by taking
DRBD down/up, or by connecting to a peer that has a backing device of
sufficient size).

Workaround: only ask DRBD to resize when the connection to the peer is
fully established.

Fix: reset that cached size to zero in the moment we refuse the
connection.

Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_receiver.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 101192d8398f..9cc41bc07ae5 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -3931,6 +3931,11 @@ static int receive_sizes(struct drbd_connection *connection, struct packet_info
 		    (device->state.conn < C_CONNECTED || device->state.pdsk == D_DISKLESS)) {
 			drbd_err(device, "The peer's disk size is too small! (%llu < %llu sectors)\n",
 					(unsigned long long)new_size, (unsigned long long)cur_size);
+			/* We rejected that size, reset to zero so it won't
+			 * confuse the aggregation with min_not_zero() if
+			 * someone requests a resize later.
+			 */
+			device->p_size = 0;
 			conn_request_state(peer_device->connection, NS(conn, C_DISCONNECTING), CS_HARD);
 			put_ldev(device);
 			return -EIO;
-- 
2.56.0

