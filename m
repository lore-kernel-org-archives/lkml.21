Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710709;
	b=wc/U4DS8TJyVJt7EmQ7sygKvUVgEg/7/QzlzGd8WMd1GGPTw8HRPvpucUHzXIMr5TkIW
	 ChhhWLfotl2cneFemVgUL2/oWSqKCxOQvySeyKJ+3TZGmMQv6dZ8Iz/tm/enD3SV1JWlR
	 cA4XgqoxC623kxCRQAMoZn22oaDa87GG+dAj0FUI1R7srrHmleQqKagX8WuLp0/vNXyPB
	 JQtaP7FM+LZJ36AExzDsoS7+qL106hSH6ieDgc5NhW+53hjk9eRH3tGHKuGgNUWbJAkTD
	 jqGelG2venUVjMZwVOoS+1Fl+NFQCq8GkuTJJ+T8r8PKBdW4d0EQE9LpmL3PgfgmMig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mfpEhfbyhPi8fEOS+N1QHzNJFz4cU/NZgKWTwuKYJ+M=;
	b=zdoJxPYgFmAztdwCm4NtTsHkIqgDOeu9YiX2Cm5m59lD3IXdxmtHdzdGD/LjKuz+8z2r
	 KYJTU1DMi5n2vRs0nbH4mXzE82c8PmC+A+AuUL6TV9CRnLUxkDrr8PRDxlegBUDDLYAZ2
	 9dPdEM+lF8z+Y/OVg+J2f8zLG7jkeZaCzulzmlzVxaE6iihAq5+VY0C94/lWei3zZ3Hla
	 3ogWEHPve8tM6ZfDnnV0zt2eDS20xloyQMr2RssalkvfyKZPFJPGCd+dMALfGhaJK9Cm2
	 LdeqNTYGkJsl9vbFWWaDt0cvHPDKsFSVLhKIfmmTwst4AfL2sQ4cvjlWggkOLMDsTMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc+MkwdP;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3845C606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3845C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc+MkwdP
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso56545525e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795710707; x=1796315507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfpEhfbyhPi8fEOS+N1QHzNJFz4cU/NZgKWTwuKYJ+M=;
        b=xc+MkwdP2qSHhRJs8tqp0gJVAbhLaJGgxK7Lgcrjfgi+poNIcrpekreyQIw8Wa2ubw
         JTYEYjzBQHqXA+RCGlkMim5rWjlpg2Rc8MJ45f9iuFGrYnTeolSe9vBS2bLSeX5T5fZf
         SZX2nx4eSzWBYUFb1yi9O/TFdM/MA3MAnAw6/ApHrCpLQQihkBD0TTWOQKPnQ28uZTYE
         XpRkIhDzQqfntphSLOtItZuJswRxPc5PSDPlBmuNOaDHAcf8EMQ3hdeMUxJAM4CSuDyL
         mqwH8JHptswvYdfZEoqv6ChJC6m67PYPkI1mpROJ+wyATfnVNkfzJA1ri8ZRyz6/FKyk
         ZCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710707; x=1796315507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mfpEhfbyhPi8fEOS+N1QHzNJFz4cU/NZgKWTwuKYJ+M=;
        b=qMXNoi+v5kOmGBz1uev3U5BFSSa7AYHc3kI/klOCHzjnnRdbq9XFeIfm0agBz6uMdq
         1zUcByz//Cc10yi7rV8RJ3e8fqY0dpeNzkeEFe+cWlbH3sbU/0TLFqjEPj5nRp1GLt8W
         /QcM62lJTnXji824BTg9LsvJkWy5Avq3JW/hEkJFKS/1sxsYz7XrDgzKWSCIZ7OLdXEQ
         Cetvd3E9A51WedpgtvXWBpvqMmWDuXSR9ODMuPeRnr/sDzX0LkAX4ZCHd9QN8PSAT8HK
         8fOZl6JvnoessP6BIhskfFVxMcGNO04wU5TsWh7yGZ2/lJE9jO6tiwgsTpaW/ZFIp7Fa
         Qz9A==
X-Forwarded-Encrypted: i=1; AL+hErEBxFuOZGH+D92/atfJVGzzMRyfA8Haz04x/g5uvmpK1AZKSyyRV+1hPRh2Yux+oe+Oo+C8KNXFw2dREKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z++MTMfh7Lbyyd2jZty1cFkm04+HjQDszXuWOABYfV39GZFMJ/d
	fbifMK/vBO4B0nCaWjpnYs7QubL9STLEcvhhuiXch6dsoSWe0DKG3rlZ
X-Gm-Gg: AZFdTZdd9j52vzLva7B7in9vkGXyUMlphO+Ebqx6fAKlsAH31QKOvFSmbKp8Ba+Q7zW
	SodznDUVelWmnW/TH8mlGb8yl0dBRMTLUSVcwi6b3RXDiJdQ1V7T4ogp0qsffDvrDlt12umao3y
	MRDW2TAw56F3ZJ3wzYH+Iz3wNP5/Jx3M5NUn7VV0xjjn5+0Ah9rF9sRpCGY4L1t0AQJpmt4AITi
	bnw/EPgwFuVJYoq5aHWFIniozhQJvhl4Ni2uaAioYfAGZUTnsTue0TtIIL+osyfFMIsEoYQiEli
	ppNjU2+SKKIdm3haRTmMPuRAKtOqRx4JWVwybfI8t61BHrQgbqSuz6MCp/iNipc10svzZzRMZsz
	AC3PiG2mhO2zFzA6ztm3fL+B8WKfsvwAI/l1DWaKbbv3M5lPARPLVccg2NPFjW61EZ1X9T8ILVW
	Wxpiw1FEJkQH5AMXa12kN+Dbyq3hi1b04mrMdwctLAYXFqzxGq8WXa8AQOCxLOfpb5a9c4yhK30
	rwNqew0hPW1aC5NRmBZgyeByRZL6krwY8zTc+NwnVMnFtydJY/Y2LiKBLcFMRFDdegyROd+nadB
	NdxP0q8p63MtPhYuIztJIYn7
X-Received: by 2002:a05:600c:4e0c:b0:4bb:875b:f23f with SMTP id 5b1f17b1804b1-4bb88827f0bmr416764955e9.33.1795710706373;
        Thu, 26 Nov 2026 08:31:46 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm721964995e9.11.2026.11.26.08.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:31:45 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Aring <alex.aring@gmail.com>,
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
Subject: [PATCH v2 1/4] vfs: use goto out on error in vfs_fileattr_set()
Date: Thu, 26 Nov 2026 17:31:11 +0100
Message-ID: <20261126163114.403846-2-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126163114.403846-1-koray.fra@gmail.com>
References: <20261126163114.403846-1-koray.fra@gmail.com>
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
Reviewed-by: Andrey Albershteyn <aalbersh@kernel.org>
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

