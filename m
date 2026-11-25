Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617279;
	b=aSNHhTQ/fkrOkQUcZvkDEioWYoJoe1JyeNvRH2zOIx1A0e6tJfNJstFq2s8Nil+3BjEp
	 R/9hRT2Jvr4Gs8nEalzweKcAd3QZGxv87x+Zp2M+HModA7TRFEKu/jx+7uzmdqdjzaKcu
	 jsVbdqwrWyTP4EJCzfYk+rGTy/XlrgbKQnZS/XL+C1CfsLe7pLiy2qH4sYYICAuvreAwd
	 dGKg9RCNuqanOBPyP4Nvn9pREOSw9bMkIPrfkdpiq/nk/AGlNQjSUENlBKVR/Pahro0fO
	 oBjwIq5agR1NPl4Z4GhxYsUKPQXZV4hMKLqhoMTL+sXjrCHoe/erfNdfi5H+iHiQxqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mhLYOMnl9962TiXgxuHKr67nXpe3NbwFxQ9c7lj7uDo=;
	b=Z2R04HxeImog7c0PpmjFvbTmXc2FGDtz3aXTbrlS6JbVQ1SXvmsk/+5qcSjREPOh5SZb
	 cAeWsQmsWIR+FduiaKN2BubASE/la4GxRYDw9GDFJns8NSsqmsunEe5J58+kC5O3dxGqZ
	 w7qvj+QqrEjdS24+BsfttTcBFIf0DONNa/1kJF/AFZxIn1cLXxR6jJ9JQ+eLHnibT59O0
	 KltiGoyDfF/90AcDmOAflNCOSNmZok16weYI/7pWThTIfD1ES7jYdwU1B7uCWjK/1lweW
	 EvzDLplmXM/Hc+a6W4RsQmEzgorffpCni31FFdYlMBHGuEvIdXsCvYDqJ3EuVUy+VMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=khqQkzoK;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EA9606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85EA9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=khqQkzoK
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so104860eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617278; x=1796222078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhLYOMnl9962TiXgxuHKr67nXpe3NbwFxQ9c7lj7uDo=;
        b=khqQkzoK3i49QvuxBB8aoDqY/FOxKxIUPKWVwNMScKVQ3oPs9+hAqq8wzHZE8QhUCz
         0CpYiXjDWbQWnV5tZgLfz8ZDPFG/EyNUnQKaDBm6HVITJbUJ8G7i2w+M2ce0ESgT37Lz
         ezGXCNPjOuIgA6ZseKbBB/bkdzebw5Y1PgFu+ykNkXmBj60Uw+CTwvUhR5AB/iC5LeP8
         z687nn8GD1IBw8p+0hgnolMGeEIZzFpJc95CnfW5/aMhtfa0vGo4e1xKJDd21n/oBWaq
         RJkx21KY/o61MKul89Z6dhgKXEecULiXET93rdS3JOm8HErCqMFSK9rkq/iIK3bd9kbn
         UoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617278; x=1796222078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhLYOMnl9962TiXgxuHKr67nXpe3NbwFxQ9c7lj7uDo=;
        b=T54xD7reQIr3i4zsVBKNaaoLERfWIf+VS8MWJBOCUBa3Ax1rfI1K1pW3lfWiz1uuir
         MV0ePqIWXvpdA1qPcHYfUHY34dbe3bbgszZk/jj9EFtlNbXrb/rxWWqKf/Gpqa8/MNmt
         Py9tRd7heJeRoxBzLcHYaMUfZ93OehWlOuYDx9bO8RKkxN8a9xQ09fYyotAxuOVZ4ugM
         4UG4n2jw0fMGNfKKVECyPsW7XTU2dREHGzXgQAwictMaChHyjNvLtVu2hgNoIGEdkW1s
         MbaF3K/1Y/ubDUpqlTAqQbyVJ+hT7HmUtE0QyMKhnJpFvRDAtTOKeDkrAZtsqnxaPqb0
         aX0g==
X-Forwarded-Encrypted: i=1; AL+hErEWFwUxpep3nzjn1MJluSDh2kS7kd9u3Ho6GezH5UNzA2abXIq0PtQsig9hiMQx8ZKbvwVO3hsMgIdI9C8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dTvAe6EJLrcEBU5BLkwwDkNX4WP9PJ29lZU4qszJSGgy0Oz2p
	BrRzy9MKHgl43ZoqRXu72EHSOQKkMwARBvPk0f+lKRPO7qYOTKSc91rj
