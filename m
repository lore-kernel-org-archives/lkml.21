Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581233;
	b=f1rySE3jYs9iJXWTQNW4Lz30d3Xy0nmY5nu9j53g6QIywSxoPfkIPPY+mRfHBnK9mW7U
	 /IFLqwdNB0pZNQiLBPIhTzo41vIia/Ir5bz8109hpYvYqGDSppbG36s5Na3Z7CWk8Lil+
	 c/1dffsXrLPIMw5i6sUXoCJoXG83/HxhG+ctdAkac1FNykIrJSoAuX9nGG2LDzDRrCaOk
	 gKa7JC3MNYDzRt8eP1DJ8fZapZ8aIEwa/uGFnAaiT5G59F5h4xPy6aQjOX3rZ7dD8l0O+
	 22K8q7jsYX3/aM2QKHDrKsDRtoaeVGZwQPoVNZ9CtGQ8GDWIaHRdb3HTpuYb0SNM+8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nGV6vXIx2nCuawVENtjX7nzz4BQ1mz6pDnhMOsUydxs=;
	b=pV1bb+wp8ZW/V6todJso6MGgJ3i6Uyt3kZTmdGoYeD7X0yharKkosaUz7Xk3kQpyZXG7
	 4n3J9cx2SqIaNN+QbJ4QKyRHMLeOq1A5skQgolr5P8fa6JBCVJ4x0clk8L0VAHbBO0JN8
	 2zFncdSU/3b3z5/QT3sfgHbnsEoGJCfCs40RtIGBtmlUsLMWOY8LDs0w+qhAkQrLvrvOk
	 jVV9U93b5U2jRkZZEb0n0YIppRzBpSK5H7avsH/hP+KpXUBPSlDEMxThjm4+r7xHylrsS
	 PIOO7OHlu3bjTLwskWvgIXPdnb/gSGfzcGHAHy2fHrg/I0X0jYobP0p4JKKeaVbRuJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ju4L/+fS";
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE72A606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE72A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ju4L/+fS
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so3060001b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581232; x=1796186032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGV6vXIx2nCuawVENtjX7nzz4BQ1mz6pDnhMOsUydxs=;
        b=ju4L/+fSXOUBLJGTQiiV0B7dYUdEU24qOysFNiTHF37O8P1S4DP9hWnZ0bHwYrLyuL
         JIhZylD8pJZWoOxDreqcp5XxisReEv/PJejDQ3CNkrmp69xMY/YwpIi7e/63VsorSc4k
         H9IZYYSBn08K7DhPVZsSWoy7ZyE5jAO5uo1y7sz+OFHstDD5WbkvUMiPiOw7kaNlhZqE
         +WzzFp1d9OKS+arWESOb9ZLK8GwuZ7lbe8+v1tVWUlM05SlY2cF4VGmQJeA0qOcmug5L
         NI2eSVjDhcHbKrvoV0uAT/rIUvHs/DYqLyhT4gDv/KeKlL79W6qkrAfDukrMl5IkV37A
         3KkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581232; x=1796186032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGV6vXIx2nCuawVENtjX7nzz4BQ1mz6pDnhMOsUydxs=;
        b=vXelmFFupklsmy0/y1VExCDOfZE7ONpLX2ex0b8sBZ/XYjPUy8vayMGtdXP4H/XdQ0
         ke63c3SsDejqcycLX1pLiNMwnAw0JVZSSEy2e7CVVxuZRRCibd2Di5HR7j3l1tS/HeT8
         U8rvCwGWs2/Ky/KNnErot4yzyjKJWE3IuCuMYFVglG2ErPtzWlCmPeySga8v6QHNOfic
         qWqL/jpXq6zFcuAJQlLspiKhMqUsfGSZ3Q9HNUYt/S4WXdGbU2jVQRoM6HwfOxTpd2nh
         TgdrmzzIsUjc6QlBG48skN3o4Iv9wL9kH/viVUYpwKrqboD/4yowSGAY2hocJ4lLXgpi
         rSFw==
