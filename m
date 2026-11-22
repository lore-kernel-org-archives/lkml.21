Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323528;
	b=yI8w9/JZaxTGHJ3nMzRsibrEYpI+Zrtwj/k6rpA3CRt9/2g38raLq9+NmjzH9jB4O5Hx
	 ibEAVlj/fCiPsQfQvwz9tujIbyg+wR47ZyN9goMLMN68irad1FH6UVSzcUb8QF9QKzDMo
	 iAcJ/A+iX6jcQm1tJdW8dn5NjjVzrYJGbWPN06NmBLOYlGBW0nvvhz7Ruc7OYYTx5Q6pa
	 9yYMrXHDE4dJBmc44QywzI0jDJlf1sOeFblZf5e7sv3242/q9mvQCu7Fe91QCtvJup0dF
	 0yni7R8HRW5Xd4j3R5yuETs8g6diHfcUoZrG5yMhhbs6vY+OUsvbNK+jpSRWguqQdJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F3QLio3AscsLh+2pvh7N6KImPKdVE87TLT/zX5+h2pQ=;
	b=leZf6F2FuqvDJuOAb3eBoDRWs7iBmU0+Y2hrAyRkeJ+mqJaz1fDgLRbb9NA+2LWrnXAO
	 wbZqfqRSM/CEPRQqTvmPtAy/AXBQII3pjs86ZyeqjCQls13uHz1R0fiqZgJOIwsFZObaz
	 JUfbVo9gbw5i6ONraZv3BTB6+Dx7u9bVdtXkNXBSNdvOV4UvVOQiTb2TA6/vqSdPj7b2n
	 RwT1D8BpMCP4Sv84hBXIYMeSsRpRIecPEmgMHCnjZ2BcYrEtl4hRbyjrO8R7rbGA422GN
	 jwJ+0pqt8GhPl20043mfGR7ak2fdw492JojWssCGaaoNT+pC3Uj1Bn4uOBgOt9VKHrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iynhWeN4;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3C7606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E3C7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iynhWeN4
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38699cf08dfso1572021eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795323527; x=1795928327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3QLio3AscsLh+2pvh7N6KImPKdVE87TLT/zX5+h2pQ=;
        b=iynhWeN4gpV9WpcFJKJKQzv0Npt/bxr3E+iEa25Y2BjgaoxbpHvQdMsIBpsXUqerDj
         hedLrg/AhtkD8omOXtvSx7eH54EXEEu12XQ176IdCTDFkwdup6Ugwtlpx8L5Ds8O8N29
         rDnXCcVlQVR/yFB5Q7X06MJj/jRhFN7wjwzhNd8Mne7eo9zwXwMaTj+Ah6I+6voLT0By
         2wy/oBR6HE+fgXhNtfQl3qPammeOevGEP9NTMhkKDpOh0pOr3uipEG+CLTOK85gQGfcb
         7lDGq5aiVc1Z5IG9fkwyPybbcCKKC35L6dgifD9POJBeyFs1l7e8TxpwHNdoSuFejvKp
         2FrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323527; x=1795928327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3QLio3AscsLh+2pvh7N6KImPKdVE87TLT/zX5+h2pQ=;
        b=f4e7V5NknG8eXGpJtIUOC2fApzK024FtcXdYobUtfgM1FkEceUn7vb4D2oshH3e4Xi
         svk5OddIecCi3ISj6+78jmjq7qJG93j14036j7iJBr0tJ3oJCYxe+NRZQ3/BCqfGdjZ2
         DYjf/24kkkJmUqnMwzWOLVekQytxkQZohne9kabbvTC5u/DooxGAt5QP9nUmR5l1SOMX
         CdD4uUPClflZjQydJS7DZfP7AKIN2evoSnpmQfow6T9VuXDzdajt+3U7IhCYbnaFDPAk
         K6HRNOeqnKEMjWnVtXS1WCpinrVKYSPVrOQaxIwLHHRmu00+OYUtq1MC9mTXAfmMqvMe
         04ZA==
X-Forwarded-Encrypted: i=1; AL+hErH5/Mga9IQtMJjJkh5YUXiC8chcjwR8wm85rvhzDGsQKScbj1zZAsYbBMGz/0lxTCDWvI5dhT6Luyz14Qc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dZiS+6Svld9T+7qcVZKU6eRhzjwIYladlkTSVO/lfD25QbBRy
	KNdYJR50TG4SvfkgVsYje6A2mUnzRZvXE1DAMFjJVcowt6DvxR+XsoCD
