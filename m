Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442786;
	b=BjwGrpAwwPIHAGxiw6fKCOmXMnvEQZHbROD9SP6KoDvif9nFKTwZMBJ/HhKTEDnIMjMT
	 TCvzKCgf8XETO4w6IYmgEF6TuFBIXDNm8L5AXfyas833Jvb70x+UZ7fBp0rqUb5QEP/YA
	 5fYJzuCM1e9q5IvufQyMaIuka5nr3a5NRoKF/S6H9RBAB4/NxmoF3CYrmqSBRtO0eoKS0
	 CM+2Ui+GcpFmQzK8TT1bWasxUEbYrmDhQ5rqWniXR0zhaQzZAOk6bp2z48VgneZfhBLIH
	 7zjVQvpDDKTJvrNnw3fcA6SA5Qi4+veERTAbvaJ3R7GWsZZ46LZoJd2MHNWPxcs7Ucw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jrb5fUsOngtPTzC22BJAsemxm+H2DBi4a3HxR8uh170=;
	b=R2wrEkCZhdnqxv7IdVMIvFnXaQOW/7QY2gf8SjbL7LHvX1BslTA4XkDq5L3TjF/wr/8I
	 9H9t6DmSWcrnYTNn5KP1OBhjRuiI4FEtEXaOdfk21P0HbYCfvEzFykttNNU52XO3syxJK
	 AzPFmFF0yGp+rhR5XY2WM3zqAtqoR7NCw4aTlowRGY6Vyb6MEtpLyaEVpKM7XYkatMm5D
	 OnE6eOyUSzPCgmoRyTAZwjd+4wpyClyIVP1vmxBbr8nsuP2EzJcP+mSk3Ro+mZmvEkpf7
	 2B/X2ci0TFBTT15MudtFS6OzpRc+vbLkvgLqUe6CPYLfIrKcB5ARRr48sf8/wYPWSZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y4yz00N+;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FC1606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59FC1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y4yz00N+
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5569551d19dso45947951cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795442785; x=1796047585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrb5fUsOngtPTzC22BJAsemxm+H2DBi4a3HxR8uh170=;
        b=Y4yz00N+PbrIRD1bJ5rBgnwNetfiXb7ub1BVy8U2gtjlG/C8Q+4/HiPM9n/SRbaY0K
         ZVccXyuWhr/x+xpBJXeCk3htxdYzvSyD8I2hR/10pThxxNF2uQSWwjQ3LJk+7AZPaIUd
         4GkS44HmnXEsDoVSGLEXiB3dOvnkungB0Jw3rx9Gxi60bbwCs88rRmELBJRqwiN7bt1H
         pbZL1X/XuUKOkn5c06g3IsoRtITna9Tv/CS5yXRjY1EVTjTZgqYYjHWVqArkc8JRS+0l
         ss3nn/iGsExctm0nh6WBgpIxyVrgI+fVbCAyPPIjwzNBNwOoL30rZCt2XDhahYyz9ZLP
         vb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442785; x=1796047585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrb5fUsOngtPTzC22BJAsemxm+H2DBi4a3HxR8uh170=;
        b=vcYa1J0fGtWMKBQZveMugLDps3v+vfoH0Oj2Rvjekdj5JdR9WAr1GHMGJpPkGMAa4+
         A8QcXyRd4H2idP8yIyqghzhYpak8w6821+eopmXXc33a8pqTezq5tLwpf8GrKdvj+aQu
         Q62S6EUG2d9hZv4Gf5Igz8koE5WefzNIRKnZC2e2JW58Y7eaKHS1TYwOEyMB14w4taF6
         So9zLelQ29wwC5NagRqCCEaN9mBbsKfRaCwhlUoiIwKfvSdCseKBjwm/YgYzIqFOm9zv
         4KndYcoPipzGe2lXu6359CQYn2j+bFbFRemoOSzQs5hDKicLuOyZvD46aDunSmMer1en
         Q2Tg==
X-Forwarded-Encrypted: i=1; AL+hErGAWljqSmQGnGcY+QVeZOOowHwrVMML2SYUauD6NKPEfEIR7nyk8vxNeFXzMaV0++mxM4xdvMyTrQ/+0j8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DxDU7PFFGo/XYuyy+WXJpFm5tym6pJ8CB1WkH3s2TSULtrL8m
	xbSDOERz6W64Z9rjJWuPQ7D77W8XLe8WvbVlOuXrKiVio49vQ9R5UgWI
