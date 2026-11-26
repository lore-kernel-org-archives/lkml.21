Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710710;
	b=p8BAV32Ho6oGLb/78HQ87pcT64JtAVI58hn5WZ3e762wsoWXUWKnkAPY2O9ajKy/e/wQ
	 JFre+8pQ8b4syH+gamIqvbRmXgKDQgo5sRiRSHmOUJSk5mmvTbhTTdTF0i5uH1PRt7TnZ
	 YhAKtEON72H0rNYF9oWGyNf6uX16Oux2mHPydTE4QSnM5YQxmbOs+DEVRlX5kP6iCzL2l
	 Pgnv+ycK7s5TM36OeTRR3q4d0ynuS4pErscLF5G7OHPW6EQwutjwnhTwgfJ4mlCEiiOwS
	 /zYlj6lrw7HUKIydA98eI5uCfU1RNqzb+c9ncsA512kLVD2awXNC17McweRtKWBpUaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6DGKGHZD1sWqO2WRSY4U0udOhpGKQXiV3WJqb4Fx1ZI=;
	b=RHXLC1HSscAmXXJvswVFpmEbt/B4odlIQRTyGV3AGOglFQ3Smp84p8JCRcUyqwnHpNje
	 biFBAx/P2t/X340Cme7QUzfwSeCr/W4b75wTsvzCnVey1yuV4hG8YXZCsdq9wHQGrHhqf
	 RI+8OTCJ0z7V5EC3zd1T3LZtnIqGpxL9gfUdyOYe55GFkzcg7hmGZf4nmQnkw3D/TQ4qp
	 UHkAsS4lY91BwbB1vVTz1jdpAJ+LYVT9joQPcHHknudRU5WUxUrchnwmmXEJQqFL3QQI4
	 gbwL6sdlLfEYs1mg6ZN2tzWf7CDv53OoS/y8nBu1/9hXYFseg0ytiOxhTQxXkpQUabw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NgzesBph;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E262606A6AA
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E262606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NgzesBph
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so58531575e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795710708; x=1796315508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DGKGHZD1sWqO2WRSY4U0udOhpGKQXiV3WJqb4Fx1ZI=;
        b=NgzesBpha5/UiuwtyApe4LBXa4J/ZEE9RKL51o52cHEQZvDJx1Io0LkMX9T4hggZMH
         yMa0nLXZDeXh3OTT5Dceu8BR+qdcmeSaC9RWK6GGdpgvq67OWwu0N8mw3xfC+ykgxBkA
         yEoRN9ICF95EXoJwq1ROoEh5ttxJozEqUgS4kFy2WgRT3O8gDHMMShxwnJZV/bfNq8gV
         94Ff+uDAmyBMb5RFFUJa2wayxciw/19DqrWBprAc5PQ2xTH4mJm64KnLuI4iptKk72YS
         FGHpM0M/l0unSVUyE9VXt42T1xN0phYdlNSwj0GuBcjfL5tAcfYo3HAercHmLDLsdKJ/
         INoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710708; x=1796315508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DGKGHZD1sWqO2WRSY4U0udOhpGKQXiV3WJqb4Fx1ZI=;
        b=T0LzLFXUkOvFrZu3ebTJHkOI8xr3ND7TMyoW4zyGi1o+8Fy5/i+yjm5vN4D99ZZY+s
         9LYlkwluNbZ3Djry3ooO/9Yh0M9w4PUohThUnxwiASoKHAWxLwv2ukE4aFp329P8rFUp
         H2fIV0DhYPNgHsvKr16Qe28mPI4le75+YGvP7hlT8E6ziXlsxxSnfEr0Dby/7cQztdNq
         gxVahVk0HK7kyKtqpw7OgzEODDNK6ghMPugpkOBEBjWMFqlTf5WJYgEvNOi1sXaArSVe
         re1DAYj3/PJCt7YlzMVSjNPWn5mP6rUeZuBUWs6ChKpxWeAfcbcblswUSESxIQutqOyx
         YXVg==
X-Forwarded-Encrypted: i=1; AL+hErFY2EY1OFd72Ur3LlEVAJiiswbeIkP+4csYgViH/LUfBBNu4kBZivQBCj//AgVvwq16hDfrSjMlAPuEaT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uP6W5i+WupiMYRi6e9nZNqpwgdh0VTg3XcpLjLDUBVdKotH9Y
	O4IaeN7rwTvrkvs3Ul+eqVrpZeocrUnQUmb4/Btya72J119lPxkXAuiy
