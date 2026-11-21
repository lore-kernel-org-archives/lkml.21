Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795237518;
	b=MHiYG1L80TU50V83fS349wUvZj3+Wm7mRXs/6OuCsQzGnx/8NvYH/BNKXLA9q+cRy0WK
	 ASve3jRQSLsP0hb98X9ILaUJh6KKD4LjhYvdf99K0t9tlkGxxbPcIhkPj+zgkwmoLmok5
	 syw37QtV/cras0jx7DhBh6tooMLL0m21gJNLPwzRwQpuldQRxsuacLzkLAz+74Pnbq6h+
	 0H+1lOkovHtjPDaaHLT7rSQixyWw06dkiH/J6IawWqm3kPnhypNdfZroV21Kyda0KBxP9
	 dN4h2b4Rkd2TB0yCrhq0VrtPpoclj+BtgIEEcc9jsem5gKZ7KSblWRqw9jSpkxhEubg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795237518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZQEmuIgwiSjfHM1LUUYtpY7CsiRUokc3oxpqHpj8l5I=;
	b=Fzs7dDOHlWTnRJzYCFdjbLU/eBtfENIxGxL2TkzSuubOkzYC1hFSrZfZg4rDYV/mW0h1
	 szYdOtr72pytsrZSrxds6QDaDCHU6Wao3eiux3AF2eVCTZN+4fQazJV2BQ+qGDtIYh5AN
	 glcH2YmfJlXct9yhdayHupiNrIrn+xPJPCTkVqn5QbOOroLkj9PLFg7jGG5BZV9AEI2FG
	 DgMtEf/z3+J46R+Ho92wFyJ05RpfR/wqh4MwlmI9RvnaJj0HbjEos5bnrXb8k6yCMR+DF
	 de+tDkqtZdD/AOAy9C2zMPXQKtQ0A+vCSaZa9kMC0Tg4VZJwzx01YZOF020IIAXS3bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahx4FyJd;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D3606A698
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1D3606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahx4FyJd
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so4376889eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795237515; x=1795842315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQEmuIgwiSjfHM1LUUYtpY7CsiRUokc3oxpqHpj8l5I=;
        b=ahx4FyJdCzr8CkjV+1FLr+jCU58RDubvTc9idS0Lp7sWS5XHx2zbOt4MH4p86wKh0r
         yrjHJDtX4tiN6j5wpPjfyW3pC5ZLaaxak6jJuBeHNSWqNaTblvbWJjYXE+RngkYm1M01
         inqd3roa97NOdaAp9j0zNe3oJIT2AKdJAl+M1ksIJknBVXAtAb1yVzgFQkFiVSIyxQBn
         BT9U/8xyd97ed61QgDjIKbuDFf3ppjsqn90nRQ/nG26+Z4erGeUN32eao/1B65Pe5Z3Y
         6ALDVV4U73UXfIxagJWYzrSWCCVq613p5rFMRq0bm1fAO7zpCcNMFODQtJmE5gkJOAQY
         vjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795237515; x=1795842315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQEmuIgwiSjfHM1LUUYtpY7CsiRUokc3oxpqHpj8l5I=;
        b=fnjtu2OMnoxGrvHD02LZQax82xDnUf8/6FL21fdosyjaps4B1tJVad1QB2x/noGo+j
         sshDyvc8blwMLWx9/AXCRYduMrqN4LTrKq7Ujzs3C8lw67LHHr9SEUCm4/xzPvZ3aPgD
         3U17YDy7zg0jCyulPI75/74d4ssAYlkrMsC4xnS5vYBLV8HCvznsis6KFOGgEHoGDowk
         ertgb1GhXMI/Dbro4cs4s1qefOj92GC+Qn38yqwv6OX0b6RErzpFaM++Ld3oOBV7S851
         lP0gKGSDlmE5hTrPe5WD7RMoMIJ6ak8DBNjLguz//Py1kbaGXoiSe24eBSs0MIHjIKiJ
         j/Aw==
X-Forwarded-Encrypted: i=1; AL+hErFCI1F7PROHfzew/aN/TUCt8KY4TWP83hLhYDR/wIBxKexyEPJ/QvEiQVeM9/mLraJGIMJubC+tQRmLQSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FLC2iJJy1ZeS17CRoPwHRT0G1Bho9CAH+gcgrjA39ZgyBGJBp
	M63ZSbOtJa+KnK/DaPdfh9QI03O7MJdn+/TjTmGhnXjR2D4ebJwFuGfR
