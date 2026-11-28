Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876074;
	b=3xXBSF8GbTDC7Xaefr6ZLFxpRnFIPjXpPeS9E4WIJbury+3l5TKnyUrjPKZkl7F49mwy
	 BXpwKbwRwYbrO5AgtibQgaLjkCRuQfXLtSKslQY44cf/B0bf9AxgQqiIbaHDyBn31a1NX
	 dI1nnz4X9b0Gg5oEkcryDZbAeue/vuz3wxmv8fbAuMkeJe6bnXYOtYL4aNAKt8jNj8jpW
	 RtHpUUNHtK7U2JJhStsELoojNdOq3f4NmXq33YC3bq3YPgMhBNSlD8JWMqL63Xl6UstHj
	 QdVAIesKwOlLSEj7FAed5fRpOlxDR6pzJ/u1PQGu+iFH5hf+bhkbqOOP8pYQsHCwlQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MkgKFbzxRvqlDBlKVb19mgxF/hamc+QGmi07NyAUxmk=;
	b=Q3ECO/dsmu9BDLln4leGrBRb0TwIgakJYQy4smHbnXVnNcIzPzvMRwOSzMxiXWRaR8ob
	 4Se6S3AlRodyUtwgrl/02ZGzl+WnwwPFQhbfBSBqaqAWtK6JEZWnITXFTu/KAWC0cEteA
	 NsTr/3Q2/rVzT/ChqnQJSK3cpE0/UdBqjd486WOY6DaQiGkG7Aph4Z2gzpkv2ix32jtGt
	 CePzco/DKO/MI26rQM1SNstRQxyePv7o9yV6Tanb5UgwBfJlP5YChNxzBJ16KMjKvoQJv
	 ten5W8yChX1c0+AvotrvG+07reMykYKkospoVrv2vLbpBnPIAlaobfqv7vU/V9B1bQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rCu5y9z/";
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39586606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39586606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCu5y9z/
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso3527442a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795876072; x=1796480872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkgKFbzxRvqlDBlKVb19mgxF/hamc+QGmi07NyAUxmk=;
        b=rCu5y9z/rp7OY3VQW2Z6OFQD5U01/DHLLY4eGc8I09Ek9/D0uchdw84eR5ZRmrPxN7
         gb3QnGZt4dLvOFcrMmqLV1/Uvz2SElZZb8MU2VtkmyRXpkY1xhl+mOlfov3PDi4P75Qr
         4tcfVNusp2PeRAIzY8QUSW8FIb8G146D30PNDRcz/rRVV8wxvg7fNvp7LtyYvIEEnB6d
         qy2MJQoc05an7AeVrrr4UNehmAwieSXhlhnitFsDzzxRYyQuWsQZJDKSP4Xw92IT7DSF
         0P15CAhlG/Ik/z1Lo73Zf216Dyl4bSth/ixWaF7tZuKA5RdYYmUIcprSAkPmwRGjba7P
         BOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795876072; x=1796480872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkgKFbzxRvqlDBlKVb19mgxF/hamc+QGmi07NyAUxmk=;
        b=rj2VjAidnXGZRFZfbv//EUvwBwzYFwd1Kwr/IsiCCbmVTd8iW/1DruKevh3ta5jKjC
         esYph7zmO0oi7SZFT1LxXYm1cU2iaZPxdMPueIHKgG+9B8gkYE4YMQdGm0bG9Gk7pod+
         Zkp4ST4OPNQLi1RWBddLHkFMZeTm55k3VBhykl/RGpVnQaWqJKza6+I7yP1LMiXKwUYn
         /hCx253PZu3E1OBrg75T6cPJZKQG620QWKFLNMVNB6Vakv7QBqmtT5Sr7TFTEVKjUu5g
         9vhuO5UjfLc16HNXdiX4XwU/P0kCZVv/6r6bNwObhnac1DEDMyIbW7SJUDRywSRVyVPb
         d76g==
