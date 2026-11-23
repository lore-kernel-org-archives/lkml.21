Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447401;
	b=oHNULopczLEAKSywOY5LCyw2guSXRjgm2TuqoTjwDMMcgCNuDc8BqPt8B2TcMkgZHuvo
	 AiR8bDusdrSTWJn7Fdez/sq9zr6PsmxPH3dzCsZTi9CSS7ML3xKa3+OPNwSWoNsCmHRi9
	 dTEbgraGeBWZzSJW9Rfw4V4a6CDyC6a5MH5JWchKA19VruRoqcivA39l53mqU8mvELoJl
	 92RbaDAZKzkmAuQ45BaCrIXazi+W9uEgSaqgnSaxQcS4c9GbVsZ7Ql6/+ndXFSosJY+WX
	 Ha1bdED6IQTCPPppS9nR5aWlXzoiHzIxlwYBXTO6tqOQEHcslqz+YQpF7sem9PPJkzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O52/z45+638cNdNcb3gm/OrMOWWSLJyJAuo7deVUGvc=;
	b=IC5PTgerl3i68Q1Xjed8SNKrPrzOMuozmRJIvWjcQDU3S6r1+JXO075hX1+cMjHw9gG6
	 T+BAYJ223NxiCvf2EB6EZkBQ/s6jV8yzTvnsNoulwLBNeFqOkTmHyyrEKSpkJZhBP89td
	 6MuuHUjToTjtbfBMM24X/zH6cjs1TaI99i5AW/YicE/VAgh+5xtLLQ0kyqnKnxpItU+cZ
	 xM2molhSXZYzIZeQWRM4DEeEboOFOk3rKeH2XDD/yAMoEx0bQZrwbf8uPgS6Ak6XQlpIS
	 RFYjKLmMqsSC9d9GVmwzq2oEAQsv+6Sxj96qlf/f3dWr6KQIjsR4fNGBSL/r6UpdcIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KVL1GDfI;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A8F606A336
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7A8F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KVL1GDfI
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso1417127a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447400; x=1796052200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O52/z45+638cNdNcb3gm/OrMOWWSLJyJAuo7deVUGvc=;
        b=KVL1GDfI18zdnOh+Yc6Bt+V11QXiheQG4r0JfdF8uyxyNkQOhPCOPBC5QszON25gqA
         ieci3YNt0q+wQ+LR3C6O6u/Ww9XUp3ccAHaFrK5z1ZrB6FO1UJHUyQR/tPuSVrmL3iNe
         RIyQdunp4pWPJ9IGKt6yzAjFy8ZjyVELQYQ3KQO5UCNLkfmbBcF19AiLQEPbFR9EM6qP
         TapJR5nGcPRT8+GYM31Ime9hcJQoFirFh8lG9TUvwd8E0jGSOVRvu7Urk/O6FQqqypAl
         1qS0A/+XHqVa68ix4TePYmwYkuYJ5yXcA1yGgBMCtTj2fj8aDMxb+MoNYL4v/KVukwDr
         MBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447400; x=1796052200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O52/z45+638cNdNcb3gm/OrMOWWSLJyJAuo7deVUGvc=;
        b=1W0lT1lH7qgLbnIemUpcQHVcv4KEf0oqVtlY6LHR5YlgPzaQpDRBVUSfAIRWVQA7tt
         3rHZoUlQtMj3rQfEKwQYflpYWL3GvvtGImvy020KxkXU8K7cdA4hKnuPn/dRPe+1N8pa
         A8KNSOfVjI3vaXNS5/xiwEHW6N36GBTBIRHQJXWoWsbCJEwUF2tNDdXdO1puxa1zj5N8
         P8B7vVkA1S05LhuRMv3V2s+lsfkNqYB8aeNdzr6qPkTFkjM8zq2etZ6pdYVWx/1IiDAy
         REaUYNvt2HYcV7MTAv4BY8kciG/PrdZ/O4Cqjd90pzQYucgRvmhdOSVaTQjSTwv4mezH
         0PAg==
