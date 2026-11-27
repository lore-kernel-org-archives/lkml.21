Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773545;
	b=UASIUHbSNAKNyBLehUqhWP3QVybcOF6WgohyR8C7Px8Uzsr5fLVK0xwk/j/GEoPW/xM8
	 J/ecb2NVJuv6qL/hfReQJThSmu+/Ss7bQ30kZSxHgOmaRUnIBat6ArlSZJ/NfL0OyxD8J
	 LIEgqZ6tw3FPqP0dmNOzYCnHnpIBqnDU2TCDkqghAwKtviHeYvPH/fuMMFvITZHm9AHZ3
	 7c8JF+PJ636B2G2utQTja4moRyIOWQWAYIC7kFHABgigU81VMWAnpecER6r9137jPvXTe
	 vaKGR0wdtGZHftQkr/yXqg7XX4jDTAEQw92zEg3lZd1ClioexrZZz+Rz9HLmPAn0G5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773545;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=baJ0mjyslci1WDPJ+WAvlMf5kc9rL/LQw0lo569JThw=;
	b=zI8QIUsqPEdnqwN6S0z63gQy1S4wZ17CgQIvUF/fuCBDntrAlECeCK2qiXDTqyrjK/4y
	 cgIMBf/5TrH32a2FRc6y3L3ij0DigF0aHuesh4cWnjbxxGv7ACjfcmJAFPcdgibfpCGVk
	 pZFKrslm/k1E5UhAM21UJz5jWn1fN/9ecp+23PGT2Lcap7Hr006pVHGQvj/crXb+OOD+6
	 P6KjtoELdxzsFRC+DEeknVxQaT2sCgfMUL5d5TV+NLRohyWlWgR4+6h8oeGoUuCki+5Q+
	 r9tRsntUufHnk6tzC5FHhuPyGv6yxzw121XDD4PcDQHozRRtDADVxEp7NZ9lHSWUcCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=bPXTnPmy;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5B6606A687
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D5B6606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=bPXTnPmy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795773538; bh=baJ0mjyslci1WDPJ+WAvlMf5kc9rL/LQw0lo569JThw=;
	h=From:To:Cc:Subject:Date;
	b=bPXTnPmy/W6KudIujZzit3pDAEr8pWumOZWpGLDIFHCP6mos/eoX4TAFYT0GAZrQM
	 hgc7M5KCEIxyEidh4uSMFrLJe44g07e1FHMLieQJoFWy6U2rE0zh2Q6xchdojxSeK7
	 hoDvq23bvi13zWfFWvkIALT+iAIX4BVEUIDLNtDI=