X-Gm-Gg: AZFdTZeZgr1cdPNXOcoNiS+k9PHebmVKo4F3nLJZWyVnx2VW3cXtT3TKklLDDXrhOhQ
	7hdl5hKlLMMvJQKOIi6vsUWe7lXhWxoXjPLljqISruYCllLHPSyg19fbvLE5ub7dB7vwrrzeAlp
	7jp7yS6CJMzrvgML7VP0NEDcE4h+WpgbS17vu+dui8dR/OM2RaL5Z0reZqoZDG6lU1rm78PRrt1
	IDNwlJtYX11m/jr+sG2JiJNLA454vN7xW0TzPFhflB+e0ksMpY3KFegBgJoknTqpmDYwy4mg6em
	8Qe8yRZNtVvb+qOjc58RR6Ehbp1JoIzXpqV3k3XORczQ7IA+bmxhbf2aqV8kKFLORfBlciiat7R
	zl3xt6yJterm6E3sAuX+9ss/vt6JWxbiqgOmCEuuCZ08F41wTOxJVz5e96RtuDu0v2CS9mZoF6G
	WVXTZ3lbDezvHBiCEFpbjCDzi6uXsu5Z1+/spFz4BZ2zpgV3v+p1Ge48KMcfX3LVpNvvHc1vvQF
	DtCn6MsP8Bcu2tojGpyv03FQuKkD7MZvaH4jYFW3HecHTXTr4t7KkcNjj2pWHhWWZAuHUX7xjAH
	OdRq7AqBwyx/C1T+LDPduj8L/O9o/3Uz3Vfop96Qn59/YoLpzi0BtsXFtIhmpxw9YRlX
X-Received: by 2002:a05:7022:b051:20b0:1b4:e533:ff50 with SMTP id a92af1059eb24-1b556912ca9mr20265727c88.40.1795617278266;
        Wed, 25 Nov 2026 06:34:38 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm48606523c88.13.2026.11.25.06.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:34:37 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>,
	Qu Wenruo <wqu@suse.com>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6] btrfs: tree-checker: add more checks for file extent items
Date: Wed, 25 Nov 2026 06:34:31 -0800
Message-Id: <20261125143431.3035562-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

check_extent_data_item() only checks the alignment of most members of a
regular or preallocated file extent. Add the following checks, based on
what btrfs writes:

- An explicit hole (disk_bytenr == 0) must be an uncompressed regular
  extent with zero disk_num_bytes. Its offset is not checked, as
  btrfs_drop_extents() can trim the front of a hole extent.

- A preallocated extent must not be compressed.

- An extent with data on disk must have a non-zero disk_num_bytes. If it
  is compressed, disk_num_bytes must not exceed BTRFS_MAX_COMPRESSED and
  ram_bytes must not exceed BTRFS_MAX_UNCOMPRESSED, as compression and
  encoded writes never create larger ones. Otherwise both must not
  exceed U32_MAX. Uncompressed extents can be larger than 256MiB, for
  example preallocated extents from kernels before v3.9, but they should
  never get close to U32_MAX.

- offset + num_bytes of an extent with data on disk must not exceed its
  ram_bytes if it is compressed, or its disk_num_bytes otherwise, as
  btrfs_extent_item_to_extent_map() uses disk_num_bytes as the ram_bytes
  of uncompressed extents.

Suggested-by: Qu Wenruo <wqu@suse.com>
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
Note that before v3.9, __btrfs_prealloc_file_range() reserved the whole
fallocate range at once, so on a RAID0 or RAID10 filesystem with five or
more data stripes a preallocated extent can be up to the 10G data chunk
limit, above U32_MAX. Such a filesystem would fail the new check. If it
should still be accepted, BTRFS_MAX_DATA_CHUNK_SIZE could be used as the
uncompressed limit instead, as a data extent never crosses a chunk.

Changes in v6:
- Check offset + num_bytes of uncompressed extents against
  disk_num_bytes instead of ram_bytes, as pointed out by Sashiko on v5.
  btrfs_extent_item_to_extent_map() ignores the ram_bytes of uncompressed
  extents, so disk_num_bytes is what reads are bound by. This also keeps
  accepting uncompressed extents from older kernels with ram_bytes
  smaller than disk_num_bytes.

Changes in v5:
- Drop the crash reports from the commit message, the patch is a
  tree-checker hardening.
- Add a dedicated check for explicit holes: they must be uncompressed
  regular extents with zero disk_num_bytes, as Sashiko pointed out on
  v4 that a hole bypassed all the new checks.
- Reject compressed preallocated extents, also pointed out by Sashiko.
- Check offset + num_bytes against ram_bytes for uncompressed extents
  too.
- Only use preallocated extents from kernels before v3.9 as the example
  of uncompressed extents larger than 256MiB. A direct I/O write
  reserves its whole range, but each bio gets its own ordered extent, so
  its file extents are only as large as its bios.
- Change the subject, as the patch no longer only checks disk_num_bytes.

Changes in v4:
- Also check ram_bytes of uncompressed extents against U32_MAX, with
  max_ram_bytes picked the same way as max_disk_num_bytes.
- Reject a zero disk_num_bytes for extents with data on disk, and an
  offset + num_bytes beyond ram_bytes for compressed extents, as
  Sashiko pointed out on v2 and v3.
- Skip holes for the new checks, as their ram_bytes is the hole size
  without NO_HOLES.
- Correct the commit message: direct I/O writes can also create
  uncompressed extents larger than 256MiB.
- Rebase onto misc-next.

Changes in v3:
- Relax the uncompressed disk_num_bytes limit from 256MiB to U32_MAX,
  as preallocated extents created before v3.9 can be larger.
