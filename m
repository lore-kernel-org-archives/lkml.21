Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443163;
	b=SxOy+ihj/ZOrjwo4tBAx8A/gNIpG4BA5rR98FGrrqxiaSGSD92G2UVAM+5ueLsEZRtX7
	 a4EnSyGT/etoesawO1GTv4dZepcLOvD+rP6pipqAkgTMmai4FzdyThuXz9Q//ezZ497Y4
	 KN15eveDzTo2k+otRwZCJJrJQnaO6gyB83p5Tz5BE8avrn50DbpxxY2KscZ2gqw0mSmSL
	 fg7dFfIsfoFw03ug9vpN5Rv5vne/ymB5aL3A3F25l7a7IaLxFrKn/bEpJy41GwagRw81A
	 oKSfqlydcDxa6aiD7BLdaDo2PSbGihPxsUfVHrm1QetTWj+R/+6g8IKkmaFyvfwGyOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FpQteIPOJ7jso2isVNK/FXoPVqd5TxYTuttF9zGO1yA=;
	b=KnMY162s8g7dmVWlNJpokbV5IJOFPn1CFtfmmrk+5XcXIEeL4yNsrWb7crD+5+rysLMf
	 me4meLt4jaKmbPWQo+2OodR5gJ7lPT2gGTIdnA315295FMvJNTG1gowGJKn8RvfJWc7/l
	 MGV0AbN/edHidlK8pw1rKKh9YTFjlQu4FukUxQEc5xo8b3PDEGxhTvBWWC1mwdhS9//K2
	 LiRZ5ddYzHU12FrJWCtkwK3GphXhuUh41wEeesgp73qIRfOfkbtaxwYgX0vvI0qa80pHx
	 6pxQilQvvXoifEcZk5grFouqkjHX34P7qoSMUbc2Au57TeeCtGe9nOhZukv3L5X1K3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HSDIN/qx";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792FA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792FA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSDIN/qx
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so4923894c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443161; x=1796047961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpQteIPOJ7jso2isVNK/FXoPVqd5TxYTuttF9zGO1yA=;
        b=HSDIN/qxhXjIe8cpCe89tmnGrEkq/g67ziZZmU9iYOrYOh8IF5sUmzhBx+5YJP1wDM
         f6Ut/vhOK71Vib7hIAvZxFVaDViu80YZrsA9EZJJEnW3+YaEJPT2ContZLY24lpR2SxN
         QTvzTWO8r1i3mMO8SzY41qYfMuhHGnX+LxVi63vXhkJSCeBixtwQylAyvfS6zpmPxMO+
         h3h1ALkFm5mP1ylfVejUswRjCOD+Flu8f+wcxbPSV00bKOYKZDznMCpsfwxmn3HVe/B9
         53/KwBCt/xCPmR7d6yQsPCiSGcVyVstJNVCqsKCFJ9vZ9KB1jpjFBTOmr5rRTxRd0R9B
         6gqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443161; x=1796047961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpQteIPOJ7jso2isVNK/FXoPVqd5TxYTuttF9zGO1yA=;
        b=WOboRW1RwT0TkfYLnBy5UpGqirAXbZq8r7k+D2zarpunAEGHbhPAKCCGd+hyzv7B6b
         CRtlWSYqIMCy9PJjwHCA8fTnO+hMK2knjb2ZN9CAFhMXv4JPmQGkxP+91NqXj3jAf3SO
         2tJTa6nOBlqcQElNYSDx/TrCO5xlUmRn81tRmpRIwayMzG9ZNbjC/6FJQTDj+40zNxJb
         no1ZGPe8koyzmDlZsELKWlNCBNVOGFQBCs1Je8+Oar+39IWVQ7HK/sVSfI80KU0el8rr
         /iquW5w3IK9SssD/PgU8Br4Jh67zMBHS0XAVKBoWqrvY46i652G8ZQ4QaQ1OfMghaGSp
         TbWA==
X-Forwarded-Encrypted: i=1; AL+hErGt20QaPSIce3ZMX3XYewL86UqEfVZ/P5eXSBIaBKR1JKpvisnTDhX8alvo5E0w1ntZfRZValPyNv8WN30=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PFdIqPdrrs1FFZMW+NSka6Gq60cCPgk/x1X5kxIAwUxkYnmRz
	i2Nn0LyL4UiBshTi0Vugkz10dtq4kAocE/HL+87LWzjrJxPtxtM5GO1A
