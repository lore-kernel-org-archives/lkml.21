Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581231;
	b=LkGzzML+GpEssE5lJzmraq03GYkyb5Y41eWKaBreQJ6Jg6x344ff1coAu8i2YixCyYzq
	 sOy3W9x4bKqSL2Bv9oEE7zQgYdDbraONf3acTphQKi7uV/0dcbuiWsZygF5xn/8warZDV
	 4MfQyeXnxDCjEbMJTZOz9tjlVs12GBggkEfCQaDIOy3PwV1MecyaFcZ11Ojewi0e+OcuD
	 leOzg13Q4VF8UDefjGMxYqUdtzhlbWpNntK4xqooD7au4nxrmZT2SqEGNjw0L7QnRMI0h
	 fjjMTEnJFyyS97cCALoz+G1Z7vrOi7pxKg2eapM1NYlak66EKGLcH15ftxywAbmVQmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M/xhIeAnDFNYNz810SILjQoo31ON+txA5gyXKyEN96U=;
	b=Qyho+rK3sMKjxNSrO5alU6NJkuMdVR3xLk0sCWtWBEcf/G4nGEHA+U+nIwSPEdYpNT5Y
	 7+4J1qS7sv00Nuw9DPWup1aeBq6EnKson5Ry9blPI5n/4JLRg2x/jRZLjOqWZbnwfqSrL
	 ptQnWmQIwH1QzzmgQg1wZ1ME2uBYmH2yMwXyZ3CaHldkFAP3VYEQYkWXVovaS7oYgoas+
	 Mb69SiaafsOESVmrlBgsUU/lN4N3UEZDhI5w0uEOAr2CJQ8dO+lsjgHfAmkCUEaTLPTj9
	 BjaUKP8e5sX9PB6utIN+GQU2aTuHnD0Z6R5bRkAgINQAZ7oSPoeZVuEzw3bvhI2WOfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chH7IhID;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA0E606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FA0E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chH7IhID
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so2526109b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581230; x=1796186030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/xhIeAnDFNYNz810SILjQoo31ON+txA5gyXKyEN96U=;
        b=chH7IhIDzACP8OdWe6XQSwvgLN46Ccc4YnceYIjl+QYGKvD2HEUIckvJNd7O/8NhV9
         2ixcuGQV6b4TLrx4eDMzssY2gGhHRu6U22govbaCr86P3AZgDko75glJQ+jL08bOh3NF
         vyyzhtqxuF8ssWyN/8ort/BNVniPt4A/Txlgh9jKZN4jIATw7HE7MmxtjoPj1+PF5CZX
         +rd0h7wMPwzJBc5RaNTXwitLiOLzZYW2MnX+dbwadEIEywjmPuVEKBD8/SzQeoGnbnUJ
         bsldSqg6udiR+dD+MECf6DgbnNYrmZb5sCUte9fU2VCy7BF6ZNO04zKs/IRokn1zhn/M
         Kghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581230; x=1796186030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/xhIeAnDFNYNz810SILjQoo31ON+txA5gyXKyEN96U=;
        b=zm5dGDAbt6Wu8Gwc8fAOpbI4WSUm7xICo3rzTVxN8yeBTPM/waiB95XtahukLoQW4h
         nh3Ts+3uilHOGFXGOW2jlN9VSZNPlxM9wshuiZtQlU7X5DmHRYz4hgGuh5HrTC4Ri+i9
         8tfEBfTNEn/ur0DINPg6CAatGBcqRE1UEyt6nj3LZ20qEQEENMJ68feY5lOzEBE1Vvow
         x6CMpXkleJfZQRrLxDSi6MJfTJ7gcfO14NlfUclxDjoTiRpHD3E1/vLNFC9viuLjyLmO
         7GHQkIb6NuDH8dSPGUfg7cVgXDZCErGMb4VwSaOa+55L/yB/ZdbzyWSuDTJupWpo6D9S
         dofQ==
