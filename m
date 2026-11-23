Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443363;
	b=F0ggUXskPK5oxEg2mevixCC+UGRfLflx/iytxFG0aEGgAzgfs1qMn9DgSwNGoh4T/PJA
	 6xeLSLBiSBdXGvLrWx2bSHp5GiXtk7HvKvIFGgU9WmV4jJ/9k8ygqD/iNKa0+wIJPkyV7
	 CT7o4HnnLBnlR37gzmOKBmtYh63lHPdr0B3+f1DEvcdhjacfuWSnALkqe1PlJxNM8oFQK
	 rb9QnU771ibigFFTcFeUDEecQtSUFedRJXt8Q+EdWMNf5u83xs590XiW7HgMwnpfipp1h
	 aQF9SFpVbeinolKQbLVssyqvkFLz7BR2Tjv5sBxDkUPo/IUl5r5KmFskQYgOVPYTpog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PjRuNUOgfB3Fg1Fm9BbnbhhqY+ZgAzXM9O/HQJjsyY0=;
	b=Ar0Q6olsLEPJk2E22n3kyR6Ua5e9Q/+w4tgCnDHeGiZadUtS3czO+fXBTUMLyi45HNbF
	 49QLz0tQ08w5f/tqJqaSt31XxREK2i8kqI/jyOoyQDJhawpV1ETiveyaUT0ZPHXjpPNIb
	 c4aFyppZpGva3W40/KgYxwnlkgpgWnMIqXlntsxLR0kOdBXNIRw+cjlAW6/RqYLKQkLN3
	 MBLcRTEZXLG++LrfISbisHiYDXTQPv+Uegpkrr68BqmQyjbkfnTcnzyg+oCknKzsD0WzT
	 Lz8MgfDPVi+72a4iJMloQZaEK0Zd8eGKyDTvayXt4SM1sWb5VxWwH57/3YU3ko6Wckw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JSP+Znqb;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78036606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78036606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JSP+Znqb
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so4848603c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443360; x=1796048160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PjRuNUOgfB3Fg1Fm9BbnbhhqY+ZgAzXM9O/HQJjsyY0=;
        b=JSP+ZnqbcEb0ia/ONGPICfm4AQK9TPsrfUjvnKiYqWlKjXcl13cN5zJH23WVbFMG/C
         W2PRjEze9BcTUJIZN6qyD6nAbIyDH2eGotrFkLL30X4BWuVewA40x1vHko4Wf07O2avA
         ZP9FZa8oa4Crf/SlOb1v35TtukW1Qs68Ne8s0FQvkp6TbsxVKEq28YMMUIQ78R96rTDq
         QSg72i5BTowgDycaDUjs/FHT3vYDbP7aEPJx6ywtLBJeK9g6It2W3gr/duKpLGk+Gc3M
         2HJxA2zGLfszuE+DxpaBOHkEpCBNuv21A/zmhFZPSKbiluZl02wqOVYXEoJcOY4f4a7W
         nZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443360; x=1796048160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PjRuNUOgfB3Fg1Fm9BbnbhhqY+ZgAzXM9O/HQJjsyY0=;
        b=xS0BN/bp4CyulFAXkZu/7UZlLGHcw1VeaIx8xeh+75sRKiixELwHlzM8aWGB37KDIm
         51/rsNynhsKlzw2WFzNS7fDV9olniAeA2I1flVgIcVrhKgQ6f5oAcrhU2WQD8UAzAHyB
         tgeSwNzfEFhV2ZVGz9llHcQhJo8VQyyirFItmV6N3ZeswITiRUCbYotEyKFsNoDGNQui
         EHeF8JuUbMD19OFF0JI6Q2W67CGgS6k/58c+S1DKDVydR/Qz0ix5ADrdKiZ0WY69ZXpn
         RWSfrPRYhpvqh9Rm9jbYHyd76+RL2aQ8iQRo3WiOpcyAwwe6llocl2cHKk0lPEqYzhd/
         Ug/w==
X-Gm-Message-State: APuU4Z+6VV9zr67bjLIEpEfiI8qtGkig4eomuZ6g7IG6X0rYHiRbthPf
	7lnOpwPfVGVEOXXaJPdyGiRlLF9AvY9e/T0hdaKDTay3lUgZuIUS4Pia
X-Gm-Gg: AZFdTZeJeEUTvddtdH+9iOzrQWTpvlNz+nPbzaUHWYJH7eSwXU3WaIdLDCwRp1IdAW9
	Ak3sOuJ0uBkvK/c4nZ224nEy2BTjLL/6wPdq1yYvLSV+eysZ391cSYr1r9+nLtJrdbE8jPCt2Fi
	g9qmWGEvOcz0RpkC2Q7Vu/vIpXUbBAM1++zbzLRNILul24DJtrXrUUejGoUsofgHHLZSNpnZ0dD
	s3rkmlzVd4BHGi0PqNTIqPuU22+ye4gpHFsU8zY1fj15FSIAivugBxXO5guAansa9jbvuorn9X6
	zMLdnpKEpUfEKbB1nb/ibMZ0aafZssgdfz/i+blredLCsxRjDF6/g2CCxXSNCSh/U/TVIfr/RuP
	YqOyPAjG12Ll1b/J0lHbX8SlSC130Q3970Q3RY+WtVl7qR2l4KiV4G+PjZ8zVTRxR5GqbXool2D
	KVqb9Y4iWAottVnqo4kYRcBIeZyyo2wmPLYVOcGHAT6cNKNX1sXejkWY8de99ADunNFO2i3SPtS
	86C4POaleIAYnh7XIro1spWZwuqOIcTC0HG8RDC5BMe8yoACaLwd3fqCPRh9p849bMoNZSP7O+h
	t4Qi3tPS+VN0n/3beP4XgY5LmLsTM5wGynXoPEW0lZ2NgT2hyY42RXQ4q3h88JAUnhgN