X-Gm-Gg: AZFdTZcD76/RljrdxdqOyYqcGn9itBhLCartDj8fNO4faXcAcmJ5zFvUrwGjbqigtry
	FZ+/ghi/S1L5w8R76UYaAf3W29TSS9jmkGpupw7xmJbuy2ikSfwdtMG8eZMHQ3g2tueTz24qZBg
	OGVDZgz62z2jTL/ttQZT2GGhNZuo/pgi3rWQqIgQgmTzVc/ffTV60TkSYYyKfGMSbTpUjIzy/ir
	X+0AKnkET4nMuQ7lYNskw2PTtD5/tfCDhB9LOUYnuG3g+e4HBL1F5n8Iz0H+aHLtNcPSpLlc1+H
	MV3rklaZt95ELEQPdj965STUCevIWD4QkCaBO9OYB29dBOQP7iHmYVHfi3/1hoWSnR/kNLjaVSI
	YFxbbw1DJZ8jmznaSyoodfySvOLGFE83FoZg4xXYsblaEt6xpSDhNAKpdhUk1/i6sdve6d4HJcg
	qqsvC9aYgKutLo1qCES2pkiU+9sW1OHuMr3KQqCoGhuYMcm1/r6H4OCLIwHpJwsuXiwmo5Y4puk
	Z8COB8mjemWSU8diwh0GFHcDd/dQl0eBsuWpiyj3/aIJ4pJxGW6cFqMsR/gbHXU6T2pDx4VerE/
	RMI7qwdBt054ITcpV5pjxXowzdEH6U6nKOf5pOpwODTl8kdJKw==
X-Received: by 2002:a05:701b:42d1:20b0:1af:d88f:fc51 with SMTP id a92af1059eb24-1b5568edb1dmr12692628c88.30.1795443161493;
        Mon, 23 Nov 2026 06:12:41 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm35997230eec.15.2026.11.23.06.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:12:40 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	Dharmendra Singh <dsingh@ddn.com>,
	Amir Goldstein <amir73il@gmail.com>,
	fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 6.12.y] fuse: fix fuse_set_nowrite() race with parallel direct writes
Date: Mon, 23 Nov 2026 23:12:34 +0900
Message-ID: <20261123141235.2477526-1-graypanda.inzag@gmail.com>
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

In 6.12.y, queuing a FUSE_WRITE_CACHE request clears folio writeback
immediately while keeping the request in fi->writepages until the
daemon replies. Cached writepage requests can outlive the cached file
handle in two ways: if write_inode_now() fails in fuse_flush(), it
returns early before calling fuse_sync_writes(); and if a file is
mapped with mmap() and closed while clean, final unmapping drops the
last file reference via fuse_release() without calling fuse_flush().

Once the cached file is released, FOPEN_PARALLEL_DIRECT_WRITES allows
concurrent direct writes under inode_lock_shared(). If a request is
still pending in fi->writepages, two direct writers can both enter
fuse_set_nowrite(). The first sets FUSE_NOWRITE (making fi->writectr
negative) and waits on fi->page_waitq; the second sees fi->writectr < 0
and hits BUG_ON(fi->writectr < 0).

Fix this by waiting on fi->page_waitq in fuse_set_nowrite() while
fi->writectr < 0 before setting FUSE_NOWRITE, and waking waiters in
fuse_release_nowrite(). Also still run fuse_sync_writes() in
fuse_flush() when write_inode_now() returns an error so close() drains
in-flight writes before returning the error.

Mainline is unaffected since commit 0c58a97f919c ("fuse: remove tmp
folio for writebacks and internal rb tree") removed fi->writepages and
keeps folio writeback active until the daemon replies. Fix the ordering
directly in 6.12.y rather than backporting that larger rework.

This bug was found with an in-house LLM-based tool, and the root cause,
reproducers, and fix were manually verified by the authors.

Fixes: 153524053bbb ("fuse: allow non-extending parallel direct writes on the same file")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Tested on v6.12.116 with KASAN in a 2-vCPU QEMU guest using an
unprivileged FUSE daemon (UID 1000 via fusermount3). Verified against
both C reproducers (FUSE_SETATTR -EIO on close, and dirty mmap
followed by munmap after clean close), which previously triggered
BUG_ON(fi->writectr < 0) and now complete cleanly without BUG or KASAN
reports. Standalone reproducers are available on request.

The patch also applies cleanly to linux-6.6.y (5139929c698c), though
6.6.y was not runtime-tested.

 fs/fuse/dir.c  | 10 ++++++++--
 fs/fuse/file.c |  5 +++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 45cbe0cb2..54b9138fa 100644
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
@@ -1850,6 +1855,7 @@ void fuse_release_nowrite(struct inode *inode)
 	spin_lock(&fi->lock);
 	__fuse_release_nowrite(inode);
 	spin_unlock(&fi->lock);
+	wake_up(&fi->page_waitq);
 }
 
 static void fuse_setattr_fill(struct fuse_conn *fc, struct fuse_args *args,
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 33ba8ae3b..5e01dd2b7 100644
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

base-commit: 5c40a1750f44dd6c7292d8c8d0b4ffff1734576e
-- 
2.43.0

