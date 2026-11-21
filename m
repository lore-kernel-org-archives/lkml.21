Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795305560;
	b=xswS9BJRX3CU5bwx6OAFh/uiwARzjJiv+F5ppSeoIdsSkLK0Zlsb7ELn2wwUHiajjusM
	 hWjhp5ZuV6EWpX1+db5BKIfkjS7oAgYAdP87m38sRwP8vnIO8Kwu6dlIHFwO47euK4n9v
	 9QYbF+vwTlJkAIP1Coow3fEzYQGx3VoNRkBsVvVvq2vwQu1HrvSLqjfJHe0EaYvJvp8GP
	 XtppA3ZjMwy48nyMuKcKf3giGYjBAPNS+x0Pr/Bz2T/TlAth+SabAIuf3FpK+keLU10xf
	 By53392ufgkikW+qibdMyc70qSrip3Ysd/C4NQNhRc9lmV6H9UbeaFHn0SmB++9iaSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795305560;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer;
	bh=hWMMGDMEcHmP+O8ljgCncTt88F2zN1z7Yd+qZiQbOEI=;
	b=aCggtDeeUEBu5Go6tvKdLr0Wj2M552F82+N5av7LXfa7CDqqdF8mengOyqKRfVpuIzXg
	 lolNkS9hFuIQrTZwCYb3ErrVR59dSY2JfpVvaBCjyln7JH7AosuObiMKnjwNk3lq8jToq
	 sb3XrrnHBZqTspWEIHRN6PfRf4D/Td0oSGknVNkfS4Rq4vQ/cfG9qn3ZOfCIeoYEOPEXY
	 Pc6QwWoCtDYNUoS4y7RP7SXOWgmBufSMCRGU4ZFKazaGznKCb0WzUrIdaBLKHGIjFjbco
	 Cfp2PKKbQppuTZibQGR/lGoB/0pRCrdnDLhqgG8R7FtvVoc0tS/VIL1OXk1rcXp7PGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SiHtd5D1;
	arc=none smtp.remote-ip=95.215.58.68
