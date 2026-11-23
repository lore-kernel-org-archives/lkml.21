Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443587;
	b=SY0LF7q3K9UTXZITawjKpewWp+/TAUQpa4CZG0Ivw61YnRJpHAVCH52/9D+ztSDIWe7q
	 qmI5xvADkTisf9ONkHv+ZdwDnxedDo57bHcuijuKA206qy4/DGkO/NM3dyQxroS6A6lv8
	 77X6/Y1ccNEzMSLSfq4TS7PDsryp7xP4OQgEVUi7NTlEUfKv4r6wXzVJA2vGdkHSfUrO1
	 RroptnV7TgVGNw66NI2cRSYkfAdLRbc/tjBIRDuPIJwpCfHX433+fZnifmgwKRs5tW70t
	 evs9hteq/quddOho1oZjIjvAA5+XFQlZ27gfbv1JPH7urH+eOY47FkJ8sKFQZdpluUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QkfpB6aPJNVrsOpvuqLtkcdraYbSYI467HC25kQ7nfA=;
	b=P4MMpZ4kOAhkDnbREo9EgcJOmlCgRDqtmyp+9bWQBmwfEUMBYWaF8hYKc3DhST9BBP2h
	 DxmAdImd2n0MDtH0aVQqArlWcmnAqeMHS9Gu1UWHAl1GeYmxG1TLn3Mdr/azqX0aYFDrn
	 DSAFxT55yduVAvbF7RObALtPPcqZJeWCwaC1o4QyuG4WdKJG3VlXmg1Eb18LIIfun4rC8
	 QAesHANJftY9PKuSYqo/sxL1sr6oLGrv0+OSs0HubXLCbKgEjhxDazz18yPBP6zxGu6+Z
	 ZnvOPsWkddXKg9qFqUO3fwLvgDmnm0Cp0rlc8RQrbyDRPo1wryeeKDL7U0ic+9jk6SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ex+6J2Q+;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD2E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD2E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ex+6J2Q+
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-380b40312e2so8142449eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443586; x=1796048386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkfpB6aPJNVrsOpvuqLtkcdraYbSYI467HC25kQ7nfA=;
        b=ex+6J2Q+kJIWVNtXyW+FJJalU8fFHwVJdnc2q1Dz5lsH+iChahTQYfnTKY/hN3spQB
         noM2EP2I8buPfvagx4GIva3BscwG0/DHRUW/a0ThRFc9JpvFyTIyqLxR8zqbMpEOcQQd
         i/dAOmYIC9HB28xKCVbewoqwFa3YwVV45J47Tp7JSBrg/aEa4etPXYP1+likJgmMqy76
         YEv2UB3UtKuuATWdj6N8qnoTXbqpzcbJYk27i873yKvVabOUzphFw2TsJCfVc5PLI9zG
         HZ+kCSQG3CRv9lxp6q8BxUkJz5ueNW6KmGtF9AV27AB36WyE+ADD6dp66faVbS8Uxf/p
         0w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443586; x=1796048386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkfpB6aPJNVrsOpvuqLtkcdraYbSYI467HC25kQ7nfA=;
        b=D2OOTR1P/fbcBItUnpFGWhUb30860Vw9nZOwxyd+TEwwMTszgptCF4MzY+XK79u2cG
         ZlVX9l7ImdA6BgIxCvNjdHgzsgtniGIdAmjdNiUwI0TpIYmISqOHwF+Ufxiv9a1h38NN
         3okNYCKKDn8vJIQnEeF42LxjdxmFeQ3aWXFFH4ErSqn+ZtS+Ey99J4rDdwaKrF/wgXYi
         aoUx6PasfqPit8+YJNj452XH3Gf+ws+nWzEab0kfunrVqomGI6VJou2LJFuqrO+fiCOb
         ZHV2XULi5nZlQQDGXQaoHXIm/dnqsV5lFGF6oRpKV+sBdpqtchn6FpDJTuELEsQRvOLS
         26yA==
X-Gm-Message-State: APuU4Z9yNpV92Vfp9M8V1uZLSuLGeQn20AqXBGTDmgbINbMLLQZja2BM
	Nmz0QJyYQnMGRbECynLoluawEVlG38utFfhNjJOKqg7cIaM8p53hpzlh
X-Gm-Gg: AZFdTZeCbo0ogPFSMS9J0gb1uIJQahGeZJYu/fCYlJpFrdSglcAAfxSBIJB6s6Sv8DT
	nBBLk1fjiMd+ici8hl7OSKM0phZFtJwPIsU4tPbFoLhJ54EVgXFg8lqYIZ5HJ1Jq98A9sAWvnNG
	AchTTQKf8S0zQeu7J7jgECnlaJ5IxX4WpWJLV4WexzvFmkf64CMJDt5+i1IWMtTYgKPR81SmZAs
	SUyh9lwfGBk50/p0XIvazpXiimemVvtvfOLOb4hv+/7xJxv9M9fYAn+ahk7gE9Mosimr1+z3Rkm
	YXspFFssTAwps5XFoh7/dLU7R4/lcMFz3sWj9YWWohjiTIhPG517Iqpk23TTwfpRDoXfQByBI7E
	nI5vQOkHMEhaTxjLYLzSz0SXiNV4KtRGly2r1H/BI4VUkMpIc+Wzrqxdyu8Jp/pBGSGacP3RR6k
	ncJRNlPP6tBtjMcV8JCVFyG+YljBpm1vUkcCfQaNEpJRgUlYh8fXUzhKqfsJwFVO+379UxIpPs+
	hgBw6QWbYTsy/KNX5ddrVuueQLZAc8dAI+nR0dTBhP3hrLvFxNcXAsAnLRldIAd+Wc1PSf/t6is
	zUhxlSGVSqt/9HqqqbEhPBgrkbxI3Dx4XK76PNcZCe9NoVFlgnUIDds0NSOYyJibLXPA
