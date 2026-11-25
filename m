Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618774;
	b=aRma6ZSp/yeIlRBi06ad+KLjEtgNgpk3oM6NR8c74vcGhDqigC81YNZ1r8a4wovsb7PH
	 edtz4D8VW58TehJEexgRbmS00PKvdX5fd6MTzg3E+OkV8RVO+YzQndSR/eo2S8BhGmxYm
	 SspCQttv0hiG98CITtsRnrYm4kNMhV6xerUBR/OW0mx9KiIkaPhx1kF1LQawgcl+qXY9w
	 teq4z/s+33hB5mtEVZR2/muynVXSzvavgAMsOOcda7vQYhMp8o5406uUw+++FleDZ6WFd
	 zHMc0+rPdABJufMfjY5nqu1F+5mEtziw4FbFw+KZyI7es4uWQIuDl7Y4D4UiRnmPl+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XC2QUBHmj2G1tj4pefmJXOx7ehHVSaXH3xnNoSU8UE8=;
	b=FFteG/Tjv4yzZSsina+ROl1NeP/+qejFn25GxIRTAljiIuN9bk8U1UGG5VBE3t+Rob5E
	 A8GNUZXbkQ0nJnL5qqtGDILokHfl2/Ie0xc5+Y7AGIdR+bPVN5Uq3YXbIMO0CJSR/Yjr9
	 PfQ6PEQ2+JGSn5SXF46CGvR9UvQTHU2BeOcL/phQqfItGyjKMprzwY1l5aQqstdDTf237
	 /RrnZKODRYqujRMfyudn0bpm4EnM6ozhUdmdGrBn+0+uiKD36XDbmNDxwPHZctpVyU+FH
	 F/jBayh1D2h1VzI/Y+5+8eE+GSbSkR3daWpqA3rBg/6hPylES01FbCDWVH2vcUewRkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymfY2YQ0;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE99606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBE99606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymfY2YQ0
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386cf1041cdso1563640eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618773; x=1796223573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XC2QUBHmj2G1tj4pefmJXOx7ehHVSaXH3xnNoSU8UE8=;
        b=ymfY2YQ0ET6DcvleQzZKnfr0gxRDGfIVDBeZPFbIAWAoWMrBeVVHqlLEnIwU4D91sh
         k57XlYyQq+gC2WgAQkqpIFjeQak+Eh2fLGvxnZt1SCaydy403xFJYKl7N0lKfZetvVeM
         XvtmBrAg80Dys3IlEQrn3FAwypF4VR7xMkQC5LpNHVpX8AKdXUhJtCgNJPDy+ls/jRye
         JYQ/YmyF27wnLaWdtsbMqT0PtbrvDtliUEoc0u/v2zuoICwWIYQe/kH+t2lC8WGoNQaM
         GP+sUu3MULj9JZ6OomdIuncvBk3t+7V95zYpdewfBmK0TFi4I6ghtICBbTGymoQjtj+x
         uxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618773; x=1796223573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XC2QUBHmj2G1tj4pefmJXOx7ehHVSaXH3xnNoSU8UE8=;
        b=aEtqntqet2cAYyImfppt9Vc1pwzhkV4e6GuKOcmU5gfZuzwSQsvpKIksqEbAY5EcEl
         Ms8jEXX1Ryo3mAG++DGrdMMUxf2pIP9NtIQgB1IzDod3E60n/24xGb+NqvuWRNYCXW6o
         KDsqc/sg+VsOJ0kncyWSDVxGMtXRBqd3eoGnPfGJSzRzVBcAjeNEVkh/rKU2r8ul/WfN
         rRsL4Uac81u110bqJd2R3WLI6C5FIIaLsyngXtIFSQO6I9XFqTcbh6HBJ72/Um1H4im3
         Uc5UYgq0OysVOnhx/E5IO9AO/vIyutG0H1zpUJ7YLz3h6tDTH62zgqOihQ3f6xFF5Ulk
         le1Q==
X-Forwarded-Encrypted: i=1; AL+hErFWzVf4fp8aH4gHOFFDMLqTd3P2YR+eSnHXVR5WV3QjnlUMQkY62fVy0bCl8OpT5kjBLOm1FVUqcxue6uM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ezpxt+ZdWNR/NFLfKPY85AbuvaEj8s2r5CteSbW3kUEk/C2Gr
	zipfnd4D9w7ewSB/k36nXKmJ4AUR7wYs0dZ85UPjSdINc/xDgukX/nSk
