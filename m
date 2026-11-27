Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748707;
	b=aatuYI7aBQ0SgvyfHQbr7R/D1yr0udOjp+xMbqkGrQwWLcLItQJbnmNTZj6OuZxckpBz
	 WtCi1tnkj0UgM09VA/MiNWopuIzqoW671M30fLOySQduPOaDBAi6yunCXyS6KWMDAeL4S
	 r/CuRB3vaDZg9TZe/Mth5eg/uBe64sbLzV4yloREn37Qbsci3rFhw3cUfeIrg80Zgg8Mz
	 c9LNMGjlnskCyTdfA0PEfPJ4duuf72olMhsUy/yEOfpNdKgcRodlJ9j5kw36v9rmLZLzc
	 7KJj7ycv2LX2F+7rbaOUefJGxhHjStL+cZAasSltZ7J23Pe+AolbUQvYVP7K8KIrsHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VMJSDmNyEar0oZTXLe+VUV/WQ3gMi33nYR1P2XH9AI8=;
	b=vBZbvU8om+IkLnMI7k0sw072jNSJxgEBntTe7tPlh27xl6PRQi9hKLhWJEkyMdzgP3tD
	 hZM62O5AMnNA8yDIiwxxa40vgor3Rwt3P2DnSnkQWlp4Ktb9JE0EbBNuoph8pZ+cBLbSW
	 uu+61hDNgghBPCdmbEYf75SqX6X9M2nCJ0FQAOoj+kLvItOT2CJduGPRWL3MhfZM5LqN4
	 jAK75Z0YxpVT09K8/0Iz10/w7HjFVFmCTA5VjD9IS0O5uF+4KlWtshArBdVaQzFEd3m4r
	 4Sjd22GwNtnCzTQPGyHqWdQJwVbYpY1SJxOzE+3ZJN6vAPgroBNuYzLnZjigt4oTv4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AE38USPW;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54C6606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D54C6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AE38USPW
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so1474675eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748706; x=1796353506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMJSDmNyEar0oZTXLe+VUV/WQ3gMi33nYR1P2XH9AI8=;
        b=AE38USPW5TWl9F4oXD7LDVr2hn25W7zaqL+RZgZm15AUQjyNTmfZw9Yx759f6OTMuM
         CrQT1lS0N7x+8afjh1La6Lx4lTB8aNjjUYK82L73suD1lWk9IBY7F5Rjshn4cnWZPPim
         TDRhZEN+M7Cq1Xm5YD/8RiBL/Bkr61GHbql6IR9gY+4hV4aiW0XaPgON9g3V3k4dQiBx
         ggkpH3xj6SABmowixfpV0VyyFcYsMP/XMmOY+JbIg4dxSMGWkO4gla6lVIsITMK/UjjP
         +FJuJc2ncDBud2RcclfSFfjav620QfIJb9cBRFRaU02gjyj4r6gRVRirFHnw4MhalrkV
         MfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748706; x=1796353506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMJSDmNyEar0oZTXLe+VUV/WQ3gMi33nYR1P2XH9AI8=;
        b=KpDdfc7D1vvKgihTdy+fbFPS27N1eV3Ch6hI5Jir5bRSlYZfw6qO60d7pfnEJHardP
         wrp7Igm2iT9sdMrFYOewPsZNq45k8r8HNx/PaC3+OC8Q6gcvM8w36VsWulFC2T5DQky9
         XKj3LWLPUyC4ZGBrYtpoNSJpFipWubQu0/eTwArLRqCEMzcV5AxAxLfEo8zwL2mwPaCp
         6a4KrE9+cnQATOrqjvbkImIakF3ofzvl3y1dw85Hj+jDQdFVzTY3Cu/Gv93Fb7T9HjG0
         +V1YWmunqzZYwuQxSm4Ku81Kto4XwFZ7EfEz7lxNNOtt3YhOkOR4UiwhCf2BDKGWyP/b
         mRBA==
X-Gm-Message-State: APuU4Z8nK7uL3qHi4g4Ihr0Gn3b3H3QOJsYNLOWyQkG28d256OT9TWHl
	F1dwlCi2lygQHvyo2paWctS0TTBh0MI/Z6dEbNRpMXaK9AEbrZ1O3HmSIuDQGSbC6t1eIg==
