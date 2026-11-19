Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101211;
	b=AZEnEdP9OFWSHTN29V8GdUrv1ZRqOg+GGD6RlOpOKoXQ4vc8wqlC6KCKFoQmTPbixpAP
	 5jPKD2QuFFAX4cjgHOKtGovpPIAulmT4XLX55k3Z+TjBs3TgvYQX40RH7xL7PDq70n/DH
	 2Ajysks6GfpfAnfSFc4Msf2UwiOxu1rlBJ+d5OuKoAVqk+eJ5wppJuUbGoTitkuScIAbx
	 9v1Dhia3dSsLxMKWD8PIFhIQgTjorA7x493JP+VQ1/j9pF9gTBt5mlBp6RlxBldnsOlSQ
	 /vHTrbnw0L2ldXQBOO/dWsrUonWIuC4uvYI97wxEsYMvgEMoJ5loAzVrUoc7x90eSgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NPAAhd5Z1XLOgPjtVPbAXMB35nuWOck8Yvyy1q9vcpA=;
	b=fNoYj6GxV9KFQoPNJJuttcMOJaSjIK57jDxiPX5MeGIKOStxNZFEjRvrfQaxLz766cUz
	 eQGjFPZ/l+DFcs2lVecVoGgUXIH30IIHN7cup/TA83BiZBvEn6t3ncHm5q8QDX/wCISZE
	 45exwKN5PBW1Z5Eo/Oo/fBWtbgZFZrrVgTsCN6PXRAUMV2gZxUr4OLq7RXVi+GPB6wecg
	 xOZYrskCvgVE40JdgCl+DL2BQBOn52zEn3o7VlKMO3mwdmOGcrP8EoblvKr9ThpWeOE0L
	 eJQiR1pS7/s5zQTFqYncgJooC0yC7Ak4bbU82kIKEvQ+APdcW+1ruvJG6nJ8T8Hm1jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m9y72N7r;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7BB606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7BB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m9y72N7r
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9495c633eb5so154573485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795101210; x=1795706010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPAAhd5Z1XLOgPjtVPbAXMB35nuWOck8Yvyy1q9vcpA=;
        b=m9y72N7rhWtG1yZ4EgJX21sPwOO0BQqE4pxTYM9+4N1xL9xtR2tfZKBZk2/r7nZNq0
         OFW7cP7YHA/Ua2LqTnDgIJ/D92G4lTcKhcjhmj/IwIKqmlvoUDuDR30Jjji2S59ODcr6
         pSSQ/crm4xbFXXTZxL+/GkyIYoKrRVgXcgoEojNupBE9mfFMVTc0RD/zZG59w53mR0JR
         idnzyeLuj4sxOZmBo18QOi9pv5Hjk1dakyDOhKobbc3jYkEqgs4K1BBlhcjxaBgmzs8n
         R9aIj8jZtmzlP8VQHFDqmC6ZfNH+ChxbUu9ejurJKgjmwrofnxAtlDm4Yf9CP3tr6o84
         5PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101210; x=1795706010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPAAhd5Z1XLOgPjtVPbAXMB35nuWOck8Yvyy1q9vcpA=;
        b=LCnU612dy36Ow5/C8o7J5BljFlMRntwd0Z0+mPP/PhOIhGoOhdhmiMbEc53qOojlOW
         An6a+GT+r47eQBX+QwWlEkxHcebIUPrE/5DH6YfQGzfJz1mzTnK9ODq+pU2cam53ACAa
         ozZDSySUixu8NloXfQyeGYsUtnyPnjg5VtD4xxybfb+ZCIUy4kf0uFMMwvUluZG3tn4j
         AALSV+N3AUFx4U32rNAdu9Rwas7bXZ4AXTCpyOKrUjfkh9D4vOLJfNmnuseA2lda8Bs0
         ItlYADewbLH8cHbsEvtVD9cRx+XhRcCtpTRgtE3PuRqgdpcS5m13bH7CHQ4GKL82izRt
         lQMw==
X-Forwarded-Encrypted: i=1; AL+hErEB1srlccpLUNqajPTYXntUlbjQCQLLb7MlOQGuzWIxAxSkQjxzDQ7h7fZ/1gxnBVbDYQqgad9lbJ9ksnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OhdnJSsL+fghJaM/V5BzLZLSF47sI+78OrUaUZl/2A8OTLrsv
	vh3u/TJ79qvjZor3etHH3Tz4BacVXhoUi6JOrhWZ2JOM6HSvz3DavzgZjIcXWqib
