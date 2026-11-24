Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502510;
	b=3Zk5Wtce1LTeOUBP7SRtn9Usv+Jne4BFVEplcmmiLOGGqCGPkqZo1SDqzZvrjPenUKMf
	 mn8JqdZKInNpcW9hEwXxawphC41l6ZhAoC3L+yVmg22TM9elhuZA3r/DMWVUzMetvkiKU
	 QFyXsUTtLUairHtNJpmY08FFevUU+IofUqkfhK9znp5A1uwCl9+hJEJrwjPBOI5c2StWk
	 6WthxSbwSfA6F7tCuqVsM/9xsRDgdeBKljk2fkwfJeC6mD+TJzCwSfzN5YdPmRxvvn9eQ
	 OmFGcuZGorFi5AZhGFe5hPqcJP4yvaB9XvdkyN0xTM2/lWZgKtU1A7692yb0J3gNw/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4WuFVQOFRYWtvH5f7uOdSI8usx8SQMpezyzM1BSEdVs=;
	b=gA7UvpE3k31Jbf3ytdcLEsOWor/X4fvQx4TvugpY+MXr4jEq9b0StBLDgjtixNRKmMhf
	 5FoxzpFCwUkOWZnAiPLpRIvnG9W0ClvFX20QtmnEZcOeWMVqwhzZVbXM0C0LcOT2Rm5WN
	 zhbMYWlubWSzyxvMtSm9Ikcsw01eSy/4dMfAhVjsoDalMOIvZtjsydHwFCYqWs6KgKUCx
	 K5jWU4HoiIjDxqDJ/mlp1fwe+nxRHcCdKyYT2bUIG++ouauhfJEZZ0FsK502d3Hz9gdWe
	 BhPCPtCNJiD9jU4ja8FBcukUuHt9qyqK1Fyf/lguOogQ2sgrb21Uyrvbt6Lv7jf9yVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoiCtpsv;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427D1606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 427D1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoiCtpsv
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso1650119b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795502508; x=1796107308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4WuFVQOFRYWtvH5f7uOdSI8usx8SQMpezyzM1BSEdVs=;
        b=JoiCtpsvXsQ/VkZFCgPsrpTHZls7GZeB/h2eq2znbxwhUUgd91Fm14p/fcB4WMzo17
         GsFvh+YAVMgX46Gmqm3NQA8fmOm3Tzvbdm8h0wuzqpITtWxq3wdUK/4eHXY7StKTAABd
         7odUFdb+aPg8zmxXILJ86GriTDPeyqQy+scF0oMb9sjoPyEJ9NDd8k8kD55N/86UcLXb
         J7pJIh9AHeyGQCrXZMc9hIrO0L0vnLe7FuWg12D7VWsK0b4j9Qrec6MkbKYI999XDTEW
         Z/6WRWZnK9miT7rdMvEI1FEISpdjB2lzuHlOGWR5E5N4cM9NWghH7e2XWfMQW4N3ptB6
         ylZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502508; x=1796107308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4WuFVQOFRYWtvH5f7uOdSI8usx8SQMpezyzM1BSEdVs=;
        b=vbNQxdDDJSUeYW1OiduVmKwPgp0zuGFy413Wegu8y/+7ULQeFIHjP+BB8dbLafgJli
         +9yeTBGTWixbbNOX14T+nRRhtlmzcT0DML3pJpwNz9dXoWrIfP4WOKAhRlTobFFo/O/f
         g8+yBEsW8BewYBva24OSWjG7HcEnwZvXJ6jXGT3yBCBCRmBclSx7ULTShdjdihFdwF5s
         DT4UyFq2yBsb2ivASwcvJM7BJltZD0ZJO5ydi0LwNUBojKuaDW0AiwLmIggL6n51Aiil
         asw9vv8ka5oTlArVveXcHkow+BaW8i5fxHV7wch6j96A0RniuBfkmyyzDEse5yBZQUZH
         Guvg==
X-Forwarded-Encrypted: i=1; AL+hErHlGHzPLx8jeqbnQtJZM83vtOMP9keDjqGp/v8l8rvXygHTOUmygpg7wW18PfiSPKurK8XwvY8KyBx2J4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d0Ct5gMMGo0a5pf6L+MZc1sEN3ARDhtXWsttEQa14yH1ESf43
	BSc3Re+YLxKVb0CiVqcKAqBtS8AWuUOzQbChWh3qZEQbbykA9pSPctbraaXnpQ==
