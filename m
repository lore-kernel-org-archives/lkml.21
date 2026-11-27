Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768822;
	b=poNr8P2bU0Tzi+MtrfVUp98W5vslLqtB4hcBcFZfP8H8BGOxnz4UhTFvGRUEIwEkjirQ
	 FfX0rn82+vwL7iKca8h1linBnfm+ibu+azPT0Tb8NwzYGQgu6whGHsyG+ZUEz6uDp18Ay
	 LC+MBT3TNgi72cSbs/vB2MLRhvPpYS5yTzKAmAxwfo+CY7TMyaJICNWSYO6RAxMqhbi66
	 K7XEDjd1nTLWXeapEHQ6ks47H0rCfwtoP9w2KxcRkDY5adq1paHQW6SA/yoKbZcOUlCt7
	 9a+uzDW6uTjW0DxJcVkQ5JGpjIWwv00FgAPtAa9mpmYKqk5ziRb7EjuHSo+laviBoWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RaXn0nW5iYEOBqaP2byxUSX/NlNAuk/kYgFWwG+1N3Q=;
	b=5s2lcvpUeQealPfI+qP241k8JfEI56NXLDqbO3s4hChtQWhAX8zOA3WA1KPlAGXQUsBB
	 UuSO+LQN4W5ZPsQ6XLukerghh6V0OtdFUaSOeyNEEKDxjNITS3qoA51cFtAUObMAFo03I
	 APHTjyJxTOXxUMYvGjjwp6Uc5aUGJMuzoXGAt4bTHERlwxgvuj4NwjXL9NC6E2fuSfYTg
	 DBE9t3ioMsKVe/k31athypCBWAVQjB45mzcHu9GKGdb2WlPBRoFAm8NRhGU4s03fOA+Bg
	 d8YmRAqoE60JP3Z4+blG5YmHdi/IPR+QhcGkOsnq1DmyrW62K0FyMP3T7eGXJhbKCKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wq4sQCs/";
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B145606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B145606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wq4sQCs/
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so1396161a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795768821; x=1796373621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RaXn0nW5iYEOBqaP2byxUSX/NlNAuk/kYgFWwG+1N3Q=;
        b=wq4sQCs/NiZDAY+AnQCLyK+EYZjXho0TEAgueQ0YEg65yI8SNAzG7bv1aj8HcwLTRy
         wZQddn+xO6cPgdbzlKeBOO7X5ND16aHIUx4q0+Llc4IOADLOxesC9Q+Wk6YB74uQ0Mgz
         Kr+ZiRLcQe/8Bk1OKY/72j/HyczldS5X7zLjAtnP5Cg7Xdl4Z5XFBBshOLtLJmzGatZ9
         m4DlUYjrI3mgLdihMsLoCOAYR/3HRoTzqQpAFyeUwf17vt48OZN6xNwSSVgmOzUu1TFM
         BINHWDA6YsRYJMzXiJEhffDwdDBbaeBlWpbu82r6i5ShzZ4rP8Xj6JP2Yuu/3fDL5Nw8
         E8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768821; x=1796373621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RaXn0nW5iYEOBqaP2byxUSX/NlNAuk/kYgFWwG+1N3Q=;
        b=OqNB1VZWZxcCmxdq6e9gtLvmlFA+4VtvSQNSE8/msUrNHBDCDP5pznA26N9C1A3gwy
         mRWN++oCvUfcrD0mGJ5Ilhxml3anCnHInTK87KfpCmyOvZJ7VrqqvLyr+KQPjq6s+qzW
         6wCIfPOhr1X1TyydegRYYmIypNyf0favfvPnfv2BQ1t/SWeaF/MLWIiu2h9BYf3KnYBa
         iq3y0M9B1yQThJQKVkoqjOIiOKPFqoTwAg/9ewxicS5uCbFtcWo+Xjuq4fzioCYegb0E
         09lbTakoMQ4E4MngwRIQDDQBP67eW8P3kB0xZPYYGT/d0Rz/Mf7lyWCuRsUcvn4P7/hb
         7H0w==
X-Forwarded-Encrypted: i=1; AL+hErENcRxjEvs7+Ht8Pesv5Cex6P4Gr+iRPqfOd/fjv/8GjKcrD5SyE5S6gGLAPnN0YFsDXmOM1vTdaz25cI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cIjRDoL2vJdHSXZMCJHcuJX0Vn6rLbMOOGqnqU/1cgezI4meR
	ZnfWPSlfkPmNeYkjxzzzNgTuQkZDVbTVHTDsBxiIye+IVopeUT8+oVZa
