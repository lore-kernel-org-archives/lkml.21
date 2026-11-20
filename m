Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795133746;
	b=kzhs9hP5doZdoYBOwDvlUDmAZ4lvf2IvptkItKRxlGpEcBU7F+mLovAj8t8O0QtZ9SQF
	 WPS1E4M4i/3ozEao0IS2Xy15Xn+mvmYXtJE4O21X2z0R+sZlHWjmkq7ciSJojeeJjCoVR
	 HxQ2tIFSUv6PZ+Cv0uToH1y35EnFYK1Odk+unnmb6NJ745rCfQqDJoZxXJD9M38vOYaHL
	 93ey3ITVwlMV4MUBiqBYBC+G0QO29doc2cMqdgeixEsMjmQPd23AZxvvi4O3+W3KnDHSY
	 kpExLAXec2MF04DhjpwLpyHnq2V2JEWTceVvR6M8rMjA0ufXYwgzxhE4rTP5WTMvGzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=5NnsEKZh5J9oPualMt3cBXpMiMJ9/gtv35OevmgsCbc=;
	b=Mej8aySgpIpY56BLQ6Uh3EDQIsGKQYuMYlGwaPlirFij5nbRUUTtK2AVuI+q1OxPi8o8
	 GIvBrRmsDeqLDeokrkQFcXDIQ6e++iDWttI2WGvxftvsgcvvIF/beDpOviE/kl9DA5Ezt
	 Z27miM3IzjmZbUcWy6x1DYvJyLfrf1GY9e7uTir/qC+0sNBl2T1nnnNkwiae8OHRCRdgg
	 5ZpHZ5/KmEeolMTy4UFjnMAc2F58chwJ0Eaf2G1pCTLd9Eu9BjpapWtxfSNVcEEMBKrXz
	 hQtNLkDiS0rvNLvuzjPesdbumecRhuJL3EbJLrEJJkHExJ5yah7FkHf6dscf5Br3wdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kj4hjFfK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B406B606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B406B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kj4hjFfK
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67db1f6f50eso516572d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:15:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795133745; cv=none;
        d=google.com; s=arc-20260327;
        b=bFjz3GWQ7qvP0Tj3VyNhtwiS0jw9HW/1UzhLLgSD4rW9FXVhcbknFkN2d4i1R27NvH
         jNQv40tosd0Qol/yJ/I11+jYYVdEDu9oco/7ZbJgNdnwp/D828OH2xilal2++mBKsvAl
         8t/CVAkRxG2uI44Ius+iPQkx7TdJGm7cPT58R7r+1ju9wceSv5eYTe1JIyS7u8MGRlst
         7OncakYDns3hgKt1A3v9ORjJtm+XD8UgjgCbZlbZve+rpnZqrZYj5vCeZcZs4ArrtJ7g
         jk49AWagePKxivDQzgf4Z/hCrUg4y2kLhAR3w3EsIyEYVlJiYOD7ARTkB/6SavQw53HD
         oT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5NnsEKZh5J9oPualMt3cBXpMiMJ9/gtv35OevmgsCbc=;
        fh=JNYY6w0wYbmbylqGbrTvBNyDQQpaeOKqjDp0Bkp0yCw=;
        b=kguFmcJiDIqA2s5CTWu0duLWyi2dEPJAo+R+3qVu5k2x678wCqzHZFeymRQYcCV2VK
         o6hOas2YjAw/SMlVjGnt4HHkOVbrPUnxYNmK0ltFhSn1HwjUpF17gMgBVrOLFH0QWiki
         D5BgYXbNt4J2xfKVOvcvxuGn6izrtySjde5GDSwMgBUx6HfIURjRedJSqOzbM/4Lq1Vq
         riBU3RZanivKOdNn+RFHa6TDRBZ6q3IkXulJsF9yQio9n0Htd1KDLNu/yUEnFhPIVhDX
         6lqVZsofJc3N8ui+6CjEERpNXD+uVkykpb8IpKJBxcETekvZ3DilCX2tyanzzSXiqfPJ
         E4hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795133745; x=1795738545; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5NnsEKZh5J9oPualMt3cBXpMiMJ9/gtv35OevmgsCbc=;
        b=Kj4hjFfKWtlyfd2L9n/nVjS09V6tE+JlVHNf1LZAfxSooMx1RJKu9XyfPhsb0ct0mK
         KexmT/on5zUlnb+1jSg6N5hno7uKegtQ5OvMmVjRBciQccq5KFAZz/SOaaA/8Y2wa2KA
         tgN4u1BNA7dUKdsUzmISXR99zSDSBA4gzZIrMkjrWb2XWbuuK6K5ZqtVFazMk/LwiYIp
         dnnB2GYQBJqbAvlbfjZDzDvYu+EuNvRtyjsCu0Z+axBpjEeC+bog2FoGh245JAX+S2Mi
         2Hn3YsHAesmk4Mg89ru2j5jGlcGF/qCSSXEN+z+Nab9GK9HWx09pNSEYonLVJiMFMlQi
         I3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795133745; x=1795738545;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5NnsEKZh5J9oPualMt3cBXpMiMJ9/gtv35OevmgsCbc=;
        b=pq2rk4WHM5eNjfZt0htrsEabP+AUmEpmijXc4KnKvik+63ewMHLZ9IKEWUf7kZhvDL
         7S8Pd+pOX1bphpjQlN0m5tRUWGf8SrCq+JH2RHxblWQsat4MTvBymtP/n+6iVO2F809j
         TS3pUsOwCP3d12INeMuiKn8ZW+00Kn4TOBRUDpu1DCeKA6l+12mHh3YBnkkGbR/sPeqS
         iaglDDfFkDndn+HAK2VDNgfboZ6YcrNp8mvt9F+7jA4AadlsZKl09/D//I7j6Qx2TK4h
         4IPCVToN10M7QhJpuUsoaNGgGAIe/7vAaMGk/gOCm9D7xZD+ov2HQnmgHI5SFXSUTnQX
         QaVw==
