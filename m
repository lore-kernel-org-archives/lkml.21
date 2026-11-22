Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371876;
	b=KBswsN83UZovZdNH2ZtQycz3EvXGO79f2D5ANdAJ3ZH6wxkd4ROfR27yNyNbWCnjPyRC
	 oeNcnhtXZnO/iBqkYYp0pWeigT6kzDbS5sfkACTrbG7TcrIFMQAs1EvOf4//T+1SUxkFT
	 TP2lk7fF40v60Pm/4e0RcZ//BnEiIuYznuR2PPiOzP4r4u2Y85pDKIEPGZuf8UXr1MznE
	 Lcs5oqPo9VU1462OuqzVJ8nxikx1Tv0wbpigahyAbd0uIIdfL4mHCN+zz6mTk+payxOtd
	 mZfKw48JxdmNPaVyDPLkTNNS2DGWLAynYSY/JZosG7XAtpfhoCO69gFCWr7KnEsC9vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=76A4WPudZsZy4CJtPE5LMtql++Tj2dohb2B1StvtAx0=;
	b=RRhrZ0djiU3vsM64wSWdCXmviGHNVwiMhNjoVtqnp2XrAxx0nZzpBlrMC9klmH7UlDxK
	 uDCksXE5rcUbqtJF1ZYrrzePBZVGsswJV72P+ykyD2vmYFeTyp3btE7Hts0WhBVAS2wxG
	 runx0uA/nULtCErLDCoa+WEVqTfJEQosQNoANIMj69X33h51I+PI/11ocjKupMt9ydfs/
	 11aXxkU0r4/MLK3Y3nJhi+8fGFe8tKIN7D8FgxNkUwerGTVmS723ljEU9AiFE91Rqe/ye
	 risdeo/NlFNvcoPenP3LwE5xArqSXT6itA/7hGPZIXHYbDs6EVT+3PZZHfdPm2HJP5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDml5vAB;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3815606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3815606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDml5vAB
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so19135925e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795371874; x=1795976674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=76A4WPudZsZy4CJtPE5LMtql++Tj2dohb2B1StvtAx0=;
        b=aDml5vABEDkKy8vsbL8COyzwkkoQ65IJ/EAggkdXqeEmF24s9kd24MeYsbiaxzwR0W
         Cw3o2WQcaja8UqOGtGtCT561ukMh7lAg6gLEqaOYI3LKQxSergdTZCvR7yEbM1fmcZel
         ghDhF62n0JAq/SmNfVwRF7lVKklbAKmY4ZFtyojZmn3Xud2A5fK+ndU9kyYD7kCPqLUH
         yOyQ45G6TPLx3G+EsReFD6vLfhe+kvNLWbbe5NJcIHAdZjlX9Jo/yvZ6LY1w0IlyrpD8
         RTAXzloYIEBO081PQjjcraJE9wilm6GBqDtHCqDCzPXHnA21vymOwXgQh3kFs5Gi1qwJ
         qhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371874; x=1795976674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=76A4WPudZsZy4CJtPE5LMtql++Tj2dohb2B1StvtAx0=;
        b=VRkFzVTCNAe1yn/QOvi0IBT8i0UaWNlF9ziwN/Y0fxbN5yi0n2qZhBxyx17DHFJEj1
         uMLpP3Ls048FaFdEOkiY26ZxusXLddNjrxpaYG4iF2/vKtXZrUziW1rZcqTr/3fMryxU
         LEZwe/wrrWnFRb/oJCXTL6McTJTJ9Qwg4C+yJ++J8IoKEUZ3V6XkmRhsS5ON1w7WRS4P
         kdgeeeie4ZgE/t2SyEKtEiBZOMQ06DQBdV0xfihTmc68pAVRpPkXHGqwU51IVN+GKjY5
         DshEhERWwsK5YUPD1Yktw4HJvWTUJsJXUX6nebwvvDLY+hfluuIUbecrwDQP4KCwG2pR
         aXzA==
X-Forwarded-Encrypted: i=1; AL+hErHDvEsOkzyB7LmA65jizhPrulJYDM64ELXW995Ai2O8jEqQPi7M9rKucUGhPLNy9kkE+r2Bxthv9v8zswI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fZSZlA2kMDs3S1IPDlwAegkMBp3+LGMjVj37Jt0T+Tay2iNhn
	0kbhnsSL5s+m18vgVo2BG0Zwj4Q4sa0dRJmp1h9wJY7Wy73eecheKk+i