X-Received: by 2002:a05:7022:f509:b0:1a4:4194:fc04 with SMTP id a92af1059eb24-1b5568e4322mr11657910c88.28.1795443360380;
        Mon, 23 Nov 2026 06:16:00 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm31101950c88.6.2026.11.23.06.15.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:16:00 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v5 00/19] mm/swap: introduce priority queues for swap device allocation
Date: Mon, 23 Nov 2026 22:15:50 +0800
Message-ID: <cover.1795439990.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Hi all,

This is v5 of Kairui Song's swap priority queue series. Today, choosing
among swap devices of equal priority means rotating a shared plist.
With this series, each CPU advances its own position in a ring of
equal-priority devices. The allocator selects a device before looking for
slots on it. This keeps the existing global swap priorities and does not
add a tier ABI or a per-memcg device-selection policy. Memcg swap
accounting and limits are unchanged.

Thanks to Kairui and Kunwu Chan for reviewing v4. I'm dropping the RFC
tag and submitting the series for review.

Changes since v4:

- Rebased onto mm-unstable at 7d1a16abe4cc (7.4-rc3), retaining the
  upstream swap size reporting fix in swap_show() and swapon().
- Following Kairui's review, renamed swap_ring_iterator to
  swap_queue_reader_head and ring_only to no_fallback. A large folio
  can still try other devices of the same priority after an allocation
  failure, but not a lower priority.
- Following Kunwu's review, retained READ_ONCE() in the availability
  check, removed a misleading comment about slot reuse, and made both
  /proc/swaps iterators check the published swap_file under the read
  lock.
- Split the off-list bit fix into patch 10, before the queue conversion.
  The plist allocator also needs to mask that bit when checking whether
  a swap device is full.
- Revised patch 04 to distinguish all allocated descriptors from
  writable devices. drain_mmlist() needs only the usage count and no
  longer reads the flags. si_swapinfo() takes one flags snapshot when
  accounting for devices being taken offline. I have not carried the
  previous Reviewed-by on that patch.

Testing:

I ran Kairui's benchmarks on the 7.4-rc3 base (7d1a16abe4cc) before and
after applying the then-current v5 patches.

On one x86-64 host, both kernels built the same source (4dbe24720eb3)
with make -j96 and eight 8-GiB ZRAM devices. Each build used a fresh
output directory. The BRD test used twelve 8-GiB RAM disks, a 24-GiB
memcg limit and one invocation per kernel:

  usemem --init-time -O -y -x -n 32 1536M

Times are in seconds (means for kbuild).

  Workload        Runs/kernel   SYS: Before -> After      Wall: Before -> After
  kbuild, 2 GiB        12       4193.23 -> 4271.06        167.80 -> 168.80
  kbuild, 3 GiB        12       2257.60 -> 2299.63        136.29 -> 136.77
  12-BRD                1        141.16 ->  131.44          6.61 ->   6.32

Both kbuild cases used 1.86% more system CPU time; elapsed time rose by
0.60% and 0.35%, respectively. In the single BRD run, throughput
(48 GiB mapped divided by elapsed time) rose from 7436 to 7777 MiB/s
(+4.59%). There was one boot per kernel and the baseline ran first.
The BRD result alone does not establish a repeatable speedup.

v4:
https://lore.kernel.org/all/cover.1794666741.git.lianux.mm@gmail.com/
v1 and original test method:
https://lore.kernel.org/all/20260714-swap-pcp-priq-v1-0-de9b164ed419@tencent.com/
Related swap tier work:
https://lore.kernel.org/all/20260916183437.2946306-1-youngjun.park@lge.com/

Best regards,
Lian Wang

---

Kairui Song (12):
  mm/swap: remove unused parameter for reading swap header
  mm/swap: clean up hibernation error handling
  mm/swap: cleanup and document swap device availability flag usage
  mm/swap: introduce swap device iteration helper
  mm/swap: change the swapon lock into a percpu rwsem
  mm/swap: serialize swap publication before removing swapon mutex
  mm/swap: consolidate swap inuse accounting helpers
  mm/swap: add priority queue for swap device allocation
  mm/swap: remove available list
  mm/swap: bound synchronous discard outside the allocation reader
  mm/swap: drop swap active plist
  lib/plist.c: remove requeue function

Lian Wang (6):
  mm/swap: avoid direct reclaim when populating swap cluster metadata
  mm/swap: mask the off-list bit when checking whether swap is full
  mm/swap: reuse per-CPU queue readers across priority changes
  mm/swap: advance the global queue cursor directly between priority
    rings
  mm/swap: skip reader rotation for single-device priority rings
  mm/swap: redistribute queue readers after membership changes

Youngjun Park (1):
  mm/swap: change back to use each swap device's percpu cluster

 include/linux/plist.h |    2 -
 include/linux/swap.h  |   45 +-
 lib/plist.c           |   71 --
 mm/swap.h             |   12 +-
 mm/swapfile.c         | 1446 ++++++++++++++++++++++++++---------------
 5 files changed, 963 insertions(+), 613 deletions(-)


base-commit: 7d1a16abe4cc5dccd21e3d6262e44433a5885d27