X-Gm-Gg: AZFdTZeQrCYEN9yl/b9u/s9Z9EYnDt/YbVVc++cPYuaAgxsoO5q7k/x9i4wNaKi9du0
	eVKkvvMxUnk012PJB7fUdaJh/5B7fhNihX3b2K/3NuCfqx9MZ6vbSE6ejU419fyAvCk8ESzh903
	EHscQGy8wuMV35LKUaUn2JpnU6bUIB/eaI8A3FbjSrojsZL5QIKEgzJt7FwhdFAxD0LfWY4L6+j
	/j0Q86nk51EC0KXQ1yXYHSJmKTmbFDYVZrYNSqPN/wjGJ4SFGD8EVn8XUcyJtHbyfFdf1Ouw/Ri
	83Kg2ziMgB+gUrdhEh2vll/MC0LtDvxG1jUPlIIAdF2rXCsWlR3DZWmvTvxmsUZdWroaCb/foDe
	sNyfRQkjAcILvioAxWyShePtdos9ONZjFjx5NfPJbJsM1gulT0DypECmYQxsthO0OPJ94kXvhwC
	BC72oZ/Srqs4a45ZIoVpBBt88PB+P2gssJhB+M2u3xxlpwfxyC5pbSnYYHS0dSBsn5zdL42RJ9C
	cEChssTvtfgfgMHqrd90gXVM+bRUjXawuBLswlGlp3EYADMG4PU5iHcVZqieOd4cuNG6l+waT9u
	d4NmaQGslPDyxeRry8g2Dd+rnDpLXF8OCfyj6G/R7AMClenn1fIpWNdI0FEYoWEGwdNvbgitp8C
	MrbT4fe62eQg=
X-Received: by 2002:a17:90b:3d92:b0:3ac:7842:bd50 with SMTP id 98e67ed59e1d1-3b41c8dd1a2mr22960427a91.15.1795768820844;
        Fri, 27 Nov 2026 00:40:20 -0800 (PST)
Received: from localhost ([39.144.138.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm39724097a91.4.2026.11.27.00.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:40:20 -0800 (PST)
From: jianyungao89@gmail.com
To: linux-xfs@vger.kernel.org
Cc: cem@kernel.org,
	djwong@kernel.org,
	sandeen@redhat.com,
	bfoster@redhat.com,
	ast@kernel.org,
	ishiyama@hpc.is.uec.ac.jp,
	linux-kernel@vger.kernel.org,
	Jianyun Gao <jianyungao89@gmail.com>
Subject: [PATCH] xfs: remove redundant ASSERT in __xfs_bunmapi
Date: Fri, 27 Nov 2026 16:40:16 +0800
Message-Id: <20261127084016.18418-1-jianyungao89@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Jianyun Gao <jianyungao89@gmail.com>

In __xfs_bunmapi(), the code checks if the fork is in btree format and
then immediately asserts the same condition:

    if (ifp->if_format == XFS_DINODE_FMT_BTREE) {
        ASSERT(ifp->if_format == XFS_DINODE_FMT_BTREE);
        cur = xfs_bmbt_init_cursor(mp, tp, ip, whichfork);

The ASSERT was originally meaningful when the if-condition tested a
different property (the XFS_IFBROOT flag), serving as a cross-check
that IFBROOT implies BTREE format.  commit ac1e067211d14 ("xfs: remove
XFS_IFBROOT") replaced the flag check with a direct format comparison,
making the ASSERT tautological.  Remove it.

Fixes: ac1e067211d14 ("xfs: remove XFS_IFBROOT")
Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
---
 fs/xfs/libxfs/xfs_bmap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_bmap.c b/fs/xfs/libxfs/xfs_bmap.c
index dcd5faf3428e..f2627ec2dd24 100644
--- a/fs/xfs/libxfs/xfs_bmap.c
+++ b/fs/xfs/libxfs/xfs_bmap.c
@@ -5166,7 +5166,6 @@ __xfs_bunmapi(
 
 	logflags = 0;
 	if (ifp->if_format == XFS_DINODE_FMT_BTREE) {
-		ASSERT(ifp->if_format == XFS_DINODE_FMT_BTREE);
 		cur = xfs_bmbt_init_cursor(mp, tp, ip, whichfork);
 	} else
 		cur = NULL;
-- 
2.34.1

