Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795306156;
	b=XMeiEyDP/gvbZQDghFqCh4iL7E6mU08By6yLUQrHVF1b+Lgyd6GL9leaLbenM1sWvbK8
	 fV8ZvbE06a/R9PaICFNvLDuJEktuCCAeYg6Z5PXqe9fUXIbpHhwfVLcFWFSunSmWxS+So
	 F9UMk5uWyj47UM0hzWTRDV2mTR6b1EQupWZg8HmgF0jdp21N8YO1i1Oe+1i6wsQyBGqdv
	 RJ61a7qxiaqvWt0AifD+84NHxw7zxH0CC4np1ZnykUxMPx9FDw9AVvU9wPF9dIis7gZEe
	 B5CrH6yMsRIj/Yu51ND6gvnQfmCwZm2rQjW+hV7BqNxDDuTjdRy7C9NsBCg8cFgrosA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795306156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I3/a3+7dsQvjvECUWVZ/SwOHlfbc32z4n2+Zae+M7DI=;
	b=kUjBu78XFHGGNs65yqxmEcNW38Ed0fJGsE5El1bIkUKexH2cdLYBxLKxDInaR1fl8qGB
	 e+R6PkyIu0DXibNocwx4TF5h7UDc8LwQlUg0PUyiZPVQ8iIpeH5Fhn8pAzslrkeNvFios
	 C6g3ROf6szPEeTH1OkBvb+IvJkYpg6nDUH2TcMTQ+ATrUM8bOnAtzC8VKDrW8Y5LewDDb
	 egwkvLHhtpGFuscURyjjGlxyjTy2Keu4SgVJe5b1lnxkceoefEtZEuNMlDO4XDoLzDz27
	 WcZ7bc54pLnE6jBq8W4Y6/sQvL5Dxnb/GT79Jhh30kNSoOSuLoyfIM+l1Gj8AiB2rWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pxx4MEVM;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66780606A693
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66780606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pxx4MEVM
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so1360613f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795306155; x=1795910955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I3/a3+7dsQvjvECUWVZ/SwOHlfbc32z4n2+Zae+M7DI=;
        b=pxx4MEVM3F9ewoA+cmrYZ5iJ7GG66cT5YEMw/9bSw+32AQdbNaeyaZM+3JoC/dwApz
         UTXTyt2hP1yxywMm4hNVJePOeGz0MGnOqeDT59BoZmGM0iHtv3qvQDqcKJ75ZctYftXA
         kPEmslanb0UMiXCiyaAj65FLQcg9cH55lzNF2rhCJTB0VVD4RlJR8bfx34szlVVEKDaC
         /SQf4GCr0GacL1gTvq3QehD9mb/pXaJT0DU0oIq9fiin+wEYVcS/rJt2xmbLSEz1RYGY
         zZWz6FecCb/clp9mCPrinCaau+nYvOhVOjDICs76X+KNwZWPsk1GaY5WrM54lZtPqKFa
         teuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795306155; x=1795910955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I3/a3+7dsQvjvECUWVZ/SwOHlfbc32z4n2+Zae+M7DI=;
        b=RDBEBcz+e7ZUJ0WlXTTKLGQRNeGU098NAAESRDxBT7/FLi5N5upqQXnWo/yvyPaTew
         3ioGUAKjvOFU1tyyF3WxFANjxid36c0hgfybX9xOXezdWkC1lHV8qxxnFHYNOyoakzsP
         7ut/sn2uHw9UFsxX06AMHpwf1RpbPl8HMMKFnlHNLKWKrgi11E51ttGNEITEhtt2N0kn
         AODtR0rhUR3F/iPsWZDrv6lg7d+rZyvdQFc8j8lrFjZhuzDwbyuSJFlw4X2OMuSmjq7g
         /aLz+BwWB6QUUYKXF9NBMdxQOzVi+eQHYUeyZ6FsFhcyibxut36lv1vacyWPTD9nW41U
         1cig==
X-Forwarded-Encrypted: i=1; AL+hErFhQWtLUDb+SozcHwx4/jsPw97bjNWzchnBbMBFyNoXuHre/WPdBeoZF+FL4oFhGvUeCWHVMd8o+7E3w/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IdAhMtkNpuTIFpqO8oKFZMgccgRsPf45z7dRpAnz9GKV2dmVF
	ey7NRGIWXac3UBV2quQq0e4vGuYxjcmpOHt0ClumiNY/oTNRHxHqVYXD
