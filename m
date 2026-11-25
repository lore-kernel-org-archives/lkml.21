Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646097;
	b=MkUHYuG66HxjfmUyB0/isoFbXXEpQ17CkgsRj7wJV7rkl9DDDD1zkhECPlJGtilMBFS7
	 4kby8h6F56I7SOQr2saXmMzL9UrKaI62JxE5o1yKCtkUYQByoLUnH8BUMIeOPbLSrybO8
	 uNUL+L6E/5VX+U1CNsgF8uWJetLsJwFKESj0uHheuTVrUaw7DEIilkXSzjXIuyQDjIbuN
	 H56u7j8ULsrsIdCotUY4QVcAp4stW5Eo+J1lGo+3UP6QKrX2blAjy/aZ+ffTT05OPW7+Q
	 IoTMnJAvGdblbXh0EzE5XKDyxaazmtkvgcvBcF81kaLkBRtYScZtetOv0gBAKJ3Lrnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OLNYMcQ2Y1oIxnqaAzxlR1bRdVnHH6Z3Siej5MTnqR8=;
	b=lMQ+Pq1u9CUmzqlfn40RrB0NAJqgkKdUMjzl7QhapStqGkxE3wWABaFT2wMXKPK3Sq1K
	 ndSHf+gGcsRtzkbX6UBQgxkZvaIHSgwHBds8KqhAd7Zz+bm0IDgxvoTw4BlJcQs9FYPcO
	 +AuXPCnhkRu22u/OrBxZ06r26gLaTLIalB0j3r3G5RJxCnI19ajHB40qeih1wvSMv9Rbf
	 oxP1I7jxnhY4UmQ9cLir7Xt7xUbDdttubnLL3yqmVwF4py7rcODzBp9Qnzu4FnFVuxwHx
	 uIvBXVB1KdcSnf2S2UcLk8K141F48+ScKvHYClaWZ4fgnQQWipNvkrgtTLTf5vkHhPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CsISQOf1;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C39606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C39606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CsISQOf1
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f01f296937so49121635ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795646096; x=1796250896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLNYMcQ2Y1oIxnqaAzxlR1bRdVnHH6Z3Siej5MTnqR8=;
        b=CsISQOf1o4qiv5EEtNLT/UKO6YzVvMBXURsmLIJJDDZdp2FDLlixMlmv+7GtyKg3wg
         tLKOwvPIIxOyGgURlHpanhNpCcNEazC806pIuN8wFOeFHqqFqTWSIU0bHB+LalQtUEpm
         HS13XAz48ZNkPCStFs3Z7LHvxJHK9bnlHhEl02bAdaFVs0uN+2AFr2O2vkgf9lod9103
         KWiH0BMIrATh0WvnfW2frvKc49jMcXB3EjHBiZzXYDPLwkb2BCTYD7j+aOqrdu/F8mWD
         f//OMb60/+mHeFcgvezJ+eb/FV2MCY4Gv1Au4uTxGVXQzWGVcRIC4tCJ/BYOmU+nEW9Y
         Ub+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795646096; x=1796250896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLNYMcQ2Y1oIxnqaAzxlR1bRdVnHH6Z3Siej5MTnqR8=;
        b=EdxQ9UwNdDvrVn+syFCwK69muwn0NWfh7jfW8KAPcBlsFkeT5lmvQSsGzt/iWC7wbk
         HrC57SneM+M/T6wmaVWCWM7XGYh1wpE2kZnkXJiv45bBwti1LGzU0etLNWJ994vs3p//
         Q7uG/5FUCV4Xbs4YHj08XJDd94nrfBHxSGVrIrdXp24YsDzn9CfciddLeLiE3OCJwH83
         KD2iekbMsNJCG+WbKg/Ozv2c45Fkgv9O+RqL3VrzOoly1TG+jJjgAESWnfeRlua3m6ne
         IshO1SRXSTiQQCNw+pIQMi/Sg7LcCXGHv07FkUrh2IfNkvhWnqObh+Q4E0KcfJlRxCt+
         7Jvw==
X-Forwarded-Encrypted: i=1; AL+hErF3L8pKHHsh04BviYLHaDkScgUlH2+MJxolKzdnVFq60iodzZYv5vi6R8Vo82W0lPLU8uGK5audoDClcFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r/n5mD/329eBiqG63dTg2jdukMvgd5PvhlMN1HsRs1BrJPri+
	LK6P1ypd5qLL+k5j4f87vzJrFyn65y6jqiKwRwckVVKfaRXLuHbQSED2uoDOArp3
X-Gm-Gg: AZFdTZdPQG4NEIe+GugN1fNmOeXqo6pjZb0EGmAOsesCqrCFIESRXxlpOGQ8ATNkaCn
	qnkyLf6l4c7WybGK8gTsHU/o6984ExsW16B+vcOTDMnvrvBddwJdJDCwnMllSNlxf5qQVkeppmR
	MjIhAK3zHhtL68tt+aD7OwHd9OeYHe8xq6m30Djn0QjnzMYXO72/+qeEgZakMcBTsG81C5lX9cN
	H3KpnXQ90EyUhYmbdO8HliRePSRJDN1Dpfb+ebi8Caaxr/Grcb1Gxz8Uw1PblqI3h3zFRuALxiy
	dRArszv64hE0mB3r2L4MCYukXqmjmmRqurHVEaS95kXal+tJpzrg1n5FzFOuU+XoCDu2NmiAtbK
	0Rb/j2ymIAYqPXuUI3bBZn2jtXRju+MqzlPcnJDE+lfHMPtL9FleqUBJcixxZYf8hI3oTBwjc6G
	LMw6DTS7Lj8bddWhK5o6968QP1hHx9PIE4qACHfvtRAN4CGhOUyzJVO8/cjlWEk1tIhP9zIGpAG
	6tUvfxxKDD1sO9nlaSghx5N0eZpVpjtZtFKpKg3Kdt0pr9lGHGIZGegUmFFTqMqGx/re+jAuwHk
	I7IL7Y0LFzT21nDvgxpW1/41t6DR2I1dE+CaTYb6z/H3A++YPw==