- Also check ram_bytes of compressed extents against
  BTRFS_MAX_UNCOMPRESSED.

Changes in v2:
- Use SZ_256M directly instead of adding a new macro, and leave
  inode.c alone.
- Shorten the comment.

 fs/btrfs/tree-checker.c | 72 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index f021ac14babf..1a8e5b997493 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -244,7 +244,11 @@ static int check_extent_data_item(struct extent_buffer *leaf,
 	struct btrfs_file_extent_item *fi;
 	u32 sectorsize = fs_info->sectorsize;
 	u32 item_size = btrfs_item_size(leaf, slot);
+	u32 max_disk_num_bytes;
+	u32 max_ram_bytes;
 	u64 extent_end;
+	u64 data_end;
+	u64 data_len;
 	u8 fi_type;
 
 	if (unlikely(!IS_ALIGNED(key->offset, sectorsize))) {
@@ -377,6 +381,74 @@ static int check_extent_data_item(struct extent_buffer *leaf,
 		     CHECK_FE_ALIGNED(leaf, slot, fi, num_bytes, sectorsize)))
 		return -EUCLEAN;
 
+	if (!btrfs_file_extent_disk_bytenr(leaf, fi)) {
+		if (unlikely(fi_type != BTRFS_FILE_EXTENT_REG ||
+			     btrfs_file_extent_compression(leaf, fi) != BTRFS_COMPRESS_NONE ||
+			     btrfs_file_extent_disk_num_bytes(leaf, fi))) {
+			file_extent_err(leaf, slot,
+"invalid hole file extent, have type %u compression %u disk_num_bytes %llu expect type %u compression 0 disk_num_bytes 0",
+					fi_type, btrfs_file_extent_compression(leaf, fi),
+					btrfs_file_extent_disk_num_bytes(leaf, fi),
+					BTRFS_FILE_EXTENT_REG);
+			return -EUCLEAN;
+		}
+	} else {
+		if (unlikely(fi_type == BTRFS_FILE_EXTENT_PREALLOC &&
+			     btrfs_file_extent_compression(leaf, fi) != BTRFS_COMPRESS_NONE)) {
+			file_extent_err(leaf, slot,
+		"invalid compression for preallocated file extent, have %u expect 0",
+					btrfs_file_extent_compression(leaf, fi));
+			return -EUCLEAN;
+		}
+
+		/*
+		 * Compressed extents are at most 128K both on disk and
+		 * uncompressed. Uncompressed extents should never get close to
+		 * U32_MAX.
+		 */
+		if (btrfs_file_extent_compression(leaf, fi) != BTRFS_COMPRESS_NONE) {
+			max_disk_num_bytes = BTRFS_MAX_COMPRESSED;
+			max_ram_bytes = BTRFS_MAX_UNCOMPRESSED;
+		} else {
+			max_disk_num_bytes = U32_MAX;
+			max_ram_bytes = U32_MAX;
+		}
+		if (unlikely(btrfs_file_extent_disk_num_bytes(leaf, fi) == 0 ||
+			     btrfs_file_extent_disk_num_bytes(leaf, fi) > max_disk_num_bytes)) {
+			file_extent_err(leaf, slot,
+		"invalid disk_num_bytes for file extent, have %llu expect (0, %u]",
+					btrfs_file_extent_disk_num_bytes(leaf, fi),
+					max_disk_num_bytes);
+			return -EUCLEAN;
+		}
+		if (unlikely(btrfs_file_extent_ram_bytes(leaf, fi) > max_ram_bytes)) {
+			file_extent_err(leaf, slot,
+		"invalid ram_bytes for file extent, have %llu expect <= %u",
+					btrfs_file_extent_ram_bytes(leaf, fi),
+					max_ram_bytes);
+			return -EUCLEAN;
+		}
+		/*
+		 * btrfs_extent_item_to_extent_map() uses disk_num_bytes as the
+		 * ram_bytes of uncompressed extents.
+		 */
+		if (btrfs_file_extent_compression(leaf, fi) != BTRFS_COMPRESS_NONE)
+			data_len = btrfs_file_extent_ram_bytes(leaf, fi);
+		else
+			data_len = btrfs_file_extent_disk_num_bytes(leaf, fi);
+		if (unlikely(check_add_overflow(btrfs_file_extent_offset(leaf, fi),
+						btrfs_file_extent_num_bytes(leaf, fi),
+						&data_end) ||
+			     data_end > data_len)) {
+			file_extent_err(leaf, slot,
+	"invalid offset + num_bytes for file extent, have %llu + %llu expect <= %llu",
+					btrfs_file_extent_offset(leaf, fi),
+					btrfs_file_extent_num_bytes(leaf, fi),
+					data_len);
+			return -EUCLEAN;
+		}
+	}
+
 	/* Catch extent end overflow */
 	if (unlikely(check_add_overflow(btrfs_file_extent_num_bytes(leaf, fi),
 					key->offset, &extent_end))) {

base-commit: 10b0e58070dc350f3e47a87bb4a584050f32ef18
-- 
2.34.1