X-Forwarded-Encrypted: i=1; AL+hErGHma2jfMW1das1DNP98TNB4Wr5h+pHq4y3hLY5vx9fjRJ7X8L6Sr0lOE66+7STEV58Yi+yYI05SbZedl0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ou+VL7l7flp171xDorz4N++0i4590xpqJvvVmrTk7V0aB7ZBC
	gHrlDiyLafGU+4D4wiyhVv46BwJdku8cPLhW6blckpqD7X5TDDm8imUU
X-Gm-Gg: AZFdTZc6X66VGNqjZA8BpTwJ5EDH4k84aslqlvJZ3UYqIPEAF9YFHsFKTzThyCHN2iz
	ynp/Sa6NKAtJ0yGSRgbuVkwwYBSVW/OF/gEPTvVO69ZXfzLDucooM8IlGJqIiCS9YFHaoEU6tA7
	v/UypGJCjOkYz42M5s1Gv9Dv6JG+tT9BQJSAE9vibs320ftig/SHOR3yjpdcNp7O7cSig7pvH54
	+XrCvPEy2O6qFcZgoPIc8xj1QX+0U1NLgwE3uM6HrTofJZgeB3SYNjYCC8Wg9QAD/aVlsqJ2qcR
	8KHTHmrdcfKWWNyrgeLnDUPgPYdXWx4enXU70MxWe07JxiijmQscH6UhZG447X9BCTI2Su1LhnV
	/8nv1+3JYEiLpCTodddZbctc7KHdIJWzA8EolrJDpBDLuGoGo4pEJZAmy+yvhK6pbI3og5YRg68
	MxkfFI6Ip9fybpw8nRVmCZ0K9dqj1xIyw3vCvitHrdHPFe3WmYVzgeVhpnMMvLHEAlx8LsAoK7z
	WYzhNK4xGeeoRHTb+5bQhnjDgcPpOlMGcgBXZyRFrqNrevdez2iUg8PUOUcgjf2/hNC1K94D1xX
	SCVbj5kO1ySRU8yvN4lNnt68W0Yo+WCke5uUnMHWjFGFVqajKl8+UhZy1vAiyYye8H6CB2jyBt+
	XzC1a1hDvUI8Q1+ZYQ0faZWwW0O37PZe3b1YRHM7GhrYX5U6gq5cwcIUNYm31GD6JLCyBpPsc4R
	O7Aet4rCCG4GXH9ik=
X-Received: by 2002:a05:6a00:a24e:b0:8b6:33a:a4ed with SMTP id d2e1a72fcca58-8c87d3272aemr16506487b3a.55.1795581232166;
        Tue, 24 Nov 2026 20:33:52 -0800 (PST)
