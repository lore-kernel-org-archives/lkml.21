Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078869;
	b=FLe9+VZKpS6+tPtAUD4qdq/xkDL3yIyQeQjXfQ/HZSnVPd1VO+XuHxtJrYy5VOJwDjp2
	 XGNIhW09QuwWQjcg3J69dQR7KLU12mtPntYZANapItfF80srg7f28gB6wD1PgmTrgZtjD
	 ZHDvHoquQtRWkw55PQPGumBoLRSUQQ4QDNaU9OMvMXIBAWneEq2E9QaQi5cW48UQ01YQF
	 NAbAw6v/Prf1X+TckwUe28SIWUFYbaQld6YpnAaWklRViFP3t9NWH1gJkgw2abT2XbhjW
	 UEY4i1UxpiDa+1IgatryXClde4nbz/QgE8INaS9G7xLQoVoN14BOGPDEearK5d/ZDOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5c5j8p3DR3jN9QgPm6TOWhHps/dxpVjAw1oBYEQAEEY=;
	b=JgRynmb/Ji4Km0ULN0oK9dk71l0t6cVn3Pf42kbBYeBLjHiEbGp80vdXYv1nKH7v6YQf
	 ErNnGUoQKrg1uR3Y22WtchyQ8MwsSrQEMhfCiEvJWbqbygUYr5/QBcsL63y/MGxsdP0bz
	 voSUnit1c3bzKFG0Py3MtLk87QDNKfQJzL3y9LpkJtu4ecKaXj13F84ZxKlk3cPVxijDm
	 5YqwRRd0Ka350NoWeKmL3448PDfup7Lmg8AUaJutr8KAFdDoAG78afW72Dsm6So5H4Ih8
	 1XBVooxLuGrc5D4HQWGmNQb3jv2r+s4IOJpsD2or1xBSDeSxAFQcFJGpzn9iE3TVWAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDR1vc9F;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39B3606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E39B3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDR1vc9F
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9995ce866so15435925ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078868; x=1795683668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5c5j8p3DR3jN9QgPm6TOWhHps/dxpVjAw1oBYEQAEEY=;
        b=PDR1vc9FS4+Vr/do8MuQAvjhUkxE9m7j7ueVLgHzhePFslsQN3yF9b98SBewSV5m91
         qEgHz0PlHiLRB8TiVyypK1dURMS9v0lcwUrUXp340A3GUkAJ46zUL6IVF7XfrDLrXLRC
         qi5LRN5QzMtHoj2vmVcfZybLvYduzw1YuwNxN6J32jM+xYqZzx10Y8f9HG6JnH49Qgab
         1oRKHP0jr02ES/sFoLOovZyya/y8ilRg+gP1/x2JWa75BFjIP4Zy/Y1NFh6fYoqGSLg+
         3DP0E1QTFFMSJ5upSRr6UcVerjkWPpjdFwAdU0FXl9MLtAY7MDYuS3FCeERxMNmn1VON
         pnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078868; x=1795683668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5c5j8p3DR3jN9QgPm6TOWhHps/dxpVjAw1oBYEQAEEY=;
        b=DZ+XnlafBWjGrxYMRPhiH9Lv+SLUJOyJea4GO8RIerRG5zvxk5SoHJ/3+rauhHKKyj
         wXi6dYI+Us9W2YjyS0TWvf8WEVcrSCIajnqFOCQ7//YiSibX9ZL+DP25Lc1NSCTZciHD
         uEgjl7ez4p12I5F+PB7GdgvKdMwcVzzCLzHOV+UFrxyk24vb9zw+/3dehbZsLsy7Fbak
         VOJvZHh6x0NFXp3Vpve0WTJVIdC5kmfKC1VjC4Ua71+91obmC6BCVW0tgeB9JRf9uVQj
         hQWUKSReXL2SxwaSbeC9dURJ01SIkUqM2BJLftu/X5xFN7TtvthYplp4lQ0XUbyItSuJ
         6Epg==
X-Forwarded-Encrypted: i=1; AL+hErHjmvVluPb+bI6QaJVEfLqflz6sZ+mqAyBkeZE0yfX/BvZWNs7UM0UK5pBnZA2GxBqmRuztDhs2ktvgwQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ax7BzhtPuaFk2H6OD9+nrQ9cQ/ItEeCQ9sHvNKtV9kTxla6N8
	9K691Jav7IF2v+bdUdfBiZHwNhzKv8OCGP+VN7WplcXeF6lGJrph89NB7q/RJ1rh
