Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057849;
	b=jaw8J0b0zpRMRyiAUMApLxyTQmrSMzxRv/dF6xqvkKxzc2zUPD7GIwBeqJbxSTrwMovW
	 ll65jBdB1YO0RBe/o0T2Ii/Rb0C+fnJiTAQBI8c2bPQVg/GJzZAIAI9gbe390WvEr36Ca
	 yyoRHCuA2/PWDgxH9REPQJlPTA2mg6vKcmy/PVq0UnXHz9rIUh5wGkQ8Fuad7ZQuBTzlr
	 e5kRELT4vUQE0CnYNLNJh3Vc9UOKuPCqiXt/daM8vmgNjW1BHnL3Y5RYlPE5mIYSFfloG
	 /2o0gmm19b+agIhXEnO+DxBi2Pkdzpcy3qfO52K3W9yLKWOPQvbwnuMiDI3p46qKisw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w1YOVY/Doh6e0864P1i6+EBgq5MNuINhZbLgi234zvI=;
	b=5ZBxkBrf+o/Rn9SHQqQSXHYn40VNDo1fWdbRt1NSFwhb8PbqwM0SsrSUMVh6iq0zh5YN
	 pa8JOPJFTmZwK+LoE6SYGhQBu1Io6i6w+KN6ikmKe7/F9grYpmm3/TSI+9WTJ+CfywB43
	 lJED5eOhFxHzJeHaOP6d3LllgAuZpZNFwSUAo0dK2mjbLnYe7VD8zLU3DWse7/44P/YmY
	 0b6R+YWiuZZChENta/epXSdF4JrHw28BVa+hfY5orYnjD6XY1dVNxhAertjXMQ7r9YkaK
	 9uINZMBTBcxlIZzdNZCCqyxZDxf7tIISSB+YYkT71Aw29pZqOm/rgbR/pjONAqRyEZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OjMOQRNd;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC2060A2617
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC2060A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OjMOQRNd
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so2732937c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795057848; x=1795662648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1YOVY/Doh6e0864P1i6+EBgq5MNuINhZbLgi234zvI=;
        b=OjMOQRNdJeLJg5azmRkBB5RW5pkDklRxxPZrFuCIDm7OU+S7G0Dg/yw0sCsiyypQOq
         g5xFwpHBQw+6l4NiCO7NbmKg6AneWrbRGdHARf8ZFk4QN5SLNKVuykO2/bTSXbM9n7wS
         PRlHLWhQK7XaCIYZ/4kT7Bzamg1H+6MXS4pSobmIYryDP/dTloLkTJ5ZIc58S5nTyGmD
         kq/s/VbhA0BvrG1n42/nx7ZjP+MPi06M/Uryt3Rvb+1niar2d2c/UA0gIDyK2IF5aI53
         +Rs8tq6Iobqrakn+myFQo+BV/UgeR9tZ16VpC9s5u0UeZYPoXW2jcFOwUO2O2jRhpEX9
         Mp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057848; x=1795662648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w1YOVY/Doh6e0864P1i6+EBgq5MNuINhZbLgi234zvI=;
        b=2AZQ+rgN34abkLbGnT56MymbclLQRecK5zb0Sf1acmHqUaLiGFBfNyV5cYxtuMJ7qN
         DvWq9SlKhLDk/LytfxSX9bdrqGaYijM6Pk8uEjaMi+qTISA3kDM6kXBKhzEGc7qHULdZ
         7hodNYKxo5GSJg5ZzqdJvT3OblF7u5HLQhBpqA0jO44tDSuJGnfkJkAgZEZlhmsu8xHL
         jFi/YTRT5OmM7NePBgIRqvJoY3tuRiQL7FFBX1f9njQMtCbPwdjfa+GiCTfantssGsjI
         iEmHlb85UzODk3u1YLXSu2O011ZQGQqh6zT/aa08hdbkKwlRcp83QqiuVkWEh8NR0oXo
         bIhA==
X-Forwarded-Encrypted: i=1; AL+hErGGOlw7Sk02dO7qRdz0gAngoq+LucypceoDC8O1MnSkEGR19mfHg/RTeqF+XgaR1wB1sZsLns9lrPijxMM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jogo/QpERy+1qhJZxBWzoFJT8cUD3wJ1xjOWIK6va/IR0byC/
	LHXmbwXAdobmwkxhJSmCBwy5SQ9k6Dsx42eWiFl6nCgMhNKgfFh2YmPtBzJf3Q==
