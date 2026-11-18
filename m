Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024609;
	b=Pv96Q4j8s42YzEbJM5tZRVuvcBbuNCknbayTrEsWChtagvR0xcDO1wrwwWYmpUFUVVmv
	 Mg29e+liblO75ZwyC5Efze3v7qO3Lh+l4uiuPffMRyJatGhsDWDdbkghN9E7Al3pMQupU
	 xOL/3MkCUarlPp1ykHKv00b+Arm2OVqNtriQ7yvp6Z3RtpKHzrvdufQQ43IdtL5G8eQTh
	 a3004gB2GakuwvU4KGjYh8byP9IYjm43YUwekZTmofR0pCl5hcJNAMnJaN6o2/uD2bJq1
	 qn/lTdScnFxMMbUr38o95ASZakAVa1kKDxp4MjmaJd+7vHaxM+sN/vqVUw8m8uQ+MXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024609;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=eqIKaeW36JPgRIZtQ4J+lRUkCbQ0VgAWoDp8AASnMNg=;
	b=imekpmltdkljXMvY61k+ifS36Di5z/8fe8/uUict/Wo+TKzSsu7Ck18Yy12E8sH2JNMu
	 INzSBElHkGXU4Cd5NlcwIq4CsM6ooql81xlZXsy0iIZ9f6u56F2bgnWQRTiGIODWlpAM8
	 TG3a46XR7Oi1gbgUGdzkYqRLw1ItvsEICRoQz5+ULY8ZIz2ryLMgTp/ftgfvSARPVGPLl
	 x9DarbhpTcvyEauP1BR3i4jAWFpLNwtTBThEYlxtBxwn5+2NaQ9ii+mEIEPSdG1GmFQhv
	 4vSB1JM0zfw4oFqzQ/MQ5KptfMmqhA6oe8PcyjzI5JZqHB9FScp4CR+nuyT3JtcpnqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=rn9DL0Xs;
	arc=none smtp.remote-ip=79.135.106.113
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8F4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C8F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=rn9DL0Xs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1795024605; x=1795283805;
	bh=eqIKaeW36JPgRIZtQ4J+lRUkCbQ0VgAWoDp8AASnMNg=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=rn9DL0Xs2ew1XjhK1O3neG+/sYA4wqECrRhUhTe4gPwOkQMQ7pu478ejECAEdS0A3
	 6uxsbEsC5lif7bDHEIv6YDnaMQNA13osEc1DtRIi3BNFOES7/tffWsSDV+/tqSikuu
	 iD9botqPVhZOhBp3cXiJ8ytb38NNQFpiPEU0QXfb+pETe7OBCMjO7xCsKuMnQM6iOp
	 PUF4ZjFljNY0EeVjIQvfpmbDp5DDHq/OAX4ImT2up6nYsmSHyOpJ7z++XEUeHBwlq5
	 WnFS0BlDCT/c9MD3ixf+4P49yvdlMfiETQq3r0nI/U43DT8JeZWyKvSzheuvB43Uq8
	 iRYe4+gSc1Y2w==
X-Pm-Submission-Id: 4jV8Rv0RxYz2ScD7
From: Miroslav Cimerman <mc@raidlab.org>
To: linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Qu Wenruo <wqu@suse.com>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] btrfs: scrub: don't count zoned repairs as corrected on a degraded mount
Date: Wed, 18 Nov 2026 17:56:37 +0000
Message-ID: <20261118175637.60283-1-mc@raidlab.org>
X-Mailer: git-send-email 2.53.0
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

On zoned devices scrub can't rewrite a bad copy in place. It calls
btrfs_repair_one_zone() to relocate the block group instead, and counts
the repaired blocks as corrected.

