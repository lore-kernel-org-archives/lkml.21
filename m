Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102323;
	b=MihtcpkHj0x4G88W21e7FFnBGg7VrXg98lP42/arragEQ6dgfnuaSIhMqFFKafbYyVL1
	 BCJxrgmp+DzdP11P4/Nla6qGETHMG6OCJPSSAFMXD0lhn+XhpL3Mgjdl7WWmDQlkVddUe
	 jcMxH6sx3ldkHJQA9Gnrb0iqDX18UH9RCC5RdxkQ3E0JNlRZHKhNz8RHwkws5tR/UX8iZ
	 fDgsmw0DuHVtPHWfggRX5xQI4tJ98ors/2bfA5qs+2zyxXH7qEujRDNW+tmcTowVZurjH
	 /40vC2NgC2I/EesVBky0Uvmp2VqxqImvakLi6PXzZmyXqXK0GQ//9t9lAlqpBz1YxeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KDh7vGX3oS8n9XC7mOI9LpgUvgIhwiDsFPziOjYHQwg=;
	b=QJePon820L+qjAePt14onCUIypSaxlu8E2th8Ilutr9YwwgbUy8o7eHaT/LYJVRCyFBm
	 /TnddendnFHLjiSpARyOiQWoQ+VNK8ItRwmYEed6ygZSrADoQ1KFk6pjm+MbkAbVFcxNd
	 +r4QehzLZc0vi+gb8orwsfrqa2EWPvV35LCbJVYFV7f51E7t9MR9us09plAFwOaw1NqjA
	 l7fqePf/vc1npdc+qBfUtq6u+G7f89RJKwL5urAiS7qDD6iTmRmJBmU3wb/Tb/fLRL7Tt
	 SDUfHXISNdVGFryKPw/2O0myXP+kOsybuOr2r3AsvMaV4MZXexX7xzzl5NIN0tFTYOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rhvL4i16;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC192606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC192606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rhvL4i16
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1645004f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1795102321; x=1795707121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KDh7vGX3oS8n9XC7mOI9LpgUvgIhwiDsFPziOjYHQwg=;
        b=rhvL4i16wcWXubKhkkigHTUHCz6OV+c27AaDTNh5n9cpiq6z/xy3qwUijrMapcs2W+
         lT2CP0nkHrnoOwWoM36WbkC53csEXlpO9WKYxEHS+Ng0KQUc0cI6unwF0F9IEJIRth4q
         lQav295c0xBMTFW4tHlX2z66X+ja5xbjYg4EM50I3P3oeib0zvH+/HiiPZr6T3aZoH9s
         CJaHuy2IOP8fY6wAfh8Dj3HHm8f+CCMD9zEmBiq30XFMAXMO0lCmLxnmHF0Hg+PRSz6q
         5DHamdjQzPP1D/Kv9s4PhYLhiqpfnQLOcJ9cRPNzGyoNZjk4jDz0rsPHdp64yQ7PFv0e
         1AoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102321; x=1795707121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KDh7vGX3oS8n9XC7mOI9LpgUvgIhwiDsFPziOjYHQwg=;
        b=GxpUEcLRNAnXA75O3as6GU+KqsPrRYjRqsrW62Lsppcuse3N7ixw+auSygxaxIahQt
         I97GbEAURZVSMud6BrATHN+b0DCeVEQxsipnWqbiIDEpOiir67gDJiscScl3PaYO6u4z
         cxfu0tEfGMsiDjPlnewjhF9TrY1SEBHFw4g12HWygKMOZle4AgKYBfl9PZhD5KhMfMJ+
         s0LaYa0s4zhGFJiucru5Dgvb7Ghv1znQYfTddOokAAUcSc+hi5J5qukrT6w3bANTBpVq
         eIo2Ub5lKMAa6VPGNeyeotXNZ8KqDFdP0e9v8ZLwq8bVUJhJsdgOG+HcMBt3lkXyo07s
         SXJA==
