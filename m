Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795389803;
	b=BMrjhTKDmxP1YXMcKRl7fgYIO8IxXnrD6OTXeflrXta3gTTSeJarRCbkNkNWV4AMfKNG
	 31090yEap6LwPuw2/EjjTSl6QZW+mZPlhbcyBltqMdzjU4DGnNJttuEQVg5fNE1NgMwW5
	 Cx7iuuHcwrI801S6YPyBqfDpAYInlBQ3hOhRW8O9cRimcYLYX5j81RVHg9ZikejIIoIM/
	 9UFMcH5dih6rANQwLWCDuHv0a1hXpC+gfryz3l37MhffjZMJwkUgd6sdp5mltWAKR1KOd
	 O1NEFxHB6LZG+GYIHU6UsRoiipnY4NvGlTglqZFk8+Z5TZE/+iRotbxLO35wkOBO3cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795389803;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=40kUSNwtS5ho9Ck3MIRIzlRXJNnqP/OIrTyrH2xuPPQ=;
	b=468OIt7h+/ALtC/N7UbxBFZ0+pf+62vWwW3sdsP0zd3X/NrRw81ewUA66fReStE5svpn
	 8ij2jaYze5CN4/WZIhA1X46eGP4v8RrXgi7P5/vndHUDCw5bDSpmt/XeHlQsd2M4N87ml
	 dPlPw5KqP4QG/Q4pGU1iquZLiC3c6pRsNX5a2paPQ0xXiHZI5YLscdv1qVk5pZiZrNtRr
	 XiNwXppuhHZ510oNkxZPDJsPMOK1gTCHyMCCkWo6AffGTSAMn9KdIHzjcyvaYe8z9J7hk
	 JiAw/hGDZ+fbfDJlvltb+7LxI6ad4/fsC/Grp0AtQw8JRyobSAOMSNDH8HNGnxTlKXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=TPTM1q2p;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E890C606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E890C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=TPTM1q2p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1795389800; x=1795649000;
	bh=40kUSNwtS5ho9Ck3MIRIzlRXJNnqP/OIrTyrH2xuPPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=TPTM1q2pQqsPnACXDnD1YDhO1sEqcVc+sEr0lSCbV7PzOSX/Ow06Q24DhWEu12l12
	 qczH6mgzUdoeyzVk66lRuSUqSmPbFMZfVAraZ2ceJjf1zR00A1+pfP5usVVbnUNFJD
	 FSRlH670Sogs26bCibSdILe2CO4Uv7FFbw5iaIAMpio89CcWhKb4uePLJxdIsOvUC8
	 teDw/82zer8VzB1Xc6s3ei9UZqExdb/RQxd3sP++SrPU2w6Xjkb2fngdaWWFMyChBf
	 lgQ768sM6NHd4d1kIUt3Q2hqW//UBo+nsSwGGOP6SthPjrX6ayk32EzZH4mAYSxag1
	 /Ui458XpeGVnw==
X-Pm-Submission-Id: 4jXlVt46Lzz2ScQM
From: Miroslav Cimerman <mc@raidlab.org>
To: linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Qu Wenruo <wqu@suse.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] btrfs: zoned: do not fail an ordered extent on a zone finish error
Date: Sun, 22 Nov 2026 23:23:08 +0000
Message-ID: <20261122232310.4099580-2-mc@raidlab.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122232310.4099580-1-mc@raidlab.org>
References: <20261122232310.4099580-1-mc@raidlab.org>
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

When an ordered extent ends at the zone capacity of its block group,
btrfs_zone_finish_endio() finishes the zones of the block group. Since
commit c428b763f29b ("btrfs: zoned: propagate do_zone_finish() error in
btrfs_zone_finish_endio()"), it returns the error of do_zone_finish().
btrfs_finish_one_ordered() then fails the ordered extent. It skips the
file extent item that points the file to the new data. It also frees the
new extent.

However, the data of the ordered extent is already written. Only the
ZONE_FINISH command failed, for example on one device of a RAID1 block
group. The write is still lost:

  O_DIRECT overwrite, the last extent ends at the zone capacity
  write and sync return 0
  ZONE_FINISH fails on one device
  btrfs_finish_one_ordered(): no file extent item, extent freed
  first O_DIRECT read of the file: -EIO (writeback error of the mapping)
  later reads, also after a remount: the old data of that extent

do_zone_finish() marks the block group as finished before it sends
ZONE_FINISH, so nothing writes to these zones anymore. Report the error
and let the ordered extent complete, as before that commit.

Fixes: c428b763f29b ("btrfs: zoned: propagate do_zone_finish() error in btrfs_zone_finish_endio()")
CC: stable@vger.kernel.org # 7.3+
Signed-off-by: Miroslav Cimerman <mc@raidlab.org>
---
 fs/btrfs/zoned.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index e6ce6f05ad75..45bd05d8edb4 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -2783,7 +2783,7 @@ int btrfs_zone_finish_endio(struct btrfs_fs_info *fs_info, u64 logical, u64 leng
 {
 	struct btrfs_block_group *block_group;
 	u64 min_alloc_bytes;
-	int ret = 0;
+	int ret;
 
 	if (!btrfs_is_zoned(fs_info))
 		return 0;
@@ -2803,11 +2803,18 @@ int btrfs_zone_finish_endio(struct btrfs_fs_info *fs_info, u64 logical, u64 leng
 	    block_group->start + block_group->zone_capacity)
 		goto out;
 
+	/*
+	 * The data of the ordered extent is written. A failure to finish the
+	 * zones does not change that, so only report it.
+	 */
 	ret = do_zone_finish(block_group, true);
+	if (ret)
+		btrfs_warn(fs_info, "zoned: failed to finish zones of block group %llu: %d",
+			   block_group->start, ret);
 
 out:
 	btrfs_put_block_group(block_group);
-	return ret;
+	return 0;
 }
 
 static void btrfs_zone_finish_endio_workfn(struct work_struct *work)
-- 
2.53.0