X-Forwarded-Encrypted: i=1; AL+hErHId/eqWeyRhzehFpJv/asWVjRL7n2LZSHNLf2owtcvSI//kDSZR2XNkmJ1yfTQJ8eS/+IR2qCIKc4PdMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LPBK0YgN6WjEDzsZA+uEET+dS99JlvPThM+XGpm8wpg/AMeqg
	4kcYrgeSnNQUOIoO2H1Q+3GJZWhWGG9bju9DPc99x/MAjR55CHY2erfN
X-Gm-Gg: AZFdTZfP7fGb1QpfEpsXQj5+BV4a6wBwIxzQ3gDR9OE+7yZWdr/oOEkcB8og6kMUYsb
	9xE9V9iLtLEWmCNxwGCM8p3iK9bcxktfZcac+1wMrV623M/TTWsJRa9+/kaVBpkIV1hQcy7+od/
	kp/5A89n0XfmENz6F1z3SkCABNCEkpCgsPLO1OnepUgdeB4bG9kfuffsTZ9wzOU7cEhz5z/BRfh
	qh0t4G6qN0t0EpKVxxaLXsOD4hmj3IGpozpU7ycV1EMzmSvjgUCaBkrdmCkRYGFCciQV0vDCTfX
	hDP3Bng+mgoqPVhICNtlRNrg0atgn1ZlpTsneooG8Ab9upQrQb45L32Swpof9CP9jfuEPGqlw+l
	XRCwLQ3HoO5Cj+DCXlQ6SC7LFCYMNobmxiyTjGDMAYYiWC9M/24G8Wka556ZEmze8qf/6ultiNW
	spsgWruvj2cVj6YMX99NxxYgPxCft1ZiQZERBP0erHcvcAb8Nbi7EQLwTWfjubq6rEG2oOh3/mm
	D3q2o/m/E4fN9l1TaeKLeCzBAXzu/RtgzFwD4nC4SMwtIYAKDYFku1GOWjRXDKKt58lmqflO0Ig
	TfPoOxcfuT1nRMF0AdfRaNNshUH3g9A=
X-Received: by 2002:a17:90b:3810:b0:3b1:bee2:223d with SMTP id 98e67ed59e1d1-3b41c9bc27emr10778729a91.53.1795447399920;
        Mon, 23 Nov 2026 07:23:19 -0800 (PST)