X-Forwarded-Encrypted: i=1; AL+hErGCzJNEe4XpDN0bMqCXRo8xaYRnBEfoB+F8zJRCSfczpAOBHLL7WRa4SEmjBsYX3YyBHh6eWd7LajzQVuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GEMgGaUvJyJCBw1j+4X/D+3yL4vOxVRwMp/iaT95OBqJJ2byv
	goBVURd+x3ZT72RSt2vEGXt+lg+48hM/zCu7i3DZdErqMUx1Uq7P5mdVeoX+uhbhJ7s=
X-Gm-Gg: AZFdTZeML4W40lgg75+VKm48BcyCMfIaSXJw4La0a3hW3k+8i5E8OhJoChTVxXeVE6n
	ZLdw8CI6zAcUpPCy79gdjo6LDDODkgGc94wInz8qPgYiLLxb6Ds4aXw/GILE6UfSr7pjFREJupL
	E38MbLprm25XzE8TRVWKfccSUOzZjjz4ugH1V8+Wj37It+Y9NjnaoZFYyIt9Kg9AOEQf+OJFN9p
	wJh/e+K+bOk55qnOTMsdG60Ui/IraEGLSZsK9mNU058CbH81CLYAB8BsbBFIUtdQQ16VVyLUSSr
	+LxU6bsNR+WxOkERFNyL1RkKp6Et0B8bzJClNLXBB5TWYEe+uKVQXpN8LsE9XubbC6H8hXJ25Qy
	d0qVNvNbjJSUdvEPLlv1c2YVaYMOFiUfGcDW/OjdcRIyPxvidg7nNS+pdDsEKCSghBXzvP2+atG
	1H7e0JhSuV5bpj0IiZYdaxJdasFLMoox36zWcjZCaQtFwufLOq7k0UbHeIsZTXGLZzhp3JGZOHL
	rqQhwEg8imnhQ9Tr2NkMtth6oeqFjGMk4kFhHT6UQ7t3oBeLInwi7OB4EbBdjWpPQIEk3Cxl0L5
	yR57YoHMt7bPCKaXBMh5A6llRM0pfgi2
X-Received: by 2002:a05:6000:2484:b0:4aa:8fc3:2909 with SMTP id ffacd0b85a97d-4aa8fc32ab1mr3673377f8f.2.1795102320532;
        Thu, 19 Nov 2026 07:32:00 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:294b::41d:4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm237463f8f.7.2026.11.19.07.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:31:59 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Caleb Kan <calebkan1106@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v4 00/10] stackdepot: store compressed frames in stack records
Date: Thu, 19 Nov 2026 15:31:33 +0000
Message-ID: <20261119153143.4099483-1-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
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

From: Matt Fleming <mfleming@cloudflare.com>

Hi,

Cloudflare runs KASAN on pre-production servers, and on some of them
stack depot keeps running out of pools even with stack_depot_max_pools
raised to 65,536. Once the depot is full, new persistent traces get no
handle and later KASAN reports lose the allocation and free history.

v2 of this series tackled that with a trie that shares common frame
prefixes. Marco asked how much of the saving came from compressed frames
alone [1]. It turns out we can get a decent saving with just frame
compression and none of the trie complexity.

When every frame of a persistent record can be compressed with the arch
hooks, the record stores 32-bit frames instead of unsigned longs.
Evictable records are always allocated at maximum size, so they stay
uncompressed.

On our production KASAN hosts this reduced stack depot pools per 1000
stacks by 41.5% on x86-64 and 27.1% on arm64. arm64 saves less because
we run a lot of BPF programs, and their code lives outside the +/-2 GiB
range around _text that can be compressed.

