Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691015;
	b=jx4coYvXen2JBufHNzVfMWAWm5kke2APZwCp+/fb8X3kxfRxrS+NaIMhGOCl4to/EWGY
	 VanNXLfmRL1cbrUkgaFSbjFym6Mk+bLIV1IjCyzL96yIFbvj7gIqOsb8qFKlHMxlHS3tV
	 J626upRWSH3aM0SHqFojb/HDI9Xxa37baa7cZ4hQdRXXq7229YjA/BFmAJ/N25cK5wmfQ
	 QBTbRpFrNM5clPI0Ayk+FYi4e2VzG272QaHakVRn3CQTACMzRS4NhOwRGqw6dW+Ukjnyl
	 LJw6f3rcZdaYTfjbWzcsJPa7dl6/d5ZFuYOBJywEuwU3GHSaAqWQ9AlL/fudD4+/iwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691015;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=sIU+K7C5RQzuzcXDj6a8HuAK0mwiTD2Mjq8iwMQYK6E=;
	b=ayQNaMT9Qwk1JDtTXVqVRouqbJSxnQNdZ6cZwPucRkj0GnYYjFBdQGcbDWBq9GQcZuqi
	 +Dpj7yrrgwNbMiMcjg7MOTcSEMEbS80f+KNbJ/fZFFZ+5JVmGW2v8X04uVHd8E0eNn1Ch
	 KYhu5RMDYXvM274P+NacVpyqzaCXrM3FEGWNa94HjCW9jHvO9OjiOlGWQ/4Pwaxddh4SR
	 8pTwCQNUbncqNkt0Aar+g6dueE3cUPO37TZbUVFkou9EewHl+6TG4lGOD4sD52n7rqxrA
	 FDrLAD6dI0KekqrkIApLiSkZ2gAShrrgqZHHqsBwaJzwbqJGl/V5wjd6nNg5W0AyIkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=bbfmkGvg;
	arc=none smtp.remote-ip=202.108.3.25
Received: from r3-25.sinamail.sina.com.cn (r3-25.sinamail.sina.com.cn [202.108.3.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2283606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2283606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=bbfmkGvg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1795691012;
	bh=sIU+K7C5RQzuzcXDj6a8HuAK0mwiTD2Mjq8iwMQYK6E=;
	h=From:Subject:Date:Message-ID;
	b=bbfmkGvgs/k4yf1P6RrPMyQkSq7CtxG96Ul2niJjIY+w4iUYV/pw612Wc12U3PGB4
	 YrYNNSgfsOnTbDU9Tz9sHK9FG0NXrso2HwU8u8CSdtFaXmWIMfMqufjIzsb16HYO/Z
	 qhWHZyucKT0ukNX2wvTE2gklO7/XW5Upb6qCd1hw=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.225.163])
	by sina.com (10.54.253.31) with ESMTP
	id 6B0811FE000063CA; Thu, 26 Nov 2026 19:03:29 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 4247216815966
X-SMAIL-UIID: 2319386A22DE4B51A2BB9254C97ADDE4-20261126-190329-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+d7aeb9ab7b1cc022914e@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] fs/ntfs3: reject remove procdir if create failure
Date: Thu, 26 Nov 2026 19:03:26 +0800
Message-ID: <20261126110326.39235-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6b080652.1fb41460.314c8.006f.GAE@google.com>
References: <6b080652.1fb41460.314c8.006f.GAE@google.com>
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

"volinfo" and "label" without checking whether proc_create_data() return
NULL in ntfs_create_procdir() and set sbi->procdir = e, potentially
hitting a warning in remove_proc_entry() for remove the label dir entry.

Add a check for label and volinfo when create the proc dir entry.

Fixes: 7832e123490a ("fs/ntfs3: Add support /proc/fs/ntfs3/<dev>/volinfo and /proc/fs/ntfs3/<dev>/label")
Reported-by: syzbot+d7aeb9ab7b1cc022914e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d7aeb9ab7b1cc022914e
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 fs/ntfs3/super.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 29aabdc8a801..ce7f9b776b22 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -634,10 +634,19 @@ static void ntfs_create_procdir(struct super_block *sb)
 	if (e) {
 		struct ntfs_sb_info *sbi = sb->s_fs_info;
 
-		proc_create_data("volinfo", 0444, e, &ntfs3_volinfo_fops, sb);
-		proc_create_data("label", 0644, e, &ntfs3_label_fops, sb);
+		if (!proc_create_data("volinfo", 0444, e,
+				      &ntfs3_volinfo_fops, sb))
+			goto out;
+
+		if (!proc_create_data("label", 0644, e, &ntfs3_label_fops, sb))
+			goto out;
+
 		sbi->procdir = e;
 	}
+
+out:
+	remove_proc_entry(sb->s_id, proc_info_root);
+	return;
 }
 
 static void ntfs_remove_procdir(struct super_block *sb)
-- 
2.43.0

