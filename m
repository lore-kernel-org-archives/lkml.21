Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951705;
	b=NGInbfW7YtVpptxN8pL1CqhJTxqCGavXsyiAj8SYeEMuE1U8BBCNBFLqPxhD6XSYO5Zd
	 3asQNoK6S9MftIvC9JS8zgnKHnr2wS80QE/ZPzRZ+O5ELq7n2dPYC0YSaw+EenNS81dOO
	 5VdLdusAtbYs9gYGft4lw6dRDr5qlx+7RDOGuel0zh5n21oiAxxp6KdZ/GBGXaL38zFrw
	 HEt9b7GHoBmHq66CnSRH9WkQG+ySMHUHiL84EwYMYPP/YtXYp9TsAC2jADSakDqSJoDB8
	 NeNQjUGG+nWXOhAn4LLBDmJl1ijmC8QPU5AS5E/okviAWrZtx8q6PUH+952i38DpMyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cM8zYdFhYY7QMWD01wtMfnMSvgeVrmpAogUxeL6zgEY=;
	b=w7qj8bnJKz3oLLh9dQPaVLzPyu5qgn3hsp0e8VEumRRMa3ZbhcVh1f8ISpQGs+pd9k/H
	 AK8eNACBeQV9bOWW+MWMXB1F3HB/mKLyISQ2jGQ7JTRO7rjLeCiTM00Z4UShX6j4GxBq6
	 NQogpyRXKjKtkSqGMkqt/gZZ6yRnSi47WCTZAz+COZkcGCiv55HkBRP73cGsUhyTIXlya
	 MbD/4wkt8td1rk9Vz//YT3nJnL/vbjSGUZJZmyRe3Yj/bMlnbXaactNfubB07xpafotIG
	 Nd7Ii8dcgX3DT4/7RkLFdtYDmAWeQLqBuT8G7oQcJyYsNViNVnirc+ajuCnq0z5hqYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCczWXoE;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6786E606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6786E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCczWXoE
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e46e449e8so147542f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951704; x=1795556504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cM8zYdFhYY7QMWD01wtMfnMSvgeVrmpAogUxeL6zgEY=;
        b=UCczWXoEHF8KuF/aQ0hYm3w8jn3hiG90ZxdiLdSK8ze14XYx6sBcQmMd5Jm0qIveIz
         U4XFFxLOiEJGN1CwBBkvGenQWxhDj4YUk1oOkUHV4wHpZT+AMnumb1+mtCWB/qlUJqbJ
         hjQDQBOQN2Nwrco0ESz84VDuipfAdIbqQ+Yk9KMbGRHJNlwkJK3g0Umre961Xx2l29NS
         i+obFc80Roui6tK5buwYTtnL/SwO+6UVzIQ8qgCQSqxW87QI+PhM+ahr3uRBl5LoPMBB
         uaGNREfEZq/eSpypYk/RxKc9CPf1QneNvwRwN0/Kh6pZyoHckwfecChLnLsUL17x/0y2
         zEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951704; x=1795556504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cM8zYdFhYY7QMWD01wtMfnMSvgeVrmpAogUxeL6zgEY=;
        b=1fsHMM2q3tRprKrWkYvksb16sBz69f6NyhvMPxU0hAsjcvOf/oDgrArkemaaRSqnAb
         T0tJUthkaOr9uc5pndZa3AZweXIUf76CYwQQudj3fPlEG1o8TT1Di4zHtLAEOyJ51381
         MZIRsZS+/l4ece9S2Hh9Dq1+U2u8+LmKFy6UIKNN2nz0ggrSTAb56m9BzwkEX2j4mWXg
         046oZ09eoAIJU8tjGljJkrr9xamoGyNlJjPDqPNXV5gDH4VLLHd/6Ikec+Z6CTzY5Vkp
         VegVDK3qIg3BOThigHK4XBL8CP39R4AfkCVlv+urD7KxLeHPo4zA7Zj9aIvbxOc6B05h
         QTKg==
X-Forwarded-Encrypted: i=1; AL+hErH1a3iF1qh9wfDQZBEPhmlPgfqxAHwlK3v2dFpUajsiyfRmab+5n/0bdqr4V35TB23EQUe5z8jiHtjnFKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AfbkPgVT9AYpvZaI6eCjiC8nTj3beRJeBn9kd4vRJC8IuDRMW
	507pCif142K6wL9H2FsCcLDJK/ZZdaUJ6bP44il4g/J6YNypE8kvHjCy
