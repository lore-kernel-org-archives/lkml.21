Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163948;
	b=ZMnQlDub3SaSzVkaWfCLVc7bnOzTMhqdVAqPRwDWSumDmYBlNvCAwkbuG5+rRcSIehSa
	 twIWa2AxPgot5KR0x+wKXP8yTjKjZLt7d5DJt8nbmMe8IbdpdH22gnbnBvWiT/ebOY9ZV
	 loJQco1INs0W7nSME0FczkJpvXjHggtiGpVBYlg8mS2EGFcssYZaBG59AC9YInpM53pyg
	 FaGKMXJnKS9nkeUvzFFnIqLbkH2Hy/NffhJx5J26zdXPt7fxTPsxvN1zbBQEsXFPWuVuf
	 DIj5W4Ehlfe/UqLpgE85N2bACPxK4sz3Ac2iZYxsAvbnUWuIBqFlrU7d4bA3TfmLsMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TVN9gvvNujEIXtZTQ1E4kuWF5NZhZv++97N2Q59Z2xU=;
	b=giAykYFTLJFj7Cj5LQj84BvY4NZZdr+VqiGGCxOLHtWPnb6Ph076mPSs4by3VPEiNNsE
	 SHoI50OmAXmYLdvNfB5/zqYwZHFXqI4/RwAk7shMjBKOMGXrVzJQJVRFKgnnVDXO7LmdA
	 7dwa58sIjm1Bu8WMWKiliZg+PbHCtWO7AfnR0s0ZVCezJwwXlfXsSj+ZSNO57DS5p3Bkq
	 s6E+F8iqv7Jyn6lrtQm/kHDaSuwBH3gwW7gGDvfuQvn3AJaGCKIHYbW346d+LH+sUlgqd
	 /y3smi4zRmz3EBQXx7WiD63Q3brnPM5dSbjkHqgaq85rB5zA6YH5dCk+jqgArI2zddw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ktr8XD/w";
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A30606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48A30606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ktr8XD/w
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so631955eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795163946; x=1795768746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TVN9gvvNujEIXtZTQ1E4kuWF5NZhZv++97N2Q59Z2xU=;
        b=Ktr8XD/wohxpaJSrx1EeOse7EJKYe7y9m2vUz90oTx0DvcjBz1lCXZMm2F5SmtDHvT
         BKYuVw4ssRD4LqKppmI5mu3Nwe2/0BL46sP8zoA5dgy3GY2O3xAurXRPGCLcVhC6mhmr
         Fl6PVOuryT4n0XEx2qHeHvsbubbXBtBO1+ISoBooVvg7CkLcUc6SRkZ2SS79obEdjzmM
         YA8BKzzTeDPdNrXx89ZSsZQ2Y2Pj3kyOXTjp3njrQvEPLYX4Lfhax8sEabMeuFbkjmTn
         Bmh3JxCu7pmbenN/SCaEa8Ur3qgVmTEbsjy993R4a4PfvSO/mSEnZS+1paaC8LCJK4Ia
         ICzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163946; x=1795768746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVN9gvvNujEIXtZTQ1E4kuWF5NZhZv++97N2Q59Z2xU=;
        b=Dr+K+7TyOe2L9AUfE6mEcEiKQvDGsrRpgGgM9KUaOOgSzZdGUitsymG+psrOsW5q1Y
         LnUO8eZYK7JAmI9BOrDer3iJG6IVxdfCa5ZQHn6YFb/4Tqh3MbwKHJX9bnfMEjgyXC+u
         mMWoxuopaj6VB8Logk2QQcZ6NXRTexdz/LsqyDT6BzBbWRHu6YIFQz1Ebj8daf1XgYId
         r7bVME31/oO9eexkBLdVB6yiSVaL/ARIlGz/ZGXQ+2/j6xQkTDeN3UFn8Kd/Kq+oiPhU
         cFAZbS517laKbHgmIKBOpcrBpRgoJDBSDJ5yxRFoYBRiQccxS5/JraESSK4nVSuhc/dX
         lAcA==
