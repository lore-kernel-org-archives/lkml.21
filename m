Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683551;
	b=SP4gsFP1QIlGIjLXSlNvm57tLNoyY0qLs6GgOdOfx2eAOJ22KabLa/M0kmOZTkYhGs02
	 D0z97oE3kBhMr0zxtQVfkvR+rVB30lUbLJ8A8QrZj+LadZgJ4Z2ZfGuBvVUPLFLknllfJ
	 zLlMqm+Ad/F0eN4u+FvFu2sG5DPQtfzkek+yNOzrowhtza+VcJc3z4teFgr5XFuuzlpgF
	 kIIRsd23yYMX7kzr3mNRTTVjEk/ij6L4P69vwgbdWdc4l+qmwp76u4ScNSoh1HCjZRHv9
	 KeEP7J2lnsfs9gXWF/jTEvhZqTZ1kCkSgWInF40s1dEa8Rx8S0BE2f0CZAIdTqf1r+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jQc/CTIKgLFqNg7/EqVB3eWhheGznFwlbWTqinE5lFo=;
	b=T72BZ7lAvnqMcl0wkKs7614gZqlH1urdPpLzndryWnpybKLFES6c0HkU53sfLU/8HUeH
	 Nzf/8+rEd/dNWTg0OQAKmqmmhiurky2nOV6y1bzIiXdVoFHy+ZL0VXYcc+4kUWvM8dS2u
	 YMR1foZ7lsxXfpMGKuV+k3YgeOzAzIRdtPW58MMK27+er3MfxViakI8wiYIq0K3iIrAvL
	 EhCq56LyXFng1uRRUnRRYSNX9ZfKiT7/GhqDaaxTouB2/QCbHspc5AMU34LsISJs1Xlt1
	 8TUlT4DMiZtQP4W+96H6HJf1AXB86t6zrZ8cmI0ulM+9vD6HRuV6fWl5n/9flb1TrHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFxc3MO3;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC5B606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DC5B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFxc3MO3
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so67209105e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683549; x=1796288349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQc/CTIKgLFqNg7/EqVB3eWhheGznFwlbWTqinE5lFo=;
        b=dFxc3MO30YtmMEUfQjjqkHJLr+EbHSnZNHH8tZKjIJN3dcUHmp0qnA3QpfmW2JLafl
         +QU3HmBAu6tKqTEffZiuFGb5MfpKeybOpmS3t1LtXNbM75purZ9Zrdvmp9Sbfw9Qv5ua
         ETBCK5gDnnitPh81ui4WT1Y5QcYujGmDt/yq8oZzRRPn+4wV53mld5Ss0vgTOA5cR3K5
         Chehx+uMB454+2gT8AVVIlvDLGL+COIMB8QcPvwtcbKdPXcHmUPbj9kxRyt9nqV4NMGU
         DC4vYhEONf43QVbm0k+Pb3cnNLbtbrqbhDpyNKZOgSCTJAezKc7h6iD/aaeZZqbM8ZL1
         oxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683549; x=1796288349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQc/CTIKgLFqNg7/EqVB3eWhheGznFwlbWTqinE5lFo=;
        b=T0AQK2pDMHCVjNTGdbp6ZAHU681PiXUnp/RZEVd9IM/JeFgQr5G17WdzSczq+4CEMW
         OyXUwSWg+W+Opy5M2EbyxmJ+8p9Zk4SB5a3Y9gWXvgWV83HqK0i2sQ8D4ghAfRoqNMZ2
         sw/T9AwYRnzv/TsYOuIx/w1h65UIywhX2miU44ZCGvFfRAFXMp1Q4HQubQ2mYr5QK1Em
         hJKgopo6oxXZSLQnNSARVZsaz7+7lOYAPgDAbCUf0GwT6xLNyce33cL9RFla5qoFkTjL
         L+MXKgTY/JrW5cZfV/tHwTxIk5ZSjXTisb9YI2vNRFdepKwICIt3oFe9N8EdxQ51xoqL
         AKQw==
X-Forwarded-Encrypted: i=1; AL+hErGkec5b078XNjz6NnDqSr8lWzlQoy3fabTCwWFqc/bq0QY2EEU/PhY5Avh94kmCjFiSDomuNI3IcLrTiSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bz9/qOOXMbSVPbBmAFiVJDtPuqgF8NUqKcNcsepk0vv6e+uCX
	9jvR7up8KdCR8dJIb8zHb7gbrGDrNZ+rkGAJKhuG6Ga9Rv0Ut+aGDizs