On a degraded mount btrfs_repair_one_zone() relocates nothing ("Do not
attempt to repair in degraded state"), but scrub still counts the
blocks as corrected and logs "fixed up error" for each. The bad copies
stay, and the next scrub finds and "fixes" the same errors again. With
zoned RAID1 mounted -o degraded with both devices present and read
errors in one device's metadata zone, two scrubs in a row both report:

  Error summary:    read=96
    Corrected:      36
    Uncorrectable:  60

Count such errors as uncorrectable, which the uapi header defines as
"no intact copy was found or the writeback failed". Dev-replace, which
writes the repaired blocks to the target device, and read-only scrub
are not changed.

Fixes: 54765392a1b9 ("btrfs: scrub: introduce helper to queue a stripe for scrub")
Signed-off-by: Miroslav Cimerman <mc@raidlab.org>
---
Keeping these errors as corrected and only logging that the repair was
skipped would leave a false positive: the counters would still report
the bad copies as fixed, and the next scrub finds them again. A new
counter for errors with an intact copy that were not written back would
be another option, but it changes the uapi. A read-only scrub, which
also counts errors with an intact copy as corrected without writing
anything, is not changed here.

Found with FuzzyRAID, a fault-injection tester for RAID that is not
public at the moment. The analysis, the fix and the commit message
were prepared with the help of an LLM, which also tested it. I reviewed
everything.

It also applies on top of "btrfs: scrub: fix several races which can
lead to UAF" (v2), with offsets.

 fs/btrfs/scrub.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
index 98362c91bce4..9dcb0e7e3d0b 100644
--- a/fs/btrfs/scrub.c
+++ b/fs/btrfs/scrub.c
@@ -323,6 +323,12 @@ struct scrub_error_records {
 	 */
 	unsigned long init_error_bitmap;
 
+	/*
+	 * Set if the repaired blocks could not be written back, thus all the
+	 * initial errors are still on disk.
+	 */
+	bool repair_skipped;
+
 	unsigned int nr_io_errors;
 	unsigned int nr_csum_errors;
 	unsigned int nr_meta_errors;
@@ -992,7 +998,7 @@ static void scrub_stripe_report_errors(struct scrub_ctx *sctx,
 	struct btrfs_fs_info *fs_info = sctx->fs_info;
 	struct btrfs_device *dev = NULL;
 	const unsigned long extent_bitmap = scrub_bitmap_read_has_extent(stripe);
-	const unsigned long error_bitmap = scrub_bitmap_read_error(stripe);
+	unsigned long error_bitmap = scrub_bitmap_read_error(stripe);
 	u64 physical = 0;
 	int nr_data_sectors = 0;
 	int nr_meta_sectors = 0;
@@ -1003,6 +1009,11 @@ static void scrub_stripe_report_errors(struct scrub_ctx *sctx,
 	if (test_bit(SCRUB_STRIPE_FLAG_NO_REPORT, &stripe->state))
 		return;
 
+	/* Not written back, the repaired blocks are still bad on disk. */
+	if (errors->repair_skipped)
+		bitmap_or(&error_bitmap, &error_bitmap,
+			  &errors->init_error_bitmap, stripe->nr_sectors);
+
 	/*
 	 * Init needed infos for error reporting.
 	 *
@@ -1227,6 +1238,15 @@ static void scrub_stripe_read_repair_worker(struct work_struct *work)
 	if (!sctx->readonly && !bitmap_empty(&repaired, stripe->nr_sectors)) {
 		if (btrfs_is_zoned(fs_info)) {
 			btrfs_repair_one_zone(fs_info, sctx->stripes[0].bg->start);
+			/*
+			 * On a degraded mount btrfs_repair_one_zone() does not
+			 * relocate the block group and the bad copies stay,
+			 * unless dev-replace writes the repaired blocks to the
+			 * target device.
+			 */
+			if (btrfs_test_opt(fs_info, DEGRADED) &&
+			    !sctx->is_dev_replace)
+				errors.repair_skipped = true;
 		} else {
 			scrub_write_sectors(sctx, stripe, repaired, false);
 			wait_scrub_stripe_io(stripe);
-- 
2.53.0

