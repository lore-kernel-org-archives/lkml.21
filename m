Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571314;
	b=wvvhKGCg+gonyL2P24TtUmnG4XzrZZ0IGG9rOp6tmSuMBjsQVWUy2/64vpIDxFKXgIt3
	 VOxUUVQnzkoH2k/uQhSv9RtBeQhO+UGC/toLG/WF7A+uh1bBG4uEEwn7Nc5XsImr77TnY
	 KVeWKpmP+fJnYQSZMygn6Xi/4MKSwJoAXvRU1Ack5kVeis9qxnlwd9lNNRx4KuTV6/UQ5
	 qIoRHGMgQbjINzTsLJed23z8xj1okdiyjMEZubmKAhE+xV75ZT0hY+UYOODbhp4easeC/
	 E4j//25trLjoUMXENiI9a4LIur5u53DdtlS7M9xngAke8PZp5f9vBuwMoqyHGHK7ydA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571314;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=X1NrYR8RrA/MRB9rmisn+6WOg8WaTqy3ek0PmvJ9mQc=;
	b=YEcfN2zYEqBh1zfL9nrlS742C2LWnhxkO8pM6FrP9T/cw2PA9h+SYbNBmXf3TD7CPbhu
	 N1TADXk/AB7PBnKP5NKp2nMXee3eYHbB84kOdvPLySRsF/PSIsMoQjqmpYKh2OpCwYFET
	 4EP7NRrmL7apFXCdhu7A4O70DMmedcmPVkvBbraKmmh2mO4cmMdeI3j07KxwNxd1X17oU
	 oNlvho/7IETKvxXmToFEA3pF+G+NOr2bGaNOi84ofFknPBLkuENQjRoRtp6S73dU/knl6
	 vG8u9+SSlhKq+2SqHi+Cjx7DVyjv3dncEz9qQRVzt6HeNEt4F8kmmJoEWhoo5IpDbqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=PYCIzyrl;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=OcFvh+ZA;
	arc=none smtp.remote-ip=188.121.53.13
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98967606A6A3
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98967606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=PYCIzyrl;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=OcFvh+ZA
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27NxX8NS; Wed, 25 Nov 2026 01:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571299;
	bh=X1NrYR8RrA/MRB9rmisn+6WOg8WaTqy3ek0PmvJ9mQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PYCIzyrl6eUcQA+brJC04pAgb5UHHnneG4jLf8+DMuUajSO3N/u0U1eOj6Y4WXb3h
	 QPjtrJe7sIS4Es6EpbKqjSeTzn5BpHszjhyFeHlF1wtoQZzgcYTbOYRPoSrLtcj9ha
	 zZmEmyaFWGoRrUUxKErty179S8fubMWFVcVpeOKYaODlto5ivgaaqEdZPqsisEov9a
	 jjh6vi80KXzvzoXiTBP8FD3F8qE4tCxMxruz31CCZyqIztYoPr7LajCZMz9FwC5vHD
	 SqYpfRsS4vZifmZvktyPirOVEVvfwHZAiqH1tyC3tBU6RlF0c8mr0ZL7UDFzsn6uWn
	 Ml6wKV8pdeTYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571299;
	bh=X1NrYR8RrA/MRB9rmisn+6WOg8WaTqy3ek0PmvJ9mQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OcFvh+ZAAFKQuswKZRP2OudlchugEFzwkfZu5XYdEScWxJlJ5Y06uHfk/mDmn2eLT
	 cE44saEx1USZL6QLTixuMNg2Yv0KiUmGeTAN1DlametSxrMGsIE6tF1q/RWlgKOQGl
	 y5z/ZGG+b2pDs29QX9R2eld/3lzOkik1k/h6jfh568gwbmM9VZJApES0ATukhmzelU
	 kO9VMPFJzdpxuyE4mjpZHWFj41JCVIYfU6IY3TYTdxIASqCw8zRH68+Gdph1VnEqJJ
	 KlkHOux4hnil+w1CU5zs1AJP7FLaunE0YWu+D/v0lVIbZ5kh0XJQQd4W7JcybWwATQ
	 6SbSfpK4RHTzQ==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e62
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=yKgdCBhA7QK4Y9OD5tEA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 80b515e03d21cd72741611094ed508e5:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 09/23] Squashfs: fix fragment bytes overflow on 32-bit architectures
Date: Wed, 25 Nov 2026 01:47:23 +0000
Message-ID: <20261125014737.347231-10-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfBBUrar6PdhX+9HBbAOW0ltDws4pnkZiS5JPw/D7vycPyog/36/Z1nT15I5NUSy5dk7JPqRC4M6h/JyNBV8d3mt0qcfgqToC+UvWP9PfYSN9tfihTwZR
 XGWCjgPW5W0MiUoB1rmqO7UuBwaBeqCD0gHxrX2ndQL1ipVnbTKhSlgJCn0BJFBbzoFWZU8PYE1ALj9mSdPVOqlfDmjHrBrwuVoHhTeIw+rmHYzkFrmSZK00
 gN9/LZ+/48G9ds7fpy2NdTrEUk4Y+tAqw2fMGx5KZST+KxXVWG/qt3AE5JsxOfFx