X-Gm-Gg: AZFdTZfkw1hZXUoF98WKQATvkwraxp02jJZtkLPHkrPFJSG1LDoI+kTGkVgX+/3Nfsf
	e0jPFRLGwBkkeizS2c4Cgxuz3rWeZxjSzB+kyIwhVjYjZZ00/LIsYHarnKvEdH6c78A7fV72jAX
	v3bzTSzAPTn4h+LHRONZs3IH0kOOOKIrdY+LF1HKzcM2Js5hfEKc500KxhQqq15wA717P3E6L0+
	qrJKnMfHWiwOMcHbLHVqPZ4tMl0e9zS2TfX/CsJzzu8Wk87rxc0dtC/IcGB225WEqpeoGoQpYb3
	wUv/d20ctvdSxIJ75Qa16AiTgobqfcspeoP0KArHsj8/aQuBSBHbDCLeZN9jAML4RiU3SncT6tz
	4vcfVSG71MwoMQTIzzPjbQBIzBagxuhBK2TlwdNUU1HV7cINRL4XxAV3BrEU0JxdSQBoeN2Vazk
	yNryDbbQv7OC4h03dAAaF+f+miTdcdcznIkZLoGNDhQSx2rrax9fZbbAe+PgAGmdRXvyy3dPCGd
	9BA6GvUaNa1CRrU8NfYVhOzlhJ6QGR8BAbtKM5b7Ab2IYZmaAP3sxsiXQhQ5i23CxnpE4iPm5DO
	eajbkCTNJ36xipkAiCkDtsrFNETWTJjyzt1+sQcguqEiyxld86WU0AsGlCDsf5g37Gm3SlJjBNU
	lq9e1HLKKEc6VhRkXqPqc1/+9W0VBJ3Jayo7QaqWY3ga1cbLJ
X-Received: by 2002:a05:6000:2798:b0:48d:f99d:a0d3 with SMTP id ffacd0b85a97d-4a63b137aa8mr951124f8f.46.1794951703521;
        Tue, 17 Nov 2026 13:41:43 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm978391f8f.21.2026.11.17.13.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:41:42 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 0/4] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Tue, 17 Nov 2026 21:41:37 +0000
Message-ID: <20261117214141.3826637-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
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

jffs2 scans a flash in place through mtd_point() when the chip driver
offers it, and copies every used eraseblock otherwise. cfi_cmdset_0002
has no point(), so an Octeon CN6635 board with a 100 MB jffs2
partition on an 8-bit M29EW spends 15-30 s mounting it at every boot.

1/4 lets point() through only for maps read through the simple
accessors; cfi_cmdset_0001, lpddr, map_ram and map_rom point today at
maps whose own accessors swap bytes, switch pins or lock the bus.
2/4 adds point() to cfi_cmdset_0002 behind that gate.
3/4 gives each Octeon flash device its own map.
4/4 lets that map use the simple accessors when no eMMC shares the
boot bus. 3/4 and 4/4 build alone, but 4/4 only pays off with 1/4 and
2/4, so taking all four through mtd with an ack from Thomas seems
simplest.

Tested on that board with 7.3.4: the mount drops to 0.55-0.6 s, and
an 8 MB file written to the jffs2 partition keeps its md5 across a
reboot. v3 held its md5s across ten 8 MB write/delete rounds on 7.2.9.
The series applies to v7.4-rc1.

One question: a cramfs on AMD flash falls back to the block device
today. After 2/4 it keeps its image pointed while mounted, as it does
on Intel flash, so jffs2 writes to the same chip wait until cramfs is
unmounted. Is that acceptable, or should point() in cfi_cmdset_0002
be opt-in?

Changes in v4:
- 1/4 also gates lpddr, map_ram and map_rom (compile-tested only).
- New 3/4: the per-device map sashiko asked for on v2 and v3.
- Rebased onto v7.4-rc1; Assisted-by dropped (an LLM helped write
  this series).

Earlier changes, in v4 numbering:
- v3: in 2/4, an XIP erase no longer lets a point through either.
- v2: in 2/4, a point no longer suspends an erase in progress; 4/4
  checks the bank width before ioremap().

v3: https://lore.kernel.org/all/20261011062908.2365879-1-orgads@gmail.com/
v2: https://lore.kernel.org/all/20261010180840.2152492-1-orgads@gmail.com/
v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (4):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: allocate the map per device
  MIPS: Octeon: flash: use the simple map accessors without a shared eMMC

  Documentation/filesystems/cramfs.rst  |  11 ++-
  arch/mips/cavium-octeon/flash_setup.c |  73 +++++++++++----
  drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
  drivers/mtd/chips/cfi_cmdset_0002.c   | 167 +++++++++++++++++++++++++++++++++-
  drivers/mtd/chips/map_ram.c           |   4 +-
  drivers/mtd/chips/map_rom.c           |   6 +-
  drivers/mtd/lpddr/lpddr_cmds.c        |   2 +-
  drivers/mtd/maps/map_funcs.c          |  12 +++
  include/linux/mtd/map.h               |   2 +
  9 files changed, 245 insertions(+), 34 deletions(-)

-- 
2.53.0