Received: from yupeng-XPS-15-9520.. (c-73-169-192-12.hsd1.wa.comcast.net. [73.169.192.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm8528812b3a.36.2026.11.24.20.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:33:51 -0800 (PST)
From: Peng Yu <yupeng0921@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: Joe Thornber <ejt@redhat.com>,
	dm-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Yu <yupeng0921@gmail.com>
Subject: [PATCH 2/2] dm thin: add wait_for_commit pool feature
Date: Tue, 24 Nov 2026 20:33:25 -0800
Message-ID: <20261125043325.138351-3-yupeng0921@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125043325.138351-1-yupeng0921@gmail.com>
References: <20261125043325.138351-1-yupeng0921@gmail.com>
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

Add the wait_for_commit option to the thin pool. When it is set, a write
or a discard will be completed after the metadata changes are committed.
We perform the actions below to make sure of it:
* In the worker, a plain write is treated like a FUA write for the
  commit.
* On the direct path of thin_bio_map(), a write to a mapped block whose
  device has uncommitted changes is handed to the worker.
* A write that covers a whole new block still sends its data at once.
  Its completion waits for the commit, similar to a FUA write.
* A discard will wait for the removal of its mapping. A discard may
  remove multiple mappings, and the discard will wait until all these
  mapping removals are committed.

With wait_for_commit set, every plain write fails after a failed commit.

We change the version of the thin-pool and thin targets to 1.25.0.

Signed-off-by: Peng Yu <yupeng0921@gmail.com>
Assisted-by: Claude:claude-opus-5-5 [Claude Code]
Assisted-by: Claude:claude-fable-5-1 [Claude Code]
---
 .../device-mapper/thin-provisioning.rst       |  25 +++-
 drivers/md/dm-thin.c                          | 116 +++++++++++++++---
 2 files changed, 122 insertions(+), 19 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/thin-provisioning.rst b/Documentation/admin-guide/device-mapper/thin-provisioning.rst
index b2fa49a5608a..8c5fdb1475af 100644
--- a/Documentation/admin-guide/device-mapper/thin-provisioning.rst
+++ b/Documentation/admin-guide/device-mapper/thin-provisioning.rst
@@ -138,6 +138,19 @@ means the thin-provisioning target behaves like a physical disk that has
 a volatile write cache.  If power is lost you may lose some recent
 writes.  The metadata should always be consistent in spite of any crash.
 
+With the wait_for_commit feature a write or a discard whose thin device
+has uncommitted metadata changes is completed only after the next
+commit, so the mapping of every completed write is on disk.  Commits
+stay batched: the pool commits once for all the IO that is waiting, and
+IO to blocks whose mapping is already committed is not affected.  The
+feature is for a pool whose devices another node takes over after a
+crash: that node starts from the last commit, and a flush it receives
+cannot cover what the crashed node completed.  It costs a commit per
+batch of allocating writes, and every device of the pool waits for the
+metadata lock while a commit runs.  After a failed commit a pool with
+this feature refuses every later commit and fails its writes until it is
+repaired, because a later commit could not be trusted.
+
 If data space is exhausted the pool will either error or queue IO
 according to the configuration (see: error_if_no_space).  If metadata
 space is exhausted or a metadata operation fails: the pool will error IO
@@ -291,6 +304,13 @@ i) Constructor
       error_if_no_space:
 	Error IOs, instead of queueing, if no space.
 
+      wait_for_commit:
+	Complete a write or a discard only after the metadata changes
+	it depends on are committed.  Writes to blocks whose mapping is
+	already committed are not affected.  Data durability still
+	needs FLUSH or FUA, as for any device with a write cache.  See
+	"Updating on-disk metadata" above.
+
     Data block size must be between 64KiB (128 sectors) and 1GiB
     (2097152 sectors) inclusive.
 
@@ -302,7 +322,7 @@ ii) Status
       <transaction id> <used metadata blocks>/<total metadata blocks>
       <used data blocks>/<total data blocks> <held metadata root>
       ro|rw|out_of_data_space [no_]discard_passdown [error|queue]_if_no_space
-      needs_check|- metadata_low_watermark
+      needs_check|- metadata_low_watermark [wait_for_commit]
 
     transaction id:
 	A 64-bit number used by userspace to help synchronise with metadata
@@ -354,6 +374,9 @@ ii) Status
 	value internally but userspace needs to know this value to
 	determine if an event was caused by crossing this threshold.
 
+    wait_for_commit:
+	Present when the wait_for_commit feature is on.  Absent otherwise.
+
 iii) Messages
 
     create_thin <dev id>
diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 358ed77ffb2b..93ce83674c63 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -220,6 +220,7 @@ struct pool_features {
 	bool discard_enabled:1;
 	bool discard_passdown:1;
 	bool error_if_no_space:1;
+	bool wait_for_commit:1;
 };
 
 struct thin_c;
@@ -262,6 +263,7 @@ struct pool {
 	spinlock_t lock;
 	struct bio_list deferred_flush_bios;
 	struct bio_list deferred_flush_completions;
+	struct list_head deferred_discard_completions;
 	struct list_head prepared_mappings;
 	struct list_head prepared_discards;
 	struct list_head prepared_discards_pt2;
@@ -732,10 +734,18 @@ static void remap_to_origin(struct thin_c *tc, struct bio *bio)
 	bio_set_dev(bio, tc->origin_dev->bdev);
 }
 
-static int bio_triggers_commit(struct thin_c *tc, struct bio *bio)
+static bool wait_for_commit_write(struct thin_c *tc, struct bio *bio)
 {
-	return op_is_flush(bio->bi_opf) &&
-		dm_thin_changed_this_transaction(tc->td);
+	return tc->pool->pf.wait_for_commit && bio_op(bio) == REQ_OP_WRITE &&
+		!op_is_flush(bio->bi_opf);
+}
+
+static int bio_triggers_commit(struct thin_c *tc, struct bio *bio, bool hold)
+{
+	if (op_is_flush(bio->bi_opf))
+		return dm_thin_changed_this_transaction(tc->td);
+
+	return hold && dm_thin_uncommitted(tc->td);
 }
 
 static void inc_all_io_entry(struct pool *pool, struct bio *bio)
