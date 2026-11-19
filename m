Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057845;
	b=Lrna+lQx1+n4nMB5XwM0qwI1gBK8b+Jcj3r/qiEKKQEitrzimQz+LeU/fV4IROPmz9OC
	 SEacqpEZOWlFbT7CcSU6DTs/Vq9r0mc8YkvPqPwdwAwLIXFAF80KYOkAFPLGV/gYZW/mY
	 F6dvqAbncvUIMbcJvv2Zwj1qti18fLBcHUfarWj+KKQ42HK1fSw4l6IsIxXNMHgt8up8t
	 GWFhLnf+yb6UvHCbZvcbtMG6rCMET98S+cgs0mV/3lNQ+CfsT6/Qbke9mjOcHgQO0inLY
	 EWdy7ILsLVcHmOM7exP+4KfyIPedzCP+iMv7/wkIZVfOCJLfNU8i4n5T3WqVT3neYzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=76T73ntXs+yFh0/soL0doyAQtKkRUjwBVbAjN35jhWg=;
	b=LoqVD918cAqK/8mdMGx/E12OLwydcf+IlChNA1nIrzoqYvDAKl98iqPA+9K0IJ13p8MZ
	 LkOifq3adFiwIpn2jVDfispwWMANmXsE2YoE3+zVc3fKdgncJEupGBgTLkpjdS4oGMIKS
	 Ga3RrkHjgXQkPd5bupvCyg1l5l4iWunGUATESoFRCv6YSvEYgOGo0sDG3qImKKoprT8B0
	 4mHZS8UssOevQRUkXGHQ89gTNQmbvmdC1tv711T81BRj9F40LH5fsRFbuGAY9qNLMDxI/
	 J4gM+MVYNuuKvRERD9+kopHPBj5TxikkJ6OoLgMdPplMnh1huMeQ5ssNTv4lBvUrtYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pyIkvM1c;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E05460A2603
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E05460A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pyIkvM1c
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1438d9363fbso225855c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795057845; x=1795662645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=76T73ntXs+yFh0/soL0doyAQtKkRUjwBVbAjN35jhWg=;
        b=pyIkvM1cCQmG+tfLh9i5xgpgkf2EEA/iG1+0t5rfHPr9VHhnVsCvw06LkdiYc6qkm6
         jhXToFdHUXGWs7Qk/8WGfOVmdPfsjpKMQCfeOWNAsBl7lRR1BLIB6mQ4TWScF2g7lo+L
         Am/YgbEkLxTIqrpa+MlcT8OEEaP1LNsVHcPQUch0CwuijiXRe/KJUtYWHg/xANpWfeq6
         SyAm//DHptUkHjGS89uxMTleKeaZ1gAKc9G5S9FB3Vky709JgcxtzU0Y6ZAtC03vE47y
         4CBlwULlois6tLC+o0Y48JeaX8hmEN4xSnp4G7mThECMTQ6KBrLnYsaQU9o8Q2z/HFF5
         NfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057845; x=1795662645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=76T73ntXs+yFh0/soL0doyAQtKkRUjwBVbAjN35jhWg=;
        b=Q7/CfsfuyfoJc33CHe13HCbqwTQ+ZYre2tzslMEjJKKXK0zzm5KpBtwstC3CBvrP0I
         8lUWhyJqiAOy1CoIYOUj7Cmv/Ty7Aw+tcpGZwxuhEna75DbOc8mzCSYmnyvfNIMWeCwi
         /XSIX+NLOYedZGlX0VMUftgjTX32scYimBbZnV0l8JF7+ZoGXD5eyzTyGvYaxZQez25U
         yWLCVcghh5Cg4PJTG2B3MWV/X6ghnEpTLb8wPPnQvZ5qmnmpOjlSJMuAQdqyJO8w4d+c
         0idNi5/e5ybLSzwXrwT98M7da5Sz7bCm6W2BYHtX4jXgqEElB6ym+wQYDC+g6wtKF4Mi
         YCcQ==
X-Forwarded-Encrypted: i=1; AL+hErHHA7WjNAxUMBkYFTyYvEmcpEklp7JziCXz3tLL3Jp68LAbHNhi7x8zX3qkMDFVYFYCL5YGg1aBmMJz154=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DLqayR87WJkS/pOL2xQrnjYdXP+RHm/XEa1czqpg0td6JvzjQ
	hiu4jRPElzyj3kLaoj6rL2SMfwNDISxqCLSUSYod7tq2VA4aiIE01cvu
