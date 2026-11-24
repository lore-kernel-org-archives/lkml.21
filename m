Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489048;
	b=W7Yw8Fdllr211YOwgzILTxjMkGSyiML/ZOqm6hJ7XN+kXk+YfXs02YqwBOKYmcjkSRsA
	 G1A9huKlNyrC5m8HymU/hmDUyemfI8LbECoN5pvy5kydf//Z3dBy1r8mfDLIgLgsOlPmO
	 +Cw0sAzXJYo6kmNmd4IMRKAIqIRfzLogV6/YkP+P012+9D/4ogbol+xOD8hSpVWG/WNpz
	 JyknQ2/PHe4PAzqgsEwK5JAlQIRG1GrAVNW5B2FFWZIDQrKMB9w4Bo61Ld8paodmJ1AUH
	 40xc65tniWLkR/KlNIgKdl5MpUi0uiosiSdLvIePGuNc1Hcu79r0qkbeuy7lvYbtcXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DW/y0V2pY9Y4Xur0V/dpfl+A1FMpAkofjo0sl92zmcc=;
	b=qCStcOmcSqhNlENgNTHGDV2EdU+EEIwj/WhayBlL6fkOa66uCt4NbBPipW8R7eNxCYEL
	 l9XFFgG2eb/W3lFRsXk6/CqQalsQJjkbq/89aox1AGucucLSC2aqpoB7k07N950r/4dHw
	 k+0nTt+V0/TUY5KRZLhQ5Ah0cdCPsAvONfsP+RAcdX+DVcZrnJHUgsmEb+6Y98O5HY7Uq
	 ghqj3fRgYIIEipbW0lQ3vU2dgu0YIObEZ8TwN4AIpMsa/BaGuCm3q6jRMXzabH+H15VbY
	 NhdyKZLyxdzlKoac1hpKzIIqay3mOPkIYq4BBblA5eNI9F6IMMhhCJuEVQ++rFhqzNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RuylJtBp;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224D5606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 224D5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RuylJtBp
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1921454a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795489047; x=1796093847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DW/y0V2pY9Y4Xur0V/dpfl+A1FMpAkofjo0sl92zmcc=;
        b=RuylJtBpHaYhu4+iZs15myrfOkxc/za2TaDpCh5O6mbIVxSZZuZaP6RhfPQja7e0Kc
         j8bARKFLuuQizjSusBxeyAsou4QYwJIea/iehMTfKxlTJRB8OSWzZQy/23Z0hqqc6EOa
         Uk3eLmlgnmiHWfyYOTceY5uDvBgPif7RFxxfNHfxS5Qz2H1//GvltkfqiQ5qomr15awm
         YW6zoDjcn1SRKHBG68BrtPzASnaD8pOA/CaZKGGsDrqc2Utj7YVjYmJn3QO7W/1GeN0a
         9cbZSiKbo9Rmx/cWMqcaEcBQddK7WZimdQBncXik2uaIuWvGW1t87CfcFG/H90cmE8VH
         j08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489047; x=1796093847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DW/y0V2pY9Y4Xur0V/dpfl+A1FMpAkofjo0sl92zmcc=;
        b=yDYw/LPHEIbBOwnrsg8BQS/C72blqOQc8+b5n6YApE+SqdL3lZqU0I5K1fcPUMvKJv
         6451R0N6o5YY7wtsRQzHjzUQeJ+Hx2ayW5vNVMmc/6AfwBUIXI49EernonYpQY7bQvMm
         JbsVQ8fDDf1jH7RTGR/gvbzLORD4ndNR9kqvmCT3qIONfzO9drvkW0eUIG//VPuZkGxp
         wKlYQjBygO5fKNzAMGAwEJJil38i+NvAV2bU1OuRrnM5LkDyyYvbrQeNvIqrIvKJZbfi
         eTHzTLKk+7v6kaqDVH1TcfSvSFlgZYaUvBsqAz/zH8zu/2SGVoSw3Bgr+V2qM2Gg6FbA
         Zz9w==
X-Forwarded-Encrypted: i=1; AL+hErGYTgZQjhUJ+lm6vPw3bexH5GLE8O/tx97Vg7Q2zULjGxHlWHK5q8P1Tz5M+7RL+ARtnZWCuyPcNBwl2Qk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qRKZm5kswsg3hAB1YmaJ9TmYeRfOxhqG57oDFaG0ZVoQ3UOrX
	pZwqChomd6U6AQvc4TLJesm7O4VSUwxU2PKk/sOCUWfP3CXMJrViHAdKxBG40x/t