@@ -749,11 +759,12 @@ static void inc_all_io_entry(struct pool *pool, struct bio *bio)
 	h->all_io_entry = dm_deferred_entry_inc(pool->all_io_ds);
 }
 
-static void issue(struct thin_c *tc, struct bio *bio)
+static void __issue(struct thin_c *tc, struct bio *bio, bool may_hold)
 {
 	struct pool *pool = tc->pool;
+	bool hold = may_hold && wait_for_commit_write(tc, bio);
 
-	if (!bio_triggers_commit(tc, bio)) {
+	if (!bio_triggers_commit(tc, bio, hold)) {
 		dm_submit_bio_remap(bio, NULL);
 		return;
 	}
@@ -777,6 +788,11 @@ static void issue(struct thin_c *tc, struct bio *bio)
 	spin_unlock_irq(&pool->lock);
 }
 
+static void issue(struct thin_c *tc, struct bio *bio)
+{
+	__issue(tc, bio, true);
+}
+
 static void remap_to_origin_and_issue(struct thin_c *tc, struct bio *bio)
 {
 	remap_to_origin(tc, bio);
@@ -960,12 +976,14 @@ static void process_prepared_mapping_fail(struct dm_thin_new_mapping *m)
 static void complete_overwrite_bio(struct thin_c *tc, struct bio *bio)
 {
 	struct pool *pool = tc->pool;
+	bool hold = wait_for_commit_write(tc, bio);
 
 	/*
 	 * If the bio has the REQ_FUA flag set we must commit the metadata
-	 * before signaling its completion.
+	 * before signaling its completion.  With the wait_for_commit feature
+	 * a plain write waits the same way.
 	 */
-	if (!bio_triggers_commit(tc, bio)) {
+	if (!bio_triggers_commit(tc, bio, hold)) {
 		bio_endio(bio);
 		return;
 	}
@@ -1056,6 +1074,28 @@ static void process_prepared_discard_success(struct dm_thin_new_mapping *m)
 	free_discard_mapping(m);
 }
 
+static void complete_discard_mapping(struct dm_thin_new_mapping *m)
+{
+	struct thin_c *tc = m->tc;
+	struct pool *pool = tc->pool;
+
+	if (!pool->pf.wait_for_commit || !dm_thin_uncommitted(tc->td)) {
+		bio_endio(m->bio);
+		mempool_free(m, &pool->mapping_pool);
+		return;
+	}
+
+	if (dm_thin_aborted_changes(tc->td)) {
+		bio_io_error(m->bio);
+		mempool_free(m, &pool->mapping_pool);
+		return;
+	}
+
+	spin_lock_irq(&pool->lock);
+	list_add_tail(&m->list, &pool->deferred_discard_completions);
+	spin_unlock_irq(&pool->lock);
+}
+
 static void process_prepared_discard_no_passdown(struct dm_thin_new_mapping *m)
 {
 	int r;
@@ -1065,11 +1105,13 @@ static void process_prepared_discard_no_passdown(struct dm_thin_new_mapping *m)
 	if (r) {
 		metadata_operation_failed(tc->pool, "dm_thin_remove_range", r);
 		bio_io_error(m->bio);
-	} else
-		bio_endio(m->bio);
+		cell_defer_no_holder(tc, m->cell);
+		mempool_free(m, &tc->pool->mapping_pool);
+		return;
+	}
 
 	cell_defer_no_holder(tc, m->cell);
-	mempool_free(m, &tc->pool->mapping_pool);
+	complete_discard_mapping(m);
 }
 
 /*----------------------------------------------------------------*/
@@ -1206,11 +1248,13 @@ static void process_prepared_discard_passdown_pt2(struct dm_thin_new_mapping *m)
 	if (r) {
 		metadata_operation_failed(pool, "dm_pool_dec_data_range", r);
 		bio_io_error(m->bio);
-	} else
-		bio_endio(m->bio);
+		cell_defer_no_holder(tc, m->cell);
+		mempool_free(m, &pool->mapping_pool);
+		return;
+	}
 
 	cell_defer_no_holder(tc, m->cell);
-	mempool_free(m, &pool->mapping_pool);
+	complete_discard_mapping(m);
 }
 
 static void process_prepared(struct pool *pool, struct list_head *head,
@@ -1298,7 +1342,8 @@ static void remap_and_issue_overwrite(struct thin_c *tc, struct bio *bio,
 	m->bio = bio;
 	save_and_set_endio(bio, &m->saved_bi_end_io, overwrite_endio);
 	inc_all_io_entry(pool, bio);
-	remap_and_issue(tc, bio, data_begin);
+	remap(tc, bio, data_begin);
+	__issue(tc, bio, false);
 }
 
 /*
@@ -2359,6 +2404,8 @@ static void process_deferred_bios(struct pool *pool)
 {
 	struct bio *bio;
 	struct bio_list bios, bio_completions;
+	struct list_head discard_completions;
+	struct dm_thin_new_mapping *m, *tmp;
 	struct thin_c *tc;
 
 	tc = get_first_thin(pool);
@@ -2374,6 +2421,7 @@ static void process_deferred_bios(struct pool *pool)
 	 */
 	bio_list_init(&bios);
 	bio_list_init(&bio_completions);
+	INIT_LIST_HEAD(&discard_completions);
 
 	spin_lock_irq(&pool->lock);
 	bio_list_merge(&bios, &pool->deferred_flush_bios);
@@ -2381,9 +2429,12 @@ static void process_deferred_bios(struct pool *pool)
 
 	bio_list_merge(&bio_completions, &pool->deferred_flush_completions);
 	bio_list_init(&pool->deferred_flush_completions);
+
+	list_splice_init(&pool->deferred_discard_completions, &discard_completions);
 	spin_unlock_irq(&pool->lock);
 
 	if (bio_list_empty(&bios) && bio_list_empty(&bio_completions) &&
+	    list_empty(&discard_completions) &&
 	    !(dm_pool_changed_this_transaction(pool->pmd) && need_commit_due_to_time(pool)))
 		return;
 
@@ -2392,6 +2443,11 @@ static void process_deferred_bios(struct pool *pool)
 
 		while ((bio = bio_list_pop(&bios)))
 			bio_io_error(bio);
+
+		list_for_each_entry_safe(m, tmp, &discard_completions, list) {
+			bio_io_error(m->bio);
+			mempool_free(m, &pool->mapping_pool);
+		}
 		return;
 	}
 	pool->last_commit_jiffies = jiffies;