X-Gm-Gg: AZFdTZeDY8X5x3mE2zLr8j2yoPppeOyeEFeRVxYpCKcBqT0F1xZ8kNfpxgkVXuwTF0i
	qEcUKakoS2sG7hhjfbYSK29R3kWIvUO2JjAFMQZl3zz0Rg+33eLoJjLrdSiesr/E6gLoduM94Iv
	uCvT0iMy7jK58wnYOteH9njnypT5jrQsjUzarWUPHqOeXrZ3VClLmiHXscXn5dIwr1VhxJ7b6yI
	qex+bj0FLvyKe4nH+p/OIqTGt7sPHDfKFSz7traTCzJ+M//0AOu0Q0EONcWbEeTZjPLf72NRGdA
	oavmRl2LXCvMdgdfJ2a+qlVhJ6ue5HmI/jZRaxc8IHa50M5swm6xtl3hx6aiPFfZ4sBZuwaTL5S
	NucLKrGGkpL7jM4KckY0U6NaRmrQRpxQezz4CwyyaVEiz+d99oAEyzcxvqm3semEuWwEJNW/db7
	owEAuReVOsWwkT8phd7tORmqWt8Xj0aNmuz+C8xN/PjxvijnCLdJNBmGnx4jfICP+WYuJsoTTJ+
	sRnOZhxyCUZf3RrmwPHdXa+9lsQ7hf4UhRZplCrUl6o+NIgDau7cQA5YbRLjom32AP2E3Dz9LUQ
	4gdoRo967kkTro8Q6Ah8pABS0mLqRNqOPq38ANa6O5gbgLM6by+GmrLt9B1ownVOOsqXIVJrMEe
	GLjQkPu0JpCiQC3MY1Lb/D2ZtmKX5qVY7hpl2tWnLNS8TdLbG9pPGT6pg1cGFNm46auZBRnQBf4
	vpSDd76iGuBGRvyAYlz5hA2lzXzmw=
X-Received: by 2002:a05:622a:1aa8:b0:55d:2737:ccc2 with SMTP id d75a77b69052e-55d6fd24195mr215979821cf.34.1795442785163;
        Mon, 23 Nov 2026 06:06:25 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:c1e4:47d6:99db:6f6c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55da87b3ba8sm3313581cf.1.2026.11.23.06.06.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:06:24 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: Zhu Yanjun <yanjun.zhu@linux.dev>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rdma-rc] RDMA/rxe: Zero struct rxe_mmap_info on allocation
Date: Mon, 23 Nov 2026 09:06:20 -0500
Message-ID: <20261123140620.64393-1-astellman@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
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

rxe_create_mmap_info() allocates the structure with kmalloc_obj() and
does not set info.pad. do_mmap_info() copies ip->info to userspace with
copy_to_user(), so the 4 pad bytes of struct mminfo come from
uninitialized kernel heap memory.

On x86_64 v7.4-rc3 under QEMU with init_on_alloc=0, an unprivileged
user (CapEff 0) issued 300 CQ_CREATE ioctls on rxe0 and read the driver
response. After the guest had run ls -lR on /proc and /sys and read
/proc/*/status and /proc/*/stat, 101 of the 300 pads were nonzero. In a
separate boot with slub_debug=P, all 300 pads were 0x6b6b6b6b. With
this patch, all 300 pads were zero in both configurations.

Allocate the structure with kzalloc_obj() so the pad is zero.

The issue was found by Claude Opus 5.5 running Quality Playbook, an LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with Claude Sonnet 5.5 and reviewed by me.

Fixes: 8700e3e7c485 ("Soft RoCE driver")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
A reproducer is available on request.

 drivers/infiniband/sw/rxe/rxe_mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_mmap.c b/drivers/infiniband/sw/rxe/rxe_mmap.c
index a4ead89cc..ac851f245 100644
--- a/drivers/infiniband/sw/rxe/rxe_mmap.c
+++ b/drivers/infiniband/sw/rxe/rxe_mmap.c
@@ -102,7 +102,7 @@ struct rxe_mmap_info *rxe_create_mmap_info(struct rxe_dev *rxe, u32 size,
 	if (!udata)
 		return ERR_PTR(-EINVAL);
 
-	ip = kmalloc_obj(*ip);
+	ip = kzalloc_obj(*ip);
 	if (!ip)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.43.0