In helper function squashfs_fragment_bytes() the u32 fragments
variable is multiplied by sizeof(struct squashfs_fragment_enty).

On a 32-bit architecture the type of sizeof() is a 32-bit unsigned
integer, which means the computation will overflow for fragments
values above 268435455.

The knock-on effect is the size of the in memory fragment index
table will be incorrectly computed, and a much smaller than expected
index table will be allocated and read into memory.

Later when a fragment index beyond this is looked up in this table,
this will produce an out of bounds access.

The fix is to explicitly widen the fragments variable to a long long
in the squashfs_fragment_bytes() helper function.

Reproducer
=========

The following script when run on a 32-bit x86 kernel (which lacks
KASAN support) will produce an I/O error.  On a 32-bit ARM kernel
with KASAN enabled, the out of bounds access will also produce a
KASAN report.

[  193.817260] ==================================================================
[  193.818057] BUG: KASAN: slab-out-of-bounds in squashfs_frag_lookup+0x23c/0x264
[  193.820408] Read of size 8 at addr cc126708 by task stat/357
[  193.820720]
[  193.821675] CPU: 3 UID: 0 PID: 357 Comm: stat Not tainted 7.2.0-13187-g66498c75b4f8 #113 VOLUNTARY

=================================================================
#!/bin/bash

ARGS="-no-duplicates -no-sparse -no-hardlinks -quiet -no-progress"

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

# Create a Squashfs filesystem with 1026 files and 513 fragments.
# This will create a two entry Squashfs fragment index table.
#
DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

# Create a Squashfs pseudo file which is fed to Mksquashfs
echo Create a Squashfs pseudo file which is fed to Mksquashfs

dd if=/dev/urandom of=urandom bs=1024 count=50 status=none
for i in $(seq 1 1026); do
	echo "$i l urandom" >> pseudo
done

# Create the Squashfs filesystem
echo Create the Squashfs filesystem

if ! mksquashfs - img.sqsh -pf pseudo -p "/ d 0777 0 0" $ARGS; then
	echo Failed to create Squashfs filesystem
	finish

fi

# The fragments field (fragment count) in the superblock is at offset
# 16 bytes.
#
# Over-write the fragments count with 268,435,457 little-endian.  On a
# 32-bit architecture, this when multiplied by 16 will overflow, giving
# the value 16.
#
# Ultimately this will cause the kernel code to create and read a single
# entry index table (where in fact the table has two entries).
#
# Then stating file 999 which has a fragment id in the second index,
# will cause an out of bounds access.

# Write 268,435,457 in little-endian format to file
/usr/bin/echo -en "\x01\x00\x00\x10" > file

# Over-write the fragments count in the superblock
echo Over-write the fragments count in the superblock

dd bs=1 seek=16 if=file of=img.sqsh count=4 conv=notrunc status=none

# Mount the filesystem to /mnt
echo Mount the filesystem to /mnt

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

# Stat file 999
echo Stat file 999

stat /mnt/999

popd 2>&1 > /dev/null

rm -rf $DIR
=================================================================

Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/squashfs_helpers.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index 4088e598400f..524d4a77686d 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -55,7 +55,7 @@ static inline s64 squashfs_mkinode(u32 start, u16 offset)
 /* fragment and fragment table defines */
 static inline s64 squashfs_fragment_bytes(u32 fragments)
 {
-	return fragments * sizeof(struct squashfs_fragment_entry);
+	return (s64) fragments * sizeof(struct squashfs_fragment_entry);
 }
 
 static inline s32 squashfs_fragment_index(u32 fragments)
-- 
2.47.3