X-Gm-Gg: AZFdTZck5U1MLR5XXrbDCASLvisJWAQ1OvpKfhm7gPfw5aKEgiTfxB7czJ40VS6C+/U
	rYpIyWadM9nlvfz+cJvI418OXeHWAx6hD27XBc0yZKmWfLAgSCY/TjL8ATCsCT0fluuGXeUDdS6
	JVix3hanBV7lqxlyWy+OYdnvd5ChUl2w191oXHiD8iwzzwfHfBV5/ldebvBxMmfhYfdu3j5md1Q
	ldx5VxW0wU0YiGwm4DFcsS+GFn8speGhewlXgTGnbhTy4a6l6Unl8ys+8y40sSAxfPa8KLAhOBN
	XMydJuYDw9Mn8Sd4a/iMiam/MhxjdSyh1j+pw4T7vwSirRZQnR5+HJtpp0BYvdeVpWqj9L5OmGh
	Y4oiMprqc5cBlxmGxEgz5hqFCyIUalKYVw7AwyuIsm6xigYt59tBXSq1vc9clLbD0Pg9FyjHXtf
	S0d+mrBb7i4UAsLQBngV18SY7j+hZkaC9AxCTqIV0D4qW4hNNWpqbCfcPQPm2tLjHvEITOpFlhe
	bxVJrfjU6rj54funL5QSmynF4PtqNzOlIuY+99SVifEXKEiCq3Xe4G3s3WcKwsxwKIlaUC4gW3X
	u6XWrLb6bKX+paLdx5+97az/7rm29rvDhqG3DZmFQ6TcVfzlQwd7JMRe7RZyWtbaG4s=
X-Received: by 2002:a05:7301:6405:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-3856ff54addmr5762667eec.33.1795237515192;
        Fri, 20 Nov 2026 21:05:15 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm14545835eec.28.2026.11.20.21.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 21:05:14 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Carlos Maiolino <cem@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xfs: reject a hole in a remote xattr value
Date: Sat, 21 Nov 2026 14:05:10 +0900
Message-ID: <179523678723.1642977.7101755246592074809@gmail.com>
In-Reply-To: <awB1mmg22PhD_efC@infradead.org>
References: <awB1mmg22PhD_efC@infradead.org>
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

xfs_attr_rmtval_get() maps the blocks of a remote xattr value from the
on-disk value length and only asserts that a mapping is not a hole. The
leaf verifier caps the length at XFS_XATTR_SIZE_MAX but does not check
it against the blocks the value owns, so a larger length makes the read
reach a hole. Without CONFIG_XFS_DEBUG the hole becomes a disk address
past the end of the device:

  xfs_buf_map_verify: daddr 0x258000001a7f0 out of range, EOFS 0x96000
  WARNING: fs/xfs/xfs_buf.c:423 at xfs_find_get_buf+0x160f/0x2350
  Call Trace:
   xfs_buf_read_map (fs/xfs/xfs_buf.c:648)
   xfs_attr_rmtval_get (fs/xfs/libxfs/xfs_attr_remote.c:434)
   xfs_attr3_leaf_getvalue (fs/xfs/libxfs/xfs_attr_leaf.c:2718)

Check for a hole or a delalloc extent at run time and return
-EFSCORRUPTED, as xfs_attr_rmtval_stale() does.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
Christoph, understood: an image with crafted metadata and recomputed
CRCs is outside the XFS threat model, so this is a hardening fix for
such an image, not a security fix. It does the same run-time check as
xfs_attr_rmtval_stale().

The patch was written with LLM assistance; we reviewed and tested it.
It applies to the xfs for-next branch. With it, the reproducer from the
report no longer triggers the warning, and XFS reports the corruption
instead.

 fs/xfs/libxfs/xfs_attr_remote.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remote.c
index e6c8dd1a997a..722440f005ca 100644
--- a/fs/xfs/libxfs/xfs_attr_remote.c
+++ b/fs/xfs/libxfs/xfs_attr_remote.c
@@ -427,8 +427,11 @@ xfs_attr_rmtval_get(
 			xfs_daddr_t	dblkno;
 			int		dblkcnt;
 
-			ASSERT((map[i].br_startblock != DELAYSTARTBLOCK) &&
-			       (map[i].br_startblock != HOLESTARTBLOCK));
+			if (XFS_IS_CORRUPT(mp, map[i].br_startblock == DELAYSTARTBLOCK) ||
+			    XFS_IS_CORRUPT(mp, map[i].br_startblock == HOLESTARTBLOCK)) {
+				xfs_bmap_mark_sick(args->dp, XFS_ATTR_FORK);
+				return -EFSCORRUPTED;
+			}
 			dblkno = XFS_FSB_TO_DADDR(mp, map[i].br_startblock);
 			dblkcnt = XFS_FSB_TO_BB(mp, map[i].br_blockcount);
 			error = xfs_buf_read(mp->m_ddev_targp, dblkno, dblkcnt,
-- 
2.43.0

