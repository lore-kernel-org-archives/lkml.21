Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571310;
	b=aPg+0mdoe4PSlAJflk6GaGVQLynCvnJZqki8xOcFV2tO1aJiveqZcZoYJxhBGUUV6Uzw
	 NmgbMRnW6ePAK1/91Q7CItnIyKQcIgT6wOGO4llkjJQ4op8/6+pv8DdKxN2Nv20DLxmfr
	 IYE7wxgRCnj1/l5smseIBUMOja42T5R2a1hHI+rGrQBbPQAQhHKCsRNrT0kqaN3LqougE
	 ZRzuoW9TXhsJMQIZ2gnpUsX6IgOcCJf09gRLaw2x45sdCaALd40egRGg+U6RucNPzaKMR
	 f95AhYiqMdd8jSVKHmaF098thsurR3P8jcGDZwRQBItqMc6ORjJfeSP51LifWQarMWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571310;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=fUv+Qm1kSWS9V8tHH3RLO8BjRTgWID3AokEIqDg46EU=;
	b=nnlEanZMNG9s3eq/0b8xRi6+xLrfOnGNDqJ5iDy69lKXT4xE1O4Mtx00Y+at9A1FMiT+
	 yZjdVxc31tS0Wf1be4C/5D9R5hCfS/VXG9/UFmtcoW2mg52QWxyZiWT7+2wqIUx/zVQhQ
	 7kDLU2nb/vEKaIJ68Nzl2GvJKLTo8twZIeZJN23dt7XGnwgptpLS0bdl6FCSB69aET94k
	 3VdN1YEYdyKIK3ScUpXDSQk6+/bqMCOGOjcdp0p15eX3pcP1D6BInet5RojqFRWV6o5QY
	 M6gzerks4UP0HSDsiQ2ziPJR4WV8sc/5Cjl0xB3CClPk63aXV6WzSnYAKvg6IQZ0wOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=X1QNR6ZW;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b="LoGGv/BA";
	arc=none smtp.remote-ip=188.121.53.18
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FE1606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69FE1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=X1QNR6ZW;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=LoGGv/BA
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27KxX8NB; Wed, 25 Nov 2026 01:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571296;
	bh=fUv+Qm1kSWS9V8tHH3RLO8BjRTgWID3AokEIqDg46EU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X1QNR6ZW37PnqXkqFRY8mOUoctRv6M/30w+/Hn4kwEHpfh+nNWkhN9yKmOz2tlDu9
	 xGMsefUm3RbUIvNloMxEj8DmeuWa7Q5VN0DaZosLhMH5rCdOCmQbCypIRlrfQZNDci
	 tvvwHeawCiyWn5n69TrXKviQAABqpzCbw/cOHdQ5rmhl8y/72ORkHaB7ndz/L6dKZz
	 0i4XWEDUpmpL0/uJZrtkl+4iIMU2fMDh0zA02se20Q5XlKfGYmmr1/V5/S9wXqxAv2
	 EioyAYP9Ki7vZPAHY/1X/+KGDA71VQHGmmVUYYKM3SpTwrh1d0nDPx5fZxK9NxmdKr
	 RFkjhCHFQbRKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571296;
	bh=fUv+Qm1kSWS9V8tHH3RLO8BjRTgWID3AokEIqDg46EU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LoGGv/BAOfPzldFXkzLwqqBwRb1spaGsjmG2KKgEsCjYUYzIxJSrrmDzVtyvwn5I6
	 9ID+hP6KRohWC3lb5RUVY3kEQjJI18SchA7Tm+f0cqRKoqPQB2JTj+fbQn1GYEFL3w
	 LsrfMwTmByeAcKhfHrcXUpCHlsu/MjLoFYtvdnydPRkT5rUxOe18JsNlVeEUw9AIiB
	 oaq4+X1yr3sKpDBC5oCP+fM2VSwDHKn1rf+8rZJNgNeNMjFvV9Kws5uBdmahLtK6Jd
	 iRIymwoVyPzJobq1lYk5QgBnXGnyBHd42ay/AAIkeesh0V8NRbPJUwXQTnYKCV6H9e
	 lJZDmjkPL0B8A==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e5f
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=x5WS-StmgMfWCMWfo8gA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: da053f91defaf188fc6326730b4df35f:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 07/23] Squashfs: fix offset in squashfs_read_inode() TRACE statements
Date: Wed, 25 Nov 2026 01:47:21 +0000
Message-ID: <20261125014737.347231-8-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125014737.347231-1-phillip@squashfs.org.uk>
References: <20261125014737.347231-1-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfDZck1WXyoGnCCnZNaY8arvdOMaxBTp26SWbob35fl3dXT+5IiisWN3Kh4Moquqej/UgPhyJaB7Mi3PUsnjz6BovPDo1DtpgJNLeY/UkVKM1Ek73pryQ
 lVNsNj7zMpca7o5ftIo7VCyE6MmVnF5Sx/5NODEMpCP7GG1CnjbsmzT/U53IGK0o+A6ztMxs8dfzCV9fmFlcHpC2rxSfU9WJg3bvTIr1a7DLwG4ip93iKnGt
 sudr+Al9zO3dYnMeLZY7j3sGI5nvjo6Yh9vYp6c7IILAv6mvhCuVtm4HHBPSxbAW

