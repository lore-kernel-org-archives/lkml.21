Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294629;
	b=lDlGe6jOFxXAxY0RRan2IUT66fc+J6WdJtSGHhfUW1Euc/fLCLsvBvn+8RJvVNV7t2sk
	 iQnUqPZOJVMxU9Tt7y859XCrAhYuN+XV0NAM+Fl/GEc6mrF2sQHe9KLV93ST9djisTtKO
	 VydUliJ7QX5M7wl08LIywgumTpDDsZuCgNKaCihlbHtmKRvLFlLuVxcSQPl5USV+ko6dJ
	 HJ36qRYapD3ovqMc4kGhVEj7fS7L8n2o0nhuX6Ws04BIDKhZL2rid/gkIBOJ+EqYrDQK6
	 nsTGsgccrHopaYr3VwEsuOUWxxXYo+6zauB7h7V0MWJqLQVMMuy7DDgvZyH8mxoj+kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294629;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=76gB/Ni4sG6cmk7iYvZawx7qklKnvMR0rJXK4sjw70w=;
	b=MC8cuoBeGtx3WWX04PMREmKbYFZLXeHh2SpQL/nwDs963upeL2vGN0w+WmJMqeW96cli
	 xXBpci4PT/Ct9R7QPZJsEVCouHlkmLj7r7O9KxUZeq80j2dLNhP7lRBDaS0WKMaluq31e
	 cdy/BBy7o3pZOs1oIc5j8YhKPHFuoUbFoW0krNRCuXQ2oInF3FeD5MkPc040LdW1hhA7D
	 Gp9qjD8fdntaVz0VawkZs3YpN+zYK1M4NqDMe7iWFA6Fhm36f2d5aHvlEqXUv87RkdBJw
	 cTCO4KfFOrt74l6jn9EK+6UlSxpNdlabU+BvqtRjwEkgJZY+/EWvvcgLBQIorOV8RJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=V3YetgjP;
	arc=none smtp.remote-ip=79.135.106.111
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91FC606A333
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E91FC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=V3YetgjP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1795294624; x=1795553824;
	bh=76gB/Ni4sG6cmk7iYvZawx7qklKnvMR0rJXK4sjw70w=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=V3YetgjPu2+8ixWUbp9+85wpxmmvuKLRWxQiaowaUvKAtiwi2XO22O/zMA9jQNmAD
	 zaMzt96YR9GINiOL83XN1b10V+qiQKPZMRcfLUYd6UneT9MGHBjX3wKe9prYInHBRq
	 /aATfDw3oan4Rjjnhd3SzNHUx1cFy7boDFuWq2R4YzncPYlQ7csiHYyo8ib31MeZKk
	 noDlIU0UCAyOO3yXtB1jr8qd0nes/yq+ggr1iMJpUBT3SNObiduplTN6BrV3RsTQNn
	 fBD+PmMR64COVQsByz0s0fFWIUX0Qlo6CGGou6vQ9V3SOaaVnH41LckAS7epfUNVDa
	 QY6CPruasaZTA==
X-Pm-Submission-Id: 4jX4JZ0rXYz1DDLH
From: Miroslav Cimerman <mc@raidlab.org>
To: linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Qu Wenruo <wqu@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] btrfs: zoned: activate RAID1 data block groups on degraded mounts
Date: Sat, 21 Nov 2026 20:56:56 +0000
Message-ID: <20261121205657.1108500-1-mc@raidlab.org>
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

btrfs_load_block_group_raid1() compares the active state of each present
stripe's zone with the first present stripe's. If the first present zone
is active, the block group is marked active. When the states differ, a
regular mount also calls btrfs_zone_activate(), which counts every zone
against its device's active zone limit, unless the block group is
already marked active. A degraded mount skips that call, and a data
block group keeps the active state of the first present stripe.

For a data block group, this goes wrong when a device that missed writes
comes back:

- The first present zone is active and another one is empty: the block
  group is marked active, but the empty zone is not counted. A zone
  append write opens it, so until the block group is finished, the
  device has one more active zone than btrfs counts, and opening a zone
  at the device's limit can fail.

- The first present zone is empty or full and another one is active: the
  block group is not marked active, while its active zone is counted.
  do_zone_finish() skips block groups that are not active, so a full
  block group is not finished, and its active zone stays taken until the
  block group is removed.

On a degraded mount, fix up a written data block group whose zones
differ in active state. In the first case, clear the active flag and
activate the block group, so that all its zones are counted. If
btrfs_zone_activate() fails, the block group stays active as before. A
full block group gets no more writes, so mark it active without
activating it: its open zones can then be finished, and its full zones
are not counted. In the second case, a block group with room left is
left to its first allocation, as before. That activation holds back the
active zones reserved for metadata. Metadata block groups are left as
they are: their writes fail on a stripe that is behind and do not open
its zone.