Received: from mta1.migadu.com (out-68.mta1.migadu.com [95.215.58.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF5D606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BF5D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SiHtd5D1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wb3yKAZP201dKIVNXQv1qH2np8Sr8oJDK91ju/2KPwA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795305557; v=1; x=1795910357;
 b=SiHtd5D1+KMRgvtukMmjdBlFw8blzki2Scg640WwWvYVmTzN/oHqTecifkN8A7v1G0RmoVCW
 inabtPmDQhcaM6Ldk7Z0D9PFfF78cQ9EgvZJ+788VexTnmyWsGIsD8GTjSsAKlDk4ElFFliifnD
 ReOiUU8Ht9tpwsKfPytcbDXM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 083799db444f5b63;
	Sat, 21 Nov 2026 23:59:17 +0000
X-Mizu-Trace-ID: 083799db444f5b63
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sat, 21 Nov 2026 18:59:13 -0500
Subject: [PATCH] md: wait for a single grace period when stopping an array
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
Message-Id: <20261121-feat-md-export-array-gp-v1-1-b1925100be19@linux.dev>
X-B4-Tracking: v=1; b=H4sIAFAwAmsC/x3MMQqAMAxA0atIZgNN1SJeRRyKRs2gllSkIt7d4
 viG/x+IrMIRuuIB5UuiHHsGlQWMq98XRpmywRrriKzBmf2J24ScwqEnelV/4xKQqpbqxhlneYR
 cB+VZ0n/uh/f9ABKZ2gdpAAAA
To: Song Liu <song@kernel.org>, Yu Kuai <yukuai@fygo.io>, 
 Li Nan <magiclinan@didiglobal.com>, Xiao Ni <xiao@kernel.org>
Cc: linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

When an array is stopped, export_array() takes the members off
mddev->disks one by one with md_kick_rdev_from_array(), which unlinks a
member with list_del_rcu() and calls synchronize_rcu() before handing it
to mddev_unlock() for kobject_del().

Each member thus waits for a full grace period of its own, so stopping
an array takes one grace period per member, about 6 ms each in a guest,
with reconfig_mutex held.

Release the serialization resources of all members first, while
mddev_destroy_serial_pool() still sees the members that need the pool,
then unlink all members at once with list_splice_init_rcu() and a single
synchronize_rcu(). Clear rdev->mddev and the sysfs references only after
the grace period, so a reader walking mddev->disks never finds a member
that has already been detached.

Stopping an array made of null_blk devices in a guest with 32 vCPUs,
base and patched kernels alternating over 2 rounds of 3 runs, median of
the 6 runs and range in parentheses:

  level, disks           before (ms)         after (ms)   change
  raid0, 16      132.4 (126.3-147.5)   37.7 (34.5-41.4)     -72%
  raid1, 8         88.5 (86.3-103.1)   43.7 (40.7-45.4)     -51%
  raid5, 8         98.8 (97.6-107.3)   57.7 (55.0-59.1)     -42%
  raid10, 8         87.4 (85.0-89.8)   41.7 (37.8-43.9)     -52%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/md/md.c | 39 +++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 03e35386a8028..11fa541bce32e 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -2676,14 +2676,9 @@ static void export_rdev(struct md_rdev *rdev)
 	kobject_put(&rdev->kobj);
 }
 
-static void md_kick_rdev_from_array(struct md_rdev *rdev)
+static void md_unbind_rdev(struct md_rdev *rdev)
 {
-	struct mddev *mddev = rdev->mddev;
-
-	bd_unlink_disk_holder(rdev->bdev, rdev->mddev->gendisk);
-	list_del_rcu(&rdev->same_set);
 	pr_debug("md: unbind<%pg>\n", rdev->bdev);
-	mddev_destroy_serial_pool(rdev->mddev, rdev);
 	WRITE_ONCE(rdev->mddev, NULL);
 	sysfs_remove_link(&rdev->kobj, "block");
 	sysfs_put(rdev->sysfs_state);
@@ -2693,6 +2688,16 @@ static void md_kick_rdev_from_array(struct md_rdev *rdev)
 	rdev->sysfs_unack_badblocks = NULL;
 	rdev->sysfs_badblocks = NULL;
 	rdev->badblocks.count = 0;
+}
+
+static void md_kick_rdev_from_array(struct md_rdev *rdev)
+{
+	struct mddev *mddev = rdev->mddev;
+
+	bd_unlink_disk_holder(rdev->bdev, mddev->gendisk);
+	list_del_rcu(&rdev->same_set);
+	mddev_destroy_serial_pool(mddev, rdev);
+	md_unbind_rdev(rdev);
 
 	synchronize_rcu();
 
@@ -2707,12 +2712,26 @@ static void md_kick_rdev_from_array(struct md_rdev *rdev)
 static void export_array(struct mddev *mddev)
 {
 	struct md_rdev *rdev;
+	LIST_HEAD(kicked);
 
-	while (!list_empty(&mddev->disks)) {
-		rdev = list_first_entry(&mddev->disks, struct md_rdev,
-					same_set);
-		md_kick_rdev_from_array(rdev);
+	/*
+	 * Release the serialization resources while every member is still on
+	 * the list, as mddev_destroy_serial_pool() counts the members that
+	 * still need the pool.
+	 */
+	rdev_for_each(rdev, mddev) {
+		bd_unlink_disk_holder(rdev->bdev, mddev->gendisk);
+		mddev_destroy_serial_pool(mddev, rdev);
 	}
+
+	/* Unlink all members at once to wait for a single grace period */
+	list_splice_init_rcu(&mddev->disks, &kicked, synchronize_rcu);
+
+	list_for_each_entry(rdev, &kicked, same_set)
+		md_unbind_rdev(rdev);
+
+	/* Leave kobject_del() to mddev_unlock() */
+	list_splice(&kicked, &mddev->deleting);
 	mddev->raid_disks = 0;
 	mddev->major_version = 0;
 }

---
base-commit: 5f22fb20497f4983094131f00a734362300d22d2
change-id: 20261120-feat-md-export-array-gp-1381456062ec

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

