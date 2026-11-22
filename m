Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795319326;
	b=do0AtWbSmgsEbYh2xYuEm/751kb4pcAiIsjIqsObmms/4FbEJLg617dyVDOPDUv8hMdE
	 71HoMVFyYNHrSVYgS/8dJ8dNDOcq0jpeUjdxrSh6TqE0XSLbasVbw9c8kFblLA9YflcCb
	 iPpobjQTzmzQRE0ze5ni+hCdQg3UOb/oXXr5eLcCnmWrSMmmZJibtgMEqUwQHw61tyOzL
	 04SDVO76r4GkMsozugqsmmyFhdS59/Xjehk/3a/Kwfq90TWF3SgRI9Wej3cCDONXOqTBK
	 2birCnMicrRxoIEujmmulmzGPKsUFI2dJeA7VMaHlSEb32z0pQV0rYU5Aj/8mW8Nk5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795319326;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iXA97T2iUMxZHGG58gqlxBN6lMsTXSCZuiggW9DAKCk=;
	b=elmQjhcsMGDMlvKZ3yV4vu4+aGCyATUJ+NMnOcPVo673Y8RoDj2mXxDTn9dhTM+y0YTB
	 Drym9qvWDfL7Q3g8+Lee5pcJJRkhDURO+0tImqW+XSyBm+K4S8JvkiqS6+b94Y47gtKMb
	 1+Fk96RP1Z14IH6PEbY1a9y9jPlfJJjGXcX2koY8zLAOhN0R3esaveWYpnuKKoFvxCSwE
	 cwD+djo4vTEPSP9WZjKmloq1wxHWeWYezWjhVuSH9fuMUKl8oHEsHFRd5E4gcZ1l5Lx7l
	 g6t8OqALKMDL/CqcYvWyadj7y93DBVwlNcFJn/CSmQit5mJ61PuHZpYctu5zR3NxNFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=KfhiWg78;
	arc=none smtp.remote-ip=185.70.43.171
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864D9606A33F
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 864D9606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=KfhiWg78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1795319323; x=1795578523;
	bh=iXA97T2iUMxZHGG58gqlxBN6lMsTXSCZuiggW9DAKCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KfhiWg782GpdOaOEogmZRsGHdZ6aoDuyXyMfSGN3iejluCK2hlFBRzDbpcJnUhKA6
	 O7LFgujuFjbwC8z1A2Swm7izfQoaVyqjlJ+T+z9895wxC8zlImxW4eIDntSlslVvEa
	 dLp6nkK8zpUGb833Eozms2wnosDLr9F7eDON32UGEkwXE9fnGmrPv9pNgK9wNxNLB3
	 UciW+Qpl+s4EfIJ2odiZVGuxj53rmG7YLZb3Rat+EcS9USiQ3IuvVw0CqOn4ioK4Ld
	 5ORf3224UufNICqop5HE86WX1zguBlGMAUTdJC8ehoNtfLNm0MGx8Mv1uR2DyrKAEk
	 +HLHXzdr6WRXA==
X-Pm-Submission-Id: 4jXFRX5T8sz1DDrZ
From: Miroslav Cimerman <mc@raidlab.org>
To: linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Qu Wenruo <wqu@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] btrfs: zoned: use zone append for every copy of a mirrored write
Date: Sun, 22 Nov 2026 03:48:24 +0000
Message-ID: <20261122034826.2333981-2-mc@raidlab.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122034826.2333981-1-mc@raidlab.org>
References: <20261122034826.2333981-1-mc@raidlab.org>
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

Since commit b39b26e017c7 ("btrfs: zoned: don't zone append to
conventional zone"), btrfs_submit_dev_bio() uses zone append only if
can_use_append is set in the btrfs_bio. For a mirrored write,
btrfs_submit_mirrored_bio() sends the original bio to the last stripe
and a clone to every other stripe. The clone is set up with
btrfs_bio_init(), which clears can_use_append. So on a zoned filesystem,
every copy of a mirrored data write but the last is a regular write at
the allocated address.

A regular write to a sequential zone has to arrive at the zone's write
pointer. Writes to one zone can arrive in a different order than they
were allocated, for example from two writers. The copy that arrives too
early then fails:

  extent A at offset 0, extent B at offset 64K of one zone
  last stripe (zone append):  B, then A: both written
  stripe 0 (regular write):   B fails, the write pointer is still at 0

A RAID1 write succeeds with one failed copy. A buffered write then
completes with one copy less. At write time, only the device's write
error counter and its "errs: wr" log line show it. The failed write also
leaves a gap in that zone. Every regular write allocated behind the gap
fails too.

Copy can_use_append to the clone, as commit c757edbef980 ("btrfs: fix
copying the flags of btrfs_bio after split") does for split bios.

Fixes: b39b26e017c7 ("btrfs: zoned: don't zone append to conventional zone")
CC: stable@vger.kernel.org # 7.0+
Signed-off-by: Miroslav Cimerman <mc@raidlab.org>
---
During a device replace, writes to block groups that were already copied
are sent to the target through the same function. With this patch the
source copy is a zone append write again, as before 7.0. I did not test
a replace.

 fs/btrfs/bio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/btrfs/bio.c b/fs/btrfs/bio.c
index efbce4d549ff..8aac4afa30ee 100644
--- a/fs/btrfs/bio.c
+++ b/fs/btrfs/bio.c
@@ -519,6 +519,7 @@ static void btrfs_submit_mirrored_bio(struct btrfs_io_context *bioc, int dev_nr)
 		bio_inc_remaining(orig_bio);
 		btrfs_bio_init(btrfs_bio(bio), orig_bbio->inode,
 			       orig_bbio->file_offset, NULL, NULL);
+		btrfs_bio(bio)->can_use_append = orig_bbio->can_use_append;
 		bio->bi_end_io = btrfs_clone_write_end_io;
 	}
 
-- 
2.53.0

