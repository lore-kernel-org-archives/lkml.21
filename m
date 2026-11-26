Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691976;
	b=1CHEnwVkQqU/JPhzub+Nuuc/u1vuXDoUvGZtou9OVO+TFrf+JLwA2uBltITZPy1M+S9b
	 8P7/PNtMCDSgNxM76ph4IrTg4BUqCscSkFVJVA37DgUaux3+KtOm5PRlSv4Hls+aOjAbb
	 kI4FYcfNu9UZdxdPNJmCE7T5R/YrMeM3ODfBGU7BPuN3zydQDwwQQlY4jdp3z1hANR/W/
	 sQMPoaXdZEBfxPA7aPU+rmvTfgb+4qrNE3qUXNXKoY99kXlC/Dq7xYJbsIfI7PVz4erKe
	 nKKMdx4B2nqxtFqAT5VD/uqsfo+EVdb0MXr3TKw/7GE9CvDCaBypQ4t5ltnmnJfgpxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691976;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jqaDdka667zC3QLL/2NfjHtHFN/hbwgftkPOJofn4oA=;
	b=up2b0hXXLkjQFMn94EJ5VZ4MPZopk3w/K8eucRpUCmHX51GSNkKUxVwKS3HZR9c4V+gC
	 FmojRGqBANj0nuGgmDdlNbadjxF1Gc3G6eoucluuVFMlgRJDrAp42GwK6nz7nUwld6YMJ
	 0cKqOeoh+N1XVnbwiQwCKz8f4LENq348OKMlC+rbOas45iMTJby0iRJZBGzIYz20gIUE0
	 uUWJEh4gpFBlWpEUyE56HVvD9DHILBCx2MwbvIcbbUq4gEnpBuJJzSRFVMmnz2Kg0Cm39
	 8+Ihln5a2i2zJ/fjKWFcMiA5iiXBvJn0ZxsrW7QLJ8G7EBy3S5avFy9TWLi+4/Xb1lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ywUUWZZg;
	arc=none smtp.remote-ip=203.205.221.233
Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com [203.205.221.233])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA62606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AA62606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ywUUWZZg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795691966; bh=jqaDdka667zC3QLL/2NfjHtHFN/hbwgftkPOJofn4oA=;
	h=From:To:Cc:Subject:Date;
	b=ywUUWZZgKVe20OSieoPA6K4LMedZ0Pgtnz/cXik3cHyzoRjQpWX2D6lrxIpfwlaOc
	 sFdHwU60YTq+vgbvrqdKiuxwlf+zffMenLxJamYRkKLPXDo6D4/JY16YvzB1KSHKpu
	 9MbAB/ZaIY2LJECJ6qEzsvBRUDbUmLwSXKTllWN0=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 4D834E28; Thu, 26 Nov 2026 19:19:24 +0800
X-QQ-mid: xmsmtpt1795691964tk1136yr1
Message-ID: <tencent_DC2C02F2FD4DBEB8416265132CEED7D2AA08@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GsTA7YI+XQrq8X6I3TwtF3ugMUB5gVUqTJvxXwKGEZqKBmpw8g9
	 k4ite7yvcdH6/C/ompjbDjnbQtAgKuRRIDcTaHsH/vMHLp6LdpfW89GcAXkHWx6PooMimMewqHjZ
	 ER3KMkYjEKRH1sVinGfI+pZV1G3BCU/8L97Nan9tslw9xKyTkXav3myMHEwZ2X4hquMxQwa0VrYR
	 sg7gfI3rw2yEnUMjKuk9hbuLbpKs4RoV1lHzhv/UnQrfl1V7p705sWXJ1DK7om9OQrhthDY743gx
	 EsILeKxhvoHyfxUiO/7O1viqMvhvOn8PlBNErzNVE1UiwtFI0lsj8pfc911rS5DCKEtY+BXS1rEt
	 xLekAmkjXniZ4jssCRibFmIe0hVIAy5jLcumxS1QW08yjhTNdbBU2yyHN4t3kpCMI4YScwbXIzLA
	 Bje/PUnfRtbkhTbMfsf+lRWxe9+lS8Yo3CFhGbQVAU7R2VqioXHU+LVnVzCu8fk/PDEj2FyIhggx
	 MxmDPkyMbU4iMIVA1AVjCNC27+4XF+1dDkyN8b0U1RlQ/f+/QKfkjWv7HYPboQxsK8EQfP1+JDaH
	 6q2797zbWiyj72Cg/pSkuE6PWyuhAZ8DQAA4jhhP6rCQKV07MBB3thydOrGSs0rsDmkXsdXih0j1
	 cWphpBEYNwwMofETALWegmHo4N4luLpeq5TzgtE8Q5AGXtetfILktBtXsffVIvpF5mvLgrmRxnBP
	 BLDoMxPIAn9qJEI3sQX7KY3oSpkVNbKA7U1KpqX+7Mq56aeoe/AOAb4ym5PDaLRMCGbR+GlpU4sI
	 ZdP3lauB45HsowbdvHYTk1jucJ8lGGAkTG4lG401jWfddYKjHLb8d0MNjLPHJmI66buO7xcqtje7
	 MDjQRDMUDC2q5MUqQCf58/8kMkTrVKoedRWOqTOQp9N7Uey0H4y3UYuW+2BfVt1lKw0MBoy2311a
	 bojdAUzMVl4E7OsueNsd55l+iZ5/FWU63K35wZCxg3KNxDux3miOBJo6kL3hPbNdkNV8HLKGYhwd
	 h/gs7Il5fW7qSV7EStwE4bBrfH9YsrZEGczbpWai13R2j0DbhjcgIE3DtFXAmxc1MyC7Jona1UpO
	 bHrfIiKIwQPf1eCsaHMSknexL/oQ==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Shuai Liu <847807867@qq.com>
To: phillip@squashfs.org.uk
Cc: akpm@linux-foundation.org,
	squashfs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	syzbot+f1290205423d04eee4cb@syzkaller.appspotmail.com,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] squashfs: fix NULL pointer deref in squashfs_lookup TRACE
Date: Thu, 26 Nov 2026 19:19:24 +0800
X-OQ-MSGID: <20261126111924.197602-1-847807867@qq.com>
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

In squashfs_lookup(), commit 5b515c0ec855 ("Squashfs: don't compute start
or alloc memory on empty directory or index") moved the TRACE statement
to before the block/offset variable initialization, so the TRACE was
rewritten to use squashfs_i(inode) instead of squashfs_i(dir). But
inode is initialized to NULL, so squashfs_i(NULL) evaluates to an
invalid pointer which triggers a kernel page fault when
CONFIG_DYNAMIC_DEBUG or DEBUG enables the pr_debug() call.

Fix: replace squashfs_i(inode) with squashfs_i(dir) in the TRACE.

Fixes: 5b515c0ec855 ("Squashfs: don't compute start or alloc memory on empty directory or index")
Reported-by: syzbot+f1290205423d04eee4cb@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=f1290205423d04eee4cb
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 fs/squashfs/namei.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/squashfs/namei.c b/fs/squashfs/namei.c
index c8009e0b2edda..30e9383f09928 100644
--- a/fs/squashfs/namei.c
+++ b/fs/squashfs/namei.c
@@ -134,8 +134,8 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 	int offset, err, length;
 	unsigned int dir_count, size;
 
-	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(inode)->start,
-			squashfs_i(inode)->offset);
+	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(dir)->start,
+			squashfs_i(dir)->offset);
 
 	if (len > SQUASHFS_NAME_LEN)
 		return ERR_PTR(-ENAMETOOLONG);
-- 
2.43.0

