Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412874;
	b=t3nnKR2HYoicVGSr26YIP5g79eHdjdCe62JNE91/arsl5Ys5csteIq5SAtenaiJPpVe8
	 Ixl9j7/GIWj3s8FtjAmoB63U4YE+SP7Uk3ipg/taVHPsv2/gKRTEiW8URGs/oI+v6Fl7L
	 Zb5rTeLlVR7mmWXj+7qtialGX7RmSFsicvsV+ucBwTW5ZHL3dmCNZVjx6CR8W3tMaB2d5
	 qxvLeDhNTAkyJ9PekQVHLiBXLjmTMcLA/rMqggI82p0qoNMybW75D6D9Mq/Hs4xG/nIHC
	 +S9MNRDe9xC/Od/AYKKfCjVQNb8ianyzM/5Zu7os4lhJn4aguM8k8PESAjgr24xC6Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KVYLN2+U6McWuEiDknSvpcPzmASCRN8tM6SVo97GcMM=;
	b=RNOKoxOOcMXl1nOl7dac0sHGZMu7MfAd2kk0weFuKmrhQ+2eCUOZJKWNxVURz9zlROBX
	 Sv0sevaHCFm+Y78g8DeAcBQ17CnYZWil1OV2mfz3nYu69osNP2ZXnAFLuCgT9TIBxfTTV
	 jzf7Urh+pT4cbdHOCcoJ1o//gk/4yo1UbeIBNzLlSB5CZPEFbnuq9PRzGsAdzYWb8c4jE
	 TPMJpXEnJd1T/VkhJ3UC4G3fR0MKUCo+JhFRcaBy7ofGcPl63Cn+PslgWNrJ4PLOOYGs9
	 RWgtwEefYnNE4SSSczoc40hDXo53u6Yvr8+7IemnzISnX6weHgGUEiLQk9l29NH6jqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LA1IhQpA;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16567606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16567606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LA1IhQpA
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb9f760337so1939901a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795412873; x=1796017673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVYLN2+U6McWuEiDknSvpcPzmASCRN8tM6SVo97GcMM=;
        b=LA1IhQpARwsh3UOKKJFoQ2D1ETT5e2wfLE2nVB013rqS3TPN0DhLAtL5jur/pqoHaM
         I4i03kwpxrw9XCyg+X8WS9n5sJ8gop+Rl6Dau7YLoOWAzmxfLF/3dz9nAb+TV/BWk7Q5
         dIAEKeKKpANajTFwozjCBDBaQo8GTzVvDdVGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412873; x=1796017673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVYLN2+U6McWuEiDknSvpcPzmASCRN8tM6SVo97GcMM=;
        b=U+/ENkM3+svIl7ZarECKSXZXQTQZpCRIvx62aZiSWm6mI3HIM9FS/p6qMAgsFJMmbD
         icWxndIPceNaMf0OrcN5bk+ZRQWjVwRiuO99twL5+UUF+a3GtyXaASg5tzQtXtyxH7nF
         GBxDsy5kNUGO37/522qZNZHAw0C3YGRLeiRF0lmZRCvQ67NifqKDfLR2S5Z/TCMcXx8T
         kWOGde2dwRd3lA6ZTI4KDVOGcOcPyPjwMFsDeM2DIjhfCuNbnJjY95UxFtjkc9oUWw1z
         IOR1vuRHHWUpCVJHe0yWeI7hNUk+zsF7P67nf8hSAxyDWGxGyCgI077cM7Yl6F95JPjg
         y7kw==
X-Forwarded-Encrypted: i=1; AL+hErFFkndeXivmzzgf+L3LPAWEb9Mvl9qd79tKxQw4fz0K5C06jBVvT0fsA0jkyi3iN3j2szFNe5jXDGdciLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YS/3WQfzBEoQ4iUPoRKS/EoaiTvtftuaGsJKOS/3n27xoOBCX
	9ZYvWSaJtttOx5f6OjCyS4MNnmSTHn4gfwvBn6np9PqopOyDcQQvbgWfwGnuyEoq98mtesGg2wD
	vrSM=
X-Gm-Gg: AZFdTZfiBFVARktQIJKEY0hBUS21hLEJkT3Vr1QUIXjG7ki4fI29BnZx+6l0g7umJwi
	Ypza2aF76IdKAMAPh9tjX9BaT/DULjWk4BymFU2Ue3zdyP5I00KzRsaYANu46Gk3JiGL4f32BpU
	2q1w7/UZlSbGpp3hrBl7QlLMpxPvVFhwjMwktTz1BURWz4kLBGi50YsyPQ48fW06p1g0Wat8iWD
	l7uf5bDtgVQ2K9TwzK6FTL+Yl883XQsTzXSMG9QZvt2/GLkM2srjx5UMFkSXd8Gh48arG42XWBW
	hWf6SMdqpnIUBwev+AXXBuXRWvRytSh7Dri+5ygZamyzQ9BkeotMn9e8AuGWIpjN2jN0gsyHH6w
	OiqtXqrWNlANI6VBK2mjSdozV072AXjsQixOaGP9YoiTTjnA0RZ+Bj1gFitNB/1mPCt8dBYyUkh
	ufDXoGsBDH6XKJOe0LQ++4BfhXUDyLe0GSuZM48a1wxpxN1xIBSrwkOCfdGns+SwKAgi6nYCcn0
	z/k168M3BPXuKPivxoiqsyu5dyqrIuqNg06u1OS5Fon3PODXDB7nvXHYeECl9vMMDajyhl5qdnw
	DrA7xcfKFl5ODJc0h6cxy+RsVB0C40LoLaZfxDuBvUcM/eIrtX8mPM4wiVATuDl8jqReBP1E6eb
	1mIaD4QmFj1T/EoueY00=
X-Received: by 2002:a17:90b:442c:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3b41c92c161mr6622325a91.24.1795412873376;
        Sun, 22 Nov 2026 21:47:53 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:d8fa:c511:e415:e0d0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm16240267a91.13.2026.11.22.21.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:47:52 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Hongfeng Chen <hongfengchen@xiaomi.com>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 0/2] zram: zsmalloc: speed up zspage free path
Date: Mon, 23 Nov 2026 14:47:35 +0900
Message-ID: <20261123054746.2579253-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
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

This is a followup on deferred zs_free() discussion [1].  We cannot
do deferred zs_free(), at least not on the zsmalloc side, due to the
fact that object handle is now stored in-place on the client side
(zswap/zram entry).  There is still a possibility for a speed up
tho.  One is batching of zspage's pages free.  The other one is
moving zram stats into per-CPU area (as was suggested by Hongfeng
Chen), which reduces cache lines bouncing in zram slot-free
notification path.

[1] https://lore.kernel.org/all/20261016120927.3191690-1-hongfengchen@xiaomi.com/

v2 -> v3:
- clamp negative stats to 0 (Sashiko).

Sergey Senozhatsky (2):
  zsmalloc: free a zspage's pages in one batch
  zram: keep the hot statistics per CPU

 drivers/block/zram/zram_drv.c | 99 ++++++++++++++++++++++++++---------
 drivers/block/zram/zram_drv.h | 26 ++++++---
 mm/zsmalloc.c                 | 52 +++++++++++++++---
 3 files changed, 139 insertions(+), 38 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog

