Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769975;
	b=MiVp4vq8h+T0Ks8m+L39uCBjMGGA1r3CTZop+gA+o30JXTRL+BWpBC/g3Qx9K8MG8AYJ
	 dKEZUhnIoy8mVX8jZfzR8Ba4NWwoXRlIxwFLQnOmi9UUyc2pYGwkL6NS8RGd49nPx2gHd
	 fPW6nEtXsD+TbnIFwwrpnEmD3LBmHhxSu8st/gyvQuMLmzgmao4SAqOEEjfiX4i0rrFBZ
	 hh6r6WLN6SZ8Y5peGMhdcemGdzCY0APQfYpyRG3gJRgOHEfsQl3mbouFjcax8biVha+/n
	 L/L4f7z0ZEegapZGlVcstDJhctFcJuxbKXGYAkafmGFvAK4FAEFjX8113YAxIljLmHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769975;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7a5V8uJNEtSJUfbxlsSU81OveDHYXfQs+t4Z/0WLw0Q=;
	b=J7+WvNTsM/Bxo3rnMGGE4Pm1GuVcMvL2D2VmvWLJX18QkVZK3EYOmBWSs4fMStSVSJBC
	 CpKSjsai+G+aP4gPXpX6yAaGFrjDBwvJ0FdP9PSuhCpQOfFkVwbqhXdizREvapS36HRGI
	 uj3MLqmzidZrRcLHQfSqCZJfGWMptcMZ24d69mMrnLiPKEOtMNFych4KwftW8Oa34MMtu
	 RqvOVI9tBPpPGL7yaoyPFZ9H9ZiOXyyPPmsQCIYYnMhdEJgejAmbBRsADl4xj24E/bwtl
	 q2tZJi3niV7hQFJ9E4070X+aSYDrKPgsW6jS2ktHnVkT/N3QfQDnOt52p5YnaE6JEqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AYhGSRjx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20E7606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AYhGSRjx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61E11F00897;
	Fri, 27 Nov 2026 08:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795769974;
	bh=7a5V8uJNEtSJUfbxlsSU81OveDHYXfQs+t4Z/0WLw0Q=;
	h=From:To:Cc:Subject:Date;
	b=AYhGSRjxzoKEEqtT32tZm1a+8a42yP26NUpFjur0TnXe167qHDP6zH3IskrtTZ9cI
	 +HUM1GLIboc42+X2HH8g1rhP0KKkQQrX4Ezs0C9uHd+XZu/n1Pndhut2v/irjlyDtb
	 fJpYDeUeiwIMqmhRlQu/8ICbKZX2IOgeg8UJxcLL103MCpOZEE52Ua3ifNUAsiOiJ6
	 DO6dYyv6HdlxSii6rKf4JRD4jKrEOU1CqCG6FE1BK1/ZkFDZ+xD12uYX5IgklfFM+L
	 R4ZADKUaux7vzAH/rJhf58OIJEor97X9IJoNjVlEjVxrMpylWzYmzPJdv2A+k8AcpN
	 T1nubdwKcwCBg==
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: [GIT PULL] Core MM fixes for 7.4-rc5
Date: Fri, 27 Nov 2026 09:59:25 +0100
Message-ID: <20261127085928.3630-1-david@kernel.org>
X-Mailer: git-send-email 2.56.1
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

Hi Linus,

please pull these core-MM fixes for 7.4-rc5.

Two hotfixes and a bunch of fixes for other nasty issues we found that
I want to have fixed sooner rather than later. All got a couple of days
in -next after proper review, which is why I am rather late this week.

Cheers,

David

----------------------------------------------------------------

The following changes since commit b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f:

  Linux 7.4-rc4 (2026-11-22 14:57:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git tags/mm-core-7.4-rc5

for you to fetch changes up to 450bf6e1e7ece7ea8c0253886a01c663ea7bcc1b:

  Merge patch series "mm: fix deadlock on the folio lock when migrating and splitting folios" (2026-11-24 08:58:32 +0100)

----------------------------------------------------------------
Core memory management fixes for 7.4-rc5

This includes fixes to:

 - THP (Transparent Huge Pages)
 - MIGRATION
 - SHARED MEMORY
 - MADVISE
 - RECLAIM
 - Core MM

The main changes are:

 - Fix deadlocks on the folio lock when splitting folios and when
   migrating folios, triggerable by unprivileged users.

 - Fix lost writes and stale reads due to stale TLB entries with delayed
   rmap handling on UP, when zapping dirty file PMDs, when installing
   CoW'ed folios, and when reclaim does not write back a dirty folio.

 - Fix various MADV_FREE issues that can lead to data loss or exposure
   of stale swap content.

 - Fix various issues with device memory migration, including
   use-after-free of the anon rmap, out-of-bounds array accesses and
   oopses after migrating KSM folios.

 - Fix a use-after-free of the mm when copy_process() fails.

 - Fix a NULL pointer dereference in the shmem huge shrinker and data
   loss with failed swap writes in shmem.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

----------------------------------------------------------------
Chris Mason (3):
      fork: clear p->mm when copy_process() fails
      mm/migrate_device: fix ksmd oops on a migrated KSM page
      mm/shmem: don't use the memcg of an uncharged folio

Daniel Wade (1):
      mm/memory: mark unshare copies dirty to fix MADV_FREE data loss

David Hildenbrand (Arm) (9):
      mm/mmu_gather: delay rmap removal on UP as well
      mm/huge_memory: flush dirty file PMDs before removing rmap
      mm/khugepaged: mark ptes dirty and soft-dirty on mTHP collapse
      mm: flush stale TLB entries before installing a CoW'ed folio
      mm/vmscan: flush deferred writable TLB entries before unlocking the folio
      mm/madvise: fix MADV_FREE handling for PMD-mapped THPs
      mm/huge_memory: use NOFS when allocating while splitting folios
      mm/migrate: allocate destination folios before locking a batch
      Merge patch series "mm: fix deadlock on the folio lock when migrating and splitting folios"

Josef Bacik (4):
      mm/migrate_device: allocate THP deferred split heads
      mm/migrate_device: don't collect a range twice
      mm/migrate_device: don't let go of the fault page
      mm/migrate_device: look up fault folio after a split

Lorenzo Stoakes (ARM) (1):
      mm/migrate_device: fix use-after-free of the anon rmap

Mani Tofigh (1):
      mm/shmem: don't drop a folio whose swap write failed

 include/asm-generic/tlb.h |  16 ++----
 include/linux/migrate.h   |   1 +
 kernel/fork.c             |  15 +++++-
 mm/huge_memory.c          |  68 ++++++++++++++++--------
 mm/internal.h             |   1 +
 mm/madvise.c              |  65 +++++++++++-----------
 mm/memory.c               |  14 +++--
 mm/migrate.c              | 133 +++++++++++++++++++++++++++++++++-------------
 mm/migrate_device.c       | 105 ++++++++++++++++++++++++------------
 mm/mmu_gather.c           |   4 +-
 mm/shmem.c                |  45 ++++++++++++----
 mm/vmscan.c               |  12 ++---
 12 files changed, 321 insertions(+), 158 deletions(-)
