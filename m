Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769345;
	b=R1UBZiqjBqkwwDVFtp1sunQ++DzDM3WMnapgsl0K5fo3YkkmXWQwWdRWdQ8DIrk0pF4W
	 tO1VqrAgN2DOxo9g2RUjXt9ED/dFoc0rh75O51n0r7sJl12VW8lzOkVtx3lwEk8TGb9kh
	 kCasH7uFUWuAvFRNqc1bNTGVODylOK90AMwTGsvNB04enF3bW0g53gZFfCbV7kfdoqqJH
	 Ke8sUnYFjHkptGAlGWRjLRWRpW5umjqdu0UoYwuP5qSfIBWgzQ4vt/QABki8QRrUH26K0
	 cdCOSaEqLoXSjGOJss2YuzEMnadlN2ZporvaR7jV+YUg1KJW/yO2WbQQI1qyCVFpPlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bAYchJLtcmu0eim/PzW1trsxh4rvw0msXXKEd2Gvip8=;
	b=ySNjXU4THSGHQTVCR3QSbTyr5oXF3osu5T8gn7e4SQoqgIC7/SwQhvzu09w+2oEW5tfy
	 cvaVl71Pmwd7ETiwf478WMwNq84Ep8nh8V+gnd16ezT1v3kvPXanP7Hk4/ynWzkH4FTN5
	 Tjy7DCTnZvYefPWdHVnUvrNr7Bv/hI6I/giBc34W/Ynfv8o00KcjrYd6opmucWTS5gnbT
	 g3CxMhXssBsLI5LD1FHOGg6KhA816f3ls2PWQ6KpsitSv6jbfoBsHZAPbUGOzHrW3bKWf
	 tUCn6awhDvU+VF/+4eIEFSewnDoghDF6/9giaKc2Lw5vGmciYWXONZwFSXlEIa8iEhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WlKEPsN6;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400F4606A6AC
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 400F4606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WlKEPsN6
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a05b210703so3709174b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795769344; x=1796374144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAYchJLtcmu0eim/PzW1trsxh4rvw0msXXKEd2Gvip8=;
        b=WlKEPsN6nJuR2Bu+idp8dGyZRPA0dTvBOqw9ir8XHq/esz8TCNoRZzWCCfgiIxWKxp
         mXXhTb4mgFPAmJ8sp/n3uaGPIZlTdUUlT8GNAgQ0qc10P3N3znUKHKbCjnhYkHrnSFMA
         KZfmwQP1fOX2q9RgaM2z9/AZkAI+ooZYTo+YseIwhh1dEoM+2iyn7slWgMt7oHZGSupW
         Un6p8L6PpxlR09mtmrZF+f+jnF3io/Hg3iNG8mdvPe3E1jSgz7Dv1lC124+XkRCNG+ij
         KW/t5SDj27pEBZtsl3D9kx5oQbdoZ1vw+h09IUYJux8VTUw9HDfQcM+6jMHnNpS0eS56
         qvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769344; x=1796374144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAYchJLtcmu0eim/PzW1trsxh4rvw0msXXKEd2Gvip8=;
        b=IHJfjgVznzUwiNcwKgdm0wJh8J8qat8TpCr+FfbGjbvPIBjqHGylmKJUIPRLxMGciO
         qWUANxs7L5gnjtnN7M+Q8KkQII/IBqyuGZlm/yirjkYCdQD3YFYEaPnsfnm7qAsX4C/K
         IMW1UHquo2NcnWBkRMocvX+qRWzBM8NNOkvvYhk17RGUNzsSRx+ksnQZmb/yAB8FHY+x
         5HIcP1BEQEMxf2Mv9NZOtIc+EITych3Ujzu+WrYA1l97mMKGOZ5HQlwq9PGXZwIfUZt/
         cVE7iYOcwUq9T7E9ORq73i8DqjmAdiSV9q2HUl/+HN4liGHWAZNftAxT4bwXOqn4ORE4
         MSzg==
X-Forwarded-Encrypted: i=1; AL+hErECkHsC5mdgZ0VPVS5BSjqJ79OAagbM7gVbOT3IA/ywmhFDEjL+DiCUof5TIQ4Rjf71Lb3qsoeFEl5UmUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P2QPO9tqK6UCfsqonit0V/ZHfOlTvc0mo8lWpQ9w8g/r7ORTG
	czoGfZE/Y2U+MSVsjQXAPxFPLa5mUwfvsfzo8+TpOE0CZCjK+5LpGfRO
