Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795006402;
	b=T4oeihNIWIizPoldZy5qPjd/RC8MNojMYttNAegBSHyBHAn5xequgRCIN0V5sHP6D9yB
	 j8+u7Kajrp74utbFO4LhUlY5sPcBe/GCqs8r0MMpTkID9QZ3aOAgVolKjw3+G2FWQoDTu
	 vSiGLwER1cgOkAmbYME4gPi/rbsG5FX4WjNpfYDakaAD7zH+gO39hIqYjKC2G8XkS3oWP
	 +Cdt0kKsqZyZydDYc6sqJbcBwEj15wMwmRI8hn7HvfP23/khilw8UhUTaBdHUTIPRG9A/
	 EMtfD/BJJ/FCZz+d2fViHZg3Ag0unM4xo8hM62E733854gnyqb5Zf7FZc66A1SLTAWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006402;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=a4QGCnrwlxC0s/gYdasEzGsyCKg5zxioqQGPp6K+YLo=;
	b=4MbSx2mOGVx/fNiX2Vq6/gKSNaDslEj2c8XksTTFIg5IzNRjCQQL/zIoVoVhYbcLQtrL
	 RoAY4rGUxIki7f0TIvGOqYqpX+IzuHum0bv55UmKBcpBqxSVkrPKDGPlqH3SGepi6Cc5S
	 25NkZ1jTrB2iiJelBlqRBukyf2SDWz+J6yJ0E1/oMYTZ4yXHZD/4Zbzry+CXf+/P746tO
	 9ahJ7a/0JdDOTnnFWpo2sbrdxTvJIFy48bjREU8Z940KYNRNv4MyfMyeia5FN+FCR8Z2z
	 wQ5VlHRZLabVCVE6PphVOMkf1F/zffuLkECcg1L2amrMJLGVcu01ID5CXoi/QOwn95Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZKJmbVi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485B4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZKJmbVi
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795006402;
	b=ZxWpLHPcw827Ys+4xLgnnWWz5LlnCI4ElHGT8gTLSA2qOC+cHIYeNbaUaf+BpJZs9Xj4
	 IP4tPPQw8ux/hPsCPnKhMJan7J9OUB+9J0SkvnjMV4AHgjJgJK0FF+lPQlPh2hcuWdwQl
	 g2Iewhcieu9E6CcAYPMVxdY9LGOa7Qdgz8rP1qGEyLhisKVCc0si5wXV6zcefMUid9NZw
	 MFU686zwRzWBZzEkrNCdcvr2JABYLcrx3JIVmdQue+FQg4cZTz16E/sJK9Eq0BWx2U/Lk
	 Ks/mT9cyS+7vJyGV51YQlHWSt3DZaWmm+11N0dmP6G2yiRVKyHIR0BobFOwNN76umsA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795006402;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=a4QGCnrwlxC0s/gYdasEzGsyCKg5zxioqQGPp6K+YLo=;
	b=MJlpgU94uWv1+QwxS19SWcug5wR7eTfQ3LfgkkYdP/xP8t+8LByGk3ayos14xLoVwFpx
	 4Gj0oOJcVfQs94YqSMtoMrYHOGdv2Kz/KsL1gYCEQojD2GVwCS7O2vv4jUMjubNp5dUUc
	 Vcwy4a8JoEvtpBb2ktvIlyYAXr93b2+2YegEuCqiKnVqtLcudPUFlqefxt4cGBT6r6Gyp
	 kYrECOJYNHtDqz1x77mbzl/9iFOpdheadCl3aQQBRds3z4vLpHFRplyJTaNmpoOqFOwc3
	 LYMTWxC5lB3sDSNS9B6nSsq77b24oSEW7ZwK1C1MZOEp+R8R1r2FTXfYhkMxTfZGNPQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A4AD71F000C4;
	Wed, 18 Nov 2026 12:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795006402;
	bh=a4QGCnrwlxC0s/gYdasEzGsyCKg5zxioqQGPp6K+YLo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=kZKJmbViIRsUXABtMSOvCpSbNGlw7QU5242iXLi1KMOxq5EPUVQ5Ua0FJtu3ScXun
	 yXNLjWT5leVqRR0fPMt0rZGTWntsJP7HUB/zC5sX3C3ejddz4QzC6Ew281usGcyRS9
	 BYdomIDbgh/ngqN5ba0Cy9dpEN+wPBkVZMsq3GFYkOt7M8oZDW9TUCn2S30MAPtEGQ
	 bvcOWv1SAZVIe5HQRGffTImVkDTwZImPjPdSQiJFVrgrMfPIK5psO5EFmpG10Uv4/a
	 ENyvDU2qPLqbmhjlR+Q5Q6iFYYBkb/uAsPnQKI37Kkvrx5CJ+vAaoOkstvtaLxfWel
	 xxN68ba/c4cWg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 00E274AD78;
	Wed, 18 Nov 2026 12:53:20 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 12:53:20 +0000
Subject: [PATCH] f2fs: don't read inode->i_ino after iput() in
 gc_data_segment()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-f2fs-gc-v1-1-297612253f6c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAL+f/WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0ML3TSjtGLd9GRdI3NLI0Njs0RzAzNjJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tACss0+drAAAA
X-Change-ID: 20261118-f2fs-gc-2792136a7063
To: jaegeuk@kernel.org, chao@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795006400; l=1817;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=CnaJBZLbNSkqbrUrG6Geieyu9/h+9hR1JQWRnrfCtG0=;
 b=gmxM3O37yU6iQwcn8i11c4Qjn9+9bQNCjnDuqrVqffwHf5d8hiGWVCyq2vaPTmw2NVbCSkv6H
 d5U2Xx0zn5ZClzra6lpw0eh25Uj5PSSm8QyV1/GXLzioyr6n3/nZmzv
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

When gc_data_segment() finds an inode that has both the inline-data flag
and a data block, it puts the inode before logging the error:

	iput(inode);
	set_sbi_flag(sbi, SBI_NEED_FSCK);
	f2fs_err_ratelimited(sbi,
		"inode %llu has both inline_data flag and "
		"data block, nid=%u, ofs_in_node=%u",
		inode->i_ino, dni.nid, ofs_in_node);

At this point the inode has not been added to the GC inode list and
i_gc_rwsem has not been taken, so nothing else is holding it. iput()
may drop the last reference, so reading inode->i_ino for the message is
a use-after-free.

Move the iput() below the error message so i_ino is read while the
reference is still held.

Found with a static analysis tool and checked by hand.

Fixes: fc01008c92f4 ("f2fs: fix to do sanity check on F2FS_INLINE_DATA flag in inode during GC")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested only (x86_64, W=1 and sparse show no new warnings). The
use-after-free is in the corrupted-inode error path and hasn't been
reproduced at runtime.
---
 fs/f2fs/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5b948c92f981..edbfb45f15fc 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1664,12 +1664,12 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			}
 
 			if (f2fs_has_inline_data(inode)) {
-				iput(inode);
 				set_sbi_flag(sbi, SBI_NEED_FSCK);
 				f2fs_err_ratelimited(sbi,
 					"inode %llu has both inline_data flag and "
 					"data block, nid=%u, ofs_in_node=%u",
 					inode->i_ino, dni.nid, ofs_in_node);
+				iput(inode);
 				continue;
 			}
 