X-Forwarded-Encrypted: i=1; AL+hErFc1VXzSLEHZVkWJ4gFPRc1vAC7YJzA4glXQLxLgNwB+wnBcuh8s5rgbYOnC2y1TVarOHOVE8K4mDmh4aQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sDvP/4mJBlvkjnBIZUQxqbAPQa14T10KdkB9hYMkazW5hPbA+
	uJ+uVmheCC5V/p/IABAtrUGfhDIzPZGQDiMPTnOILHBxO+bMTm5MVXOPBkzqTHxGZH55Tkx50lG
	EZzBIS5wdsars/qwwvWbz8zP26W4f4y0=
X-Gm-Gg: AZFdTZe2D79v52yOKn8mOId1KZ533AblVxFLgk6yfxrYKbR7JUMixIjNK54fMOKnrBf
	a0dzvUX+TP/bYc/f6Yf3YQ1RoiEPyXrQzwmh6fxoesbiK6yu/Ssa8s6YzjiVP9BQgfjQ7ahHhcY
	vmlACP8ZzV/RrQzpQq5HjXBehqT0o/URrJ5s+ogfTPl9Up2SXORSnQAR5QQI1hWfT+eTHJZFH+S
	O5MILM0X/8JMMmdf1bc8DwnfaEtmN4Y0o5/4fhKv+trhV30wDCNRbPS5oNPLhBtxwKQeypzzYVP
	9KWDS5r+rutDMtA8TgsceJDPGNXeQZeoU3NmNUHUaHXfml2KHum9T38UkMrzIj0PLSF8gfS7z7M
	nkckoEKjPDpiUJ6FMpZsaJ46wV/c5FxS108QY9HDQnj2pGkYuMgFxxhjp56W0zu+sjJr8mA==
X-Received: by 2002:a05:690e:4507:10b0:67d:b449:857e with SMTP id
 956f58d0204a3-67df42d0716mr398478d50.6.1795133744479; Thu, 19 Nov 2026
 16:15:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Jyothi Bommisetty <jyothi.b09052007@gmail.com>
Date: Fri, 20 Nov 2026 10:47:38 +0530
X-Gm-Features: AclHuK-zSHJ_pObok_tJ-4Y2XrXTXysJD4sBi2T9xMmKc9gIvRS2ziQuJ6HjFmk
Message-ID: <CAOCJsgwxy9tYUuaP1jjjo=BfiqG-iGfTgL=E3530Oz01MX6jcA@mail.gmail.com>
Subject: [PATCH] ecryptfs: fix use-after-free in mount cleanup
To: code@tyhicks.com
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+baa24e4b7e349e388442@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

When sget_fc() succeeds, it transfers ownership of fc->s_fs_info
to the superblock and clears the filesystem context pointer.

However, ecryptfs_get_tree() retains a local pointer to the same
ecryptfs_sb_info. If super_setup_bdi() fails, deactivate_locked_super()
can destroy the superblock and free this private data.

The subsequent error cleanup then accesses the stale local pointer,
resulting in a use-after-free.

Clear the local sbi pointer immediately after sget_fc() succeeds,
so the error cleanup does not access memory owned and freed by
the superblock. Also remove the redundant call to
ecryptfs_set_superblock_private(), since sget_fc() already assigns
the superblock's private data.

Fixes: 2ccde7c631f9 ("Clean ecryptfs ->get_sb() up")
Reported-by: syzbot+baa24e4b7e349e388442@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=baa24e4b7e349e388442
Signed-off-by: Jyothi Bommisetty <jyothi.b09052007@gmail.com>
---
 fs/ecryptfs/main.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index 5f37cddb9..bfc125462 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -468,14 +468,12 @@ static int ecryptfs_get_tree(struct fs_context *fc)
  goto out;
  }

+ /* sget_fc() transfers ownership of sbi to the superblock */
+ sbi = NULL;
+
  rc = super_setup_bdi(s);
  if (rc)
  goto out1;
-
- ecryptfs_set_superblock_private(s, sbi);
-
- /* ->kill_sb() will take care of sbi after that point */
- sbi = NULL;
  s->s_op = &ecryptfs_sops;
  s->s_xattr = ecryptfs_xattr_handlers;
  set_default_d_op(s, &ecryptfs_dops);
-- 
2.56.0
