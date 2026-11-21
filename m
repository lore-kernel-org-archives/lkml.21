Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285585;
	b=JOKBPDDcPBB8pXKVbHLIqlR5AQX0qdO9wiCOeE1GDPQq7PoaPYWw3mgxdYpZjoMDBEBW
	 ltvKL0GX2y9jJrClmnlcyE+VXz0Ngm9Kk85tPshutvdivPZhjhXLckmKiXHfuUjlPebfz
	 kFgqvmk2lKcScQUzhsRi4zNl6aXH/FO+XTXG1yEMpQlnL8a5fGO32qPUu6STt64UDB4SI
	 sWfEiiTbY9nMCoFxLzG3VUuyEVzsL73hqN35a9tJtZbxvRmqGCZVWZyxls0c7KgBXRyai
	 7mdNaw3/xmxsFfqegZc8PtyGy1YHVxzFIejM/6nvJbxWyZKCXzdgTpmDQI348M9lCFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yAYWGM+wOxQBk0PpmM5hBcytMWSDnG3ENBg6Zhdqtzg=;
	b=uMFPbjj91f98RZIqdTdW1xvFGpT3prGvo8QOC5yxGmzjyImVUGpnMePahp/GZfdSm+KU
	 RHPR9y69NiEH26rb2d524tRfyUA58cmwkcSFrkhWAJ4G3fyaxoePOXtd2cPHReuTA8IB2
	 zfgWkorJraUamRWkzd4FQx2lOLgQFeZYD+RBMu5bWmR/GRQissAaawrdIBq64peaVlDFu
	 jbF4HOPq530wrRSIAqa5luVaqEIIVkRbGcWhR5kcRnl7XbGey4ulGoNlCkesnww7uF+SE
	 PV6/otXNEx9veJWPBR0fd9xoOxqndbsyvY2FnwkE+UJ75QCOsVzkbGeKQD96zvsZ2HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKFalGLT;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2337606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2337606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKFalGLT
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-384d0550c71so1202553eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285584; x=1795890384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yAYWGM+wOxQBk0PpmM5hBcytMWSDnG3ENBg6Zhdqtzg=;
        b=ZKFalGLT+aaXpivK/3Ypqu5a9Dkkhf0E1d8u50CSUyKOUx1qXxWWgYIjq5HL0qdJ3d
         GszeRiIDfnLIuMzozueKOunkt3An+6RfLHfeJBnm4RsTur6dZjyT/WtcJYttI/tG9qTL
         dBU1FMdSG6pOnscPKzCn3U6oI8nbAzb3EUHO2lnS+TJiyneWm//WuXqr3xFcPUGh2Id1
         iacbneDDYY9d4znevKwusXbesbV5pK1s7Y/H0appouJ6HRBTq0X3j48Pg+tv+DGwR4An
         SA387ljnRYGDGn4+ZcJupx4Yw18m4gGrQ3YVna5wda2zQTPeYCr607/VjQJaoYWvQbbU
         PWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285584; x=1795890384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yAYWGM+wOxQBk0PpmM5hBcytMWSDnG3ENBg6Zhdqtzg=;
        b=pyHPGewzL/T3M0tad7GdSJpxjqrQr27pUB153j5O9RaSZEwKAGAJqhyLIrkdbrmVzD
         nElnbKCnNtHcuKLFUwLkLYjqQ1p0VV6u6SpKjV5pK2QgsoJliEZmedT6QPQU7nPoGWZg
         uS3PEKx+NYJHC0ifvczlFVDUhmWlPrB9GcpLqT7/2B4kp4763wWL/XJQUM07KDPap4uN
         QPHVoQX3vg0GU1pkZ7tySPLx/vYZpAwlIh4VaNo34dewlKv5MgLlRPtgzUfnIQ9kY/ie
         N8O2hH8RVdj0EQ0jEBm1JqQUinSk6bmZrSz5NzkdqhhU7R+qJKOwRvQWNobFn+KZM9XK
         onnQ==
X-Forwarded-Encrypted: i=1; AL+hErG2T64r8eU4mjdTgrhRbqFc5TykpjjePe0wjHMDtYUBcuOE3qyV8tc1bMc/lrWNGrLiV2QkUHiaJxCHD7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZMpjuhRQml2hfQWeguo2gaH3DH/M5oQzX8AJL6VuDxkdxi3n0
	W1gYXFJu65oFELt8Z7ZzvLWXeJy3s5un/0oy1UNySG/JQ0mhBGNJRcGe
