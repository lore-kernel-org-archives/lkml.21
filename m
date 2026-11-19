Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107894;
	b=kRX+aF45lh0Ks8vnKap9sOoP0sQEAFGfYNXIH7zEshePPT9qfAmC68J5VmLnhgTOhTZp
	 hyyogap+UQsHQ18OcqkbUAXcfuvLfJSe7EtH1YLU2cojaewfH7600GkHjcSbYBJbpNQ0g
	 Sknpevf+4HQIgMdav/7oQILWqvdBb6WyCVwMQS3Q/Z+sJAwccsFd0yB+4Sau7iej6ya05
	 WbnMPabk2ROIn7S+NMmIa+DAkabOwqdK+ajDk9n1ssMNnV78nnU9yuUTLAz92w1U/gtZw
	 GW1dVrUq26NNyx3CmBfBgMeCF6GhJDbsY9dL1USk0qe2ccfbMruPXc8i5AKLbVe1zag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=9YrcN3VTHuAzKVwTFah/n0lO5UTQ+5t8mWxnZHt8ueo=;
	b=jvk8ftZa1dkzeOrP9v3LpPMDvWSq0zmwCX/2i3IJh90v3nrBVJ3kE0HdBIVkCVtX9tzV
	 7ZNAyp9GN6NO4T9+tWqDcvJbGilDJI2R1xlUnL1j2dndBgTf6x8ctJMhw9zCQ8G/oe/zn
	 2hm/uVF33US3TypSb8VxI37wem2mHWT5bPhImqVRdzN+p3Z7enaJ3Sv31YRp9Giba8fCP
	 qdz2MXz2K6ieSyu/4lfYpqD4o5GXiCJ6duqMcmCx5QXWHDgZHh+Eh2V9cZ0r/FyXZSjGT
	 8ntP+8nijpnK8DdngOGppL9yx9Fdh5UAl0WzHVCudg2ziNEjBt01bO4Hio4Hj+lZweQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="HO9/WGTz";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBF860A3814
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DBF860A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HO9/WGTz
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3854627c1c8so243977eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107893; x=1795712693; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YrcN3VTHuAzKVwTFah/n0lO5UTQ+5t8mWxnZHt8ueo=;
        b=HO9/WGTzKBzVAS4R2l3j9A1ZAr/EEt32hh83fjRUiplNAChVV+gzvU4e3EgLBrphnt
         /lVlHa8QP9HalvvWzuyZF1EEYWWXtTFqISiCu/3zplAPrft3CVHGjcMJt59dVrdvnxn6
         gldp6z87WwOOsRyJbwgQ7ugon34ZtV+cA1rEoeMvkI1zMeyaoeOub3E5HsBTqyk0LcyI
         cCWBRDI/JG/FWS+yFxwTh2/f/Hd+axOlqbh+XRbhNmeK3du0yiOTGVuuTl5GZyhlIuqu
         ypf0ORff+TwGa9Hh9mBEoGbbVUMLa31YeJbC4pOxarKIZWeBjJUnJnTb6HZPYDZ6bRqV
         FHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107893; x=1795712693;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9YrcN3VTHuAzKVwTFah/n0lO5UTQ+5t8mWxnZHt8ueo=;
        b=clxwokmpUM+g+AHpVjWKhdG9fNvN1NckMtdvPoSdp5NZM4OQwH6rWNzl7iCgNr8pQB
         XCnnOi2CEyCgodZr1Sp3ufgDNy8qckhJL5anxL50xFKpb9n0T5hZ3Ljm0VyD6v/uYfW3
         8dR1Js/3ACQDKY1zLysY06SECHz2GG3XlYIss/11ndsw7F9qEVmvN4bVYMQymWhNNScV
         f5lvf24acjTSUNUHvB4U90BLwI0vpRFRZMLziok134mt5pEF/ybgWIGy8rTik22LCyzc
         +TpKfWzKO7PhKoya4xBCUt7eSA8RVgRTVbuDUdglTo3F8zXIQnA0DakBQkiI8N111IdE
         nMfw==
X-Forwarded-Encrypted: i=1; AL+hErHpvP+CTzeT600+e/0klf4Y1ArCnmmTHRchZBwilNLsRBYuw3UhoVF5j/t29ttNRckrAT7dYr+MTlj9PhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mxnuBQ5k/uTQjdBa21y1D9SjwAt4D8ltoCkJNRQJWDunoO3vO
	vtRjVGFSoYa0rF+PhDjzolLH1PNkZmQd0Cu/kNUE/83kUr7EFXPp74hxg12WnJZOOXCedII4q6E
	BAUohigIlAA==
X-Received: from dycns21.prod.google.com ([2002:a05:7300:f795:b0:382:8cee:3808])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:881b:10b0:384:24d9:526b
 with SMTP id 5a478bee46e88-38424d953afmr2634367eec.26.1795107892359; Thu, 19
 Nov 2026 09:04:52 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:49 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170449.1513687-1-irogers@google.com>
Subject: [PATCH] xfs: initialize error in xfs_getfsmap_rtdev_rtbitmap()
From: Ian Rogers <irogers@google.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When xfs_getfsmap_rtdev_rtbitmap() was converted to iterate over realtime
groups with xfs_rtgroup_next_range(), 'error' was left uninitialized. If a
continuation or range-bounded FS_IOC_GETFSMAP query has start_rgno >
end_rgno (for example when keys[0].fmr_physical + keys[0].fmr_length lies
in a higher realtime group than keys[1].fmr_physical while both remain
below eofs), the while loop executes zero iterations and returns the
uninitialized stack variable 'error' directly to userspace as the ioctl()
return value.

Initialize 'error' to 0, matching xfs_getfsmap_rtdev_rmapbt().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested with LLVM=1 W=1 and
-Wconditional-uninitialized; not runtime-tested on a live XFS realtime
filesystem.

Fixes: e3088ae2dcae ("xfs: move RT bitmap and summary information to the rtgroup")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 fs/xfs/xfs_fsmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_fsmap.c b/fs/xfs/xfs_fsmap.c
index 041bb2105ec6..3ccf3ce23332 100644
--- a/fs/xfs/xfs_fsmap.c
+++ b/fs/xfs/xfs_fsmap.c
@@ -760,7 +760,7 @@ xfs_getfsmap_rtdev_rtbitmap(
 	xfs_rgnumber_t			start_rgno, end_rgno;
 	struct xfs_rtgroup		*rtg = NULL;
 	uint64_t			eofs;
-	int				error;
+	int				error = 0;
 
 	eofs = XFS_FSB_TO_BB(mp, mp->m_sb.sb_rblocks);
 	if (keys[0].fmr_physical >= eofs)
-- 
2.56.1.708.g77570a6a1d-goog