X-Gm-Gg: AZFdTZeP/a90e9R0kpaBHAi+Ij9TLDeLt/fTYXJmfnhnsS3mmDkai5bx4Y41BLJ5FKR
	cyaPiz1mL6k3sOG7WgTz17EDDgtq8ZQSiSclB6nZcZEKAQD1yw0UoN5eGApUQia2aSOso3ansLE
	ugCSMsqmsTYd1NqQWs4adHWOOvZDwWcj+kf5wDpjuaqcEFBlqfVLsiOww2UO4qZG1VN45pMC3Zc
	Kf/Lklc3FGBa0ey71LNTHebXrTZFOF9B0key+JBPdbrPyNv96t78gz5Tx5e5hZkZ/HMi/SfQraw
	Lc1PL6Lq1451l/m5oqs7bPPgP62KZSKtm9IMXDL4EX/8yxcu51IiZJoSKhSNOi8tx5UiRDyNgos
	bKEuVb/aMNxagz7LoSI5bt008TPpcc6rYZXaLAEI+kvcq+e7+mzXQd8pZh5XaA4bl2riFzkMKEj
	FvZ4+sCW3K7CgfWPWzgD7ZZ6WTiCf+Yz24V2fzJj0eB0HURb+h6Lt0U2oDk2Ry/qRE+ieKmK/Qf
	+GWcgzgUFrjuTq20IAo8n0htiwwEBxv6Q3hXjgLznA+hNFZsQ7xX916Zc7df2gYZT9e89Wmt53g
	GUOC5oqWAghRy+M9826Dvd7JTsc4UjMVqV9Hl/KHvvetcEuZOaWh76hE/yyTO6LKfdafe0ks9sL
	8bA7Yz0Q0BgA=
X-Received: by 2002:a05:6a20:db97:b0:3e9:176f:ab86 with SMTP id adf61e73a8af0-4014bc4b23amr26347756637.44.1795769344544;
        Fri, 27 Nov 2026 00:49:04 -0800 (PST)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0818c1sm12289058a12.30.2026.11.27.00.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:04 -0800 (PST)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	hch@lst.de,
	jack@suse.cz,
	axboe@kernel.dk,
	tz2294@columbia.edu,
	baohua@kernel.org,
	linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com,
	syzbot+cid5582b8164122eda@syzkaller.appspotmail.com
Subject: [PATCH v6 2/2] f2fs: enable buffered RWF_DONTCACHE
Date: Fri, 27 Nov 2026 16:48:45 +0800
Message-ID: <cfdfaea72b21b8abf58cb250495150d92e73beda.1795746008.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795746008.git.qiwenjie@xiaomi.com>
References: <cover.1788438786.git.qiwenjie@xiaomi.com> <cover.1788795700.git.qiwenjie@xiaomi.com> <cover.1795746008.git.qiwenjie@xiaomi.com>
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

Pass FGP_DONTCACHE to f2fs_filemap_get_folio() for
IOCB_DONTCACHE writes and advertise FOP_DONTCACHE.

The address-space write_begin callback is also used by internal
callers that pass a NULL kiocb, including page_symlink(). Check iocb before
inspecting its flags.

Keep the F2FS-specific lookup because write_begin_get_folio() adds
FGP_STABLE, which can deadlock here.

Reported-by: syzbot+cid5582b8164122eda@syzkaller.appspotmail.com
Closes: https://ci.syzbot.org/series/cbb9ded8-1388-4a7b-bfa7-44082b04025b
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes since v5:

- Rebase onto dev, using the existing fgp variable and preserving its
  folio-order handling.

 fs/f2fs/data.c | 3 +++
 fs/f2fs/file.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 37d74afc8b26..f3559c27d44c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -5622,6 +5622,9 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	unsigned int blen;
 	int err = 0;
 
+	if (iocb && iocb->ki_flags & IOCB_DONTCACHE)
+		fgp |= FGP_DONTCACHE;
+
 	trace_f2fs_write_begin(inode, pos, len);
 
 	if (!f2fs_is_checkpoint_ready(sbi)) {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c80dbbe76f8f..571a848c6af5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -6274,6 +6274,6 @@ const struct file_operations f2fs_file_operations = {
 	.splice_read	= f2fs_file_splice_read,
 	.splice_write	= iter_file_splice_write,
 	.fadvise	= f2fs_file_fadvise,
-	.fop_flags	= FOP_BUFFER_RASYNC,
+	.fop_flags	= FOP_BUFFER_RASYNC | FOP_DONTCACHE,
 	.setlease	= generic_setlease,
 };
-- 
2.43.0