X-Gm-Gg: AZFdTZfTvZchyJQkxLkb6qRfY3M08oSyRTrYoOGgySsCEEnnaaGU3Wyt+tK3PhttkLx
	zcrFGzaM87PXvXGheYw+NxpMyBTj5GbdCDCQLVTUMFC46TtGy85YOeOLM6K0EFI/kDXEImHXu/B
	uZo/FoT8iwoI9N3SxdrGetiAQ3RVc/vhLcwrT96ch11PvahpucTbgzZVLOw7mEE41J4U6otc9LG
	JDcFROtaA8Tz5zKyqrmcZE0RBa3U/dn4dJ8159pBTXTa0lN5ZSW5Y1DgEdJMeyBi+jBdyLH09eZ
	eHjPtKFPXrkabgifo9QxclLXwxrziX9xdzXWg2Wufu1P+ER1lGTlL5RCOYQrdWgqnpm9CnxLmvf
	6mcmENv9jrUGWQqIQHJab7V0xQ9NiGdKXbh/mVgnEhCltLsweZUtGs1D+cGHaV6zW+/o2QvmEeY
	Gjf/a1Qf84U0f8FQUtpkqy53RVKcYXYRA2tnOXpjdm3tIEIwts456iCZbNT7fI2UnukbuMmz8bM
	P4a+6JQ2n7lgmWqiMu6bHMKI11T+qyX9b4Yh7DTjwZLNknU2pRyD2LgQH+1vkWP63Xo53s+qwcr
	YWd6mbijAP0rQY/7zvn3YH2TcIOB0fA=
X-Received: by 2002:a17:903:41d1:b0:2ef:f280:40ae with SMTP id d9443c01a7336-2eff73f226amr58656285ad.12.1795078868112;
        Thu, 19 Nov 2026 01:01:08 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6192086sm27386255ad.38.2026.11.19.01.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:01:07 -0800 (PST)
From: "ping.li" <leeonion.muyu@gmail.com>
X-Google-Original-From: "ping.li" <ping.li@horizon.auto>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [RFC PATCH 0/1] mtdchar: kvmalloc() for large read/write buffers?
Date: Thu, 19 Nov 2026 17:00:54 +0800
Message-Id: <20261119090055.1255028-1-ping.li@horizon.auto>
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

From: Ping Li <leeonion.muyu@gmail.com>

While investigating a throughput regression on one of our platforms
(long uptime, fragmented memory, large read()/write() on /dev/mtdX)
I noticed an inconsistency inside mtdchar:

  - the ioctl paths (MEMREAD/MEMWRITE) allocate their bounce
    buffers with kvmalloc() (83208e106a8e8),
  - but the read()/write() paths still use mtd_kmalloc_up_to(),
    which halves the buffer size until kmalloc() succeeds.

The halving behavior is not a correctness problem: the loop in
mtdchar_read()/mtdchar_write() makes progress with whatever chunk
size it gets.  But under fragmentation a multi-megabyte transfer
silently degrades into many small mtd_read()/mtd_write() calls,
which is visible when the low-level driver cost scales with the
number of transactions (e.g. drivers that forward each call to a
remote controller over a bus).

This RFC proposes to align the read()/write() paths with the ioctl
paths by using kvmalloc(), keeping the KMALLOC_MAX_SIZE cap.

The open question I would like to sort out before submitting a
proper patch:

  How concerned should we be about low-level drivers receiving a
  vmalloc'd buffer?

Looking at the tree, most drivers only memcpy() the buffer, and
the controllers that DMA directly into it (brcmnand, gpmi,
cadence, atmel, ...) already check is_vmalloc_addr()/
virt_addr_valid() and fall back to a bounce path.  So vmalloc'd
buffers are supported everywhere today -- just slower on those
controllers.  With mtd_kmalloc_up_to() the same controllers get a
kmalloc'd (smaller) buffer instead, so either way there is a
slowdown; it is mostly a question of which one userspace prefers:
few large transactions through a bounce path, or many small
transactions without one.

If the direction is agreed, I will follow up with a proper patch
and numbers from our platform.

Ping Li (1):
  mtd: mtdchar: use kvmalloc() for large read/write buffers

 drivers/mtd/mtdchar.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
--
2.34.1

