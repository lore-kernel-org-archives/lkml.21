Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795463703;
	b=o+RJeo7jypLlCuDiAi1BUO9WSaAgIiruCW29zwC3GRGAFtSiDbZ0e6XEwSC+Rwtf5tYC
	 sbvEKddVpTUX78zjtkqsY44u29PhKHt+HCXV5fp34GffvGH+q6z4Lu8Zfpf8xZavQk5kz
	 RtnsjVWtu12uQg6CRyxtLPxLPSpDZZlAZIt+J2f6vEN4hks4u3ZoX+LnO1Qx4kur7XpEI
	 VanSTvwAsBN7H8ZI82b5JmOgf8EL00CYHlsRZQUDYBocybaVgwMoeJORsWEdziLsahlku
	 hvlvGK3GKDBOIgeXyZ0EpHI1tvAF3wKaof2uNUvQGF15hBcyLH60AG+xlFIp380EAaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463703;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eWUWFxVepb4D7hTC4wy3oVHuVPV1UHqMcMs5ZrhqlbE=;
	b=39cbtxsLlLAAbVEQvfK5V33ZKLWDhFsCpAprLpkv9o/32aRGVrRhx+blZNvoVdVDWe6Y
	 Nkxzqp8TEUfDlm5twAoXayIJeBk8qpjhnaExkBjso0trCkyAoGEd+P6KbSU0qvbOxLKG/
	 ft9LjsJNghLjW0mGYuCrjZ7j49EGzrI1BP7KihqTYNxEy+1DLA6dzFxy3IaD70hkDMlEl
	 vz3RV3WiEbj0PDlt5wv+dY+/CnXDXQubKtRs5LBDiiteyOBcU795ku4C7JLoAmMIqnm8p
	 Ex7miJCvgiGGJaqAsjkOJfjhIL2BpFv/SZRiZRaVrVnq63mKIXh5Y7wOo32LvOV9FWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KluVWlhA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733C5606A335
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KluVWlhA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795463703;
	b=Ib5fAJYkC586pQSoDqTDZmDSGEyL9KBZvH9P9MbAzaEO04wO6sfq8BkQAVjmajMjd7Az
	 h/k5Y0wEpVlwhmFVN37e5EBlmEHdOTTImqt5mfOOJWvHQW4rCbHogdHIzMKBoIBMrCo8R
	 /BMg/qWs0adPP/oO19/f1Z1pq29/qfqeI/JTshxhoc+/UWxUil/bUlE68V+6HPtZQoacg
	 vEwEhmfv3YXB8NQl8d1MpoD88bxyKQYs7W0XK0BKEeS/K7ZKyZ2077DO7Y2wX2jy//NoS
	 NLm+gaYyOez/c1VsWPUMkcT4I3HRAaJLjiTwhELGUnYqZVJKkqT54idlsK5gkPNJwFw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795463703;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eWUWFxVepb4D7hTC4wy3oVHuVPV1UHqMcMs5ZrhqlbE=;
	b=obuUhf3FQPAdswF6ylECJl3G48il9QFsU8rCTElrIXaz5T152a+hI++PfiJNN4uIYr7Q
	 LO3AsS3bxgUw8zD+h/eIbmF+AiNVekvgP5tjjO0MjPcoE/lmBv6ryqClYaODCSa71jpsa
	 Esfi7HZDGE9cZskrKEwQHaofipKSZJiOMfMXWwDxN3oLYKE6PKHMBsuZQOdUN8xPFwfNS
	 08VfGO063F7iIxjPo6iUK+yXxJZ7iPcZAyBHZ/wTsnlNAfluuQQoDfG/4Ywz5nk9/yv1V
	 suYDONCezbFoolj1B6iBsKpLpVTWQ1P1258Mlpcf0I6Kyjz51firKQdqfGdKX9UM2Nw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE28E1F000C0;
	Mon, 23 Nov 2026 19:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795463703;
	bh=eWUWFxVepb4D7hTC4wy3oVHuVPV1UHqMcMs5ZrhqlbE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=KluVWlhA9PZj/fVzWKTiqnlx7wIXhomQipoWkrPf2eBiKRkxC1WNc4nlNoqppEsyB
	 oCHh+y80SkS6y4k9qJWxzkufsxJeq276QuE088p2zF3bhfJUGpuEMykhyL9XT/rjs/
	 mxBoyClKXcdz8WYercEtfXftR/OzBUs+lX9xJn8GpkaGQAyj5nhU+plE9U+Li7h8Uk
	 Jc+oQO5E8LUuZ24kXviolICUn5dfc453y1GJbLPrsNz2r5FotdPw1UITse+EOFeCMc
	 TtPq6a0luO4ICrW6tvjFreIpHIOzHMV+E3OBtz7Y7vcghTdEjXg1CQ1iTBfhHuuQjO
	 dDVkQ1Rc1Hv5A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3BE8F4C684;
	Mon, 23 Nov 2026 19:54:51 +0000 (UTC)