X-Gm-Gg: AYBFou1qPNd+loL382TRZGNK5oggRwVKkppW0D/b62FVUFIvf18N1QyTE0VkRSkIZfP
	1DbzZomASe+LsniL0UsZU4ormnHvxRGfPSwNQRyfJiDtEayPG2d08uUxgyoi2bTx7iskV4mgMOW
	IfDIRNi/b9Ntwuu7sBMcvjCbsxMZ+1F6ttoI/k0Ykojn7b2uUNQdrCe5Jm3EVkqlfkqo/W7qCHQ
	h7yT1RcueIQvXVg5ThGjxYg+9RpnEHlVuTFxz1/AfTLdoe6GQTS2FVu92d8H1iLtVuGchtv9da0
	45vmcf6Jdz6EablggBY6DxRk45zdJvUYld8eYakhs1OzjLL2X2GO/zelwhZF6duvdnPtBLKSTtz
	DetNiMjzV1R87kWGBV7LjAWdh3uIAwaj9w6y5aJVN8LSYOP1qUuRif74qqMYeXCyyMgNqaZG30k
	aLidANztMB2mwVFSTOnqNGTsoNatWYXgBJaaM187RAqYcDwD9QNokjBL2STDdKowYyPKftfsSR2
	+zeryDLjQ2uQvcpFVisGiNwn8LVH/tweRSIRwWAXcS0zmdGm8Sfs46hoRzpD5PV6dKVwZQIEpHc
	c3JxHt18rZrYUtjZhKOYJZfKti0NZInGdq53AMNpMUKb5a1jZg==
X-Received: by 2002:a05:7022:4183:b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b543be5439mr5394453c88.30.1795057847918;
        Wed, 18 Nov 2026 19:10:47 -0800 (PST)
Received: from MacBook-Pro-8.lan ([27.125.146.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm15028118c88.13.2026.11.18.19.10.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 19:10:47 -0800 (PST)
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
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] zonefs: ignore RLIMIT_FSIZE above LLONG_MAX in zonefs_write_check_limits()
Date: Thu, 19 Nov 2026 11:10:26 +0800
Message-ID: <20261119031026.7985-3-dingf3ng@gmail.com>
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

zonefs_write_check_limits() follows generic_write_check_limits() and
has the same problem: it stores rlimit(RLIMIT_FSIZE), an unsigned long,
in a loff_t, so a soft limit between 2^63 and RLIM_INFINITY is negative
and every write fails with -EFBIG and raises SIGXFSZ.

Keep the limit unsigned and apply it only when it is at most LLONG_MAX,
as the generic helper now does.

Fixes: ebfd68cd0c1e ("zonefs: Fix O_APPEND async write handling")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5 Frama-C
Signed-off-by: Ding Feng <dingf3ng@gmail.com>
---

Notes:
    v2: hold the limit in a u64, as in patch 1.

 fs/zonefs/file.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
index 319d950..c9293e3 100644
--- a/fs/zonefs/file.c
+++ b/fs/zonefs/file.c
@@ -399,15 +399,16 @@ static loff_t zonefs_write_check_limits(struct file *file, loff_t pos,
 {
 	struct inode *inode = file_inode(file);
 	struct zonefs_zone *z = zonefs_inode_zone(inode);
-	loff_t limit = rlimit(RLIMIT_FSIZE);
+	u64 limit = rlimit(RLIMIT_FSIZE);
 	loff_t max_size = z->z_capacity;
 
-	if (limit != RLIM_INFINITY) {
-		if (pos >= limit) {
+	/* No file position reaches a limit above LLONG_MAX. */
+	if (limit != RLIM_INFINITY && limit <= LLONG_MAX) {
+		if (pos >= (loff_t)limit) {
 			send_sig(SIGXFSZ, current, 0);
 			return -EFBIG;
 		}
-		count = min(count, limit - pos);
+		count = min(count, (loff_t)limit - pos);
 	}
 
 	if (!(file->f_flags & O_LARGEFILE))
-- 
2.55.0