X-Gm-Gg: AZFdTZclCAmlQv0LZESd2TZnGYaWL+5wki5eHs2xexdtm0BfD3vCNkUlSitKhuNbzEv
	+c+BJfpmLfYDyLWBzwjOoqQ2FdjiLGt/Vk+7TAYybkvbc8nvYW35/ZuIdNGk6UocHsLuCtg8jGI
	SWnh1wFmfDdtrL0DGYOyWnZtdURt0L3GJ8PHj9MXIRVcrailpAQ/A+J/W1uWTMZP5uj6XwDhkYW
	q1XqaXlTLUrANjOX58+tLPuxOhPGPbpD6GP7zQ992nOlK3X9y/xqkbuvrC2uqfSNvOVZJrS11sP
	+uF4Y1KcjpR+YRfzU0CuwKzZjooEhAiUCicFIFlM8AlBFlog9fbJTMoisyUQhictGWO/evlG9N+
	i7GU1N/XiBQRc/UQuuiI0/GWPIPQB9ivo16+YwPqtAouT5aqJRCBOE0X4LzW1tt0PVOSMLYiCAN
	AMnGItbQxw32By+KMKZD6hRY96SeOtIxY214IYARc65VLoIKOYF137F+jw8DisUr0Gwktv0Wemg
	jjWRhwRuGSJJ2t88YNL1FtFIxuaZkLDLgb8eznyl6nB8sRzeAWWxRh8cc23KVErzV+Ym5dFjq3q
	5JSgG34P8JDmmCPbiWaJHdB8XOPCC74=
X-Received: by 2002:a05:6a00:4a06:b0:8c9:4ad:abf5 with SMTP id d2e1a72fcca58-8c904adb638mr8505595b3a.27.1795502508396;
        Mon, 23 Nov 2026 22:41:48 -0800 (PST)
Received: from thangnn-ASUS.. ([2a09:bac1:7ac0:e88::247:18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077a058sm6745089b3a.8.2026.11.23.22.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:41:48 -0800 (PST)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: dm-devel@lists.linux.dev
Cc: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	linux-kernel@vger.kernel.org,
	syzbot+dbad68398c8646e5a382@syzkaller.appspotmail.com
Subject: [PATCH] dm cache metadata: drop the last reference under table_lock
Date: Tue, 24 Nov 2026 13:41:43 +0700
Message-ID: <20261124064143.118819-1-ngocthang2710.1999@gmail.com>
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

dm_cache_metadata_close() drops the reference with
refcount_dec_and_test() and only then takes table_lock to unlink the
object from the shared table. In between, a concurrent
dm_cache_metadata_open() on the same metadata device can find the
object in the table and call refcount_inc() on a zero refcount:

  refcount_t: addition on 0; use-after-free.
  WARNING: lib/refcount.c:34 at refcount_warn_saturate+0xc0/0xe0
  Call Trace:
   lookup+0xa9/0xc0
   dm_cache_metadata_open+0x104a/0x1560
   cache_ctr+0x145f/0x37b0
   dm_table_add_target
   table_load
   ctl_ioctl

The closing thread then destroys and frees the object, leaving the
opener holding a dangling pointer.

Use refcount_dec_and_mutex_lock() so the final decrement and the
list_del() happen atomically with respect to lookup().

Fixes: 9b1cc9f251af ("dm cache: share cache-metadata object across inactive and active DM tables")
Reported-by: syzbot+dbad68398c8646e5a382@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=dbad68398c8646e5a382
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested in QEMU (x86_64, 4 vCPUs, KASAN + lockdep) with the syzbot C
reproducer (4 threads racing DM_TABLE_LOAD of a cache target on the
same metadata device):
  - unpatched: "refcount_t: addition on 0" in lookup() in 3 of 5 boots
  - patched:   0 hits in 4 boots x 8 runs x 25s, no other warnings

 drivers/md/dm-cache-metadata.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/md/dm-cache-metadata.c b/drivers/md/dm-cache-metadata.c
index 461044dca367a..04140e6b1fb92 100644
--- a/drivers/md/dm-cache-metadata.c
+++ b/drivers/md/dm-cache-metadata.c
@@ -877,15 +877,16 @@ struct dm_cache_metadata *dm_cache_metadata_open(struct block_device *bdev,
 
 void dm_cache_metadata_close(struct dm_cache_metadata *cmd)
 {
-	if (refcount_dec_and_test(&cmd->ref_count)) {
-		mutex_lock(&table_lock);
-		list_del(&cmd->list);
-		mutex_unlock(&table_lock);
+	/* Drop the last ref under table_lock so lookup() never sees it at 0. */
+	if (!refcount_dec_and_mutex_lock(&cmd->ref_count, &table_lock))
+		return;
 
-		if (!cmd->fail_io)
-			__destroy_persistent_data_objects(cmd, true);
-		kfree(cmd);
-	}
+	list_del(&cmd->list);
+	mutex_unlock(&table_lock);
+
+	if (!cmd->fail_io)
+		__destroy_persistent_data_objects(cmd, true);
+	kfree(cmd);
 }
 
 /*
-- 
2.43.0

