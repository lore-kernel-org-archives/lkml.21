Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959768;
	b=EpPniUZoupUx21VD1PWnqQMFjaMm1Gl19L2CZv94pSMGFjq2hd/vA1KFa191hbLR5Iw/
	 Ln2RYmwNqp4tLPPgb5yLwss2yB3GQacEGkg/LnDg9oDtAHwu8WV1FbqblHtKw+yd5tMVo
	 ASBSgvKYKy+mT66hsLRvP5rVuAORWdWsOrIwqSuBGaSLBOgnu6RbGmth5Rvmvive2KVDF
	 hmWcTPqwYn2taDf4ieyjoS1sTwn8h0yIXwB8H0Zd7oSInfwyQvWVXz0BN9M734LK6X3JN
	 vxUd5dqbfpAOFe4KTUkWGsYw23AHE/XGdaA4byPQ0XDdBx0ztU8+ZVl8govHutHUFvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959768;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GdSPBdcK1tlpMgkOYv9BSH7mF4dBreGs7y5htYeuMg0=;
	b=kUrWyM5pw9328jyggMc0MCst7lYF+yISrpk83gdf+qYh9QfCnlaAU+5CglyRsgsOgVCV
	 bugErQUhNxUoVGVCTr5E10KVw/SzlcD8x0hj7XVDtYnqkKVZn0KGSs/iQ2YwxrbuB4aB8
	 7IWe26S8indBBW6gVgOJ1GjpM8cFbcjAFnjY+RO9BK09yATOUPS1T8xkniJIdWQF0R/ah
	 ekrPvu9C/96lODVILyplymBMgAaEdUGxt/W+kA+hsUrSVsFvlG8AXjFgfA4TmOewjpmbe
	 hGnyGngS7I2iWalc09mBft/1Eaz73IRdeOsYYc+brNwcdRuWCK+kzJ8lAlQlZqINOmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=Q2zLOY8z;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3FC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E3FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=Q2zLOY8z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1794959764; x=1795218964;
	bh=GdSPBdcK1tlpMgkOYv9BSH7mF4dBreGs7y5htYeuMg0=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Q2zLOY8z9ivTkv8fhW7wTZYhc18Eu7tONx3b46jrv1JK3kZBaB3mQiRvlIRTdFpyk
	 KuV6/B4G1TkPB1Xdi4+ob+fFpO24Qkctc8ORQ4dsMNHPeE3LPa7/DQ0SE9eB4YNslG
	 UMXMcRK5KZ0G5r7rKtakR0FJY3zA/JbtwAKlrfiLOIu5BDIsPmPaXHef4sfImtV6m1
	 4hIF/E+dfHV6V5vpbSEU8EwLe7Xmz7sVN0DorWY0WKFcYW+0nnSaQU4dfiMF7g1a5v
	 d+aq16mHyc2dIDgWRoc+Sa2pGyASyIp/6CcgN/iQoS5011UOIlcBKT/WLuvphrFblJ
	 aNnbtUWh2nECA==
X-Pm-Submission-Id: 4jThSy40Rzz1DDqy
From: Miroslav Cimerman <mc@raidlab.org>
To: linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] btrfs: zoned: skip missing devices when releasing active zone reservations
Date: Tue, 17 Nov 2026 23:55:57 +0000
Message-ID: <20261117235557.187781-1-mc@raidlab.org>
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

On a degraded mount of a zoned filesystem with a missing device, mount
can crash in btrfs_check_active_zone_reservation():

  KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
  RIP: 0010:btrfs_check_active_zone_reservation+0x369/0x5b0
  Call Trace:
   open_ctree+0x377d/0x4140
   btrfs_get_tree.cold+0xb/0x1de
   vfs_get_tree+0x80/0x2d0

The first loop of the function skips devices without a block device,
but the second one, which releases the reservation for the stripes of
the active metadata and system block groups, uses the zone_info of
every stripe's device. A missing device has no zone_info, so a RAID1
metadata block group with a stripe on it crashes the mount.

Skip stripes on devices without a block device, as the first loop does.
The same was fixed for zone activation and zone finishing in
commit 2bbc4a45e5eb ("btrfs: zoned: fix zone activation with missing
devices") and commit 35fec1089ebb ("btrfs: zoned: fix zone finishing
with missing devices").

Reproducer: two zoned null_blk devices, mkfs.btrfs -d raid1 -m raid1
-O raid-stripe-tree, write and sync a file, unmount, remove the second
device, mount the first with -o degraded.

Fixes: a7e1ac7bdc5a ("btrfs: zoned: reserve zones for an active metadata/system block group")
CC: stable@vger.kernel.org # 6.7+
Signed-off-by: Miroslav Cimerman <mc@raidlab.org>
---
Found with FuzzyRAID, a fault-injection tester for RAID that is not
public at the moment. The analysis, the fix, the tests and the commit
message were prepared with the help of an LLM. I reviewed everything.

This applies on top of 0c595e53b0c6 ("btrfs: zoned: don't release
active zone reservations for conventional zones") in for-next. Stable
trees without it need the same check in the old one line loop.

Tested on btrfs for-next (6f4bbde7e036) in QEMU with KASAN and zoned
null_blk: without the patch, 2 of 2 degraded mounts crash as above.
With it, both mount and the file reads back. A normal mount with both
devices present works with and without the patch.

 fs/btrfs/zoned.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index b1be02eeba68..e6ce6f05ad75 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -3160,9 +3160,14 @@ void btrfs_check_active_zone_reservation(struct btrfs_fs_info *fs_info)
 			continue;
 
 		for (int i = 0; i < map->num_stripes; i++) {
-			struct btrfs_zoned_device_info *zinfo = map->stripes[i].dev->zone_info;
+			struct btrfs_device *device = map->stripes[i].dev;
+			struct btrfs_zoned_device_info *zinfo = device->zone_info;
 			u64 physical = map->stripes[i].physical;
 
+			/* A missing device has no zone_info. */
+			if (!device->bdev)
+				continue;
+
 			if (!test_bit(physical >> zinfo->zone_size_shift, zinfo->active_zones))
 				continue;
 
-- 
2.53.0