X-Forwarded-Encrypted: i=1; AL+hErGlY9eMs2TOalxZc53a7kDiJStEzPHJcogB06g7Yif3J8LD5VOdxZYHp/ye4u0gMWoZmc5UiKCqgwYxK5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D31aD0MJrL+A2w4WLHqvehAD2MvFFNL1GPDg9sE4vmJtfGVgw
	zIreXG0MYjpa3PZHJB8W9pobKp5alLEG5AxTHCewi/TwBCtfxB5wwwjj
X-Gm-Gg: AZFdTZfDHlkqU7XsbDVL6FZaBIgHEx9z8L2A2wGEHV3amr3sXoUhvPzSi0y2GMOFFyX
	7KCdNMUAuVGtErbwlBqpBTabDsZqmEnT+az2r7Mlo2qkdxG/c96MYV2/7KfE31Lt5WT0aLmXuc2
	09ysYeU4DGajT9KLL5fP/kWqEAafby6M1nOHc316fqOp/trY3kiAeDuCzFG4P4BBNLd+LDZOUAu
	aWx4c//6GgcIEcoiLu9U7Ytg14xGldBZrMf7bM5rRYJkAsCdg9ybDmAZptAyVd1yDWE9dmTSpaa
	og2I1J/UwxOIMqfVIJwLlPnZ7a3d+L1w7Gag6dcx5H82STfj4EUvY9W8N4wd1o0Wt8mS0/I9Ylw
	LsoUJ6DPXlxqi77vcU+tZmX5RYDD84BmRUbJJr29nCrRpVR+dhjVF+FQF5T0NCJ7uLhnWSbVEcP
	IiZE0l6zvbmJqd+3chlDYzvcQistKDzopsF/dBAN7Flqqz68HamgU+9aQZlKsxXm4UV48p54buX
	QXEwFQT+g+Q5zjJEh9w4YSSNw8nprEeFFSGCqimFx/bCy0cHHf0ZQ5ZITcWvMO7lMcq68MAffFn
	NZBjod74ntmNgGHu2opoRhg3vRGA7VnIcYdagm06BBLWNDdSrACKwFFIGjRqwRav0yY4O4EY+8y
	kCyFy8NCiA1aN3d/VcF1sYXTPUxSc3vRh/E5uFA==
X-Received: by 2002:aa7:df08:0:b0:6b7:1c:eae6 with SMTP id 4fb4d7f45d1cf-6ba37d63d91mr14903374a12.10.1795876072181;
        Sat, 28 Nov 2026 06:27:52 -0800 (PST)
Received: from kernel.. ([191.40.25.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e35ca6sm12448436a12.4.2026.11.28.06.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:27:51 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH v3 2/7] rcutorture: Require debug_objects flag for debug-objects test
Date: Sat, 28 Nov 2026 22:27:24 +0800
Message-ID: <20261128142729.3756679-3-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128142729.3756679-1-kunwu.chan@gmail.com>
References: <20261128142729.3756679-1-kunwu.chan@gmail.com>
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

rcu_test_debug_objects() checks for missing callback and barrier
operations only when ->debug_objects is set.  With the flag clear,
execution falls through to the test even if those operations are
missing.

With CONFIG_DEBUG_OBJECTS_RCU_HEAD=y and rcutorture.object_debug=1,
the trivial flavor can therefore call a NULL function pointer.

Skip the test for flavors that do not set ->debug_objects.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/rcutorture.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 67fc770abc102..1648e6369d809 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -4774,8 +4774,13 @@ static void rcu_test_debug_objects(void)
 		return;
 	}
 
-	if (WARN_ON_ONCE(cur_ops->debug_objects &&
-			(!cur_ops->call || !cur_ops->cb_barrier)))
+	if (!cur_ops->debug_objects) {
+		pr_alert("%s: %s does not support debug-object testing\n",
+			 KBUILD_MODNAME, cur_ops->name);
+		return;
+	}
+
+	if (WARN_ON_ONCE(!cur_ops->call || !cur_ops->cb_barrier))
 		return;
 
 	struct rcu_head *rhp = kmalloc_obj(*rhp);
-- 
2.43.0