@@ -2399,6 +2455,11 @@ static void process_deferred_bios(struct pool *pool)
 	while ((bio = bio_list_pop(&bio_completions)))
 		bio_endio(bio);
 
+	list_for_each_entry_safe(m, tmp, &discard_completions, list) {
+		bio_endio(m->bio);
+		mempool_free(m, &pool->mapping_pool);
+	}
+
 	while ((bio = bio_list_pop(&bios))) {
 		/*
 		 * The data device was flushed as part of metadata commit,
@@ -2778,6 +2839,11 @@ static int thin_bio_map(struct dm_target *ti, struct bio *bio)
 			return DM_MAPIO_SUBMITTED;
 		}
 
+		if (result.changed && wait_for_commit_write(tc, bio)) {
+			thin_defer_cell(tc, virt_cell);
+			return DM_MAPIO_SUBMITTED;
+		}
+
 		build_data_key(tc->td, result.block, &key);
 		if (bio_detain(tc->pool, &key, bio, &data_cell)) {
 			cell_defer_no_holder(tc, virt_cell);
@@ -2878,6 +2944,8 @@ static int bind_control_target(struct pool *pool, struct dm_target *ti)
 	pool->ti = ti;
 	pool->pf = pt->adjusted_pf;
 	pool->low_water_blocks = pt->low_water_blocks;
+	dm_pool_metadata_set_refuse_commit_after_failure(pool->pmd,
+							 pool->pf.wait_for_commit);
 
 	set_pool_mode(pool, new_mode);
 
@@ -2903,6 +2971,7 @@ static void pool_features_init(struct pool_features *pf)
 	pf->discard_enabled = true;
 	pf->discard_passdown = true;
 	pf->error_if_no_space = false;
+	pf->wait_for_commit = false;
 }
 
 static void __pool_destroy(struct pool *pool)
@@ -2997,6 +3066,7 @@ static struct pool *pool_create(struct mapped_device *pool_md,
 	spin_lock_init(&pool->lock);
 	bio_list_init(&pool->deferred_flush_bios);
 	bio_list_init(&pool->deferred_flush_completions);
+	INIT_LIST_HEAD(&pool->deferred_discard_completions);
 	INIT_LIST_HEAD(&pool->prepared_mappings);
 	INIT_LIST_HEAD(&pool->prepared_discards);
 	INIT_LIST_HEAD(&pool->prepared_discards_pt2);
@@ -3146,7 +3216,7 @@ static int parse_pool_features(struct dm_arg_set *as, struct pool_features *pf,
 	const char *arg_name;
 
 	static const struct dm_arg _args[] = {
-		{0, 4, "Invalid number of pool feature arguments"},
+		{0, 5, "Invalid number of pool feature arguments"},
 	};
 
 	/*
@@ -3178,6 +3248,9 @@ static int parse_pool_features(struct dm_arg_set *as, struct pool_features *pf,
 		else if (!strcasecmp(arg_name, "error_if_no_space"))
 			pf->error_if_no_space = true;
 
+		else if (!strcasecmp(arg_name, "wait_for_commit"))
+			pf->wait_for_commit = true;
+
 		else {
 			ti->error = "Unrecognised pool feature requested";
 			r = -EINVAL;
@@ -3881,7 +3954,7 @@ static void emit_flags(struct pool_features *pf, char *result,
 {
 	unsigned int count = !pf->zero_new_blocks + !pf->discard_enabled +
 		!pf->discard_passdown + (pf->mode == PM_READ_ONLY) +
-		pf->error_if_no_space;
+		pf->error_if_no_space + pf->wait_for_commit;
 	DMEMIT("%u ", count);
 
 	if (!pf->zero_new_blocks)
@@ -3898,6 +3971,9 @@ static void emit_flags(struct pool_features *pf, char *result,
 
 	if (pf->error_if_no_space)
 		DMEMIT("error_if_no_space ");
+
+	if (pf->wait_for_commit)
+		DMEMIT("wait_for_commit ");
 }
 
 /*
@@ -3905,6 +3981,7 @@ static void emit_flags(struct pool_features *pf, char *result,
  *    <transaction id> <used metadata sectors>/<total metadata sectors>
  *    <used data sectors>/<total data sectors> <held metadata root>
  *    <pool mode> <discard config> <no space config> <needs_check>
+ *    <metadata low watermark> [wait_for_commit]
  */
 static void pool_status(struct dm_target *ti, status_type_t type,
 			unsigned int status_flags, char *result, unsigned int maxlen)
@@ -4015,6 +4092,9 @@ static void pool_status(struct dm_target *ti, status_type_t type,
 
 		DMEMIT("%llu ", (unsigned long long)calc_metadata_threshold(pt));
 
+		if (pool->pf.wait_for_commit)
+			DMEMIT("wait_for_commit ");
+
 		break;
 
 	case STATUSTYPE_TABLE:
@@ -4107,7 +4187,7 @@ static struct target_type pool_target = {
 	.name = "thin-pool",
 	.features = DM_TARGET_SINGLETON | DM_TARGET_ALWAYS_WRITEABLE |
 		    DM_TARGET_IMMUTABLE | DM_TARGET_PASSES_CRYPTO,
-	.version = {1, 24, 0},
+	.version = {1, 25, 0},
 	.module = THIS_MODULE,
 	.ctr = pool_ctr,
 	.dtr = pool_dtr,
@@ -4490,7 +4570,7 @@ static void thin_io_hints(struct dm_target *ti, struct queue_limits *limits)
 static struct target_type thin_target = {
 	.name = "thin",
 	.features = DM_TARGET_PASSES_CRYPTO,
-	.version = {1, 24, 0},
+	.version = {1, 25, 0},
 	.module	= THIS_MODULE,
 	.ctr = thin_ctr,
 	.dtr = thin_dtr,
-- 
2.43.0