The offset used in the TRACE statements has been advanced past the start
of the inode header by the squashfs_read_metadata() call.  This means
the offset printed is incorrect.

Fix this by using the original offset, which is obtained by calling
squashfs_inode_offset(ino).

Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/inode.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
index bc7c81d442f2..66858fabed1a 100644
--- a/fs/squashfs/inode.c
+++ b/fs/squashfs/inode.c
@@ -184,7 +184,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 
 		TRACE("File inode %x:%x, start_block %llx, block_list_start "
 			"%llx, offset %x\n", squashfs_inode_blk(ino),
-			offset, squashfs_i(inode)->start, block, offset);
+			squashfs_inode_offset(ino),
+			squashfs_i(inode)->start, block, offset);
 		break;
 	}
 	case SQUASHFS_LREG_TYPE: {
@@ -244,7 +245,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 
 		TRACE("File inode %x:%x, start_block %llx, block_list_start "
 			"%llx, offset %x\n", squashfs_inode_blk(ino),
-			offset, squashfs_i(inode)->start, block, offset);
+			squashfs_inode_offset(ino), squashfs_i(inode)->start,
+			block, offset);
 		break;
 	}
 	case SQUASHFS_DIR_TYPE: {
@@ -266,7 +268,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		squashfs_i(inode)->parent = le32_to_cpu(sqsh_ino->parent_inode);
 
 		TRACE("Directory inode %x:%x, start_block %llx, offset %x\n",
-				squashfs_inode_blk(ino), offset,
+				squashfs_inode_blk(ino),
+				squashfs_inode_offset(ino),
 				squashfs_i(inode)->start,
 				le16_to_cpu(sqsh_ino->offset));
 		break;
@@ -293,7 +296,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		squashfs_i(inode)->parent = le32_to_cpu(sqsh_ino->parent_inode);
 
 		TRACE("Long directory inode %x:%x, start_block %llx, offset "
-				"%x\n", squashfs_inode_blk(ino), offset,
+				"%x\n", squashfs_inode_blk(ino),
+				squashfs_inode_offset(ino),
 				squashfs_i(inode)->start,
 				le16_to_cpu(sqsh_ino->offset));
 		break;
@@ -337,8 +341,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		}
 
 		TRACE("Symbolic link inode %x:%x, start_block %llx, offset "
-				"%x\n", squashfs_inode_blk(ino), offset,
-				block, offset);
+				"%x\n", squashfs_inode_blk(ino),
+				squashfs_inode_offset(ino), block, offset);
 		break;
 	}
 	case SQUASHFS_BLKDEV_TYPE:
@@ -361,7 +365,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		squashfs_i(inode)->parent = 0;
 
 		TRACE("Device inode %x:%x, rdev %x\n",
-				squashfs_inode_blk(ino), offset, rdev);
+				squashfs_inode_blk(ino),
+				squashfs_inode_offset(ino), rdev);
 		break;
 	}
 	case SQUASHFS_LBLKDEV_TYPE:
@@ -386,7 +391,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		squashfs_i(inode)->parent = 0;
 
 		TRACE("Device inode %x:%x, rdev %x\n",
-				squashfs_inode_blk(ino), offset, rdev);
+				squashfs_inode_blk(ino),
+				squashfs_inode_offset(ino), rdev);
 		break;
 	}
 	case SQUASHFS_FIFO_TYPE:
-- 
2.47.3