X-Forwarded-Encrypted: i=1; AL+hErEWxIJD9QdERHeLm85Us8BuEUgpKLqJfxHpt3wDrEsWTSR/Eu30H6KPbp6QlGabb9YSXscSve2gOkVLuYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9H6brXT1+m1Ptqq9J5Ykjk22z6rJ0WSnuMjtm9FOYUnqhwSvBP
	LigCsxP8bXuIXgw6lrjbpJ9vO74kqHms4f3xuM/EjroVZPvQ0z4w37qs
X-Gm-Gg: AZFdTZddhzIEZBjCpmCA4RLlnaPO0SAJ0JF/5P3u91jjhWdo0HGWs5hO8gxDB6BnmyN
	rWbxylYm5dCtR5U76GmYgKwxYcbZZLl6GGpzDjCKN+yUGvTL4K9kW5Ce7RXWx9iSsm/yr0Wjn0q
	lCQoRPa80/DhiLfbftyqqgLxI4YODsa/W0XDBRIq0jYxXuL5s4i7FilMZq/MQONJHzJnXzqEVJJ
	6Z7C05AoxcjTvOz1qlXjlR/QggvcgRUACzgn1oQDOGNwgYlJApFduWg5zLgQCwnf4DlBjzRuE/4
	n2KpmxQsiGihBdewBNVA6q2KRUVHuGRecjrucUBtmKy1uKxJwtBl7igEsgQMPxbTtm42yFrjiDm
	a2j/32F/vVvwO8rsJr213LazHMK1dsNV83Cty387QT8st13bY0wuGhjbh3fB+OlQWpLHVr5K+u9
	yHspEh6EqFhPGCHrGzJ6QEYpwyEgxEjyXDP8qAbZ+Os7cNEgYF6K3Nfg7E8a3F2jPfkuKIHqSIt
	7UV6yJrtgv4arVWOi1cpuOgxd0HeND4C6zeVQ9LBI1O9wVf/5HPswmHBFLQEWUJ5pOma61uv03e
	Wfs5HdsO3FE2IGixAlZcNI5uK0iixmO6aSMwNwQmMYzYGaa0dpLDJxeRpe5LhnOX6FlpJ43t45N
	TtOXyRbGUdxD9ydxnN5P02A1TFMaYvVYnjYSZ2yk/HIsn0SjNpKAYmomk5X1H+BsVQZiz7w==
X-Received: by 2002:a05:6a20:7f8e:b0:3f8:c7b1:6899 with SMTP id adf61e73a8af0-4014bc49db2mr17569291637.42.1795581230367;
        Tue, 24 Nov 2026 20:33:50 -0800 (PST)
