Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754579;
	b=1g/wjpbGmqKkAPC/Ago8s0AsTpqKfpGtBrmGAcWOiqyH0r4/DLXv4eprdBU7WSKfp1KD
	 GeAvrmQi2sPqRSyHQNrr0Vfs6AFzqZsNX4otm+xcCnsyjCrQTPMa+OfKCamHxK81x1rBL
	 JQKabxMiSyHCUns17iRkwdk2H+T+cWefHrj25BO2lQQ/4pEXj5/iv2NWKi3nWsgOev/6f
	 ctHtFt7+pnM3TingLwjILkquP+XVEamuWgXmimFwEgZE9Qqv5y4dL+8ZIPXBFw7bigPo/
	 nmJ18eqW19hyNrmWu44ms71NNBd8oVUHvn5eA6DGUBG2nj/FZgE6ZKw3p04qIZMTCjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FlZVgstUiKok9fd01FeyZhK0bRQdfrsI1x6ZmeBZqEA=;
	b=vuZktJrv5ZbBTgumLfrRNvHldiTGXp24LL6rHAgqbIWoLwOfL0Jdd2kzQgbr2rOjeLrY
	 5C7Lfwi1KrZBMrjpWPLJikYPukGzziGCMmfs6UNPu7tB0HQRZoiZN6q60gWhGXvv0qZqc
	 cKYgi/lWJmj+o+ZFZS9Ib1dkbG8hERiSCfnfnt3ku3uaGIG7WG0oZ6x67yBXWcnTVAGdn
	 LgwKiedDzwh1+DAIXXjo9KDlKr53YwDoFOB93fTHwAvyry/Ke1cD8tJ6IVIzYezun7Pk8
	 JLtKnBA4KG0OlhH0N267iDI/nmfxVzsJfG0dnsy3NRVxhy+os8yB7H9sZREqNk1J/wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rygzqj3A;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E57606A68B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71E57606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rygzqj3A
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15dd124bbe7so11248565c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795754576; x=1796359376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlZVgstUiKok9fd01FeyZhK0bRQdfrsI1x6ZmeBZqEA=;
        b=Rygzqj3AG5bwJnLyOQL8p/munsxO7nnRa15tC/ekWKJXZ7BMiXrqx7k0kQTU5ErkaJ
         3+QqPB/GlrTtqNeqABtYQWzFn/1896WbOhBYz7hc1Hsi8FoYQLlXA3gJZB2MBvssH3i+
         pQTsj6yPwdAi9dpEKjDpDdit0bNxmAc2oGZmoofe+1HM87uMADaxRpdLYfQVe8Mnsn7i
         O1Qu///S51WfW59B2px4YMNRYn3BpX/WpmpC/8ZmsAFo6MCUn5DPDwcEP2nNw2/XnhJS
         7mwfdeyWGJ8xPE00a5ayVvxuomNgF6TRBKXIQMOTVXRx0kzLlKWBT/a0APITwmEoJDO9
         qYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754576; x=1796359376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FlZVgstUiKok9fd01FeyZhK0bRQdfrsI1x6ZmeBZqEA=;
        b=FmC61UmNr6FEHTQ/zxnFxdSihQagIBS7uLZYhl49Ony2YDXygMGnJ66Sz9Rd/bnMAK
         +BovIQOZ8lSBOQfhH8G7xpxWc9y7iyOARbEz+b68gLgymfY6xl5uVBZqKkenE69Tu55E
         i0rPr5inMlmcn6ZuDiW/FbYmHXzzI5eP/snIT9x3H1qr3uTuaFZj9JFVq7cgkTdaXF+b
         8uN4dxQ5SpkYuDcEvCTMGGTMFYKSi5Sehy4pm9YdHSmPZdBkAHMuRsZhA741GG/1W3Pf
         PivweIFjUd7m20c9DiDw3rxMijvZAf96qzJmu4KV4/lyqqxn39M7Ovg9JqcRC6uganIK
         rpbA==
X-Forwarded-Encrypted: i=1; AL+hErFT3qXh112rruyPzV6jIKWbv+gQSoMu++NPvKOISNLVs9/GfkVOU05jmT2NqaveQooHa2LuoGbJxO6eo90=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q31NXD5e2k2ASukYdEBdsLTwU7QP+JbnynxmiijcBRLcYSRaR
	tE11y9AlFYSSNhVbcE2GRngV667BxZt7Xqv4StnfovcKaEzfqg5pw+P8mMA4lg==
