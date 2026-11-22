Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351250;
	b=f/x5LRRO9ubythr+TkQi6IqpppmBHsWnmSR2c2dDsty0dvME+nIyeBvGFAaf+sDLDlCZ
	 79Yn2j31MtX5UwqVZ+0zh1y53LYV58dyis3EXF3LBUZhU9n13J7kZN1irh/Z6cIGH6eER
	 JRau71YV2Era+loyO6K+F/mqO+DF5Gu3tHPBiPJtuafR5pM5hfFw7oPiV1sXp3AYSATF5
	 L4ZBBwQS3ebo2Dv7fxb718pZPtXBpRSsfTh7i3XC1Zx4QDmxSSyGXjiYvKKxfy9RA83YO
	 ZqWkeXtYeCtUiZNBuLsnsRinXdR47FZwLirYguKt28cb8ABGYmG5tIZ6aBHT2skt1nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351250;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=DYQ7zJ50rb8VOoPYOra9GdI41CkUpWQlSUYJOOJtLao=;
	b=ldMh/LjG2Bz0dGQNZZs9TYsE7LHUYBD4smgBGaMkBQ4N1oq6Z8pUzglBdYd7Dal2JQi7
	 A/f3TrOLt52ZAIoT7ebZ0UsMbFqjhYlNO2en7aTQYn+BGRfl9J71eN2GVZUXuJcn3TprG
	 KZ0kaiR/I0MDm2q++CEN+S8YJww6nKq0aOCFXZZlJt7+pz9Ks2QP7tciTjk2PbobPf2sE
	 Q1dtbT+XZNt9Cln4QA56UxHZMo7KtJtLsh2UD5YLjFzTvc+AubciE22dewU0tVsXnA8Yd
	 OJRe+Wy8WjrKDc/pV+xFFIMrplMDK0XPXYGYd8nGFjQv7HQ0c0wunzie+p0SeQyMZ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JpX4iy57;
	arc=none smtp.remote-ip=95.215.58.144
Received: from mta1.migadu.com (out-144.mta1.migadu.com [95.215.58.144])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB06D606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB06D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JpX4iy57
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+yAiuIFYVr3+0OQE+cv2N59mSojKiu1LmTrb6IwrG3Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795351248; v=1; x=1795956048;
 b=JpX4iy57jR1Oy+mtvJ+WzEOhGxhglKiYt8Q1KEDg2tVnjpUSF5zoGMqBd/HFOe89Zb9h4wuK
 qZZ5JDcBTD5AwYB9nTvpjxJIPbD1Nx+mECWJvkWNPnd9JmkiOyqlklVumsD3h+fd1w6tkJ3POA3
 ZCslyttwqVdi+LP3SjS7DQUw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id f0288d815cd8398c;
	Sun, 22 Nov 2026 12:40:47 +0000
X-Mizu-Trace-ID: f0288d815cd8398c
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	urezki@gmail.com,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	chengming.zhou@linux.dev,
	corbet@lwn.net,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	linux-kernel@vger.kernel.org,
	baoquan.he@linux.dev,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v6 08/14] mm, swap: require zswap for xswap devices
Date: Sun, 22 Nov 2026 20:39:12 +0800
Message-ID: <20261122123918.3486916-9-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261122123918.3486916-1-baoquan.he@linux.dev>
References: <20261122123918.3486916-1-baoquan.he@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Baoquan He <hebaoquan@kylinos.cn>

xswap pages live only in zswap.  Without zswap, swapout cannot
free the page, but still takes a swap entry.  So the device consumes
swap entries without freeing memory.  Fail to create a device when
zswap is unavailable.

Acked-by: Chris Li <chrisl@kernel.org>
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 1f319e365b68..ba899e349e99 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -4089,6 +4089,10 @@ static int xswap_create(int prio)
 	unsigned int type;
 	int error;
 
+	/* xswap has no backing store, it relies on zswap. */
+	if (!zswap_is_enabled())
+		return -EOPNOTSUPP;
+
 	mutex_lock(&xswap_ctl_lock);
 
 	spin_lock(&swap_lock);
-- 
2.54.0

