Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516569;
	b=N4UiIPdLAi/96kccYL9trwsLXEtcCAaNKnW9/4JExW+d17W/c/aGQcbcT8z2o3IewCe8
	 c6UhsL1iicMolgxDSyM+aoNtdL0Za5XSkVUCSGXC2zxRXVW4QAJgjr1bxZUQE0IG8M32a
	 LjffVEGWw+SEz2Dfeelp/Mr+Nwo/HVtfHF50Xnh6xxpjYfPO7KByvZoaKVtcVqbnkIbHM
	 aWJzS7LtBlIURrwrbmeFxUOutM/r0TxXruWemRq3V9+hUMF51y3KGD8eWfrWrZ3TA4ces
	 GgIPZVPcoTii1D4rHovtjLtMaEEhFT8ma6jnIPGPg7WleteFkFnuL5l/TCA5YIV9u/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2+HSkOtOU1kljM1v3ikCzTVJIjfkEJGNjipK7N4p86Y=;
	b=EMFIHuxDM+pu5Ud7J0q/BehwvBZ7h/4VuLTT4Fm3TS81OptFBMJmRsPCb/7lnZMMLcDF
	 nat/awyOIrzMQh1EnLp2HP+4Vaix/Bd9qC3nRp0sQbNUOa1Pb0BwdS9k1D+t7xl3zoFef
	 0Y0UZUm0SLVDltn6JWtLvmTDokePstMxeotZjfRS5CivBHhBksB9Q0ZpZ5UDBHPWw7rQ+
	 sA2SstFipGcrfN+v10PqL4CcfFOqDLrnUGE/7AomhT0PrrBclbjBNCxmIZbSRAcJCc9zz
	 1CDg9VvFALl4313CLoqSsvPbxa71DZw2Jdf1S95uwdZSiHqthrRSqhr7XZ1RChKtMnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bu28w/jw";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFCD606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FFCD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bu28w/jw
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so55768145e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795516567; x=1796121367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+HSkOtOU1kljM1v3ikCzTVJIjfkEJGNjipK7N4p86Y=;
        b=bu28w/jwTIfb21GVEMo0GqvKyj4hNRPCml04a4XI2W5+iXWoj/Lp3u+KDc+cbsFwrX
         ZzKLgH/kC12yGTZL2iXgaRjqU3oDCxUiskS0ElFrMMemS+jL3BuxsCEn4pRuE5LkngBP
         caKNy70UyspHh3iaCbyB/QjxjBy9gQcdYIavQUuy+wyWLNMaH/ijIOx4OedGKLxdOsHT
         yZ18Vd8m2oMeBt3bJU7wBs0YKThrTyZ1juo5im5DNd+eJQx8E9dbPqzWxrTChVYt1QxA
         mE7gKEllcyFTtI0Jxk7KGBUwnYEdKIsAimV4yfWt6i71aWl7Cu0qF+g25rs5UXfJxc+w
         MS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516567; x=1796121367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+HSkOtOU1kljM1v3ikCzTVJIjfkEJGNjipK7N4p86Y=;
        b=OsC4rlWYYq1v6MKa48qa6oglTPFNme13fMhCzh4kQe69SPecKu7bB3nmrwkDdxX1qq
         8qDiRyKpE49PINjprlupAX3GZojSvG8Jkc6TX78EzLaCyJmFwWMqEGO4CeTA0T0drqeK
         k7VCsQOu/tX6Gbd9huSKbeUJLhUJwMn7Phuuxnag7hykCT6ttdTjCqwVB2l2yFyugYlx
         OR0oKXsxRdpRNN/gl5aQ/RJQkAm1KtbnhUh2qem1tMy4WhttcYNhiNxq5LVei0rjEFU/
         VWuuMJCSxz598JIplJJCtovNQjRMbGbiIOPZbhZuGYbUgo0NupDsP1/6vzsr3FZ3/Ex3
         X7iQ==
X-Forwarded-Encrypted: i=1; AL+hErGdYRHZhPvOvLb7/bFm7BHKyYgL743VgsUhv7YTDasD14JSWuujEE5MWO/s6l+Fwxo6WpiFq9y7QV4s3E8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rLL7mpAjVt5hg+9MawEZdsSzzFRG2IXlLPv5fUYXYPiV5On4V
	Y+ozRu76UnPUYrK8r8Nr38CCkzn6NUw9ihMOsxouIi2+P+qyFFhO21M4
