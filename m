Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.125.139.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144942;
	b=4WA8h3kCFiU/2iBoZsjvyirUeDh+p6kvffxSBsTpmamkIGYfwRLDnuUwGjtwL2qsRwKc
	 wz/WXnlh0Tk+rUZqIAN+hqqB90cIBieJcQj3KMOljqjRTNeZhKLkk5WZPPy3zzgjsIlyh
	 muqD6Ox6s+rJ0LXmEg50ktaxMIl+VLghUjaRU8q9D9mMX+VKVVBQtcYWT4YtmgF1w2fX0
	 fUga4uAXtk5fOaGPYLEGhFty1z1H7LorTdELYHXeaUFIe251igVMdl0IrEL6FENyM1RWO
	 wX0bYIKwkmlxfa9eOG/8Uzm7GaNAJzm9cThUIkR9k7OgvVK12x7ZUoBWCmyMGGpOudA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144942;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QX5Pn6Wnb4UoeoOJOWQY8hREz2NI4GOQ6dhczU3Ype4=;
	b=pIasCQanhY/n2EKetQ7SSvViRXc+d4KrKmgIHMOjcYd68d5DSZ1/Bh+UoeFQX+JVJQJI
	 Y0c+pJfYuiUaRjVDJao+FDJLlyl+zEt7c9F9xRFpoH6oqwwapmjeV4stJNxZ2DmUAIKTz
	 OMxXgwUsFgHK7yuXY0go6cHLkOhOsZe9Syqab1CpQwJ8ZxlCRfA7kEX3j8+XHj3zFK6nG
	 7S7cneFTV0oBE/UIq/NKs0Fb8kAZc7loJvB9YdM6f9uJCMAp0QrLE9uIWJEBsQO2+wAGj
	 R9bwPrGdmM0Ifo4XW2uSeCjuKCNoIulk1uQG/Sk3Ud9uHt6/aCW47M6doNp8beieEmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sony.com;
	spf=fail smtp.mailfrom=sony.com;
	dkim=pass header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=s1jp header.b=uBiCWNaB;
	arc=none smtp.remote-ip=211.125.139.71
Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74089606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74089606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=s1jp header.b=uBiCWNaB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1795144936; x=1826680936;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QX5Pn6Wnb4UoeoOJOWQY8hREz2NI4GOQ6dhczU3Ype4=;
  b=uBiCWNaBuW2b/WpcUtc+GS+FnAdO3Vq2Up+ghZiQSGbEMifqtcN0cPqD
   PBSbNcbEB5/f5ICi5cnHMsdobZWrIpIdXZEhSNK+yQ9cozGGPHbELGXfs
   3udnDDgqjLh2jnshokrRNV/5YGKkk0rEgf/WEh5s5xba/LklY4isU5mF+
   qZE8wufvF9+xMPLrlBwcLudpsM5EUCb+k6Q8t2GpJ7nUpESZyZhzK9tlo
   QAZVNke2RFTmDJFikxdvFI/WBGHp26kuWyper27jeFPTLojH3gogqjNyY
   OYZp6A8aUyd4y7S1WD2NHwABk0/k2dRJYI+I3GQJ7BO7fGX2z0IAf5Oxt
   g==;
X-CSE-ConnectionGUID: QaWedxaJSUmMhq4cYS2UCw==
X-CSE-MsgGUID: EPB6F1oOTfinbWmlbK2Ugw==
Received: from unknown (HELO jpmta-ob01-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::6])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 12:22:08 +0900
X-CSE-ConnectionGUID: zXGdvRdHTiitO4LDGqUUuw==
X-CSE-MsgGUID: 8NRGQHi7SjmMdFuR627dQg==
X-IronPort-AV: E=Sophos;i="6.27,166,1786978800"; 
   d="scan'208";a="86754485"
Received: from unknown (HELO cscsh-5109200313.ap.sony.com) ([43.82.111.223])
  by jpmta-ob01-os7.noc.sony.co.jp with ESMTP; 20 Nov 2026 12:22:08 +0900
From: Friendy Su <friendy.su@sony.com>
To: xiang@kernel.org,
	chao@kernel.org,
	jack@suse.cz,
	amir73il@gmail.com
Cc: linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Friendy Su <friendy.su@sony.com>,
	Yuezhang Mo <Yuezhang.Mo@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>
Subject: [PATCH v3] erofs: set SB_I_ALLOW_HSM for bdev-based mounts
Date: Fri, 20 Nov 2026 11:19:09 +0800
Message-Id: <20261120031909.1757230-1-friendy.su@sony.com>
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

Set SB_I_ALLOW_HSM to enable fanotify FAN_PRE_ACCESS events for
bdev-backed mounts. File-backed mounts are not supported.

This allows EROFS to handle cases where file data is not available
locally at mount time and needs to be fetched on demand by a
FAN_PRE_ACCESS event handler.

For example, an EROFS image can use blob mode with metadata stored
on /dev/pmem0 and file data on /dev/pmem1, where the latter initially
contains dummy data.

The filesystem can be mounted with:

    mount -o dax,device=/dev/pmem1 /dev/pmem0 /mnt/erofs

On receiving a FAN_PRE_ACCESS event, the handler fetches the actual
file data from a remote source and fills the corresponding blocks
on /dev/pmem1 before access proceeds.

Signed-off-by: Friendy Su <friendy.su@sony.com>
Reviewed-by: Yuezhang Mo <Yuezhang.Mo@sony.com>
Reviewed-by: Daniel Palmer <daniel.palmer@sony.com>
---
 fs/erofs/super.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index ce05557bd998..4ef4c8ce1240 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -684,6 +684,14 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 		errorfc(fc, "superblock_share does not support extra devices");
 		return -EINVAL;
 	}
+	if (!erofs_is_fileio_mode(sbi)) {
+		/*
+		 * Follow other filesystems by supporting FAN_PRE_ACCESS events
+		 * only on bdev-backed mount. Don't bother with file-backed
+		 * mounts.
+		 */
+		sb->s_iflags |= SB_I_ALLOW_HSM;
+	}
 
 	sbi->blkszbits = PAGE_SHIFT;
 	if (erofs_is_fileio_mode(sbi)) {
-- 
2.34.1