Fixes: 568220fa9657 ("btrfs: zoned: support RAID0/1/10 on top of raid stripe tree")
CC: stable@vger.kernel.org # 6.7+
Signed-off-by: Miroslav Cimerman <mc@raidlab.org>
---
Sashiko reported this in its review of "[PATCH v2 4/5] btrfs: zoned: use
the highest RAID1 write pointer on degraded mounts". This patch applies
on top of that series:
https://lore.kernel.org/linux-btrfs/20261121134550.216217-1-mc@raidlab.org/

The fix and the commit message were prepared with the help of an LLM,
which also tested it. I reviewed everything.

In testing on two-device RAID1 with a debug print of the active zone
count, both cases reproduced on for-next, with and without the series.
In the first, a device came back with its zone of a data block group
empty, the first write opened that zone, and when the block group was
finished, the zone was not set in btrfs's active zone bitmap of that
device. In the second, a full data block group with an open zone on the
returning device was not on the list of active block groups. With this
patch, the empty zone is counted when the block group is loaded, and the
full block group is on the list.

The tests did not get a device to its active zone limit while the zone
was uncounted, so there is no failing write to show. The self-tests do
not reach the new code: they load no data block groups.

In the first case, the empty zone is never on the first present stripe,
so with two-device RAID1 it is on the last stripe. The last copy of a
mirrored write is a zone append write. On for-next, the other copies are
regular writes: btrfs_submit_mirrored_bio() sets them up with
btrfs_bio_init(), which clears can_use_append. So "Data is written by
zone append to each stripe" in 4/5 holds only for the last stripe today.
I will send a fix for that separately. Until then, a write does not open
an empty zone on a middle stripe of RAID1C3 or RAID1C4, but this patch
counts it until the block group is finished.

btrfs_zone_activate() checks the active zone limit of each device before
it sees that the zone is already active. So it can fail on a device that
has no active zone left, even if its zone of the block group is active.
In the first case, the empty zone can then stay uncounted, as before
this patch, and the block group stays active. Zones counted before the
failure stay counted, as when the allocator activates a block group. The
order of the checks is not changed here.

Activation at load is not limited by the active zones reserved for
metadata: reserved_active_zones is still 0 while the block groups are
loaded. So it can take active zones meant for metadata on the returning
device, until a data block group is finished. With two-device RAID1, the
next write to the block group opens that zone anyway.

 fs/btrfs/zoned.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index 8ce329da612d..2d5f78e71620 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -1524,6 +1524,7 @@ static int btrfs_load_block_group_raid1(struct btrfs_block_group *bg,
 	struct btrfs_fs_info *fs_info = bg->fs_info;
 	u64 highest = 0;
 	bool mismatch = false;
+	bool active_mismatch = false;
 	int first = -1;
 	int i;
 
@@ -1600,12 +1601,33 @@ static int btrfs_load_block_group_raid1(struct btrfs_block_group *bg,
 				     !btrfs_zone_activate(bg))) {
 				return -EIO;
 			}
+			active_mismatch = true;
 		} else {
 			if (test_bit(first, active))
 				set_bit(BLOCK_GROUP_FLAG_ZONE_IS_ACTIVE, &bg->runtime_flags);
 		}
 	}
 
+	/*
+	 * On a degraded mount, the active state above comes from the first
+	 * present stripe. If that zone is active and another one is empty, a
+	 * zone append write opens the empty one without counting it. Clear the
+	 * flag and activate such a written data block group, so that all its
+	 * zones are counted. A full one gets no more writes: mark it active, so
+	 * that its open zones can be finished.
+	 */
+	if (active_mismatch && btrfs_test_opt(fs_info, DEGRADED) &&
+	    (map->type & BTRFS_BLOCK_GROUP_DATA) && highest) {
+		if (highest >= bg->zone_capacity) {
+			set_bit(BLOCK_GROUP_FLAG_ZONE_IS_ACTIVE, &bg->runtime_flags);
+		} else if (test_and_clear_bit(BLOCK_GROUP_FLAG_ZONE_IS_ACTIVE,
+					      &bg->runtime_flags)) {
+			/* Failure is OK, the block group stays active. */
+			btrfs_zone_activate(bg);
+			set_bit(BLOCK_GROUP_FLAG_ZONE_IS_ACTIVE, &bg->runtime_flags);
+		}
+	}
+
 	if (mismatch) {
 		btrfs_warn(fs_info,
 		"zoned: write pointer mismatch in %s block group %llu, using the highest",

base-commit: 184fa2c40f5c50afb1d8bf900eafadf450db392e
prerequisite-patch-id: f0678cffb57a607bde3edf038077931028c982e6
prerequisite-patch-id: 8fd088df247e1257946b793993343d85109a457b
prerequisite-patch-id: 5ac60d0cd7e210833e85f523e3dea594fa15ecd0
prerequisite-patch-id: 173c8a0cb5bd262349e48de045c0c1369707add1
prerequisite-patch-id: a764dcedb5b7d3c86d7400deee8ec63c78ee2c40
-- 
2.53.0