X-Gm-Gg: AZFdTZdVo4ELLSp8HL/MMboinZN3UFQu4FlVrbN8ScWRKQ+4HuuxSBWupKdbhmqZYNy
	xxpjvFWwRjGs6/DDTV9KJs0pgRpsdsHIA4XRLGG5FS1el4I43SvG0AUE6P4av9T7Bc47OXAQeKC
	NW8115RzGMeJq6R2nroKaPzqZYlWwQtqvsqAB/zS9V3DFsmGtcLbb1CMcfxFznqVunrJFSl0JTm
	OWC92gB8txYJx1ZOklnI1QBbsAnRDGrZLttCnGvkMlgMECQbqGcZRVk4xz39H7pz2wlqWLYZmCO
	f+3KZbvBj1zMetaaj524+Q5+i7W/J+BY3VeTIySudgj73htPDuFCzry1ImBCc6D08noCPX0kAcF
	9O2mzvLVJtgpaqEZjz3b/Mm2je1dwDrmuFKStqN6/Y6z6SrGpxOXJlHOT1jKqA3efeTNzRMyq7R
	l5ZIo1c4kF7KFQae4YiTGsnfRd+XmRILNziq5rO/VGJX1A85ZRX06dtdZ4S5QJ9g7Vh/TjGBVW6
	c54NjF8/27D+Fal724S2LsGsaO+ryakuyHngUkkh9p81MBCCfcY/M3liDmKP/hOQTELNSxg5pSu
	D5RDozR3AVm5zvXqQjn0E2PkhXArAN+Ek9CHkQxbUNtd6YlzqI/pGw==
X-Received: by 2002:a05:600c:154c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4bb8881c378mr415302325e9.8.1795683548507;
        Thu, 26 Nov 2026 00:59:08 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:07 -0800 (PST)
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
	linux-doc@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH v5 0/4] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Thu, 26 Nov 2026 08:59:02 +0000
Message-ID: <20261126085906.814373-1-orgads@gmail.com>
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

Tested on that board with 7.3.4: the mount drops to 0.55-0.6 s, and an
8 MB file written to the jffs2 partition keeps its md5 across a
reboot. v5 was booted on another Octeon board with 7.3.4; its code
changes since v4 touch only a failed point() and little-endian
kernels. v3 held its md5s across ten 8 MB write/delete rounds on
7.2.9. The series applies to v7.4-rc1.

One question: a cramfs on AMD flash falls back to the block device
today. After 2/4 it keeps its image pointed while mounted, as it does
on Intel flash, so jffs2 writes to the same chip wait until cramfs is
unmounted. Is that acceptable, or should point() in cfi_cmdset_0002
be opt-in?

Changes in v5:
- 2/4: no pointer is returned when nothing could be pointed (sashiko);
  the changelog now also states the slower first CRC check of jffs2
  data and that lock and OTP operations wait for an unpoint.
- 3/4: Fixes tag (sashiko).
- 4/4: little-endian kernels keep the semaphore accessors; their boot
  bus needs the address swizzle of the I/O accessors (sashiko).

Changes in v4:
- 1/4 also gates lpddr, map_ram and map_rom (compile-tested only).
- New 3/4: the per-device map sashiko asked for on v2 and v3.
- Rebased onto v7.4-rc1; Assisted-by dropped (an LLM helped write
  this series).

Earlier changes, in v4 numbering:
- v3: in 2/4, an XIP erase no longer lets a point through either.
- v2: in 2/4, a point no longer suspends an erase in progress; 4/4
  checks the bank width before ioremap().

v4: https://lore.kernel.org/all/20261117214141.3826637-1-orgads@gmail.com/
v3: https://lore.kernel.org/all/20261011062908.2365879-1-orgads@gmail.com/
v2: https://lore.kernel.org/all/20261010180840.2152492-1-orgads@gmail.com/
v1: https://lore.kernel.org/all/20261010172142.2138956-1-orgads@gmail.com/

Orgad Shaneh (4):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: allocate the map per device
  MIPS: Octeon: flash: use the simple map accessors without a shared
    eMMC

 Documentation/filesystems/cramfs.rst  |  11 +-
 arch/mips/cavium-octeon/flash_setup.c |  78 +++++++++---
 drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c   | 174 +++++++++++++++++++++++++-
 drivers/mtd/chips/map_ram.c           |   4 +-
 drivers/mtd/chips/map_rom.c           |   6 +-
 drivers/mtd/lpddr/lpddr_cmds.c        |   2 +-
 drivers/mtd/maps/map_funcs.c          |  12 ++
 include/linux/mtd/map.h               |   2 +
 9 files changed, 256 insertions(+), 35 deletions(-)

-- 
2.53.0

