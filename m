Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131682;
	b=pu1vrk4jqPPapysZRBENals46t7+m/cRHLCqn9llWB4o5nBi1L4NQVurJWfQWO5RfaIH
	 xmtPZlWxKu4u6BjwpklnHTS7AFvzKZPwNtZEK0vgT1MmqtFmfjbVQYOz8u6pJdSJ3mzqR
	 21ue80lJRruP54wOgBVahHuyW+UF+zYL2yW5NYam+hSQsbffTqoEJ7m91Qh7xOHxjj7pJ
	 vUAa1L8mXHplvBYJYh5eUDj5BDt1uRdV/W+mY8jucTlomK5NdwEOGf8Hgsuxz++Ubt2ya
	 uxSFi7E6hP/mxkDXcdajXEPdtWh73o5dtfG3hHweY9hJAaOMKlhdrQlmGKXu8SOdIGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nKWdvn5g3LWqbr6kSTOS4+Q+mYE0fgsqV+kyH0HAgJc=;
	b=OzY9ciNuZASgMimjBFN5xwzo9UNJNxJ6Ms8FZYLla2VNfr5z4fyqoH322niixHxoGM9s
	 bw2eDJ/+LOWmUljReZTA9tGMigXqriFlKlvB042/YUkAxWE0yeVWmlp16BwtT0GWggAkp
	 Mo+PomP46hnXzl3oykZQVxTHPw+qYdyvDsopCzrbvm0n6Dz6n54pq/7AywgI3ChMC3D2B
	 pU0zr9HoR1ZHgnsoFY+6A7wRLn/bWqrQ9cvzU4XurGBWKRuQBEQ9gIPaCumEJZbbYitD9
	 H6SVTQHkkYbEE+ZeKG8IzNACu+gR4UnmiDvXG2pZB2b2lwKXxiPGACg26RAF3HJ1yAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uavAA8Gu;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435F260A2635
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 435F260A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uavAA8Gu
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67da62357acso706003d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1795131681; x=1795736481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKWdvn5g3LWqbr6kSTOS4+Q+mYE0fgsqV+kyH0HAgJc=;
        b=uavAA8Guf8WpnuTNpWimlPENJzUf8jbi7z9vm+4+bM3r6bbHArdER6HHyjbhAroXL9
         tX1WDOkGFYXp/Z8PZbeNdlWudF/fgIs6dmff5+n8b55qWrsGD0lXa5aNLl1svV+NQSik
         BInwZLE8LD5tLiSiqOjLoRe73LDHVO8WtEP2iZ5IEuzF0pnoIcjBi7nBgmlgFW1uvgEL
         dNeqagXulZh2q8aM4G6lvtAj50AfM4xSaQD2ti4kX3T23AiGMymqbTuPwp+G1acY/ZcK
         rBP2PmLWd8jaYjY/2GLCYVawno+kEBBao6Uesp3u3pcN9WPYQtrAfALrEojDy6Vu/DB0
         suoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131681; x=1795736481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKWdvn5g3LWqbr6kSTOS4+Q+mYE0fgsqV+kyH0HAgJc=;
        b=a/mMIOV9I+2VW43es6bGHaxSaTUZtXRXZdghT3IG7jLeT8XQwd4Xnu5/nDzOzNxZSl
         QXWRFPuYyUj9mCu3YSiJCr70j9UohY7Iv1/INwK25VQ/MhRPFwVUZ95+5MnDp8RyflgY
         s31d/hdon3DOn42GCu2/Er6DjWzk1fMceKdPRRbd5zHvB8SecGsr/tONceK31xyJjDKL
         LmhPOZwcwGezVp4v7RpokAnfEe8StQEnRQdia+tJoSwW3xmHa+kVVXCPWlnsJnnDvV4D
         1d6MMdJgb+nQMW3V/EkQpx7fphTg0xVBjGNpi/G2au9yPA+OFPG5Pgz2vSPzn58lUq2q
         I7vw==
X-Forwarded-Encrypted: i=1; AL+hErH1d2P0PVQWRq6y3ojdUrRMfHCqEPfJm0lF5Ss5LQYSd77fWeVKHvohaGTtepoJR8J5Hbsu5l3SIDPxxgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VdhyqB2sA5xYn1HhS48rjWkUT5p1SEbikUh3siXJgxuNKKGoT
	IXqeVQ1phG/Tn4FSn9Y9xpXpY85WcaNsN1YjbpkGu7QJiWd1Pt3nsqyFQBqrST9lKqQ=