From: Samridh via B4 Relay <devnull+samridh.modal.com@kernel.org>
Date: Mon, 23 Nov 2026 19:54:44 +0000
Subject: [PATCH v3] mm/shmem: avoid zeroing new folios twice with
 init_on_alloc=1
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
Message-Id: <20261123-samridh-shmem-send-v3-1-afc6a40bc187@modal.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/32NQQ7CIBBFr9KwFlOmsaWuvIdxQWEQjBQDlWia3
 l2omy6MmdVL/rw3k4jBYiTHaiYBk43WjxmaXUWkEeMVqVWZCdTQMsY6GoULVhkajUNHI46K9lq
 B4tAw5Ejy4yOgtq9Ver58OT6HG8qpmMrC2Dj58F6riZXd30BiNN/A+07rQwuqPzmvxH0vvSMlk
 GCr4D8VkBUaUNRs0JJ1fKtYluUDWdpTfAkBAAA=
X-Change-ID: 20261117-samridh-shmem-send-9fd2d8231e8e
To: Hugh Dickins <hughd@google.com>, David Hildenbrand <david@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Samridh <samridh@modal.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795463691; l=2736;
 i=samridh@modal.com; s=20261117; h=from:subject:message-id;
 bh=cB/X49bEfE/YxcJEqpPRK906snRfTv9QZQXwDDpM5iE=;
 b=X7wVMmGKz2duhlMnJ04dtKau0IR8o6b1Ll9s74xW0fdxBH9twRT/0YfQ2a17/8K0DQ5WSQwi+
 YgdAKfD3sxwDryqlYQJ+siJqBn8QdQwCWuav/MgO5qy373b6KQmohSj
X-Developer-Key: i=samridh@modal.com; a=ed25519;
 pk=+V5ZaIpEMOLG1b2MsSHY0Nm20lIADx5ia//FZeuqVgk=
X-Endpoint-Received: by B4 Relay for samridh@modal.com/20261117 with
 auth_id=1554
X-Original-From: Samridh <samridh@modal.com>
Reply-To: samridh@modal.com
Content-Transfer-Encoding: 7bit

From: Samridh <samridh@modal.com>

shmem_get_folio_gfp() clears a new folio before marking it uptodate.
With init_on_alloc=1 the page allocator has already zeroed it, so the
folio ends up being zeroed twice.

Skip the clear for a folio that was just allocated when
user_alloc_needs_zeroing() says it is not needed, like anonymous memory
does. Folios that are already in the page cache but not uptodate, such
as those left by fallocate(), are still cleared, and so is every folio
on CPUs with cache aliasing.

Time to write one byte to each page of a new 4 GiB memfd mapping, with
shmem_enabled=always and init_on_alloc=1 (median of 24 runs on 6.18.55,
x86_64 VMs):

                  before   after
  Xeon 6975P-C    0.625s   0.420s
  EPYC 9R14       0.216s   0.160s

With 4K folios the times change by 3% or less, and init_on_alloc=0 is
not affected. We found this while running gVisor, which keeps sandbox
memory in a memfd.

I wrote this patch with help from an AI coding assistant (Claude Code),
then reviewed and tested it.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Samridh <samridh@modal.com>
---
Tested on 6.18.55 with this change backported, on Intel and AMD x86_64
VMs, and build-tested on mm/core for-next. A simple test fills memory
with data, frees it, and then checks that new memfd pages read as zero,
with MADV_HUGEPAGE and MADV_NOHUGEPAGE on the fault and fallocate paths.
It passes on both machines with init_on_alloc=1.
---
Changes in v3:
- Move flush_dcache_folio() into the clear branch (David).
- Link to v2: https://patch.msgid.link/20261118-samridh-shmem-send-v2-1-f2ea01bfc178@modal.com

Changes in v2:
- Use user_alloc_needs_zeroing() instead of __GFP_ZERO (Baolin).
- Link to v1: https://patch.msgid.link/20261117-samridh-shmem-send-v1-1-1b897ff562d9@modal.com
---
 mm/shmem.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index c769d0bc7df9..0ab3b9146141 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2810,9 +2810,12 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
 	if (sgp != SGP_WRITE && !folio_test_uptodate(folio)) {
 		long i, n = folio_nr_pages(folio);
 
-		for (i = 0; i < n; i++)
-			clear_highpage(folio_page(folio, i));
-		flush_dcache_folio(folio);
+		/* init_on_alloc already zeroed a new folio. */
+		if (!alloced || user_alloc_needs_zeroing()) {
+			for (i = 0; i < n; i++)
+				clear_highpage(folio_page(folio, i));
+			flush_dcache_folio(folio);
+		}
 		folio_mark_uptodate(folio);
 	}
 

---
base-commit: f7d95bf74091373fad7273db4557df9b5a902335
change-id: 20261117-samridh-shmem-send-9fd2d8231e8e

Best regards,
--  
Samridh <samridh@modal.com>