X-Gm-Gg: AZFdTZcyvVug3/gwhJ3ed1uamhRBUdGOzjRRtLuGRsSmsqOlpDeWqb7J1lSiNzqbcmH
	TCts69lbFVyYEQByN4n5xQFXQHbyD1Fmd8eQbPcqWBUf3VbSGZb7OHn30tr2jGz96YsSoEXQhe3
	gh+YJw5OqmaMCJKqXdQ9S1sk4urNm5YQQ4Jt5ilTKjpD0bFtbdYaH97ZVimWcn3vP4pHch5Evy8
	1FueL7DrYvVBjYDPxPUd7b4iIpdt1+Vh5MlIuyrfOtvdBLjsdTzu3Rnz4/8pkS2B4iE64S8dZI7
	CJPkh1AV/s8R3L29lafiZ6rzIXP1xlCa5AqnfyzFQ0fJARPfyr0C+pJrvKQ56SDmZczwW/c1Dj7
	Vkw4xqQfJeQ0tGB+2n8UvHX5P96Fz4pX2XVzG7LIrsTdhxNaZu5rM50+JIA1rMBWpGATOmcHEw9
	wjyhEIzYXCZC2WSCa8REw55KuJNSmXkS0J8/TZugshNQlgi1OEjZTX49tyGFl4a5YFyVnXJaqld
	Yi3Rhq+1SDNGNI0iydecogME13/5rKTMRK8lhO0rJYKw3oXUw/eh+jg28Y33AUJ5DyB2Uwv/2kB
	aUsNsVfoiMwGUUFDOQT8VCZg
X-Received: by 2002:a05:600c:3b83:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb88822242mr502582645e9.28.1795710708243;
        Thu, 26 Nov 2026 08:31:48 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm721964995e9.11.2026.11.26.08.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:31:47 -0800 (PST)
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
Subject: [PATCH v2 2/4] fscrypt: update fscrypt_prepare_setflags() to use xflags
Date: Thu, 26 Nov 2026 17:31:12 +0100
Message-ID: <20261126163114.403846-3-koray.fra@gmail.com>
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

Update fscrypt_prepare_setflags() to use FS_XFLAG_* xflags instead of
legacy FS_*_FL flags.

Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/crypto/hooks.c       | 10 +++++-----
 fs/file_attr.c          |  2 +-
 include/linux/fscrypt.h |  6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 149498bdab94..52d6a33fc9e9 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -182,10 +182,10 @@ int __fscrypt_prepare_setattr(struct dentry *dentry, struct iattr *attr)
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
 
 /**
- * fscrypt_prepare_setflags() - prepare to change flags with FS_IOC_SETFLAGS
+ * fscrypt_prepare_setflags() - prepare to change xflags
  * @inode: the inode on which flags are being changed
- * @oldflags: the old flags
- * @flags: the new flags
+ * @oldxflags: the old xflags
+ * @xflags: the new xflags
  *
  * The caller should be holding i_rwsem for write.
  *
@@ -193,7 +193,7 @@ EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
  *	   another error occurs.
  */
 int fscrypt_prepare_setflags(struct inode *inode,
-			     unsigned int oldflags, unsigned int flags)
+			     unsigned int oldxflags, unsigned int xflags)
 {
 	struct fscrypt_inode_info *ci;
 	struct fscrypt_master_key *mk;
@@ -204,7 +204,7 @@ int fscrypt_prepare_setflags(struct inode *inode,
 	 * derive the secret key needed for the dirhash.  This is only possible
 	 * if the directory uses a v2 encryption policy.
 	 */
-	if (IS_ENCRYPTED(inode) && (flags & ~oldflags & FS_CASEFOLD_FL)) {
+	if (IS_ENCRYPTED(inode) && (xflags & ~oldxflags & FS_XFLAG_CASEFOLD)) {
 		err = fscrypt_require_key(inode);
 		if (err)
 			return err;
diff --git a/fs/file_attr.c b/fs/file_attr.c
index 40d6518f1d8e..1687891c526c 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -195,7 +195,7 @@ static int fileattr_set_prepare(struct inode *inode,
 	    !capable(CAP_LINUX_IMMUTABLE))
 		return -EPERM;
 
-	err = fscrypt_prepare_setflags(inode, old_ma->flags, fa->flags);
+	err = fscrypt_prepare_setflags(inode, old_ma->fsx_xflags, fa->fsx_xflags);
 	if (err)
 		return err;
 
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 28f2108e29f3..68d0983385d0 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -461,7 +461,7 @@ int fscrypt_prepare_lookup_partial(struct inode *dir, struct dentry *dentry);
 int __fscrypt_prepare_readdir(struct inode *dir);
 int __fscrypt_prepare_setattr(struct dentry *dentry, struct iattr *attr);
 int fscrypt_prepare_setflags(struct inode *inode,
-			     unsigned int oldflags, unsigned int flags);
+			     unsigned int oldxflags, unsigned int xflags);
 int fscrypt_prepare_symlink(struct inode *dir, const char *target,
 			    unsigned int len, unsigned int max_len,
 			    struct fscrypt_str *disk_link);
@@ -784,8 +784,8 @@ static inline int __fscrypt_prepare_setattr(struct dentry *dentry,
 }
 
 static inline int fscrypt_prepare_setflags(struct inode *inode,
-					   unsigned int oldflags,
-					   unsigned int flags)
+					   unsigned int oldxflags,
+					   unsigned int xflags)
 {
 	return 0;
 }
-- 
2.56.0