Received: from yupeng-XPS-15-9520.. (c-73-169-192-12.hsd1.wa.comcast.net. [73.169.192.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm8528812b3a.36.2026.11.24.20.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:33:50 -0800 (PST)
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
Subject: [PATCH 1/2] dm thin metadata: report uncommitted state and refuse commits after a failure
Date: Tue, 24 Nov 2026 20:33:24 -0800
Message-ID: <20261125043325.138351-2-yupeng0921@gmail.com>
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

Add two flags for a thin pool:
* commit_failed: Set to true if a commit failed. It is a fact that may
  be caused by IO errors.
* refuse_commit_after_failure: Set to true if we enable the
  wait_for_commit option. It is selected by a user.

If both of them are true, the user should repair the pool.

Add a new field:
* changed: A new field of struct dm_thin_lookup_result, set by each
  lookup that finds a mapping. False means the thin device's metadata
  in memory was the same as on disk at the time of the lookup; true
  means they may not be the same.

Add some helper functions:
* dm_thin_uncommitted: Return true if the thin device might have
  metadata changes that are not on disk yet. When we get a commit
  failure, td->changed might be cleared, but the metadata changes are
  not on disk due to the commit failure. So when commit_failed is true,
  the function will always return true.
* dm_pool_metadata_set_refuse_commit_after_failure: Set the
  refuse_commit_after_failure flag.

Signed-off-by: Peng Yu <yupeng0921@gmail.com>
Assisted-by: Claude:claude-opus-5-5 [Claude Code]
Assisted-by: Claude:claude-fable-5-1 [Claude Code]
---
 drivers/md/dm-thin-metadata.c | 61 +++++++++++++++++++++++++++++++----
 drivers/md/dm-thin-metadata.h | 14 ++++++++
 2 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-thin-metadata.c b/drivers/md/dm-thin-metadata.c
index e60e1326376a..7b56c970a524 100644
--- a/drivers/md/dm-thin-metadata.c
+++ b/drivers/md/dm-thin-metadata.c
@@ -221,6 +221,9 @@ struct dm_pool_metadata {
 	 */
 	bool in_service:1;
 
+	bool commit_failed;
+	bool refuse_commit_after_failure;
+
 	/*
 	 * Reading the space map roots can fail, so we read it into these
 	 * buffers before the superblock is locked and updated.
@@ -972,6 +975,8 @@ struct dm_pool_metadata *dm_pool_metadata_open(struct block_device *bdev,
 	INIT_LIST_HEAD(&pmd->thin_devices);
 	pmd->fail_io = false;
 	pmd->in_service = false;
+	pmd->commit_failed = false;
+	pmd->refuse_commit_after_failure = false;
 	pmd->bdev = bdev;
 	pmd->data_block_size = data_block_size;
 	pmd->pre_commit_fn = NULL;
@@ -1020,10 +1025,15 @@ int dm_pool_metadata_close(struct dm_pool_metadata *pmd)
 
 	pmd_write_lock_in_core(pmd);
 	if (!pmd->fail_io && !dm_bm_is_read_only(pmd->bm)) {
-		r = __commit_transaction(pmd);
-		if (r < 0)
-			DMWARN("%s: __commit_transaction() failed, error = %d",
-			       __func__, r);
+		if (pmd->refuse_commit_after_failure && pmd->commit_failed) {
+			DMERR_LIMIT("%s: refusing to commit after a failed commit",
+				    __func__);
+		} else {
+			r = __commit_transaction(pmd);
+			if (r < 0)
+				DMWARN("%s: __commit_transaction() failed, error = %d",
+				       __func__, r);
+		}
 	}
 	pmd_write_unlock(pmd);
 	__destroy_persistent_data_objects(pmd, true);
@@ -1351,6 +1361,7 @@ static int __reserve_metadata_snap(struct dm_pool_metadata *pmd)
 	 */
 	r = __commit_transaction(pmd);
 	if (r < 0) {
+		pmd->commit_failed = true;
 		DMWARN("%s: __commit_transaction() failed, error = %d",
 		       __func__, r);
 		return r;
@@ -1397,8 +1408,15 @@ int dm_pool_reserve_metadata_snap(struct dm_pool_metadata *pmd)
 	int r = -EINVAL;
 
 	pmd_write_lock(pmd);
-	if (!pmd->fail_io)
-		r = __reserve_metadata_snap(pmd);
+	if (!pmd->fail_io) {
+		if (pmd->refuse_commit_after_failure && pmd->commit_failed) {
+			DMERR_LIMIT("%s: refusing to commit after a failed commit",
+				    __func__);
+			r = -EIO;
+		} else {
+			r = __reserve_metadata_snap(pmd);
+		}
+	}
 	pmd_write_unlock(pmd);
 
 	return r;
@@ -1516,6 +1534,7 @@ static void unpack_lookup_result(struct dm_thin_device *td, __le64 value,
 	unpack_block_time(block_time, &exception_block, &exception_time);
 	result->block = exception_block;
 	result->shared = __snapshotted_since(td, exception_time);
+	result->changed = td->changed || td->pmd->commit_failed;
 }
 
 static int __find_block(struct dm_thin_device *td, dm_block_t block,
@@ -1796,6 +1815,17 @@ bool dm_thin_changed_this_transaction(struct dm_thin_device *td)
 	return r;
 }
 
+bool dm_thin_uncommitted(struct dm_thin_device *td)
+{
+	bool r;
+
+	down_read(&td->pmd->root_lock);
+	r = td->changed || td->pmd->commit_failed;
+	up_read(&td->pmd->root_lock);
+
+	return r;
+}
+
 bool dm_pool_changed_this_transaction(struct dm_pool_metadata *pmd)
 {
 	bool r = false;
@@ -1836,6 +1866,14 @@ int dm_pool_alloc_data_block(struct dm_pool_metadata *pmd, dm_block_t *result)
 	return r;
 }
 
+void dm_pool_metadata_set_refuse_commit_after_failure(struct dm_pool_metadata *pmd,
+						      bool refuse_commit_after_failure)
+{
+	pmd_write_lock_in_core(pmd);
+	pmd->refuse_commit_after_failure = refuse_commit_after_failure;
+	pmd_write_unlock(pmd);
+}
+
 int dm_pool_commit_metadata(struct dm_pool_metadata *pmd)
 {
 	int r = -EINVAL;
@@ -1848,9 +1886,18 @@ int dm_pool_commit_metadata(struct dm_pool_metadata *pmd)
 	if (pmd->fail_io)
 		goto out;
 
+	if (pmd->refuse_commit_after_failure && pmd->commit_failed) {
+		DMERR_LIMIT("%s: refusing to commit after a failed commit",
+			    __func__);
+		r = -EIO;
+		goto out;
+	}
+
 	r = __commit_transaction(pmd);
-	if (r < 0)
+	if (r < 0) {
+		pmd->commit_failed = true;
 		goto out;
+	}
 
 	/*
 	 * Open the next transaction.
diff --git a/drivers/md/dm-thin-metadata.h b/drivers/md/dm-thin-metadata.h
index 2f64f48b5f19..d7b149471e0b 100644
--- a/drivers/md/dm-thin-metadata.h
+++ b/drivers/md/dm-thin-metadata.h
@@ -81,9 +81,16 @@ int dm_pool_delete_thin_device(struct dm_pool_metadata *pmd,
 /*
  * Commits _all_ metadata changes: device creation, deletion, mapping
  * updates.
+ *
+ * Returns -EIO without committing once a commit has failed, if the pool
+ * asked to refuse commits after a failure (see
+ * dm_pool_metadata_set_refuse_commit_after_failure()).
  */
 int dm_pool_commit_metadata(struct dm_pool_metadata *pmd);
 
+void dm_pool_metadata_set_refuse_commit_after_failure(struct dm_pool_metadata *pmd,
+						      bool refuse_commit_after_failure);
+
 /*
  * Discards all uncommitted changes.  Rereads the superblock, rolling back
  * to the last good transaction.  Thin devices remain open.
@@ -112,6 +119,10 @@ int dm_pool_get_metadata_transaction_id(struct dm_pool_metadata *pmd,
  * operations only.  A small performance hit is incurred by providing this
  * copy of the metadata to userland due to extra copy-on-write operations
  * on the metadata nodes.  Release this as soon as you finish with it.
+ *
+ * The reservation commits first, so it returns -EIO once a commit has
+ * failed, if the pool asked to refuse commits after a failure (see
+ * dm_pool_metadata_set_refuse_commit_after_failure()).
  */
 int dm_pool_reserve_metadata_snap(struct dm_pool_metadata *pmd);
 int dm_pool_release_metadata_snap(struct dm_pool_metadata *pmd);
@@ -136,6 +147,7 @@ dm_thin_id dm_thin_dev_id(struct dm_thin_device *td);
 struct dm_thin_lookup_result {
 	dm_block_t block;
 	bool shared:1;
+	bool changed:1;
 };
 
 /*
@@ -175,6 +187,8 @@ int dm_thin_remove_range(struct dm_thin_device *td,
  */
 bool dm_thin_changed_this_transaction(struct dm_thin_device *td);
 
+bool dm_thin_uncommitted(struct dm_thin_device *td);
+
 bool dm_pool_changed_this_transaction(struct dm_pool_metadata *pmd);
 
 bool dm_thin_aborted_changes(struct dm_thin_device *td);
-- 
2.43.0

