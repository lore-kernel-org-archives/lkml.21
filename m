Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759105;
	b=z8XOidhC+RXS7BgUJdmRbQMXogPYMKrE82IGGM8YZgKnCZzWQd2W3vilGh3rSqrYyweF
	 nIL8nEd23kfk5K/FumCHaMopc1yLUDC/vLKOVpRikvCEOdtJnUxXbTK0oa2DnnszAIR5O
	 OCNqFSssLweQfJc9tOEYTPILhnj4do1hfyBmI7SUwmcne+ExoWBbS8hM136rv5Iki+8Y1
	 o/XCHQblcQ+mjQ8KLoK5YI7KSZaHEqHn2AJR2EG14jSHVUCPVIbnPVssd/m4ce2UsHuld
	 lB4fsoIoaZ06ADkygV9m0gx7MbmTf8vgrQAdIgij7H450o9FXbBjBWGcTguLOChjv7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759105;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5p/W2bprmFnDBAIG0avEYzrbMepHuFa/JXotPOHUHKg=;
	b=Q0u2Umm2OFV3SBDkv2H06KII42m24CIcV4EWNhPYiB8NHYv05tNIqLPJWbbNwq8iLiCP
	 ZvUdKQkaR9wfNx4REI8m8LLku5fxOI9z/+yrP35eAq9brVoo5/rlT8+UX4ig3yI7DKGW0
	 569PH2KTJgv6lq97NPXj17SGT5d3fImrVetKfy/9n7vzdG7BuG2FZnKoFEMy8Re3q/K8P
	 akxCosPangQB2JERNfiyFlupNsG7tsSZygSS2fMSI9RaDefOV15Ki7+qAmTH4x0kVQiKJ
	 OG4pitqfSUEq+Qc7u3vtYqVRbHt29E7niun5xFa96gfHpDhZRaBfepC3Q8ftwGCY9BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=roIlpO7R;
	arc=none smtp.remote-ip=61.135.153.165
Received: from smtp153-165.sina.com.cn (smtp153-165.sina.com.cn [61.135.153.165])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98F6606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C98F6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=roIlpO7R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1795759101;
	bh=5p/W2bprmFnDBAIG0avEYzrbMepHuFa/JXotPOHUHKg=;
	h=From:Subject:Date:Message-ID;
	b=roIlpO7RbCXyaTA4RgLw+V3FbOzEDA+Bw454EcxlzqGO0caC1o3Vqwp/ewrEln1c2
	 pk+QsKz9vD029J+t7g8i5YmNEDsqB4NaBTrezTyf2NOD3pdsGNKeNn8l0x3fZTphIM
	 vgRrEbWZV+3UzE33g33F6VFEigq9lQZCedTqdFac=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.225.163])
	by sina.com (10.54.253.32) with ESMTP
	id 6B091BF6000054DE; Fri, 27 Nov 2026 13:58:16 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7957624456832
X-SMAIL-UIID: 200F0F56D93942D996E5A3F512366FE3-20261127-135816-1
From: Edward Adam Davis <eadavis@sina.com>
To: eadavis@sina.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzbot+d7aeb9ab7b1cc022914e@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2] fs/ntfs3: reject remove procdir if create failure
Date: Fri, 27 Nov 2026 13:58:13 +0800
Message-ID: <20261127055813.58182-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126110326.39235-1-eadavis@sina.com>
References: <20261126110326.39235-1-eadavis@sina.com>
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
v1 -> v2: 
1. add missing volinfo release if lable create failure
2. return after set procdir

 fs/ntfs3/super.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 29aabdc8a801..a71628b9489e 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -626,18 +626,30 @@ static const struct proc_ops ntfs3_label_fops = {
 static void ntfs_create_procdir(struct super_block *sb)
 {
 	struct proc_dir_entry *e;
+	struct ntfs_sb_info *sbi;
 
 	if (!proc_info_root)
 		return;
 
 	e = proc_mkdir(sb->s_id, proc_info_root);
 	if (e) {
-		struct ntfs_sb_info *sbi = sb->s_fs_info;
+		sbi = sb->s_fs_info;
+
+		if (!proc_create_data("volinfo", 0444, e,
+				      &ntfs3_volinfo_fops, sb))
+			goto out;
+
+		if (!proc_create_data("label", 0644, e, &ntfs3_label_fops, sb))
+			goto out_volinfo;
 
-		proc_create_data("volinfo", 0444, e, &ntfs3_volinfo_fops, sb);
-		proc_create_data("label", 0644, e, &ntfs3_label_fops, sb);
 		sbi->procdir = e;
 	}
+
+	return;
+out_volinfo:
+	remove_proc_entry("volinfo", sbi->procdir);
+out:
+	remove_proc_entry(sb->s_id, proc_info_root);
 }
 
 static void ntfs_remove_procdir(struct super_block *sb)
-- 
2.43.0