X-Gm-Gg: AZFdTZf5WDQjlvpuCoJ2Wn/e9YJciEbsz4LHM1ugGKETfm2ziQ0Z0wuueKT8zqL/xt4
	VUoLKHVzXzcTtpwz0+18UD9VDxcRWct54Zt9p7emmKa4PYj2VcyVKORppgrA9m1MK/5Twzo+6wD
	rOy6m2jx1beDv4zNocgrMHW2IRw+hMddQKAwEL2IEgd90LptxZeTZMDWpgWrT5mb+t2BCgCBtcS
	Nm1+QXsejKYbyduBlX09zVdu8wsPV7GsGaqEuWOkffLiQrULgV30MuQ7R64RWxjuRxjiUXp01bs
	cuWo9utZLTnrxDujSXYz/qxmNe2Yxqnc1e8aEEc0Aj+M42JtQHUjUDZnqJBDeI10NLvrS8OwL62
	kEy2S8xEO3tiGkVBprAyafUrVEwvxrXFL35u5deNOrPekOxtF8UZ+/uAjhp5YVvfIYmdhHBFJ3b
	avZsYlrAVA4BOZ4T4WC/nkTS1ATNDuKdO6xRZhuMFgB4tC8ObC9/VCrmgbkDiwFQ+Dn/tzwadmf
	LU60jZ/p1oYagD3gsueYWw686p316BeZBrGqnTjjpriEEerNB4XDlSMpgJy7thduu+fn0m50iLi
	JnqCSPUZ1YwXpkoBF+gYuq/3KycL+WZq+oodK+7M3eU3D9DraLF0iv+96kYiKjgZN5UlwQdYg52
	DBLJc173GdL+fv+qZ4QfdrTlVX3Bx3QAEC4U076Gik0vFadxLXy1pWD7XIfr4MfrjORu44V0=
X-Received: by 2002:a05:690e:419c:b0:679:f97f:fdf6 with SMTP id 956f58d0204a3-67df448c769mr466727d50.66.1795131681346;
        Thu, 19 Nov 2026 15:41:21 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:1932:ad09:1827:11fb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df338e8fesm796893d50.16.2026.11.19.15.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:41:20 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/5] hfsplus: reject an allocation bitmap that does not cover the volume
Date: Thu, 19 Nov 2026 15:41:11 -0800
Message-ID: <20261119234112.720963-5-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119234112.720963-1-slava@dubeyko.com>
References: <20261119234112.720963-1-slava@dubeyko.com>
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

The allocation file is a bitmap with one bit per allocation block, so
it has to be at least DIV_ROUND_UP(total_blocks, 8) bytes long. This is
not checked at mount. hfsplus_block_allocate() and hfsplus_block_free()
look up any block below total_blocks in the bitmap, so with a shorter
allocation file they read and modify bitmap bits beyond its end, which
are never written back.

The only guard is in hfsplus_file_extend(), which fails with -ENOSPC
("extend alloc file!") once the blocks in use approach the bitmap size,
and hfsplus_block_free() has none. On a 64M volume created with
"mkfs.hfsplus -b 4096" whose allocation file size in the volume header
was changed from 4096 to 1024 bytes (fsck.hfsplus reports the volume as
OK), writing two 24M files fails with -ENOSPC at half of the volume,
and after unmount fsck.hfsplus reports:

  Volume bitmap needs minor repair for under-allocation

Fail the mount if the allocation file is too small for the volume.

Tested on a KASAN and lockdep kernel: the volume above is rejected at
mount with "allocation file size 1024 is too small for 16384 blocks",
the same volume with an allocation file of 2048 bytes (the minimum) or
4096 bytes mounts.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
---
 fs/hfsplus/super.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
index d23594d12064..6e4068e53b4f 100644
--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -777,6 +777,19 @@ static int hfsplus_fill_super(struct super_block *sb, struct fs_context *fc)
 	}
 	sbi->alloc_file.inode = inode;
 
+	/*
+	 * The allocation bitmap has one bit per allocation block. The
+	 * bitmap code looks up any block below total_blocks in it, so it
+	 * must cover all of them.
+	 */
+	if (inode->i_size < DIV_ROUND_UP((u64)sbi->total_blocks,
+					 BITS_PER_BYTE)) {
+		pr_err("allocation file size %lld is too small for %u blocks\n",
+		       inode->i_size, sbi->total_blocks);
+		err = -EIO;
+		goto out_put_alloc_file;
+	}
+
 	err = hfsplus_ext_load_alloc_file(sb);
 	if (err)
 		goto out_put_alloc_file;
-- 
2.53.0