X-Gm-Gg: AZFdTZc76Q8gvA15h5oFpPTqr5Bg10P2opgIaxHXIV1mT7INR3xxwOFO/CuApokFkI1
	qmHAbSf4yXZ8PIT4Y10r0DoU3h3rzzIoMfoyrXyMs3rIqqzdp0WC3R1t5XMOARXMAzyNnWw7BpE
	71NOH9p1S1DKWJDdXnvaaosZ74GFRKlOfchplRIDcWvrZpGsma/ymfyyMHz1Ipklnz/Mf6Cg/F9
	bGUfzYwbj45hrYvxd6+kYgzt6AGMX7BTnm6xPbi4xfGBWgQWDAFp6eCqno+VqDLwU1K+FtJUw7A
	e5k220BFPmYeBEOtby9Z3w7iQ2AK9N+r3rSu9izG5kaqXDHzTmdkOwuVzGs3L1IvwsyPhlHAr1t
	v+n5AB/6PnYixK0v9uhaqSBt562D4CyCEpvEyQyYNGhVCWnSM/pGvEZWWhyc9kPyQcmgKvqkzoc
	svsgj4LRBKvq9jmyQis63eXfs3m57d5O50FCHBQQwHaKOnTepuaGhGH5z3dbZPfYfcZMWV6qGRO
	F33siGoVEWIBMDC8DY1empYrPLMuVqF4QsavEnI8Vaz8ECFByTNLs8ZS/aHsij1FSrJvgg604md
	/Be1mprPHleI5xiJrcZyeAe4ndj648EQo9Ek9FJmnObakPXk9utdIJ5c/AfGPhp7ah7JJ9oHYAh
	k1f3qdMAMN7cMuKMBkZH91ZXvk2nQk/fh0vpEaAlqqpKEC0gUCW9JSdM98ZfOSiKVH3521GRhL4
	tGM7E4GhPAthcgC8pHjaAuPg==
X-Received: by 2002:a05:701b:4583:10b0:185:33ab:4d55 with SMTP id a92af1059eb24-1b5569101fdmr21655037c88.29.1795748705829;
        Thu, 26 Nov 2026 19:05:05 -0800 (PST)
Received: from localhost (ec2-54-254-160-110.ap-southeast-1.compute.amazonaws.com. [54.254.160.110])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm59613588c88.13.2026.11.26.19.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:05:05 -0800 (PST)
From: jianyungao89@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Jianyun Gao <jianyungao89@gmail.com>,
	stable@vger.kernel.org,
	Carlos Maiolino <cem@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Eric Sandeen <sandeen@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Yuzuki Ishiyama <ishiyama@hpc.is.uec.ac.jp>,
	linux-xfs@vger.kernel.org (open list:XFS FILESYSTEM)
Subject: [PATCH] xfs: fix log flag cleanup in xfs_bmapi_remap error path for attr fork
Date: Fri, 27 Nov 2026 11:04:55 +0800
Message-Id: <20261127030501.1618-1-jianyungao89@gmail.com>
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

xfs_bmapi_remap() was originally a data-fork-only helper, so its error0
cleanup block hardcoded ip->i_df.if_format and the D-series log flags
(XFS_ILOG_DEXT / XFS_ILOG_DBROOT).  commit 7cf199ba5a70d ("xfs: make
xfs_bmapi_remapi work with attribute forks") extended the function to
support XFS_BMAPI_ATTRFORK and converted almost the entire body to use
whichfork, but the error0 cleanup was left untouched; a later mechanical
conversion in commit f7e67b20ecbbc ("xfs: move the fork format fields
into struct xfs_ifork") preserved the bug.

When called for the attr fork, the cleanup is a complete no-op: it
checks the data fork's format and clears D-series flags that were never
set, while the A-series flags (XFS_ILOG_AEXT / XFS_ILOG_ABROOT) set by
xfs_bmap_add_extent_hole_real() are never stripped.  This is reachable
on the success path too, since error0 is a fall-through target: if the
attr fork starts in BTREE format and a three-way merge drops
if_nextents below the threshold, xfs_bmap_btree_to_extents() frees
if_broot but a stale XFS_ILOG_ABROOT remains in logflags.

In practice this does not crash or corrupt data -- the inode item
format and flush helpers dispatch on if_format and clear stale ABROOT
before if_broot is dereferenced.  But the code is logically inconsistent
and relies on downstream defensive checks; fix it now to avoid future
trouble if those checks are refactored.

Make the cleanup fork-aware, mirroring xfs_bmapi_finish(): use
xfs_ilog_fext/fbroot(whichfork) and check ifp->if_format.

Fixes: 7cf199ba5a70d ("xfs: make xfs_bmapi_remapi work with attribute forks")
Cc: stable@vger.kernel.org
Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
---
 fs/xfs/libxfs/xfs_bmap.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_bmap.c b/fs/xfs/libxfs/xfs_bmap.c
index dcd5faf3428e..9236aa80838e 100644
--- a/fs/xfs/libxfs/xfs_bmap.c
+++ b/fs/xfs/libxfs/xfs_bmap.c
@@ -4520,10 +4520,12 @@ xfs_bmapi_remap(
 	error = xfs_bmap_btree_to_extents(tp, ip, cur, &logflags, whichfork);
 
 error0:
-	if (ip->i_df.if_format != XFS_DINODE_FMT_EXTENTS)
-		logflags &= ~XFS_ILOG_DEXT;
-	else if (ip->i_df.if_format != XFS_DINODE_FMT_BTREE)
-		logflags &= ~XFS_ILOG_DBROOT;
+	if ((logflags & xfs_ilog_fext(whichfork)) &&
+	    ifp->if_format != XFS_DINODE_FMT_EXTENTS)
+		logflags &= ~xfs_ilog_fext(whichfork);
+	else if ((logflags & xfs_ilog_fbroot(whichfork)) &&
+		 ifp->if_format != XFS_DINODE_FMT_BTREE)
+		logflags &= ~xfs_ilog_fbroot(whichfork);
 
 	if (logflags)
 		xfs_trans_log_inode(tp, ip, logflags);
-- 
2.34.1