X-Received: by 2002:a17:90b:2e49:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3b41c58ae4dmr17896124a91.0.1795646096100;
        Wed, 25 Nov 2026 14:34:56 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdebb45c972sm907029a12.20.2026.11.25.14.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:34:55 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Amir Goldstein <amir73il@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 6.12.y 6.6.y 6.1.y v2] fuse: fix fuse_set_nowrite() race with parallel direct writes
Date: Thu, 26 Nov 2026 07:34:46 +0900
Message-ID: <20261125223447.651208-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026-11-23-1-daily-reply-0006@kernel.org>
References: <20261123141024.2476753-1-graypanda.inzag@gmail.com> <2026-11-23-1-daily-reply-0006@kernel.org>
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

In 6.12.y, 6.6.y, and 6.1.y, queuing a FUSE_WRITE_CACHE request clears
folio writeback immediately while keeping the request in fi->writepages
until the daemon replies. Pending requests can outlive a cached file
handle if write_inode_now() fails in fuse_flush() and returns before
fuse_sync_writes(), or if a cached mmap drops its last file reference
via munmap() without calling fuse_flush().

Once the cached file is released, FOPEN_PARALLEL_DIRECT_WRITES allows
concurrent direct writes under inode_lock_shared(). While one writer
holds FUSE_NOWRITE and waits for the pending request, another can enter
fuse_set_nowrite() and hit BUG_ON(fi->writectr < 0).

Fix this by waiting on fi->page_waitq in fuse_set_nowrite() while
fi->writectr < 0 before setting FUSE_NOWRITE, and still running
fuse_sync_writes() in fuse_flush() when write_inode_now() fails. Wake
waiters in __fuse_release_nowrite() rather than fuse_release_nowrite()
because fuse_do_setattr() calls __fuse_release_nowrite() directly on
success, including under a shared inode lock via fuse_direct_IO() ->
fuse_do_truncate().

Mainline is unaffected since commit 0c58a97f919c ("fuse: remove tmp
folio for writebacks and internal rb tree") removed fi->writepages and
keeps folio writeback active until the daemon replies. Fix the ordering
directly in the stable trees rather than backporting that larger rework.

This bug was found with an in-house LLM-based tool, and the root cause,
reproducers, and fix were manually verified by the authors.

Fixes: 153524053bbb ("fuse: allow non-extending parallel direct writes on the same file")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Changes in v2:
- Move wake_up(&fi->page_waitq) into __fuse_release_nowrite() to cover
  the shared-lock fuse_do_setattr() path pointed out by Sasha Levin.
- Verify and target 6.12.y, 6.6.y, and 6.1.y together.
- v1: https://lore.kernel.org/r/20261123141024.2476753-1-graypanda.inzag@gmail.com

This single patch applies cleanly to linux-6.12.y, linux-6.6.y, and
linux-6.1.y. Tested with KASAN and lockdep in QEMU on 6.12.119,
6.6.163, and 6.1.193 using unprivileged FUSE daemons (UID 1000 via
fusermount3) against the close -EIO and dirty mmap/munmap reproducers.
Also reproduced the v1 missed-wakeup hang on the shared-lock
fuse_do_truncate() -> fuse_do_setattr() path using an artificial delay
and confirmed v2 completes cleanly across 6.12.y, 6.6.y, and 6.1.y.
Standalone C reproducers are available on request.

FUSE maintainers: could you please consider an Acked-by for this
stable-only fix?

 fs/fuse/dir.c  | 10 ++++++++--
 fs/fuse/file.c |  5 +++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 54fcf91272a0..aaf364fe0e7b 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -1821,8 +1821,13 @@ void fuse_set_nowrite(struct inode *inode)
 
 	BUG_ON(!inode_is_locked(inode));
 
-	spin_lock(&fi->lock);
-	BUG_ON(fi->writectr < 0);
+	for (;;) {
+		spin_lock(&fi->lock);
+		if (fi->writectr >= 0)
+			break;
+		spin_unlock(&fi->lock);
+		wait_event(fi->page_waitq, READ_ONCE(fi->writectr) >= 0);
+	}
 	fi->writectr += FUSE_NOWRITE;
 	spin_unlock(&fi->lock);
 	wait_event(fi->page_waitq, fi->writectr == FUSE_NOWRITE);
@@ -1841,6 +1846,7 @@ static void __fuse_release_nowrite(struct inode *inode)
 	BUG_ON(fi->writectr != FUSE_NOWRITE);
 	fi->writectr = 0;
 	fuse_flush_writepages(inode);
+	wake_up(&fi->page_waitq);
 }
 
 void fuse_release_nowrite(struct inode *inode)
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index f733a0f78114..b1646a452cc4 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -538,13 +538,14 @@ static int fuse_flush(struct file *file, fl_owner_t id)
 		return 0;
 
 	err = write_inode_now(inode, 1);
-	if (err)
-		return err;
 
 	inode_lock(inode);
 	fuse_sync_writes(inode);
 	inode_unlock(inode);
 
+	if (err)
+		return err;
+
 	err = filemap_check_errors(file->f_mapping);
 	if (err)
 		return err;

base-commit: e2e4b92c2b2a3ae78423cb343951cb5d2241b405
-- 
2.43.0