X-Gm-Gg: AYBFou3mo/IZbYf338xYMK1XIXlh1C6R//44FernbP6RrdVsVRFU6x2297oxMHYQpTx
	u+o6v2V5HG1amoZA1N0vI23TiqGerpqHTxaFyEVN+losn8U17IBwDnrV9vRiKBT8PDnALTKaHEO
	UGYY+Up0YWHXPf2hmso+K9Sj3rXifcdgHDW3iw2JWGkUjKMALC2DNFjkYla4ldsWSTd+Qg7K4CD
	+BfSc4Z6KfxxnzCDo3y9Gr0oZJlijRLW77lz8/BhzbvemJ5OyIVL70Z/OdCMgBWILwBkaEOUrUX
	Yc79eiFKHXxAm05uYafBX4ktZKOwkispy2OiH6Wzqd9/bTi6bfMXoblGgd4sGx8zK3w1Y3e2PsI
	qoRJOLvQEq/F5SPvuanewH2tag46Mrp11G9xj9KKijxMF70zLAJ2BfPrOp+46pnoczLiZ/mIeg4
	sCoZo1QEvo7ySZMQWwgPruTUcZpnaVNc+0VsdTX030RNlgAx3FSOu5djAM8EDEJJD7kCqM11kIz
	bWHi+820eyfaip8PgAX2vJkZ2e+K6Hl3m2ZQD49xROYgeG4dkwMek8MQfKsxhuL4AcolcMn8Atl
	HxH9WNDS9dYcFkjoTw14EY87GEb0VAOL93qqDy/OVjIc7vWVXk3911XX9ylrdr5CivJcJvA=
X-Received: by 2002:a05:7022:e886:b0:185:6c8c:d860 with SMTP id a92af1059eb24-1b54e8894eamr777303c88.5.1795057844676;
        Wed, 18 Nov 2026 19:10:44 -0800 (PST)
Received: from MacBook-Pro-8.lan ([27.125.146.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm15028118c88.13.2026.11.18.19.10.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 19:10:44 -0800 (PST)
From: Ding Feng <dingf3ng@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: Ding Feng <dingf3ng@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jun-ichi Takimoto <takimoto-j@kba.biglobe.ne.jp>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] fs: ignore RLIMIT_FSIZE above LLONG_MAX in generic_write_check_limits()
Date: Thu, 19 Nov 2026 11:10:25 +0800
Message-ID: <20261119031026.7985-2-dingf3ng@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119031026.7985-1-dingf3ng@gmail.com>
References: <20261119031026.7985-1-dingf3ng@gmail.com>
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

generic_write_check_limits() stores rlimit(RLIMIT_FSIZE), an unsigned
long, in a loff_t. A soft limit between 2^63 and RLIM_INFINITY becomes
negative there, so "pos >= limit" holds for every position: each write
through generic_write_checks() or copy_file_range() fails with -EFBIG
and raises SIGXFSZ, although no file position can reach such a limit.

Reproducer (bash counts ulimit -f in 1024-byte blocks, so 2^53 blocks
is 2^63 bytes):

  $ bash -c 'ulimit -f 9007199254740991; echo hi > /tmp/f'; echo $?
  0
  $ bash -c 'ulimit -f 9007199254740992; echo hi > /tmp/f'; echo $?
  File size limit exceeded
  153

Before commit 9fd91a90cb98 ("vfs: strengthen checking of file range
inputs to generic_remap_checks") the limit was an unsigned long in
generic_write_checks(), and such limits had no effect.

Keep the limit unsigned and apply it only when it is at most LLONG_MAX.
Smaller limits keep the existing loff_t arithmetic, so their behaviour,
including for negative positions, is unchanged.

Fixes: 9fd91a90cb98 ("vfs: strengthen checking of file range inputs to generic_remap_checks")
Reported-by: Jun-ichi Takimoto <takimoto-j@kba.biglobe.ne.jp>
Closes: https://lore.kernel.org/linux-fsdevel/8F9EB913-3AC3-4D89-9DA3-427029F6D211@kba.biglobe.ne.jp/
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5 Frama-C
Signed-off-by: Ding Feng <dingf3ng@gmail.com>
---

Notes:
    v2: hold the limit in a u64. As an unsigned long, "limit <= LLONG_MAX" is
    always true on 32-bit, and clang W=1 warns (kernel test robot, Damien).
    v1 was applied to vfs-7.5.misc as bc0dc4379463; this version replaces it.

 fs/read_write.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index b15522c..9786dfc 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -1693,14 +1693,15 @@ int generic_write_check_limits(struct file *file, loff_t pos, loff_t *count)
 {
 	struct inode *inode = file->f_mapping->host;
 	loff_t max_size = inode->i_sb->s_maxbytes;
-	loff_t limit = rlimit(RLIMIT_FSIZE);
+	u64 limit = rlimit(RLIMIT_FSIZE);
 
-	if (limit != RLIM_INFINITY) {
-		if (pos >= limit) {
+	/* No file position reaches a limit above LLONG_MAX. */
+	if (limit != RLIM_INFINITY && limit <= LLONG_MAX) {
+		if (pos >= (loff_t)limit) {
 			send_sig(SIGXFSZ, current, 0);
 			return -EFBIG;
 		}
-		*count = min(*count, limit - pos);
+		*count = min(*count, (loff_t)limit - pos);
 	}
 
 	if (!(file->f_flags & O_LARGEFILE))
-- 
2.55.0