X-Gm-Gg: AYBFou0nvw6k5SkKY7fTY5zfqMzTmwRbeZiOjnKPiZzMXPlDCCluAG6iFtNGEKiqvTp
	uECnkmJs/T4MkuuIXbrALzsqcO+UtBeADtSHlJdA6hwF51IcDI0lCKVHxb3ktSejTMkMKZnDdWP
	RMRvrqKH5mZEAImfi426Zp0D3tFF4UIPdRrMvF3Um6BolXCyIMBIr6HQyO/Wn/fTi5gUHoMmsqs
	GtyD71pzRU3XjJ2zlZGpF0014vcvB6doz7ovGrWRmG/mHEGW440b4ZdC7E2DD8zoDwV04YSPN4K
	lR/qMEiUzqujOirNu7fGISkmbRkaLsxEoiZt+OJjdw1vSEd0+HymbRp3pUKDkLGAWEwkU1TZbA0
	SnvfSSoH4IyjmXcWo21C0vQUZEueLZ13RukqtA4oW4kDvFigJctCtxulIrbtThGM0SxeDdM19bH
	PqtAa70JI4mnVUCDF+4AFsyRMzIrokfConMvq+doMVAlMZZFcGPH+iBww0vQe6cjoEPWJ8gTFfY
	VJK9Hz3mu/qX1FkTFHJuYFp/eRzvHUqmmLrCuQY+kyVMPxV5Mw2zoGKrfXzom3EjM9+NXMzjyQ1
	rAJyE5cidg7WcosHCmStf0zQVFmWK/DcKy4B1cZaMoC6v3v1Mkcn5zpXNI9AFsK2ufWunXThNpi
	BlWNnqNO01adzMn4Es921FltKKCzYE1QJq4ufzGtbuPo/udeRAdGgKl6WflZkLoBYQPy5xGoTEd
	gJ6HRehIJd3/JwxylD9kyUNDc7/Ks=
X-Received: by 2002:a05:620a:4890:b0:949:5c62:e78f with SMTP id af79cd13be357-9499959d372mr1158164485a.25.1795101209851;
        Thu, 19 Nov 2026 07:13:29 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:c935:f347:a919:9f78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949b9a44123sm13915285a.20.2026.11.19.07.13.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 07:13:29 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rdma-next] RDMA/rxe: Fix NULL dereference when invalidating an unbound MW
Date: Thu, 19 Nov 2026 10:13:27 -0500
Message-ID: <20261119151327.95446-1-astellman@stellman-greene.com>
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

A type 2 memory window has no QP or MR attached while it is in
RXE_MW_STATE_FREE, which is its state after it is allocated and again
after it is invalidated. rxe_check_invalidate_mw() rejects
RXE_MW_STATE_INVALID but not RXE_MW_STATE_FREE, so invalidating a FREE
window reaches rxe_do_invalidate_mw(), which dereferences the NULL
mw->qp and mw->mr.

An IB_WR_LOCAL_INV for the rkey of a type 2 MW that was never bound
panics the kernel. So does a second IB_WR_LOCAL_INV for the same rkey
after a bind and an invalidate, and a received SEND with Invalidate
naming a never-bound window's rkey.

The first case, run by an unprivileged user under KASAN:

  BUG: KASAN: null-ptr-deref in rxe_invalidate_mw+0x156/0x310
  Write of size 4 at addr 00000000000003b4 by task kworker/u8:1/30
  Workqueue: rxe_wq do_work
  Call Trace:
   rxe_invalidate_mw+0x156/0x310
   rxe_requester+0x20d4/0x5640
   rxe_sender+0xe/0x30
   do_work+0x144/0x470
  Kernel panic - not syncing: Fatal exception in interrupt

Only invalidate a window in RXE_MW_STATE_VALID. rxe_invalidate_mw()
now returns -EINVAL for a FREE window, as it does for a type 1 window.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with the same tool and reviewed
by me.

Fixes: 3902b429ca14 ("RDMA/rxe: Implement invalidate MW operations")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---

Tested in QEMU with KASAN on v7.4-rc3, and on v7.4-rc3 with the RDMA
code from rdma for-next (7404c82cbf12). The reproducers are short
libibverbs programs; I can send them off-list.

 drivers/infiniband/sw/rxe/rxe_mw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_mw.c b/drivers/infiniband/sw/rxe/rxe_mw.c
index a2e3a6ce0946..82a20a96a351 100644
--- a/drivers/infiniband/sw/rxe/rxe_mw.c
+++ b/drivers/infiniband/sw/rxe/rxe_mw.c
@@ -228,7 +228,7 @@ int rxe_bind_mw(struct rxe_qp *qp, struct rxe_send_wqe *wqe)
 
 static int rxe_check_invalidate_mw(struct rxe_qp *qp, struct rxe_mw *mw)
 {
-	if (unlikely(mw->state == RXE_MW_STATE_INVALID))
+	if (unlikely(mw->state != RXE_MW_STATE_VALID))
 		return -EINVAL;
 
 	/* o10-37.2.26 */

base-commit: 7404c82cbf1246e0e84e2ec21834d23c26f9a8ed
-- 
2.43.0