X-Gm-Gg: AZFdTZfrWakBuDFrSu6ROyhEAR3UyxLc7vcqkuXC+k/7BLwT726PHYJwNhci6UygMMA
	cDiULTMpJ+M/w1drTcJh2XLIBYqldIsS9+lzI1Sr3wCZAmIv6dnZHQDCLK3E7QO0jrjondq2VBz
	vxlpgdkA0I8rNLi/NCimoeu/eEOxS1OeOhqdZ/o6hKMOnSknwDJrisOI+lqtEb4yeqxxXluOHkl
	kVZdOiUuKHyBUrdW0A3+7gClyA1VFgV5MgLz9kmwfN48vLkpBP/ia3al8BtHH2UGN+RhBmN3S5V
	9uegYBS0Qg6YH2fgpzgKjyF2cJ/AtkA26xfeoW+zCq8gaZ6ZxYkPRc4S+Ma1SNEMvc32xKYsbdN
	+Cd0Q7MtavRSAne1sHP1S6+Cme8iFcIiK0Q1MXAqedBJwhguirXhgKtATJqdVdomj4aoHwQ1xCk
	migf2OFmltIl/Z6nyv1mlOzUrS0GFQTiopsCXDSOLSeNnHeGqVMUAhvy9qX/c80zl03obyk/R0o
	ntSaOH2qcGaLcsr6c4S6nfyLHCUwMiHjtpOUBydd7LhOQHboLBxOLVSnVw44p279k6CxBKS3kfl
	vN/0lr6RvwNlKxJHc51u5BEHycg920PRou94JM5eV6KOHOIJNArO2wKTuH1N0PbMnC843e2O1nX
	pp1xj0ftyvL3iJmdOJJTJxpHSSPdi4AbFtYv5CQ==
X-Received: by 2002:a05:7301:dd94:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3856f559cfemr6470210eec.30.1795285583855;
        Sat, 21 Nov 2026 10:26:23 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm25583535eec.4.2026.11.21.10.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:26:23 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linkinjeon@kernel.org
Cc: senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	hyc.lee@gmail.com,
	lsahlber@redhat.com,
	icb@fastmail.org,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2] ksmbd: refuse to open an append-only file for writing without O_APPEND
Date: Sat, 21 Nov 2026 18:23:13 +0000
Message-ID: <20261121182313.43201-1-dennylin0707@gmail.com>
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

smb2_open() opens the file with dentry_open(), which does not go through
may_open(). inode_permission() refuses write access to an immutable
inode, but nothing looks at S_APPEND. A client that has write permission
on an append-only file can open it for writing and overwrite the data
that is already there, which open(2) on the server and nfsd do not
allow.

Refuse the open like may_open() does, when the file is opened for
writing without O_APPEND or the create disposition asks to overwrite
it. smb2_create_open_flags() also selects O_WRONLY or O_RDWR for
FILE_WRITE_EA and FILE_WRITE_ATTRIBUTES, so these opens are refused
too.

An open with MAXIMUM_ALLOWED is granted the write rights that the
permission bits or the stored DACL allow and would be refused as well.
Leave the write rights that the client did not ask for explicitly out
of the access granted to such an open, so that it gets a handle for
reading. The maximal access returned in the MxAc create context is not
changed.

Directories are left alone: an append-only directory still takes new
entries.

Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Refuse every open for writing without O_APPEND, not only the ones
  that ask for FILE_WRITE_DATA or FILE_APPEND_DATA. A handle opened for
  FILE_WRITE_ATTRIBUTES could still reach kernel_write() through
  FSCTL_SET_SPARSE.
- Refuse an overwrite disposition up front. The truncating ones used to
  fail in vfs_truncate() after the oplocks were broken, with
  STATUS_SHARING_VIOLATION.
- Drop the write rights of a MAXIMUM_ALLOWED open in smb2_open()
  instead of ksmbd_vfs_query_maximal_access(), so that a file with a
  stored DACL is covered too and the MxAc reply stays as it is.
- Keep the rights the client asked for next to MAXIMUM_ALLOWED. A POSIX
  open for MAXIMUM_ALLOWED | FILE_APPEND_DATA can append again, as
  reported by Ian Bridges.

v1: https://lore.kernel.org/linux-cifs/20261120071553.28739-1-dennylin0707@gmail.com/

 fs/smb/server/smb2pdu.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 6bd63c5e7da3..bcd25c197ffa 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -5028,6 +5028,14 @@ int smb2_open(struct ksmbd_work *work)
 		maximal_access = daccess;
 	}
 
+	if (req->DesiredAccess & FILE_MAXIMAL_ACCESS_LE && file_present &&
+	    IS_APPEND(d_inode(path.dentry)) &&
+	    !S_ISDIR(d_inode(path.dentry)->i_mode)) {
+		__le32 asked = smb_map_generic_desired_access(req->DesiredAccess);
+
+		daccess &= ~(FILE_WRITE_DESIRE_ACCESS_LE & ~asked);
+	}
+
 	/* MAXIMUM_ALLOWED may not have granted the requested DELETE */
 	if (req->CreateOptions & FILE_DELETE_ON_CLOSE_LE &&
 	    !(daccess & FILE_DELETE_LE)) {
@@ -5122,6 +5130,19 @@ int smb2_open(struct ksmbd_work *work)
 		goto err_out;
 	}
 
+	if (IS_APPEND(d_inode(path.dentry)) &&
+	    !S_ISDIR(d_inode(path.dentry)->i_mode)) {
+		if ((open_flags & O_ACCMODE) != O_RDONLY &&
+		    !(open_flags & O_APPEND)) {
+			rc = -EACCES;
+			goto err_out;
+		}
+		if (open_flags & O_TRUNC) {
+			rc = -EACCES;
+			goto err_out;
+		}
+	}
+
 	rc = 0;
 	filp = dentry_open(&path, open_flags, current_cred());
 	if (IS_ERR(filp)) {
-- 
2.43.0

