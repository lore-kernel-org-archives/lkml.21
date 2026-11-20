Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143505;
	b=S0ft4wxkDptwZEug2tv6ZaVEYGr0OscuX8SuymBRkN48VBlclop4zgHwUHZQ0pMFdpXo
	 nkHip1U4iiDXksqOyp8ePcYV6zKrD8X3GfeshLdUyuFqT+3dtaDAqMW26taTMiFWeojSH
	 EDaL93vh7sT3/1/zYlvtmd8Sm2WM1qQKa5bavZuX7PzjGMzKLe5JNVbR7E/J4gofW6V3r
	 Ye3yf9CuJyyy8fCXJS3EYU8LDAEAmpjE02BDl91rhJg1fO137NRWP14lSdYn53PnCNz4T
	 r3TooqEG5kFlZQxz6xprlq5ifiDWIa+JgJ6ri26wC6XLoTILzMphYowovhlvz6Nyaow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wBWPAIqvIDVApxQAhC8lxyajSPGZTusmtwDLAKdJnvw=;
	b=VQtH9nAKciZRWwK5aVFc1uR2WHq58YJuw2iTdhbC5aRrWrUMX3DajMum6QK2RbRnbpnH
	 5CpBlV+S4mco0E1mRg59SryR60vaGvhWpy2x0TDvLaOmmm5ep/RKQST2fVxcs1oexllxa
	 P7WTOH/HFsjCYkWF0aQ6qaxbLZeUTSNHZmZns9Rxdl8kyN0mag/pdZMPNZSFJUwsiJoSF
	 872PVAcATLDURkBeb31LQgr8vP0/RtnhHkVJaF9fW/A52z0tmDoSeqByNIeGQzpQQO2WM
	 0JfbWSZvmIPKcMvbrv6+t2rr96CANMHGdF/ye53NN8+vBsLE4Q8juDqdL7pS5Yl3jtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LmLgz8N3;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EA4606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83EA4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LmLgz8N3
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso346193b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1795143505; x=1795748305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wBWPAIqvIDVApxQAhC8lxyajSPGZTusmtwDLAKdJnvw=;
        b=LmLgz8N3WHtNAjhkY/vczV1KNXtxy4JPW+LnTtOzMBEddzS/D7/S9+beyQwErjT0my
         0Di6lSga3zgpttKLH5Iy71kLa0ff9/DVNQQsME2JLI0h9z6AWf9E0hLJkaXcLxzhSQ4Z
         5ffDRYNTH6NeIAtE/ZKuknjgGxDLoRbn2peLQ6qYtLu9xkWJGxioW0FvhgmQWOZuWXcn
         4PWwP2/UjQ7jMk1YeuBWMkapG4gdAIKW/5HL9YwOiUUMoWPBGsrDVPmKDsDOZypin1vX
         18pmJyhBKXnnBBaMDhqrzpknmmfQYnjvgRqrW4lHlIGe951uVqcE7cocEkCLRmsx6iW+
         HmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795143505; x=1795748305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wBWPAIqvIDVApxQAhC8lxyajSPGZTusmtwDLAKdJnvw=;
        b=Y0oiSbXICfBlsIpHYzix9sHWDUMcy3H1ZpIvqgUrz8KC+Lc2h6U5DPVH0QJ+x559xJ
         6Xo3gH7Z+Z/Xw5Z2qlortfHREHCszuavgglNaLJW0iNBnMuxYJf3LeDYdibvwajKhApN
         RBmvSNXiVpz6W4wnL2dj0TQULosQI70/BtO3h+zAQ1hN/ZUlBD+D8g3VXCVLyYVfLKbk
         ZaRV/wDyVppwvnb4nqpR017KZt+ACsLbe9HwHVQgj9qf+3DFYIgU+5EK0da+1oUQBt9X
         sWtoeKKnmjOVKyLVAII4uemS8wMX+4d8cagd0Ex47+3Xiw+I1OE7LIuZKTAsC4lgV61n
         ZfhA==
X-Forwarded-Encrypted: i=1; AL+hErEhuP5xzWULpQEDj0w5bKew1T+6BGY6BE0a88bwZb/XHHB1TYalI43LgqFZkxancwXhT/U1B1+2Mdx3hRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bJBu03kzN7gJNQSKRNApKOxD4UrS60k4/+q/xb0heRwtILLLd
	NXB1YvaqHvuDKeABCLro6F9RxDdnDE6yVrSxnwASb9exDVGmMdMRptbHo3cEmN1j3kTBWDRJDxX
	RryJLNaCmWsLUGTEg4SKQdiSjqU4eXsq5O7g4LHkn8UAaD50j/BtUaoSS3Mk=
