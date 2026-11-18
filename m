Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992867;
	b=YT2p/QyY0Bxo6NIJy6W/BHpWnIqEsg2VAbNyUxDnXf1sv0KtVlsetB3ZX44uwVb99W4s
	 +7jd19CojNnn6w58fri8JJ/zKS6QxyUgu2F/l7td5N/yvd+T9hvqGHFnB781Js4+OIGBo
	 tlN3wTqW3OOkZzHCmtilo1NEAOP3G3+8twhQwPIW+jfWRSq/d0GGPp2YD0aNwBTPXHcQn
	 B3qJwR/3qz1gI86v4cxpWj/bULICVshnTjfwybN89Iw1Y4k2j6+QzFI/DJ7MGti9NfCjP
	 sxxxitRbHn0L9zwpGmVemd9B0t05rCp/st9RkogRMNTmir/WPZwAiaztag72ZtF8bMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992867;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=MFoFqOsxsF0mMxP5c38fD1pVJRD+Yn/OA3ZdUReG7Uk=;
	b=IoVR/S8h0jzs5DOCbH1pwlxZFlRLxMPh264gaK7kH/gmdSpc2JW4VwKlRGC5g7Kx0twK
	 tDtZM0HnRKF1LUyZ4PCUywJ8KPgfdM4J3MnY0Y+duedyUYuXXre3DwltBY4mFudnO7rDi
	 HlIKwKGJ1BXUSNWeozn0/CZGTGXb304SZngqYjjRpKCsCElWWM86o4Bnyk8bxILuelG9X
	 /xb4Tlg0tUova3gHxWZWtVPRD0ctLjYIQ2igpAuvxgTLLCvuL2r20+lGaJBuO9Sf3O2na
	 h1aP6SYG0qYNlEUFx0R+CZ4zDKIAXOImkaQRXM44sqdnPgUlWZxowHPVYfwUaH2ztwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oYnK8x0H;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C46606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04C46606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=oYnK8x0H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=MF
	oFqOsxsF0mMxP5c38fD1pVJRD+Yn/OA3ZdUReG7Uk=; b=oYnK8x0HS/O49Ya6h7
	9jCXvpn2PVLsorH1AZ1W23J1Ad0Abhb24T//6Gadpe8SObT1KMF8tNTLT2SYsxuV
	IklMBao+3kvFJKGmqR36u/H7WWPzvZdBYzbc5THH/BN+PpAo4vHMGaBMHMwgAoGm
	8jRl99mKuqmABZZXUOqIE0eT8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDn7yTNav1qnmzWIQ--.7895S3;
	Wed, 18 Nov 2026 17:07:26 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 01/37] ntfs: propagate mapping-pairs update errors from inode writeback
Date: Wed, 18 Nov 2026 17:06:25 +0800
Message-Id: <20261118090701.1858849-2-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wDn7yTNav1qnmzWIQ--.7895S3
X-Coremail-Antispam: 1Uf129KBjvJXoWrZFW3Aw4ruF48GFW3uF15Arb_yoW8Jry5p3
	9xCryDK3yDJFyDKrs2kF4agF1I9a4kK3yUJF1UKw12qwn8KF1vqFWFya18Xr1kCrZ7ta4a
	qF1UuwsruryUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFAp8UUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8A7n0Gr9as6IcwAA3B

From: Xuewen Wang <wangxuewen@kylinos.cn>

__ntfs_write_inode() overwrites a failed mapping-pairs update with the
result of syncing standard information. fsync() can then report success
while the mapping pairs remain dirty.

Check the update result after releasing the runlist lock and take the
existing error path. Preserve the errno and retry handling for ENOMEM.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v6:
Keep the existing standalone writeback fix ahead of reporting helpers.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.
- No undefined references to ntfs_report_* or fserror_report_*.

 fs/ntfs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 6a9f488e2775..ba1f78fc8c66 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2974,6 +2974,8 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 		if (!err)
 			NInoClearRunlistDirty(ni);
 		up_write(&ni->runlist.lock);
+		if (err)
+			goto unm_err_out;
 	}
 
 	err = ntfs_inode_sync_standard_information(vi, m);
-- 
2.51.0

