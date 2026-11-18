Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004363;
	b=5IzYlZy2JLhmYyhJ8HQE1sY6nomWR19ARj+oO7QpXWsvXsCfoG8R1YJC3pa/c7EIgYGk
	 SVMdP8TppnoTJg9oeUsNYkiV3Sz72d0G57fj2+MSdNmFuKNknuSx7mMxSVPFWgW0PL/hj
	 BF/InHzfDjtJOyBlFsc+bolz4LAnH9DzWr21C3o82R+TD15rajSfzkzqx+QY89J7zk3sn
	 vSt7YjrG4HAi7AS60oHSGXB2CZaznKhOmG466AlqF0BGtPtIM0lyf0yhyaqukncl6y/QK
	 TiM+yxggOrE8Hnq9R7h8Q91YCFXSEUV1nooCHxJUXBVAbr5K6pRakWk/adxi3DNHTTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004363;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yuZG6CdJuD9vtqpA/QJDHc8bAea3N5SCYAeWRtouXhc=;
	b=zewc9T8mSIo7ktr7+nSXs6PDNww3yXUHulGhGsvFm00qZL2HM5yYpj0aPfzvpZ3wBa1L
	 gtBn2CQ8DN/3GH39aq6QZ0JQVRqtzTkjaV9GBO9TpSAjLq3DaUJW5RXKpbGZ9XLdkMQEh
	 eI4v/n4HYj2UaRPGng8nEoA8/4qJaB/8n72kzt4/rp/tPCQA4RxrM99w2WxAAZ0oq3QOh
	 Lv2WyHEbnegwhc+VGxcyYntheFsHW0RPllyfpETEaWOzmrPOBJNws4/m86kirIThWgCGq
	 9bBjhS+H0tgaimiAiwQXUwnT808pm5CY4HslmUnh+U+7xcyw5iU5J7wuQsauGlZQQ/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=eBegDgwO;
	arc=none smtp.remote-ip=79.135.106.113
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7B1606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F7B1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=eBegDgwO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1795004357; x=1795263557;
	bh=yuZG6CdJuD9vtqpA/QJDHc8bAea3N5SCYAeWRtouXhc=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eBegDgwO1w3M9BOhBV3y7lNkN8z6z+gW2asAO7dbzMnbyA+GNtWgoSGxPzvYdORJo
	 Ih/v9/eqnJcdu6Qljllyb6f4QKZZvgf1khcKrtFyVP0XocOLd44TkcMWruzQzG+yCd
	 HGwBdETOpaBUkChJXPjhgMEpA5K2cFzeSA35/BD8MaIu2XKabWkmAlCXBTVc7nSHWI
	 9pLFN2bzsZ+KX3KHeVMInvAC8rvYQV++7/WSoJWSyruuttFYAXQ2RGvxUYsR1LaQ1x
	 6/vvULv7ypPKnYGcfwhaBWb7rub0xpPb5C0NX5Xxx7DUPRatBrTL3C4VK94cP47E3V
	 fl2+6aFvlB3eA==
X-Pm-Submission-Id: 4jV0yX0XLQz1DDr2
From: Miroslav Cimerman <mc@raidlab.org>
To: linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] btrfs: start writeback of relocated data before dirty throttling
Date: Wed, 18 Nov 2026 12:16:31 +0000
Message-ID: <20261118121631.6644-1-mc@raidlab.org>
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

When over the dirty limit, relocate_one_folio() waits in
balance_dirty_pages() for the flusher to write back enough. The flusher
skips a filesystem whose s_umount is held for writing, but an unmount
and a remount read-only hold it while they wait for a relocation by the
reclaim work to finish: close_ctree() in cancel_work_sync(), and
btrfs_remount_ro() in btrfs_commit_super() for the cleaner_mutex the
relocation holds. Nothing else is sure to write back the relocated
data, and both hang:

  task:kworker/u16:1   state:D
  Workqueue: events_unbound btrfs_reclaim_bgs_work
   balance_dirty_pages
   relocate_file_extent_cluster
   relocate_data_extent.constprop.0
   relocate_block_group
   btrfs_relocate_block_group
   btrfs_relocate_chunk
   btrfs_reclaim_block_groups
  task:umount          state:D
   cancel_work_sync
   close_ctree
   generic_shutdown_super
   kill_anon_super
   btrfs_kill_super