X-Received: by 2002:a05:693c:880b:20b0:386:b025:1e1e with SMTP id 5a478bee46e88-386b02522d2mr3390054eec.16.1795443586180;
        Mon, 23 Nov 2026 06:19:46 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm12602179eec.0.2026.11.23.06.19.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:19:45 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v5 16/19] mm/swap: reuse per-CPU queue readers across priority changes
Date: Mon, 23 Nov 2026 22:19:35 +0800
Message-ID: <227a1e9b7213652ee5eca947d2f1c3da88462dde.1795439990.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795439990.git.lianux.mm@gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com>
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

Inserting a new priority allocates a replacement per-CPU reader array
even when earlier ring removal left enough storage. An unnecessary
allocation can add swapon work or fail despite sufficient capacity.

Track the installed reader capacity and retain its high-water mark
until the queue becomes empty. Reuse existing storage when the new ring
fits, initializing every valid ring index for the new topology. Prepare
larger storage outside the writer only when growth is required and
recheck capacity under the writer before publishing.

Preserve the existing prepare/install ownership and failure rollback
protocol. Device removal continues to avoid per-CPU shrinking allocation
under the writer.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 7d932035c961..0c4452fa53ae 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -201,6 +201,8 @@ struct swap_queue_cursor {
 };
 
 static __percpu struct swap_queue_reader *swap_queue_readers;
+/* Keep the high-water capacity until the last priority ring is removed. */
+static unsigned int swap_queue_readers_capacity;
 
 static inline bool swap_device_masked(struct swap_info_struct *si)
 {
@@ -240,7 +242,7 @@ static bool swap_queue_needs_readers(int prio)
 			return false;
 	}
 
-	return true;
+	return swap_queue_len >= swap_queue_readers_capacity;
 }
 
 /*
@@ -288,13 +290,15 @@ static void swap_queue_reset_readers(void)
 	}
 }
 
-static void swap_queue_install_readers(struct swap_queue_reader __percpu *readers)
+static void swap_queue_install_readers(struct swap_queue_reader __percpu *readers,
+				       unsigned int capacity)
 {
 	int cpu;
 
 	lockdep_assert_held_write(&swapon_rwsem);
 	free_percpu(swap_queue_readers);
 	swap_queue_readers = readers;
+	swap_queue_readers_capacity = capacity;
 	if (!readers)
 		return;
 
@@ -430,7 +434,8 @@ static int swap_queue_add(struct swap_info_struct *si,
 	}
 
 	/* No ring at this priority: insert a new one at pos. */
-	if (!*readers || nr_readers <= swap_queue_len)
+	if (swap_queue_len >= swap_queue_readers_capacity &&
+	    (!*readers || nr_readers <= swap_queue_len))
 		goto failed;
 	new_queue = kmalloc_array(swap_queue_len + 1, sizeof(*swap_queue), gfp);
 	if (!new_queue)
@@ -458,8 +463,12 @@ static int swap_queue_add(struct swap_info_struct *si,
 	memalloc_noreclaim_restore(noreclaim_flag);
 	kfree(old_queue);
 
-	swap_queue_install_readers(*readers);
-	*readers = NULL;
+	if (swap_queue_len > swap_queue_readers_capacity) {
+		swap_queue_install_readers(*readers, nr_readers);
+		*readers = NULL;
+	} else {
+		swap_queue_reset_readers();
+	}
 	return 0;
 
 add_to_ring:
@@ -502,10 +511,9 @@ static void swap_queue_del(struct swap_info_struct *si)
 	}
 
 	/*
-	 * Shrinking the small topology arrays is optional. Keep reader storage
-	 * until a new priority is inserted or the queue is empty: per-CPU
-	 * allocation must not run under this writer's noreclaim scope, which
-	 * can grant backing pages reserve access.
+	 * Shrinking the small topology arrays is optional. Keep reader capacity
+	 * until the queue is empty: per-CPU allocation must not run under this
+	 * writer's noreclaim scope, which can grant backing pages reserve access.
 	 */
 	gfp = GFP_NOIO | __GFP_HIGH | __GFP_NOMEMALLOC;
 	noreclaim_flag = memalloc_noreclaim_save();
@@ -548,7 +556,7 @@ static void swap_queue_del(struct swap_info_struct *si)
 			swap_queue = NULL;
 		}
 		if (!swap_queue_len)
-			swap_queue_install_readers(NULL);
+			swap_queue_install_readers(NULL, 0);
 	}
 	spin_unlock(&swap_queue_update_lock);
 
