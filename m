Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=93.77.172.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960038;
	b=1Yw4BRGYFMYkvkdJN0o6oBbY9aEYGtF5PCV6KR72Aqtiivs913iZNAVUzAhvxeuPS5pD
	 IpF5PQZhY2WoVI6MFZM8/HeG7kcmaKza0FSGUonwjBsZDVo/jjlUGnK3uEVgnx8euCdUx
	 kWybDrQ8tEbR891kYxfby71CF0MeWuPiWbgLR9q3RLBrBIzjd7Zf5eJW0eGUuGEYjtOEe
	 fsKAaAbdme6jSP/SZerzNZYtmZm0I4tJukL6lriAQTQZe1HXShuZkqruwOX4hVkGoeLds
	 Y2Xmm7PCjM1cOM4bm7qDkYWw3O15Oh4ZRPFW3qi26l6PPhVFqnBwBQzx5k43moDfC1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960038;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7IO9qqU3wnMoibykZ1N5l5PPq7ErE0eqGwekZqMRpqE=;
	b=irHOgWWPbaFJ8FjLOFm5Dgd8zZBQyPIACBRKABGgsIsy0RPPcgArv4JB5tt/lToV6avO
	 lc4eQrxVmQmE7BMHncKD0G2RyZCOWu0lkt5S58131hk9n8WfoMmF0rCuRORXNoGDDSpiE
	 jOdB+WBRQMzMbRtJkmTe7+ruq+NTyH5WmWJfQPx2EtyN47JB8E4fO6FZ2c79ElQElPs0A
	 jrGceR6KxOKRCcCZUmhOfIT5inAvjidBCjXglF1E0549cSs8AfVHFZIlZsG/rLzi1KMOQ
	 Dkp1yoOHmNpRQ1YWS4/kaJ2i84jglm7G2oLwYP39kvC1ryEwEOyAv3Q4rQxAnIF5sCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex-team.ru;
	spf=pass smtp.mailfrom=yandex-team.ru;
	dkim=pass header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=L6u3caU5;
	arc=none smtp.remote-ip=93.77.172.5
Received: from forwardcorp2e.mail.yandex.net (forwardcorp2e.mail.yandex.net [93.77.172.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5DA606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E5DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=L6u3caU5
Received: from mail-nwsmtp-smtp-corp-main-80 (mail-nwsmtp-smtp-corp-main-80.yp-c.yandex.net)
	by forwardcorp2e.mail.yandex.net (postfix) with ESMTPS id 52195C0053;
	Wed, 18 Nov 2026 03:00:27 +0300 (MSK)
Received: from i101646577.yandex-team.ru
	by mail-nwsmtp-smtp-corp-main-80 with ESMTPSA id L0NFxU0Yj0U0-eYG64ehH;
	Wed, 18 Nov 2026 03:00:26 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1794960026;
	bh=7IO9qqU3wnMoibykZ1N5l5PPq7ErE0eqGwekZqMRpqE=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=L6u3caU5HDhbgq9gNGbkegT7GZ25C9gWnv+Cczano/c6tPTYjfBNCFO13jqGgR/eS
	 igXD0bTj49EYDSYLvCJdgkuxvgy1atUs4tZBB6pwYj5x7WF4NJd5NM879JF4b8tAG+
	 fxYbTCVTregpSMs+qUzBJW4gqBP1Ubu03nVdCyOk=
Authentication-Results: mail-nwsmtp-smtp-corp-main-80; dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>
Cc: Daniil Tatianin <d-tatianin@yandex-team.ru>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/page_alloc: don't undo another caller's pageblock isolation
Date: Wed, 18 Nov 2026 03:00:13 +0300
Message-ID: <20261118000014.1474617-1-d-tatianin@yandex-team.ru>
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

start_isolate_page_range() fails with -EBUSY when a pageblock in the
range is already isolated, after it has undone the isolation it did
itself. Commit 2c7452a075d4 ("mm/page_isolation.c: make
start_isolate_page_range() fail if already isolated") made it work this
way, so that users of overlapping ranges, such as CMA, memory offlining
and gigantic hugetlb pages, can use pageblock isolation to stay out of
each other's way.

Since commit b2c9e2fbba32 ("mm: make alloc_contig_range work at
pageblock granularity"), alloc_contig_frozen_range() handles this
failure by jumping to its common exit path, which calls
undo_isolate_page_range() on the whole range. What is still isolated
there at this point belongs to the other user, so this takes the
isolation away while that user is still working on the pageblock. The
page allocator can then hand out its free pages again.

Return right away instead, like offline_pages() does when
start_isolate_page_range() fails.

Fixes: b2c9e2fbba32 ("mm: make alloc_contig_range work at pageblock granularity")
Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 mm/page_alloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 12fac9084c48..151a8d64783d 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7335,8 +7335,9 @@ int alloc_contig_frozen_range_noprof(unsigned long start, unsigned long end,
 	 */
 
 	ret = start_isolate_page_range(start, end, mode);
+	/* After a failure, whatever is still isolated belongs to someone else */
 	if (ret)
-		goto done;
+		return ret;
 
 	drain_all_pages(cc.zone);
 
