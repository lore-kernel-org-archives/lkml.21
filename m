Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795136683;
	b=Pb+NGx96XHw3qj17E5AFMtvf3ThXiDEepi3xfbh/4oXfWnBMrasqMeIb6nA4gCDUcBcR
	 nxu03fxkblqAfzhhpQja7qCEYjiIDIX1V+i3b4MC50pVospJS9/Hgu3sza8FpfdgBDx88
	 C3Ezz1vyZFtq7tQMI+G8CXsrdbtJtxBCS21aoON7SMqyxsHONzibGX0KDJpBYN845V4ze
	 TSoAok43EB0RwGCQhr93H2aI0V6gmjLjvY6JVoGJ/Wd1sd8ALa7spKEcGE/mo3jcVmp5J
	 ZDB5INR0RGVyVJ8ICGCk6t36DV12KeQw2IfsBLdPaWX4gRTQUvoXrlb3EGz4aCiv5Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795136683;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=45xLE3ij2k2Cw8yAuil/e/r7Lukwi6ue4Sth5/YZLOw=;
	b=cye7bDvQ3E4KJWZ0AYoDL/l92ZsiQoGn9IWqA1TynytEOWR9yxYbS8NwvdoxJrd7eiBT
	 1vKewCRwII0v9fZBtQcFO8eAgLowVN2YW2YKQw/W0Zmz3TafTnlM5loymtEPGZfIAwMb3
	 /JP+yh9oT//wO0gvqJu3z80JVXLBpr8ikHtYLCeqA6kv6p1Firt2gQwhqnQifcaUlK1vk
	 FY+mCtzubJy8sgOSyct9ifNAaeCCF8qfDlFuiSBC8Ju8A1I8yr5DJm8MzeQGG1OWlk8ft
	 fTwQqmcfrW2fjKjlYtfcZosFMMX5AEBy5Jk4VG3cPwq7P9v8u9HmON7EgU6qW7dCZKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=RHR1fnR1;
	arc=none smtp.remote-ip=203.205.221.153
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0E7606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A0E7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=RHR1fnR1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795136671; bh=45xLE3ij2k2Cw8yAuil/e/r7Lukwi6ue4Sth5/YZLOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RHR1fnR1OS3HYSjMJXkhtTxAmPpJb0VS5LllBrjxgwBYUAwPxBxAbYSuyOb6Ago9j
	 UfjGrkge7TKV1pQFT56lI5xvewHBzxX0Hb/fLhjQpgqNJpv/3cUfI+/F7MBDcpODMe
	 zwEvSl/5FXKZnRsN9K1t/uf0u90Bow5Lq1n6nONo=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.198])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 11DA96FC; Fri, 20 Nov 2026 09:04:29 +0800