X-Forwarded-Encrypted: i=1; AL+hErFyopZQ74HHKFoMGYr8ksAxHa2dZQhdepR8sIgfD1W5cJh1bzf0l3gOjznXr+Yq7xUmKyEHepSwHnMoBrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZWB1ukcaLcidBlqenExxmKdwkhQC4EuQR1a0Mpk603Ar5mRal
	uY6AQQlD1l6kcHY43Gmeoloxx+uScxjKV85KmhxuiNpqsVTXkhDAtus+eiaiqQY+FbDO7A==
X-Gm-Gg: AZFdTZeo4PFr6PzDKaTNbBIp1g+PEpb0+zuyQ6FXS/ffV282qgonwPq4pjoL8NHgmU6
	V272DmTBkAPnAr/vLOvgs04+A5wzMsQkffVgC8Cdf/VdxsgiTHfOl7jvhiRumVzu379U9nSJsGn
	E5w8mMEVSj+WkD8HdSzofZVLZw+u8HBgo2rs0jFX51hbjBU4zqbN2SYM4ONPqrR8aHLQhAyTq78
	ZCXgMQZRwl+S64ftKhzrL550pHVPixEeLy9mJCKa4fRvjqG6KJ/aJYMAeitJ4JZnAOT0k0o0Jqv
	JSCAnxTO6zhtwpR2X3eQEPcI+5MAZqOFg1Oc5ccFo6LpmEOJC0pji76cyzW/WmNK0IdyJav+7HN
	jPNBkafQqHQ16JN+8L86sFQ/N5qwN5yTqNsSstgapLd0lzt3ALZeVG5yN7366VTH6j7bj+HhzvM
	cYB6opbW9+SV3bQGXbWVUyX1EucRyltSbGKqXDyxrIIQwNKzM312OMdJD+MQHtD1UpV1ymdDeRS
	E0gSt4oxPl90hIaxvM2AjcQMWqTmtMu1HNxpbQDv9JHraRsLGixBqFUeKNb8YJ5sXAfFTn3WHcd
	j2o8GSnUE1sLfOIfcaAwMxNmU6hCh3g6cLsc5Xaq3ZHXtR5OL05syhHwa5qHHfDM0+DWfgIcMwK
	UYL2WtweLPozPIzgVMEgASnqjJJ2Ubt0RW8ZpMzJNDrxs87K6+KOcmxOO/8AT
X-Received: by 2002:a05:7300:339a:b0:36a:18e2:64c with SMTP id 5a478bee46e88-3856fd5bf6bmr2021691eec.11.1795163946269;
        Fri, 20 Nov 2026 00:39:06 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm6297369eec.14.2026.11.20.00.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:39:05 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] f2fs: reject immutable and append-only files in atomic replace
Date: Fri, 20 Nov 2026 08:38:57 +0000
Message-ID: <20261120083857.40170-1-dennylin0707@gmail.com>
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

F2FS_IOC_START_ATOMIC_REPLACE truncates the file when the atomic write
starts, and the commit drops the old blocks. It only checks that the
file is open for writing and that the caller owns it. It does not look
at the inode flags.

An append-only file can be opened for writing with O_APPEND, so the
owner of such a file can remove the data that is already there, which
ftruncate() and open() with O_TRUNC do not allow. For an immutable file
the same works through a file descriptor that was opened for writing
before the flag was set, although f2fs_write_checks() refuses writes
through it.

Return -EPERM if the file is immutable or append-only.
F2FS_IOC_START_ATOMIC_WRITE does not truncate the file and is not
changed.

Fixes: 41e8f85a75fc ("f2fs: introduce F2FS_IOC_START_ATOMIC_REPLACE")
Cc: stable@kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/f2fs/file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index a150de19b60f..ef7dc420fdde 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2597,6 +2597,11 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 
 	inode_lock(inode);
 
+	if (truncate && (IS_IMMUTABLE(inode) || IS_APPEND(inode))) {
+		ret = -EPERM;
+		goto out;
+	}
+
 	if (!f2fs_disable_compressed_file(inode) ||
 			f2fs_is_pinned_file(inode)) {
 		ret = -EINVAL;
-- 
2.43.0