X-Gm-Gg: AZFdTZc6bZof5ryc45uo3OCgJ2ALgpFsbyIO53SoRrq/Cv8oMIAq+jCHSbQ/tgVvYHh
	bU7NYXU00X6X8CdcBeBHddQXOftODRGNOJR/iqUPhb2tNlZe/Wn621zFP9oa8OCP55bK5M6qwzd
	vLoYXx6SKzRoE+9jF4cDFSLb/Esvq/KY+4zysghysfm5Jdcp2xiz4M80m4TnMlxFZ0uz8DZXMTp
	BH0bjAWQ3WuS6sKaH5nS3t826zgELqBtxGCZKWf8wloXWEdNXDAPFv8WCknMlDvXr8ByW0bdgls
	Tr0b6hTVzBms3BDQhfsUvDMeBasa/79aD1LRfYX2oIFVd121KyQ+ZYl64qXw62KHG1N7HI0NAup
	iTUIwb1TTStJwl0V9e17UGrmXxTGgEEsZHZ6VVOeN3thkXt0FyzcrQ588N2Dg96PwPeYT7RmFvK
	uZJufFvq6sHv+GGXxOINUOn4jVcjvstzlflza6hF2zqK2HgFRV6PWiULyp9I5Lkxh1joLBNSko6
	OUXdKTQiWyw3cwtJVVNKF/ayAJVW3LeRMHEnaBcXXeUbKp8zkM9P1b5MbwKAyd9BGhnDwYIDrcn
	mGmR7NeWV9PcjVVaMr6XPM4NIlilxJOPfnAwOFiEOn7160E6VvF/yiWk7e32huo=
X-Received: by 2002:a05:7022:5f08:b0:144:c112:5f24 with SMTP id a92af1059eb24-1b5568f9e24mr23217860c88.25.1795754575621;
        Thu, 26 Nov 2026 20:42:55 -0800 (PST)
Received: from carrot.home.local (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm88000388c88.9.2026.11.26.20.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:42:54 -0800 (PST)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Wang Jianjian <wangjianjian3@huawei.com>,
	linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Zheng Zheng <fengaojigui88@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 8/8] nilfs2: avoid infinite retry loop on GC failure
Date: Fri, 27 Nov 2026 13:41:01 +0900
Message-ID: <20261127044231.37630-9-konishi.ryusuke@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127044231.37630-1-konishi.ryusuke@gmail.com>
References: <20261127044231.37630-1-konishi.ryusuke@gmail.com>
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

Currently, the GC loop in nilfs_clean_segments() only breaks out when
nilfs_segctor_construct() returns -EROFS, continuing to retry on any
other error.  When a persistent or non-retryable error such as -EIO or
-ENOSPC occurs during log writing due to filesystem corruption, I/O
errors, or free space exhaustion, this loop can spin indefinitely while
holding the transaction lock, leading to task hangs.

Now that GC-specific state changes can be selectively reverted on log
writing failure to preserve filesystem consistency for subsequent
operations, modify nilfs_clean_segments() to abort immediately on
errors in general, leaving only a minimal retry loop bounded by
NILFS_GC_RETRY_LIMIT for -EAGAIN and -EBUSY.

Fixes: ce5a5ad1a833 ("nilfs2: fix infinite loop in nilfs_clean_segments()")
Reported-by: Zheng Zheng <fengaojigui88@gmail.com>
Closes: https://lore.kernel.org/linux-nilfs/CAO-4RZ1Q-HzRCd+S1uHZJRdN-ZCtv47f=pXTxbq4YaJgn_DALQ@mail.gmail.com
Closes: https://lore.kernel.org/linux-nilfs/CAO-4RZ2pjEOpTBzqca5UxZHtaFS2Dj9zmNj1BtjvKm1yFE7_Jg@mail.gmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/segment.c | 9 ++++++++-
 fs/nilfs2/segment.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index b306f09c9497..5765959617fe 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -2582,6 +2582,7 @@ int nilfs_clean_segments(struct super_block *sb, struct nilfs_argv *argv,
 	size_t susz = NILFS_MDT(nilfs->ns_sufile)->mi_entry_size;
 	__u64 *segnumv = kbufs[4];
 	void *subuf = NULL;
+	unsigned int retries = 0;
 
 	if (unlikely(!sci))
 		return -EROFS;
@@ -2644,7 +2645,13 @@ int nilfs_clean_segments(struct super_block *sb, struct nilfs_argv *argv,
 
 		nilfs_warn(sb, "error %d cleaning segments", err);
 
-		if (unlikely(err == -EROFS))
+		/*
+		 * Although the log writer should not have any paths returning
+		 * retryable errors (-EAGAIN or -EBUSY), keep a bounded retry
+		 * path conservatively.
+		 */
+		if ((err != -EAGAIN && err != -EBUSY) ||
+			retries++ >= NILFS_GC_RETRY_LIMIT)
 			goto out_unlock;
 
 		set_current_state(TASK_INTERRUPTIBLE);
diff --git a/fs/nilfs2/segment.h b/fs/nilfs2/segment.h
index 711c69e24575..4158948d890d 100644
--- a/fs/nilfs2/segment.h
+++ b/fs/nilfs2/segment.h
@@ -204,6 +204,7 @@ enum {
 					* Retry count of construction when
 					* destroying segctord
 					*/
+#define NILFS_GC_RETRY_LIMIT	    2  /* Number of internal GC retries */
 
 /*
  * Default values of timeout, in seconds.
-- 
2.53.0