X-QQ-mid: xmsmtpt1795136669tecd2y9o9
Message-ID: <tencent_7590135AEEA7D2DC2CE7F27E4DF5B8936208@qq.com>
X-QQ-XMAILINFO: Mu8aJQRa+GU4oS5wXc7gQDQW5b0P+ExAsTzgh2ai1cWhG7iLfIRLAy33BPFYzG
	 dBgYdG6IzRnl43qtw2KztjORTdkAB4fCggJW8ZfI9bT7dqRJ794tpC3wcidu7eRbuY9UcIil7lNk
	 KRjnVzlKfmHrgCzZoVTUavyxizODwQVzBseBTLVWmJ2kjLIGiaj/V5VquH02COZiZKwx9dGj72OD
	 XymkVce7ufXvYNjMTzAm7U+66hrhEF23s3H33/pQl/0RheAocaSlCJ7gyv21NCUWg6Za7A1T5csi
	 wxFV/SfttwHPmBEEr1iXuFjIukp4FTlwfjzj3LERK41hfQuFZ8QabmhCDx53z+oEH1EkVV98ymwj
	 GA2ctyVwxMacj1RjpuKdp0mafPmHEWSw9J80nTcvk9ZhRpJtQZcOEhvOULdWHfREyPfTY2CR1jO0
	 8EVYeu+CD/B04bEkz0aem6Lkc8MqT7QmAtGEkSPfgHcYA/y4QG9kWdHZlWSGmdyTjWg5pSc/rsh4
	 TYjZxSM6WLnXRZKcN+THYKbLqlIxvHmGXcKb7KLwfoutZv+uBEuScGnclazS5Dorj+LQ5RTycAEM
	 SjnZvTR3wDP4R7w/glqqkzOh1wOTIX12sncthG0B6Dqvhnkqh+s2mZ0JkDaVMaxdVOPBmMXQn49u
	 1cjunTGnQuOqC3OCufW67a/3SqavGJjbh2AYOmQEqrKHf/a2EaHd54qvnqhG32C0EKwWCXnfWjxH
	 gYFDV6JOFRfw68f7aCpc7ZzjJBpN0r+tfZhZFckTux8SuMOpUoroYql8zmeVG0mwC2+fpRVVSTmv
	 /6uvwYDl3i4TFpdrB/xLYCYjRAYKzX28z5M9jLom1hLL6GuGzB2YmBXJ1A9ehty1FvB4MITYbM8C
	 2i8L8F6nVSonAPtHK4uonkNftxUeAPJL9RdjcRje4fmT+MhRtxyGWgt2RlcdCpEKntUs4BtozrNa
	 J/S+EdadMbMW8K1uo+Ga83QbSfimGHAblH7kpfYsRbFVqYfOsLTVE3raRUSUqVQEclD9I7Q6DuAE
	 6oxv7iNajXw4kYLbygrmqSOutZEZReMsxg0/kJlw==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com,
	luquijeffrey@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [syzbot] [jffs2?] KASAN: slab-use-after-free Read in jffs2_xattr_delete_inode
Date: Fri, 20 Nov 2026 09:04:29 +0800
X-OQ-MSGID: <20261120010429.12330-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a7bfdf7.ed659fcc.23056a.007f.GAE@google.com>
References: <6a7bfdf7.ed659fcc.23056a.007f.GAE@google.com>
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

#syz test

Hi Richard,

Gentle ping.  I posted a fix for this on 2026-11-03 [1]; it resubmits
Lucas Jeffrey's September patch with credit, as his thread had gone
quiet while the bug kept reproducing.

There has been no response so far, and the bug is still live -- 44
crashes recorded in the November monthly report [2].  The fix is a
one-liner clearing f->inocache in jffs2_init_inode_info(), consistent
with the other pointer fields there: a stale inocache survives slab
recycling after the previous mount's jffs2_free_ino_caches() and is
dereferenced by jffs2_xattr_delete_inode() on the evict() error path
when jffs2_new_inode() fails after jffs2_init_inode_info() but before
jffs2_do_new_inode() assigns a fresh inocache.

I've verified with the syzbot C reproducer under QEMU + KASAN: the UAF
triggers before the patch and is absent after it.  The patch is inlined
below so syzbot can re-verify on current master.

Note that the syzbot bisection points at an unrelated block2mtd commit
(7b09acdc "mtd: block2mtd: add support for an optional custom MTD
label"); the repro mounts jffs2 on block2mtd, so that looks like
bisection noise.

Could you take a look?

Thanks,
Shuai Liu

[1] https://lore.kernel.org/all/tencent_A21BAE90D8EE04A5FB98B4168BA73C695306@qq.com/
[2] https://lore.kernel.org/all/6afbd91e.e6a8accb.234e85.000a.GAE@google.com/

---
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -55,6 +55,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
 	f->metadata = NULL;
 	f->dents = NULL;
 	f->target = NULL;
+	f->inocache = NULL;
 	f->flags = 0;
 	f->usercompr = 0;
 }
--