X-Gm-Gg: AZFdTZdL0c2d05BB2EFo3Ob0IWNhZP6C9PAMeJ5B8MRIWrkj74fl2pjbge/08xEoAYr
	htW0pD/NTUcXO2ATWB4zLVojMb1uB6ZrjuxbyeHMSxEsnzu7QgDTfTQV+4L6GD5jeqs9iNzVbzM
	FKU+ZikztflGn4K/p/feus6SIyrh2JQXAvFnVjVNqpbmhi1klwGZ5o8bpqyQvhlxF+XX2rVLvSS
	GtQr3FhsX4Ya7e2Cob+PcGJfvY/bzU+ODpvuDxRLeD1tn4S76RaI23ynigy7vP06ssH9Qcb4kBO
	Tvk19AODICB3XHQ8yKjd67bPJSaO8fhjEG+djcW02JS6IHiNLkCBR7B3N7TZ0+rlz/oDAHDmpQH
	89dMSdC6sQDLtwyB/xwZwIAweWVFXT1YJPriorvKgIH+KDi5XxRSgZOMl7DblGLPeteOUGmvt1A
	WQfY3OmK2DBdECcm5NNcWgA9jS4FTEYGBmWD1bWXpwBNxfnZmrLXyv0mHQNL/PAtv8KbdaT4zE3
	X+3TD/H8En89rsK7T9iC5T1UulD1xhnP12mcF9kefWW4QpbZKRaGMdE6WLOXSXLnxSvc4WO5NXl
	vuSYCmnE4wWQZUuXoNupSCzf6SHx3psmVA==
X-Received: by 2002:a17:90b:2ccb:b0:3ac:b6eb:e0cd with SMTP id 98e67ed59e1d1-3b40a62fe77mr11447094a91.48.1795489047353;
        Mon, 23 Nov 2026 18:57:27 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm60823275ad.9.2026.11.23.18.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:57:27 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [RFC PATCH v2 0/2] mtdchar: per-device bounce buffer policy
Date: Tue, 24 Nov 2026 10:57:20 +0800
Message-Id: <20261124025722.1476247-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119090055.1255028-1-ping.li@horizon.auto>
References: <20261119090055.1255028-1-ping.li@horizon.auto>
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

This is the second revision of the RFC I sent earlier [1], following
the discussion with Miquel [2][3].  It implements the agreed
direction: low-level drivers decide whether they may receive
non-linear-map buffers, and a helper applies the allocation policy
accordingly.

  Patch 1 introduces mtd->allows_vmalloc_bufs (defaults to false,
  partitions inherit it from their master) and mtd_alloc_buf()/
  mtd_free_buf().  By default buffers come from
  mtd_kmalloc_up_to(), which gracefully shrinks the size under
  fragmentation, so a driver never unexpectedly receives a buffer
  which is not DMA-able.  Drivers that only memcpy() the buffer,
  or which bounce it internally, may set the flag to get
  kvmalloc()'s vmalloc fallback and keep the requested size, so a
  large read()/write() no longer silently degrades into many
  small mtd_read()/mtd_write() calls.  The size reduction is
  intentionally not kept as a last resort for those devices: an
  allocation failure is reported to userspace rather than
  silently shrinking the buffer.

  Patch 2 converts mtdchar_read()/mtdchar_write() to the helper
  and updates the stale comment above mtdchar_read().

Compared to v1, the flag is an explicit opt-in with a conservative
default rather than core-set, the halving fallback after
kvmalloc() is dropped, and the powernv_flash declaration patch is
no longer needed since the conservative default already covers it.

Converting the drivers which already bounce internally
(brcmnand, gpmi, atmel, am654-hbmc, ...) to the new flag is
planned as a follow-up series.

Numbers from our platform (an IPC-backed NOR flash device where each
mtd_read()/mtd_write() is forwarded to a remote controller):

  - one transaction costs t ~= 20ms + 0.3ms/KB, i.e. ~620ms for the
    2M+2K transfer this platform uses for OTA updates;

  - with the opt-in, every 2M+2K read() issued during the tests
    (~80 runs across clean, fragmented and severely fragmented
    memory states) produced exactly one transaction, in every
    single run;

  - without the opt-in, the same command was observed to produce
    both single full-size and halved (len=1049600, two transactions)
    transfers within the same session, depending on transient
    allocator state.  The split is not reproducible on demand;

  - wall-clock throughput is not the benefit: a halved transfer pays
    only one extra fixed cost (~3%).  The benefit is determinism:
    the opt-in makes the transaction count and buffer size
    independent of memory state, which is what transaction-bound
    backends need.

[1] https://lore.kernel.org/linux-mtd/20261119090055.1255028-1-ping.li@horizon.auto/
[2] https://lore.kernel.org/linux-mtd/875wxtf8uy.fsf@bootlin.com/
[3] https://lore.kernel.org/linux-mtd/87y0akuer5.fsf@bootlin.com/

Ping Li (2):
  mtd: core: add per-device bounce buffer allocation helper
  mtd: mtdchar: use mtd_alloc_buf() for the read/write bounce buffers

 drivers/mtd/mtdchar.c   | 24 +++++++++++-----------
 drivers/mtd/mtdcore.c   | 44 +++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdpart.c   |  1 +
 include/linux/mtd/mtd.h | 16 +++++++++++++++
 4 files changed, 74 insertions(+), 11 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1

