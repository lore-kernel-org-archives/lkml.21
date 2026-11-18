Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026161;
	b=rdlix3op5DCqg0xHvrO2Aapmzy1KuEIzKwXx4pmX13z/Ds0FBjsIeN/bcEViOzeNdPUm
	 VP7gKN+/DhzpY2+DoOAWx2+5C6QMXtrochopsCAz2zxpAoUf7wXQ0tS5rS46ViDi2nVbs
	 a0JZe7Ln7K/6J8tpWjlQV2dYg+6PssFDZRCZYc3xLG3JXf6GfNCIRxzyYk8JIfFmBQWJn
	 yDwGKOdlt4OQ3CKsLp93ZSjD8n5m7p4V3Wf30/7ZsSiCI2lqZ5TlOHfQ4QZ377v9z/YxW
	 xIlIyRS3rfPimhLqkK8ctHybXEKxRRBmSiP7mHo0T24yf93qCFr6iYJeliTFPc580iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026161;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xvB8IhYRPSnbnj2uCIAQHzMiYpbNgO0dDpgbm6C1Dps=;
	b=Xav1Fd4yj/LjlowY1zZWblMpcwMOfNkPdAAVHUAXGjOMzyM7Xv1pcTT3jowGo7cs7iX/
	 1FN3XCenSL43YQYZPUjgaPJrLaiDx4t1WVgWKu0BWrfqK/iHvskq3cMz7E2YX3kdnQCyd
	 OrlDgCx1yKvM6rjlTskCVsHYlY9ITy3RHx36xREEW4e9KFCjrxHzNlSd3bH2Xj9h2rbym
	 9bLkfCIPuB6555GlwLN3BKDBSJic0s2cYBy0WYo3uKwpKfHAEMQP5xRJbrA4oowjLI0WT
	 HjNtK7ahFP0AhgkIt2FDkpuPvXR8S8wP92ux8cLfE6e4Hb2DqHX3dA5vpz4dBdZ6R/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODZK9b7w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544A7606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODZK9b7w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6571F000C4;
	Wed, 18 Nov 2026 18:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795026161;
	bh=xvB8IhYRPSnbnj2uCIAQHzMiYpbNgO0dDpgbm6C1Dps=;
	h=From:Date:Subject:To:Cc;
	b=ODZK9b7wAy+7knSx5IdGq47OxYc/w6wlve6EX4WhEEofAft1dtcexWSkfUhq+/7G4
	 xmHel7e0ZkMNcepri9ctwPko4OE+uDGGjVIYfa2U+quHtXGNo2RzkoIjTHs8v4TrHZ
	 wbxiD2HbDSz+7T3SJOokPcpXsQ5lpMkV5wjMPxaOK6kAVKFZ7mU1jDM9ts/W+/YWYB
	 T7CIeqSyM8ze/TXw3XTE1O8tR8Iv1D8gFU6OoEWDX0vfFmPcvwFpFkk3gzrDPTHXaG
	 OodFbQOhiT1Pe6x+nj3Da+6fhoTZ+jz1NWCxQCN1iHGeWlTszHrrbantqG6LozlYGL
	 Zk6q0tBAEH31w==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Wed, 18 Nov 2026 18:22:10 +0000
Subject: [PATCH] MAINTAINERS: consolidate the memory mapping entries into a
 VMA entry
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-maintainers-consolidate-vma-entry-v1-1-8019b0e9928f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NMQrDMAwAvxI0V2CnYJp8pXRQE7kRJHKRTGgJ+
 XtNhxtuuTvA2YQdxu4A411cijaJlw6mhfTFKHNz6EOfYow33Ei0Ntgcp6JeVpmpMu4bIWu1L+a
 c6JoCPUMaoHXexlk+/8f9cZ4/533uRHMAAAA=
X-Change-ID: 20261118-maintainers-consolidate-vma-entry-ff6a360ab069
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Pedro Falcato <pfalcato@suse.de>, 
 David Hildenbrand <david@kernel.org>, Jann Horn <jannh@google.com>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, ljs@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5075; i=ljs@kernel.org;
 h=from:subject:message-id; bh=avC9Gd6INiMLB87wWgBdV52PLjJojmtRdMkvf72D52E=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLL+vnmgWPR1cTCT+oFt7iIvN3LJGa0y+FnwPdTQ7MAll
 YJd+WpNHaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZiIhyPDP8O/pyP+sR7RfHg4
 x5l7ncSVSU5yLSnfazdPuMCqeFxszQ9GhkuPDsx8nJ1QHFfockovemI1U/pe3ZCHvledC3ZKrpg
 4hxEA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Memory mapping entries were kept in three different sections in order that
those maintaining/reviewing each distinct part would be made responsible
for/cc'd on only those parts.

However this creates confusion as to what files belong to which component,
so simplify things by consolidating them into one.

Expand Suren's maintainership to the entire component, as he is a trusted
and valued member of the VMA kernel team and very much deserving of the
position.

Additionally, drop Suren's core and misc reviewerships in order to focus
upon VMA.

As David is receiving pull requests directly, make him a reviewer, purely
as an administrative change.

Also specify the new tree location in preparation for the tree being
established for next cycle, and remove the link to the not so regularly
updated linux-mm website.