X-Gm-Gg: AZFdTZcY7AynG6gkNQtbXl3vCIokcZ13axypdUlv3vPL9+EmucundYymqMaAOC9WR+4
	q5hGpYfVFnijcboUA+mtoKS49/Gu7N0xYNx1NIvQ2WVt7ePUhdM/QbDkLhdOB9rma/2oE6j5P2k
	L6r3hHxLzDTmJSjODptA4uJeOc22tzZEcSJ7xyFAZFjnONvHV3bdq0mNnq3OkgUtIfPnXnBaNuv
	j07ZNVdVjVLgytQwDtQ0HwJEebeBRI6RH9b6f5aDcbTjeP70FwGJtvewXro2Afokf5bkeRcnto4
	HVN2rtWIYe5GmwrjIdNusZ8P5a6jC43cGjcjAABzQRtxrGaxvMfiWicO3l7GfHbOac9W0PB1CP6
	6o6LURIWXRt6BKxk1f8QkVWbqiH+YvuR+JCt3cygANay9zbvzjoqpAi+U1P9c83hXPn/HeWbVoe
	YZrXmc9QVoHxVMwTPR8gziOerA2yVVwa/ttsV87iCG2EXoqwWckrUAhD+1DDxe0xHx8fpTEW3cb
	JEdgVxksm1HrBI3ZIm4e27NRrWAOBcGXoAXIDzcQoR1wfH0FEu6qQs2MouV69Lu0GjRiSHkdh/a
	uBQwEayTp22ly0sSyRg4Fk319PloI0z2AgzqApLJJ8vxF2UGBIml
X-Received: by 2002:a05:693c:4001:b0:370:d6e4:e8aa with SMTP id 5a478bee46e88-38570b34fecmr8521946eec.41.1795323526357;
        Sat, 21 Nov 2026 20:58:46 -0800 (PST)
Received: from fred-server.tail1cd3ef.ts.net ([2600:381:4c20:1067::7ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm38865118eec.3.2026.11.21.20.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 20:58:45 -0800 (PST)
From: Fredric Cover <fredric.cover.lkernel@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fredric Cover <fredric.cover.lkernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] smb: client: convert DFS target node name from cache charset on mount
Date: Sun, 22 Nov 2026 04:58:40 +0000
Message-ID: <20261122045841.99012-1-fredric.cover.lkernel@gmail.com>
X-Mailer: git-send-email 2.53.0
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

parse_dfs_target() converts @path_consumed to the mount charset using
dfs_consumed_to_local(), but @ref->node_name from the DFS referral cache
is still encoded in UTF-8 (cache_cp).

In dfs_parse_target_referral(), passing @ref->node_name directly to
cifs_build_devname() and smb3_parse_devname() copies UTF-8 bytes into
ctx->UNC and ctx->prepath (and mixes encodings when @prepath from
@full_path is also non-empty). On mounts using a non-UTF-8 iocharset
such as iso8859-1, subsequent path checks re-encode these strings to
UTF-16LE using local_nls, corrupting non-ASCII characters on the wire
and causing initial mount to fail with -ENOENT.

Convert @ref->node_name from cache_cp to ctx->local_nls with
dfs_cache_local_path() before building the device name so ctx->UNC and
ctx->prepath stay in the mount charset.

Tested against Samba with iocharset=iso8859-1 and iocharset=utf8 for
both DFS link referrals with a non-ASCII target subpath and mounts with
an additional non-ASCII prepath, including reconnects.

Fixes: c870a8e70e68 ("cifs: handle different charsets in dfs cache")
Cc: stable@vger.kernel.org # depends on: smb: client: convert DFS prefix from cache charset on reconnect
Signed-off-by: Fredric Cover <fredric.cover.lkernel@gmail.com>
---
Note: Applies on top of "smb: client: convert DFS prefix from cache charset on reconnect".
---
 fs/smb/client/dfs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/smb/client/dfs.c b/fs/smb/client/dfs.c
index efef00c33321..6b212e49cf92 100644
--- a/fs/smb/client/dfs.c
+++ b/fs/smb/client/dfs.c
@@ -25,6 +25,7 @@ int dfs_parse_target_referral(const char *full_path, const struct dfs_info3_para
 {
 	int rc;
 	const char *prepath = NULL;
+	char *node_name = NULL;
 	char *path;
 
 	if (!full_path || !*full_path || !ref || !ctx)
@@ -40,7 +41,12 @@ int dfs_parse_target_referral(const char *full_path, const struct dfs_info3_para
 			prepath++;
 	}
 
-	path = cifs_build_devname(ref->node_name, prepath);
+	node_name = dfs_cache_local_path(ref->node_name, ctx->local_nls);
+	if (IS_ERR(node_name))
+		return PTR_ERR(node_name);
+
+	path = cifs_build_devname(node_name, prepath);
+	kfree(node_name);
 	if (IS_ERR(path))
 		return PTR_ERR(path);
 
-- 
2.53.0