Compressed records aren't contiguous unsigned long arrays, so callers
can no longer borrow stack depot's storage. Patches 1-7 move every
stack_depot_fetch() user to stack_depot_fetch_into() or the print
helpers and then remove stack_depot_fetch(). Patch 8 adds the arch
hooks, patch 9 stores compressed frames, and patch 10 teaches the GDB
helper to decode them.

Changes in v4:
- Write *frame in the generic arch_stack_depot_frame_decompress() stub
  so callers never use an uninitialized value (sashiko).
- Use the address of _text in the GDB helper rather than relying on its
  debug info type (sashiko).
- Rebase onto v7.4-rc3.

Changes in v3:
- Drop the trie backend, the stackdepot.trie_enabled boot parameter and
  the trie KUnit tests.
- Drop STACK_DEPOT_FLAG_COUNTABLE. page_owner reads traces with
  stack_depot_fetch_into() instead.
- Remove stack_depot_fetch() now that it has no users.
- stack_depot_print() and stack_depot_snprint() decompress one frame at
  a time instead of copying 16-frame chunks.
- Store compressed frames directly in hash records, using the u16 size
  and u16 flags header layout from v2's COUNTABLE patch.
- The GDB helper decodes compressed frames instead of rejecting trie
  handles.
- v2's patch 1 landed as 8f56ea8e0706 ("stackdepot: stop preallocating
  after the final pool").

Thanks to Caleb, who wrote v1 and v2.

[1] https://lore.kernel.org/all/CANpmjNMP=NdD8ZE9rPwikUBcLwc8V=J648X05YGPn41yAZ5hmw@mail.gmail.com/

v1: https://lore.kernel.org/all/20260817-stackdepot-trie-v1-0-53870ca1651b@cloudflare.com/
v2: https://lore.kernel.org/all/20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com/
v3: https://lore.kernel.org/all/20261113185702.1332171-1-matt@readmodwrite.com/

Caleb Kan (6):
  stackdepot: add caller-owned stack trace fetching
  mm/kmemleak: use stack_depot_fetch_into() for leak reports
  kmsan: use stack_depot_fetch_into() for origin reports
  mm/slub: use stack_depot_fetch_into() for owner tracking
  drm/locking: print deadlock backtraces with stack_depot_snprint()
  stackdepot: add architecture hooks for compact frame storage

Matt Fleming (4):
  mm/page_owner: Read stack traces with stack_depot_fetch_into()
  stackdepot: Remove stack_depot_fetch()
  stackdepot: Store compressed frames in stack records
  scripts/gdb: Decode compressed stack depot frames

 arch/arm64/include/asm/stackdepot.h |  37 ++++
 arch/um/include/asm/Kbuild          |   1 +
 arch/x86/include/asm/stackdepot.h   |  37 ++++
 drivers/gpu/drm/drm_modeset_lock.c  |   5 +-
 include/asm-generic/Kbuild          |   1 +
 include/asm-generic/stackdepot.h    |  20 ++
 include/linux/stackdepot.h          |  45 +++-
 lib/Kconfig.debug                   |  16 ++
 lib/stackdepot.c                    | 164 ++++++++++++---
 lib/tests/Makefile                  |   1 +
 lib/tests/stackdepot_kunit.c        | 312 ++++++++++++++++++++++++++++
 mm/kmemleak.c                       |   4 +-
 mm/kmsan/kmsan_test.c               |   4 +-
 mm/kmsan/report.c                   |  28 +--
 mm/page_owner.c                     |   8 +-
 mm/slub.c                           |  12 +-
 scripts/gdb/linux/constants.py.in   |   5 +
 scripts/gdb/linux/stackdepot.py     |  23 +-
 18 files changed, 651 insertions(+), 72 deletions(-)
 create mode 100644 arch/arm64/include/asm/stackdepot.h
 create mode 100644 arch/x86/include/asm/stackdepot.h
 create mode 100644 include/asm-generic/stackdepot.h
 create mode 100644 lib/tests/stackdepot_kunit.c

-- 
2.43.0