X-Gm-Gg: AZFdTZcHjyWVxQY4bEtCKjW+29ij9zM5zfU/Cblf7qTBm3SgECSjglLjl/nw3Blb/Ze
	cwttbrpy01u65gJwrBuEoGIwFJJ+FyPzvq6WLUJHRwh6Ep7wyK4g/ap2pNLsBVVwR/pZ/Z8MJl0
	hrYUZ3cQzzuxA0dKLqqN5cP088/XoqtC41TVXMXZxqRdaM+8soxLUIJWMDZtBtBkOAM+U/DzV7B
	dp5QAPh/unNr3nfpmM5xEG87nX/UtI/v1+Gn7f9dnzzl6uvuzVmXeCM+2/9qtaBpGcsCyUoI0+t
	JufQAH/Fak59PBwbbR8eNmp8mRS4wIQokm9rL0FOC70UURTUUNZ1oW6HJQbysTzF3awjXHhEhIn
	pHKejQHG3tLb8U0fp3KdZYmgmtPQyANxYfMKh2DUZXmbK3pOYGg6LqoI0nxe4QntncNJRa2YwBD
	+OpYyKg33Hrqmii6Ia2R1/yy/fe5rlYdvexKynLJSENsDGNK/0cd+BGQ673QM+xl8wrXXRdrxI2
	zyaQWoYZZNaa+Fb2VT8Hlv0KoKDKZOIIuYTPPZ6fTVXALQsf7mIETxn3COmeTlK6/rzNMVs1bEL
	8XIlWS0bJ1G+dyJScMPPnS1EQGJFrNB36LLy+QyKxHYsAw==
X-Received: by 2002:a5d:5f4c:0:b0:48e:5d33:da5c with SMTP id ffacd0b85a97d-4abad5aca65mr14743143f8f.1.1795306154599;
        Sat, 21 Nov 2026 16:09:14 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm13461872f8f.0.2026.11.21.16.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:09:13 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lauri Gates <lauri.gates@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Dave Chinner <dgc@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev,
	linux-nfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH 1/3] vfs: use goto out on error in vfs_fileattr_set()
Date: Sun, 22 Nov 2026 01:08:54 +0100
Message-ID: <20261122000856.536902-2-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261122000856.536902-1-koray.fra@gmail.com>
References: <20261122000856.536902-1-koray.fra@gmail.com>
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

Switch from using if (!err) { ... } to the cleaner if (err) goto out;
in the main body of vfs_fileattr_set().

Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/file_attr.c | 45 +++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 833e03810b24..40d6518f1d8e 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -285,30 +285,31 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 
 	inode_lock(inode);
 	err = vfs_fileattr_get(dentry, &old_ma);
-	if (!err) {
-		/* initialize missing bits from old_ma */
-		if (fa->flags_valid) {
-			fa->fsx_xflags |= old_ma.fsx_xflags & ~FS_XFLAG_COMMON;
-			fa->fsx_extsize = old_ma.fsx_extsize;
-			fa->fsx_nextents = old_ma.fsx_nextents;
-			fa->fsx_projid = old_ma.fsx_projid;
-			fa->fsx_cowextsize = old_ma.fsx_cowextsize;
-		} else {
-			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
-		}
-
-		err = fileattr_set_prepare(inode, &old_ma, fa);
-		if (err)
-			goto out;
-		err = security_inode_file_setattr(dentry, fa);
-		if (err)
-			goto out;
-		err = inode->i_op->fileattr_set(idmap, dentry, fa);
-		if (err)
-			goto out;
-		fsnotify_xattr(dentry);
+	if (err)
+		goto out;
+
+	/* initialize missing bits from old_ma */
+	if (fa->flags_valid) {
+		fa->fsx_xflags |= old_ma.fsx_xflags & ~FS_XFLAG_COMMON;
+		fa->fsx_extsize = old_ma.fsx_extsize;
+		fa->fsx_nextents = old_ma.fsx_nextents;
+		fa->fsx_projid = old_ma.fsx_projid;
+		fa->fsx_cowextsize = old_ma.fsx_cowextsize;
+	} else {
+		fa->flags |= old_ma.flags & ~FS_COMMON_FL;
 	}
 
+	err = fileattr_set_prepare(inode, &old_ma, fa);
+	if (err)
+		goto out;
+	err = security_inode_file_setattr(dentry, fa);
+	if (err)
+		goto out;
+	err = inode->i_op->fileattr_set(idmap, dentry, fa);
+	if (err)
+		goto out;
+	fsnotify_xattr(dentry);
+
 out:
 	inode_unlock(inode);
 	return err;
-- 
2.56.0