X-Gm-Gg: AZFdTZdOG+Jg91D22h8FTysY60yJh9e/Q5I55AZTdoexJXkAA3rLuIC1GGA8GrKwWJO
	+Z7VbqNvkAg+mVWqG44Cm/TVl8w6sv+fwRg8+d2lnHR4AzgzFbHQURu19W6Rpl10UumfqtAGU/6
	VRP49i9e/lfBiffxgnMirQvGLRTLUXiQ+vBIA0lWGuVWJ6Vae7juTiqcb1KQ7cZQzNfzk0ZY6em
	TfMLadPyct4IfQGIPB4avr5Q6GGqh/8RFx926rLzCDU/R83KCCRppidxNpL22jqdJ8hTPY9mum5
	RA4eo44tqr0Ip5muVOD6fZgO5/WiQterVhl/OgCVNl+yak6sfVxxME2py4LvBp5BMlHaJMfn2AA
	J5qWytHZmm6heRTkYuF1ct78nlXMPm7rcTQ9XEzjm2YNRU7fu8L3ZK5pgp0N+VBvDXuUB1u90jD
	U29hWby3+zAoelEWwUM91hOBjCkoMXps0FA9A+EdPIFRLF7p694qQtVN/cvbVoFauNCTGbdD3nJ
	mIfLCAMzqRUqfXEGB36RaPQG5HCxYXmj7pRq/R1TWWUPBripf6XWnnDyGCQIDGUpuzKYOfzi1zw
	WRFWBg0bXxu0Qvn2BjP1ixt86ClsQxAewrnn7NYsFpqCL+X/QLuRGw3D
X-Received: by 2002:a05:600c:1549:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb8880ad4amr190688825e9.7.1795371874103;
        Sun, 22 Nov 2026 10:24:34 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f0f1csm112711375e9.0.2026.11.22.10.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:24:33 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Eric Sandeen <sandeen@redhat.com>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+1d23ad199a3bfd6f9149@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH] ext2: handle NULL fc->source in ext2_msg_fc()
Date: Sun, 22 Nov 2026 23:23:31 +0500
Message-ID: <20261122182331.13740-2-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
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

With the new mount API (fsopen()/fsconfig()), userspace can pass mount
options such as "nobh", "dax", or "reservation" before setting the
"source" parameter, leaving fc->source as NULL during option parsing.

In ext2_msg_fc(), when fc->purpose != FS_CONTEXT_FOR_RECONFIGURE,
strrchr(fc->source, '/') is called unconditionally without checking if
fc->source is non-NULL, causing a kernel NULL pointer dereference:

  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:strrchr+0x24/0x80
  ext2_msg_fc+0x157/0x1e3

Check fc->source before calling strrchr(), and omit the "(%s)" device
prefix when s_id is NULL or empty (e.g., when source is unset, empty,
or ends with '/').

Tested locally in QEMU (x86_64, KASAN+UBSAN) using fsopen()/fsconfig()
with NULL, empty, trailing-slash, relative, and full-path sources.

Reported-by: syzbot+1d23ad199a3bfd6f9149@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1d23ad199a3bfd6f9149
Fixes: 98f18c76c2c3 ("ext2: create ext2_msg_fc for use during parsing")
Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
 fs/ext2/super.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ext2/super.c b/fs/ext2/super.c
index 54a6c26d0..c99367652 100644
--- a/fs/ext2/super.c
+++ b/fs/ext2/super.c
@@ -89,20 +89,25 @@ static void ext2_msg_fc(struct fs_context *fc, const char *prefix,
 
 	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE) {
 		s_id = fc->root->d_sb->s_id;
-	} else {
+	} else if (fc->source) {
 		/* get last path component of source */
 		s_id = strrchr(fc->source, '/');
 		if (s_id)
 			s_id++;
 		else
 			s_id = fc->source;
+	} else {
+		s_id = NULL;
 	}
 	va_start(args, fmt);
 
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	printk("%sEXT2-fs (%s): %pV\n", prefix, s_id, &vaf);
+	if (s_id && *s_id)
+		printk("%sEXT2-fs (%s): %pV\n", prefix, s_id, &vaf);
+	else
+		printk("%sEXT2-fs: %pV\n", prefix, &vaf);
 
 	va_end(args);
 }
-- 
2.53.0