The same goes for a resumed balance, which both wait for in
btrfs_pause_balance(), and for the relocation of the zoned
RECLAIM_ZONES space flushing, whose work both cancel.

When balance_dirty_pages() would make us wait, start writeback of the
data relocation inode first, then wait as before. Writeback errors are
still reported by btrfs_wait_ordered_range() at the end of the stage.

Fixes: 18bb8bbf13c1 ("btrfs: zoned: automatically reclaim zones")
CC: stable@vger.kernel.org # 6.1+
Signed-off-by: Miroslav Cimerman <mc@raidlab.org>
---
Found by an LLM while testing "btrfs: wait for block group relocation
on remount read-only" with a low dirty limit. The fix and the commit
message were prepared with the help of an LLM, which also ran the tests
below. I reviewed everything.

Tested on btrfs for-next (6f4bbde7e036) in QEMU with KASAN, one zoned
null_blk device mounted with commit=1, the reclaim thresholds lowered
and vm.dirty_bytes at 2 MiB. An unmount while the reclaim work
relocates hangs as above without the patch (5 of 5) and takes 0.2 s
with it (8 of 8, 3 of them with the default commit interval instead).
A remount read-only retried in a loop hangs without it (3 of 3) and
goes through with it (3 of 3); the relocation then still writes after
the remount, which "btrfs: wait for block group relocation on remount
read-only" fixes. With both patches, remount, remount with an
immediate unmount, and unmount are clean (9 of 9).

A balance of 200 MiB with a slow writer on another filesystem at the
dirty limit takes 3.4 to 4.2 s with the patch (4 runs) and 3.0 to
4.3 s without it (12 runs), 2.2 to 2.3 s without the writer either
way. Writing back each folio and waiting for it, instead of throttling,
also fixes the hang, but made that balance take 22.7 s.

The resumed balance and RECLAIM_ZONES cases are from reading the code:
a resumed balance can hang this way since 837d5b6e46d1 ("Btrfs: allow
for pausing restriper"), and the Fixes tag names the reclaim work,
which the reproducer uses. balance_dirty_pages_ratelimited_flags() is
exported since 6.1, hence the stable tag. The cleaner's autodefrag
throttles the same way in btrfs_defrag_file() and is not changed here.

 fs/btrfs/relocation.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/relocation.c b/fs/btrfs/relocation.c
index 072bc943d62e..6252608b0983 100644
--- a/fs/btrfs/relocation.c
+++ b/fs/btrfs/relocation.c
@@ -3045,7 +3045,19 @@ static int relocate_one_folio(struct reloc_control *rc,
 	folio_unlock(folio);
 	folio_put(folio);
 
-	balance_dirty_pages_ratelimited(inode->i_mapping);
+	/*
+	 * Start writeback of our pages ourselves before balance_dirty_pages()
+	 * makes us wait for the flusher. The flusher skips the filesystem
+	 * while s_umount is held, and both a remount read-only and an unmount
+	 * hold it while they wait for a relocation by the reclaim work to
+	 * finish. Writeback errors are found by btrfs_wait_ordered_range()
+	 * at the end of the stage, as with the flusher.
+	 */
+	if (balance_dirty_pages_ratelimited_flags(inode->i_mapping,
+						  BDP_ASYNC) == -EAGAIN) {
+		filemap_flush(inode->i_mapping);
+		balance_dirty_pages_ratelimited(inode->i_mapping);
+	}
 	btrfs_throttle(fs_info);
 	if (btrfs_should_cancel_balance(fs_info))
 		ret = -ECANCELED;
-- 
2.53.0