X-Gm-Gg: AZFdTZdmXS2uO/JtSNOUZDzS/ysHuvUpEQwvGYJxAIdMDtcS7RjUvdahk7iPTsw2tgD
	NriuYsGdvtP6Udo7VpmtItM5hLy8s4PaTYOAhcwbd5FF65CiSK2rdD8JktPDaYo+mnobHztp6iZ
	ZCO1vDHUv3ZvRCLUNRV4RWv5qRlKlZtCQTbWOpjvGt0g7PQfrZEaR5Se2s2QU/6MEG7Wtp3WpqJ
	91I46nXdvdzrVGOpHerQCBdCjC2H1SMc7ofumMdyed2cOONLIlspwTK5eFPc2Kfgksx3tprL1fr
	sFUbIGe/K4MdksbZmRjyIe67Q7Tmy+U1Xt1pqNLe4rFviDEt/+jovuDJtu32q8vO5Fe7ILHQ08P
	VclK+E9vodx7NAD8AurZSyiH+ZhogoU4FUMl2V84MN6NLalfyBcz1x+vFLMN/aByJ+yVvyL7xfA
	eqyl+JKw8GAr5CtNuTilkiAXREWhGChGndTR6l7qXgUhKYV7Tq4dJwxHWrt5u7dT+8EXA0zlJdZ
	sGVboL9UZOV02Qz87vZZRhl4Emv+ECZASe1L2Om+fWo/n5WeFAUrEAqiuQdCK+CsKGsN2bvSIMU
	iABxYZn/oTW+Wu9bv8rW3izhN9L1MpjyXOgaPtKJdq0+vdQL5/xeAFjbbm+wn0BVaKE=
X-Received: by 2002:a05:693c:8955:10b0:386:9cae:abef with SMTP id 5a478bee46e88-386bf39f8b9mr5885843eec.36.1795618772691;
        Wed, 25 Nov 2026 06:59:32 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm61060566eec.21.2026.11.25.06.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:59:31 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] xfs: reject a hole in a remote xattr value
Date: Wed, 25 Nov 2026 23:59:28 +0900
Message-ID: <179559978502.2875040.12926533524466805036@gmail.com>
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
v2:
- Read the start block into a local so that the checks fit in 80
  columns, and post the patch as its own thread (Christoph).
v1: https://lore.kernel.org/linux-xfs/179523678723.1642977.7101755246592074809@gmail.com/
Report: https://lore.kernel.org/linux-xfs/179505710272.3511680.12978324583605871086@gmail.com/

An image with crafted metadata and recomputed CRCs is outside the XFS
threat model, so this is a hardening fix for such an image, not a
security fix.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype. The patch was written with LLM
assistance; we reviewed and tested it. It applies to the xfs for-next
branch. With it, the reproducer from the report no longer triggers the
warning, and XFS reports the corruption instead.

 fs/xfs/libxfs/xfs_attr_remote.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remote.c
index e6c8dd1a997a..7cd3f2de1a80 100644
--- a/fs/xfs/libxfs/xfs_attr_remote.c
+++ b/fs/xfs/libxfs/xfs_attr_remote.c
@@ -424,12 +424,16 @@ xfs_attr_rmtval_get(
 		ASSERT(nmap >= 1);
 
 		for (i = 0; (i < nmap) && (valuelen > 0); i++) {
+			xfs_fsblock_t	fsbno = map[i].br_startblock;
 			xfs_daddr_t	dblkno;
 			int		dblkcnt;
 
-			ASSERT((map[i].br_startblock != DELAYSTARTBLOCK) &&
-			       (map[i].br_startblock != HOLESTARTBLOCK));
-			dblkno = XFS_FSB_TO_DADDR(mp, map[i].br_startblock);
+			if (XFS_IS_CORRUPT(mp, fsbno == DELAYSTARTBLOCK) ||
+			    XFS_IS_CORRUPT(mp, fsbno == HOLESTARTBLOCK)) {
+				xfs_bmap_mark_sick(args->dp, XFS_ATTR_FORK);
+				return -EFSCORRUPTED;
+			}
+			dblkno = XFS_FSB_TO_DADDR(mp, fsbno);
 			dblkcnt = XFS_FSB_TO_BB(mp, map[i].br_blockcount);
 			error = xfs_buf_read(mp->m_ddev_targp, dblkno, dblkcnt,
 					0, &bp, &xfs_attr3_rmt_buf_ops);
-- 
2.43.0