Received: from shuai-VMware-Virtual-Platform.. ([39.165.245.102])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id EB83566F; Fri, 27 Nov 2026 17:58:56 +0800
X-QQ-mid: xmsmtpt1795773536t7hof9yn8
Message-ID: <tencent_17D1FD4EFA98C54A1EA1E90D37406C602205@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJQ6Sfm5w8eYU/Xk+Y1uGIhZj1xhO5GXZdFMMMFadOMDiz1w59Dc
	 Mh8IqvXH8lV8GTB9yHoAS3y2hdTDfsqaXM08duaBAHwr2Z3nn0sLB4zPHKsHNzeRil7FL4+KYKy9
	 F6gpOrI9bJap/oHnvXiWSro8R58kO8qEC7ToLszQ4tq/Ev6zAUyCv/zfvZa6nMR19Jzn17brkPP8
	 6HCA9/byNxNT41Cvzir86Ei3iZPJozJoo8acRhee3QwTLx8dXVZHVV6QMWx1gOQW8BEOQHuNHIT0
	 eH6v7Vb/EVhEgK54++5niZM5sK0R8gtdqd/+PJT0VIhJ/XLuXyMZyYi6gD2KXdnxSw+VzZHZTwww
	 S1htuhzXjaUV0bRoiexdvh6zvfLwrAvk/81rZWRGCUPW/h/EsXk+0xnZStJsJgON98DKfobakfUz
	 IJx2gv5N5huboB6tJ89Ihol6P+UZqdVud3egh+QUtmpDqG4rJ4wMt41eqbRiII1ocFgSlthdSl5C
	 dnkePYsMwMryOc4pmrXPcyUpT63HwlYo7OfgVX1A5z3QM2ZYa/dpSL/c1aNhHKGb7VrvXU4s8JEa
	 Ms72KWt3h59iqAkJvxuY8slDLN+BQIderrDQ8Jxg52SvpFjkR27Fi6AvnDFUzkQIBzhCuniHG9ro
	 71t6WwN9zFjIcmRZTFLLMhkPDF8VjSx15ed/gAqmNH862zFJPf0WEz81b5lLWd6mJM0lquqMnDXD
	 LdBjQQ8xVI9Ej3pfIijK5MR/og+vdnNp7kD7ceiUbZbPQ/3vrZfWiPobaJY1F2aASh/M0jD5UKHO
	 XMiVA/7kU2kpL5gCb7et/moYyhJyTgOQrXkxi8Gh1YYSlq8jMegCJus3SRk7cBrgMvmto/OUyx+V
	 DIOPdJJRNE6/nAzMFnauYlg5poH+LW1eJYo/2fVqHvpyiGen2iv/Otix9itWwUFHTdakH/HOOAJe
	 t24dAPHaYtPlV8L9TcBswH8MkYSB+rgLCkuilPtPGEg9qhodEeIyoQsRC+K1BSJVjdrzFGsfukFb
	 2la3AqqHy3hBIGFeXNnjdRPx+R+4venb2BNOuba1w7pmL+9NzdrNbeKLTAFcujvVxX0esGug==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Shuai Liu <847807867@qq.com>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	syzbot+d7aeb9ab7b1cc022914e@syzkaller.appspotmail.com,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] fs/ntfs3: handle proc_create_data() failure in ntfs_create_procdir()
Date: Fri, 27 Nov 2026 17:58:56 +0800
X-OQ-MSGID: <20261127095856.770026-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
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

proc_create_data() may fail and return NULL, but ntfs_create_procdir()
assigned sbi->procdir unconditionally.  This let ntfs_remove_procdir()
call remove_proc_entry() for missing entries, triggering a WARNING
at fs/proc/generic.c:742.

Check both proc_create_data() results.  If either fails, remove the
one that succeeded plus the parent dir and leave sbi->procdir NULL.

Reported-by: syzbot+d7aeb9ab7b1cc022914e@syzkaller.appspotmail.com
Fixes: 7832e123490a ("fs/ntfs3: Add support /proc/fs/ntfs3/<dev>/volinfo and /proc/fs/ntfs3/<dev>/label")
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 fs/ntfs3/super.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 29aabdc8a8012..6beb850fc1dbf 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -626,18 +626,31 @@ static const struct proc_ops ntfs3_label_fops = {
 static void ntfs_create_procdir(struct super_block *sb)
 {
 	struct proc_dir_entry *e;
+	struct ntfs_sb_info *sbi;
+	struct proc_dir_entry *volinfo, *label;
 
 	if (!proc_info_root)
 		return;
 
 	e = proc_mkdir(sb->s_id, proc_info_root);
-	if (e) {
-		struct ntfs_sb_info *sbi = sb->s_fs_info;
+	if (!e)
+		return;
+
+	sbi = sb->s_fs_info;
 
-		proc_create_data("volinfo", 0444, e, &ntfs3_volinfo_fops, sb);
-		proc_create_data("label", 0644, e, &ntfs3_label_fops, sb);
-		sbi->procdir = e;
+	volinfo = proc_create_data("volinfo", 0444, e, &ntfs3_volinfo_fops, sb);
+	label = proc_create_data("label", 0644, e, &ntfs3_label_fops, sb);
+
+	if (!volinfo || !label) {
+		if (volinfo)
+			remove_proc_entry("volinfo", e);
+		if (label)
+			remove_proc_entry("label", e);
+		remove_proc_entry(sb->s_id, proc_info_root);
+		return;
 	}
+
+	sbi->procdir = e;
 }
 
 static void ntfs_remove_procdir(struct super_block *sb)
-- 
2.43.0