X-Gm-Gg: AYBFou0zLF9Cd1YInFuOxnqws1+x4I6a/6yQ7IB6YIsyF+E+60jS0txyEIeSAnQfgNO
	dL444ASKLOGV4HuPOeKTDxqa5jdA+KQOcdl8tWyXsJT0D8xYcYs3OrKAiSlIC5twKpKKBRqczAF
	jT2O1tgUsJuDrmyt24F0RNm7lZj/aUq5XvMtw053iUyi5W0v4vX+y/nC/nnRdxGYtPPTYlESu8T
	weFWmEg8wcBNIjfEJsAaaIUakMtJ01wR39KARMEJXYT9hE6wv8qcjbIXALbNxVN+jfJckpc6itN
	xuT18xYQ0tWvSTVIepL/Rfh06PWs6pAuNYVevENvXIM5yp6YuS0gaUq+vDbPOF9KyKv9ePIUu63
	j1n9xWzER2mXaA8m3K2TpPjPdNGYT/o3s0MHl22s+UFoFIyuZkCQ3BkzjdWgaWFgdFURzrokQ0W
	0WaiEwIctc3Nm9RtoCt60M3XQit2SYFVUPfUnV7+7965xYS+HBfbOM/ez5KWt+j7OsQx/nCELkb
	JeZqBzycJz+nAPNQE31EHl9UMYt3SFDmi/klVnZUgkiC8JZj8BtLyR6koFiJ5wnFAJ/A4D/gC+V
	qDjwBAlTonbe78din/JuwaE2JfV+VJRO6q+2Xg==
X-Received: by 2002:a05:6a00:188f:b0:882:fafe:9874 with SMTP id d2e1a72fcca58-8c87bfa59edmr1487082b3a.31.1795143504791;
        Thu, 19 Nov 2026 18:58:24 -0800 (PST)
Received: from localhost.localdomain ([103.26.8.217])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm749647b3a.31.2026.11.19.18.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:58:24 -0800 (PST)
From: Lei Chen <lei.chen@smartx.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Chen <lei.chen@smartx.com>
Subject: [RESEND PATCH v1 4/4] block: link request queue debugfs directories to tag sets
Date: Fri, 20 Nov 2026 10:58:06 +0800
Message-ID: <20261120025806.1065295-5-lei.chen@smartx.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120025806.1065295-1-lei.chen@smartx.com>
References: <20261009030111.57784-1-lei.chen@smartx.com>
 <20261120025806.1065295-1-lei.chen@smartx.com>
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

Tag set debugfs directories use numeric IDs that do not identify their
attached disks. Starting from a disk's debugfs directory therefore gives
no direct way to find its tag set configuration and CPU mappings.

Add a tagset symlink in each blk-mq request queue's debugfs directory,
pointing to ../../tagset/<id>. Queues sharing a tag set link to the same
directory. Create the link only when both debugfs directories exist.

Signed-off-by: Lei Chen <lei.chen@smartx.com>
---
 block/blk-mq-debugfs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 298387607049..78a91a1095bb 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -644,11 +644,19 @@ static void debugfs_create_files(struct request_queue *q, struct dentry *parent,
 
 void blk_mq_debugfs_register(struct request_queue *q)
 {
+	struct blk_mq_tag_set *set = q->tag_set;
 	struct blk_mq_hw_ctx *hctx;
 	unsigned long i;
+	char target[32];
 
 	debugfs_create_files(q, q->debugfs_dir, q, blk_mq_debugfs_queue_attrs);
 
+	if (!IS_ERR_OR_NULL(q->debugfs_dir) &&
+	    !IS_ERR_OR_NULL(set->debugfs_dir) && set->debugfs_id >= 0) {
+		snprintf(target, sizeof(target), "../../tagset/%d", set->debugfs_id);
+		debugfs_create_symlink("tagset", q->debugfs_dir, target);
+	}
+
 	queue_for_each_hw_ctx(q, hctx, i) {
 		if (!hctx->debugfs_dir)
 			blk_mq_debugfs_register_hctx(q, hctx);
-- 
2.43.0