Given that, from next cycle, the tree will sit outside of Andrew's current
process, remove his entry, also purely as an administrative change.

With that said, I'd like to take the opportunity to express gratitude for
Andrew's huge contribution to mm, and for his being both generous and
gracious throughout this period of change in the subsystem.

Co-developed-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 MAINTAINERS | 51 +++++++++++++--------------------------------------
 1 file changed, 13 insertions(+), 38 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..59496dd1d11e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17509,7 +17509,6 @@ R:	Lorenzo Stoakes <ljs@kernel.org>
 R:	Liam R. Howlett <liam@infradead.org>
 R:	Vlastimil Babka <vbabka@kernel.org>
 R:	Mike Rapoport <rppt@kernel.org>
-R:	Suren Baghdasaryan <surenb@google.com>
 R:	Michal Hocko <mhocko@suse.com>
 L:	linux-mm@kvack.org
 S:	Maintained
@@ -17680,7 +17679,6 @@ R:	Lorenzo Stoakes <ljs@kernel.org>
 R:	Liam R. Howlett <liam@infradead.org>
 R:	Vlastimil Babka <vbabka@kernel.org>
 R:	Mike Rapoport <rppt@kernel.org>
-R:	Suren Baghdasaryan <surenb@google.com>
 R:	Michal Hocko <mhocko@suse.com>
 L:	linux-mm@kvack.org
 S:	Maintained
@@ -17974,30 +17972,37 @@ F:	rust/kernel/mm.rs
 F:	rust/kernel/mm/
 F:	rust/kernel/page.rs
 
-MEMORY MAPPING
-M:	Andrew Morton <akpm@linux-foundation.org>
-M:	Liam R. Howlett <liam@infradead.org>
+MEMORY MANAGEMENT - VMA
 M:	Lorenzo Stoakes <ljs@kernel.org>
+M:	Liam R. Howlett <liam@infradead.org>
+M:	Suren Baghdasaryan <surenb@google.com>
 R:	Vlastimil Babka <vbabka@kernel.org>
-R:	Jann Horn <jannh@google.com>
+R:	Shakeel Butt <shakeel.butt@linux.dev>
 R:	Pedro Falcato <pfalcato@suse.de>
+R:	David Hildenbrand <david@kernel.org>
+R:	Jann Horn <jannh@google.com>
 L:	linux-mm@kvack.org
 S:	Maintained
-W:	http://www.linux-mm.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/vma.git for-next
 F:	Documentation/core-api/protection-keys.rst
 F:	Documentation/filesystems/mmap_prepare.rst
+F:	Documentation/mm/process_addrs.rst
 F:	Documentation/userspace-api/mseal.rst
 F:	fs/proc/task_mmu.c
 F:	fs/proc/task_nommu.c
 F:	include/linux/mman.h
+F:	include/linux/mmap_lock.h
 F:	include/linux/pkeys.h
 F:	include/trace/events/mmap.h
+F:	include/trace/events/mmap_lock.h
+F:	include/uapi/asm-generic/mman-common.h
 F:	include/uapi/linux/mman.h
 F:	mm/char-mem.c
+F:	mm/madvise.c
 F:	mm/mincore.c
 F:	mm/mlock.c
 F:	mm/mmap.c
+F:	mm/mmap_lock.c
 F:	mm/mprotect.c
 F:	mm/mremap.c
 F:	mm/mseal.c
@@ -18011,36 +18016,6 @@ F:	mm/vma_internal.h
 F:	tools/testing/selftests/mm/merge.c
 F:	tools/testing/vma/
 
-MEMORY MAPPING - LOCKING
-M:	Andrew Morton <akpm@linux-foundation.org>
-M:	Suren Baghdasaryan <surenb@google.com>
-M:	Liam R. Howlett <liam@infradead.org>
-M:	Lorenzo Stoakes <ljs@kernel.org>
-R:	Vlastimil Babka <vbabka@kernel.org>
-R:	Shakeel Butt <shakeel.butt@linux.dev>
-L:	linux-mm@kvack.org
-S:	Maintained
-W:	http://www.linux-mm.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
-F:	Documentation/mm/process_addrs.rst
-F:	include/linux/mmap_lock.h
-F:	include/trace/events/mmap_lock.h
-F:	mm/mmap_lock.c
-
-MEMORY MAPPING - MADVISE (MEMORY ADVICE)
-M:	Andrew Morton <akpm@linux-foundation.org>
-M:	Liam R. Howlett <liam@infradead.org>
-M:	Lorenzo Stoakes <ljs@kernel.org>
-M:	David Hildenbrand <david@kernel.org>
-R:	Vlastimil Babka <vbabka@kernel.org>
-R:	Jann Horn <jannh@google.com>
-L:	linux-mm@kvack.org
-S:	Maintained
-W:	http://www.linux-mm.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
-F:	include/uapi/asm-generic/mman-common.h
-F:	mm/madvise.c
-
 MEMORY TECHNOLOGY DEVICES (MTD)
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Richard Weinberger <richard@nod.at>

---
base-commit: 0c524518413094607a6178c53a65815762bc9c45
change-id: 20261118-maintainers-consolidate-vma-entry-ff6a360ab069

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