Received: from thangnn-ASUS.. ([2a09:bac5:d452:16c8::245:e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm19145548a91.1.2026.11.23.07.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:23:19 -0800 (PST)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Breno Leitao <leitao@debian.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+527fed49e5b988882c9a@syzkaller.appspotmail.com,
	syzbot+4d078516add5f4f12cea@syzkaller.appspotmail.com
Subject: [PATCH v2] mm/slub: don't let kmemleak report rcu sheaves
Date: Mon, 23 Nov 2026 22:23:13 +0700
Message-ID: <20261123152313.359601-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113151837.123795-1-ngocthang2710.1999@gmail.com>
References: <20261113151837.123795-1-ngocthang2710.1999@gmail.com>
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

kmemleak reports sheaves as leaked:

  unreferenced object 0xffff8881009d4e00 (size 512):
    hex dump (first 32 bytes):
      b0 7e 81 2d 81 88 ff ff 60 bd b3 81 ff ff ff ff
      00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00
    backtrace:
      __alloc_empty_sheaf mm/slub.c:2854 [inline]
      alloc_empty_sheaf mm/slub.c:2874 [inline]
      __pcs_replace_full_main+0xf7/0x330 mm/slub.c:6094
      free_to_pcs mm/slub.c:6147 [inline]
      kfree+0x353/0x390 mm/slub.c:6923

The same happens for sheaves allocated by __pcs_replace_empty_main(),
__kfree_rcu_sheaf() and kmem_cache_prefill_sheaf().

The second word is rcu_free_sheaf: the sheaf was handed to call_rcu() by
__kfree_rcu_sheaf() and is waiting for a grace period. Sheaves are
recycled between the pcs, the barn and rcu, so any sheaf can end up
there, no matter where it was allocated. While queued, the only
reference to it is the ->next pointer of the previous callback.

That callback often lives in memory kmemleak never scans. kmemleak
itself frees every kmemleak_object with call_rcu(free_object_rcu), and
those come from the SLAB_NOLEAKTRACE object_cache. struct slab of a
SLAB_TYPESAFE_BY_RCU cache pending rcu_free_slab() is another case, as
slab pages are frozen and skipped by scan_zone_pages(). The chain from
rcu_data is cut, and the sheaf, typically old, looks unreferenced. Since
it is then not scanned either, the objects it is about to free can be
reported as well.

Making kmemleak follow rcu callback lists would mean digging into rcu
internals and would still break at any untracked callback. Sheaves are
allocator metadata, always owned by a pcs, a barn or an rcu callback, so
mark them with kmemleak_not_leak() instead: they are never reported but
still scanned, so objects queued in them stay referenced. Allocations
that can't spin are not tracked by kmemleak, so skip them, as
alloc_slab_obj_exts() does.

Fixes: ec66e0d59952 ("slab: add sheaf support for batching kfree_rcu() operations")
Reported-by: syzbot+527fed49e5b988882c9a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=527fed49e5b988882c9a
Reported-by: syzbot+4d078516add5f4f12cea@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4d078516add5f4f12cea
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v2:
- Rewrite the explanation. v1 blamed struct slab, but in my reproducer
  most reported sheaves are queued right behind kmemleak's own
  free_object_rcu() callback, whose kmemleak_object comes from the
  SLAB_NOLEAKTRACE object_cache and is never scanned. struct slab
  remains another possible break, as Catalin pointed out.
- Comment: "e.g. struct slab" -> "e.g. its own metadata".
- Also fixes syzbot 4d078516add5f4f12cea (sheaves allocated by
  __pcs_replace_full_main()), same root cause.
- Rebased on v7.4-rc4; applies to next-20261120 as well. There,
  sheaves of SLAB_NOLEAKTRACE caches are not tracked, and
  kmemleak_not_leak() on them is a harmless no-op (paint_ptr() ignores
  unknown objects).
- Code unchanged otherwise, so I kept Catalin's Reviewed-by.

v1: https://lore.kernel.org/all/20261113151837.123795-1-ngocthang2710.1999@gmail.com/

Tested in QEMU (syzbot config, 2 vCPUs), stalling a grace period with a
preempted reader on CPU0 while CPU1 queues rcu_free_slab() and
rcu_free_sheaf() callbacks, then running kmemleak scans:

  before (v7.4-rc3): 176 reports, 82 of them sheaves (allocated by
          __kfree_rcu_sheaf, kmem_cache_prefill_sheaf,
          __pcs_replace_full_main, __pcs_replace_empty_main), the rest
          maple nodes held by them
  after  (v7.4-rc4 + v2, 4 runs): no sheaf or maple node reports.
          5-9 reports per run remain, all from a single exited task
          (task_struct, pid, creds) waiting for its RCU callback. Same
          kmemleak blind spot, not sheaf related.

 mm/slub.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/slub.c b/mm/slub.c
index 5c33d12470601..ed52c1c5d31da 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2856,6 +2856,14 @@ static struct slab_sheaf *__alloc_empty_sheaf(struct kmem_cache *s, gfp_t gfp,
 	if (unlikely(!sheaf))
 		return NULL;
 
+	/*
+	 * A queued rcu sheaf may only be referenced by an earlier rcu callback
+	 * in memory kmemleak doesn't scan (e.g. its own metadata). Never
+	 * report sheaves, but keep scanning the objects they hold.
+	 */
+	if (alloc_flags_allow_spinning(alloc_flags))
+		kmemleak_not_leak(sheaf);
+
 	sheaf->cache = s;
 
 	stat(s, SHEAF_ALLOC);
-- 
2.43.0