X-Gm-Gg: AZFdTZdHez4/bIF7g8Iv+pW02CeEuDehFrTCaW7OQXKxz7wG9Majk4QuY+2+ZdeK422
	MrUP0WgGjE3FpmZE5WhKvmwrLoFB4TtSKlpu3rXGkZC4ITZeYqWkbWAqhRfJ5AnpfLmGc5ZZuGa
	A5XIYaJXjFU8ywnR/DPYgp+Yf7iaVfEBs6wUwRnVea7m/amkW/U8tAOh4qBwiL7FpU6CE/A6tzY
	stGim3hohsqDAkCj3pZ3rRIhiPSLrrPOC+hGvoh22EVfnFbs+ZO0brvwnv2L/gm7esW9rOf9CM0
	IAlo6ofHPmp5UMmVH1aie2l5FHpn9K/9LHLhW241k6wQRzepX6NiHV+DLJ8icgpcF0X1LNh/20k
	n1Pskbm9bx0wil/uM5CKI4d3hhnVwBT3nSa/+dcvk7n4ya04N1jr7Ts9vgpEVFrv2KeY2kgBLLG
	+AMVZCnbAz9I7afau/02QTxxgREGPw6exobFwpBSnEdc4KOrdIYlSyF6t3SvkkuoYwX6ikqCOHU
	qQW2Jcu7VvlkQap5cLP9DVEqEPsZQ3T3WyGM6gAhEmqGm6hnxruRGB4E7+xmkkDyS92OagsSw92
	bzEebpFQ/c3orDw2hkWLwP455pL/Y47jqxrQX+Su6NTrD28j/B1Yy0LYzG4N1QcieirY6kdkFki
	daURrr/0fltpUalaY0yg=
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr275755005e9.7.1795516566777;
        Tue, 24 Nov 2026 02:36:06 -0800 (PST)
Received: from grower.termidesk.ru (ppp91-78-12-234.pppoe.mtu-net.ru. [91.78.12.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895eec06sm165954765e9.2.2026.11.24.02.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:36:06 -0800 (PST)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Martyniuk <alexevgmart@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH 5.10/5.15/6.1/6.6] io_uring/io-wq: save worker type before dropping its reference
Date: Tue, 24 Nov 2026 13:35:59 +0300
Message-ID: <20261124103600.39642-1-alexevgmart@gmail.com>
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

From: Kyle Zeng <kylebot@openai.com>

commit 37e425460b7c41687e51e3254b1eb1d799da9614 upstream.

io_wq_cancel_tw_create() inspects cb->func after calling
io_worker_cancel_cb(). For an existing worker, that call can drop the
last worker reference and wake io_worker_exit(). If the canceling task
is preempted, the worker can be unlinked and freed by kfree_rcu() before
the callback function is inspected. KASAN reports a slab-use-after-free
read in this path.

Save whether the callback belongs to an unpublished continuation worker
while its reference is still held, then use the saved result for the
conditional free. This preserves the existing accounting and frees only
the worker allocated for the canceled continuation.

Fixes: e6db6f9398da ("io_uring/io-wq: only free worker if it was allocated for creation")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
Backport fix for CVE-2026-99804
 io_uring/io-wq.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index f57743d911b4..2692f5ef387f 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -1232,14 +1232,16 @@ static void io_wq_cancel_tw_create(struct io_wq *wq)
 
 	while ((cb = task_work_cancel_match(wq->task, io_task_work_match, wq)) != NULL) {
 		struct io_worker *worker;
+		bool free_worker;
 
 		worker = container_of(cb, struct io_worker, create_work);
-		io_worker_cancel_cb(worker);
 		/*
 		 * Only the worker continuation helper has worker allocated and
-		 * hence needs freeing.
+		 * hence needs freeing. Save this before dropping its reference.
 		 */
-		if (cb->func == create_worker_cont)
+		free_worker = cb->func == create_worker_cont;
+		io_worker_cancel_cb(worker);
+		if (free_worker)
 			kfree(worker);
 	}
 }
-- 
2.43.0
