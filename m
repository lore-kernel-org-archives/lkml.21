Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131009;
	b=d49gbR72rhTaQMvSJrpS0a4l72FH40RXw+e6sZUouOSSQPY3TyJM6Itt+j++7baVESl/
	 Mmpc8r3wln/PYVwswl1u1kR766nDq03Br4tgm25/Db4co3EUapxmflGPzIZ9wHfvNXWCB
	 +K2+MGELLEd759XgJlC/nLxKrtGFSL0ZdpaGH+la8RzAzXRnlSsz0o7XIeudkNCTNjRU1
	 GEu6GUBXnYFGt9xAEUMX6VMlXey9CcJscKjkGa0/2k9BulxnnJ4w5sTa1PoysYLUD3hWa
	 bO5CEuNDeZO9cHXyYAHHsBKMXrVw8h7a8aEHI6zdqsId4IDivqcoLvtZqYulyHnS3zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ea1gJLVhc2AO1s67WLIHygzyGKJ2RI2yud9cLOuT1ts=;
	b=eT7GEgwuBjoF0gBmytmZ7ptquzp7DxhTih2JdeKpf5bjC849xNKf3dLk3GL6blL9yuGW
	 gex9FgEF8z4m4tmCvwm/rCezoLK6qbhMwExFqvxYHGUQ5+kyprDvcEsq22gHM+QdiIG7t
	 mQloC+qx8oOuXzAfnstMeyt+SBJ2qouZsg5urZbEBnmngavDRR8MHFdn+XuRQ7BtAEwF7
	 LafseSyYCqEc47IzH/5uWjoM92syZAydBKP8WWeyn9TUOc00vFMrNQ5LRATbYinFUAtSw
	 wDwfUAHjh7mZzjk9BeGck7xobBZKg8OTOiLbDimY06NJgFsMj9WoUei9gBhmB02Irlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asN7KogE;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6939860A261E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6939860A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asN7KogE
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae58d17cd9so327471c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795131007; x=1795735807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ea1gJLVhc2AO1s67WLIHygzyGKJ2RI2yud9cLOuT1ts=;
        b=asN7KogEdB96Lzvh3BR5oH7SonpAuK8Q2/X/M8t/crF2IPtJoovK27hdTnMt/868+D
         TlvSSoQnPXoxVLQUX6pbtp+CEK/iNCQ2sCdAtBuCn12ID9Sa6CMD+gAkoOTNtsZYIpWD
         kBB23MWbIvaw/oBLvyUxwiSeAVOBonehR1MMIwFJmBJ3rJcuDTAzrdUuUrgibVQe5Gu+
         YM7VLIXm+p+jSM8Mv68Z0hbhMPQ4MnjDt+jHjKhJt/bK2xMOWPh9/wTsLuVfh+zKdvRp
         wXt3wfZdhL46pF5G/40RYxoUecauz7ILlISDElM0d6d9amgqwsDiPefYW7+cdMo7X9eD
         kq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131007; x=1795735807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ea1gJLVhc2AO1s67WLIHygzyGKJ2RI2yud9cLOuT1ts=;
        b=Hrmw1xhhwuTosIza06cCXvPKd3wTDYkttr8mZd7991JJmuztxBUKeToYyGX53N/dmU
         yTNiPx76SE8nAlW/XnGKtTMH/Yt4mR6MXcfuKi8G1PIvfYp7HrjuRpRWQfsrQxAhxaYs
         OlYJvhyZMzdDtSvJJRvTz/5V888fa3ZK+0WQCKPJzjHENICf5a9KiesDIxeyv6wEITcf
         urw9YuhKeOJTONC1FkFuZkvVMB3Fqllg4Nw2dQh/76jog7X6lwtOWbNoUp4u/XZuFg7G
         e0d8u/ES1/2Q6E6osKKUjchKzfn+GG0EbJddnZhI0gdn2ekRpyoDMkU08GS5H4Mdl7qx
         1FZA==
X-Forwarded-Encrypted: i=1; AL+hErHWd7my/eqYUY8X1uyH+SpoZys4CuC3G4vWSjjBKw+DyIRlegNyOEe2ys/RgFVQyKPzDT58MZ2hcWjqrB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QQVagMAtJ0K+umQ1lLo9XC8tB3PN2JIIXH4d3bxJ//fD98dL6
	qVJuYcTP1DWVykCvxegdT2S6t6B3aEW6yo+KaaEvNyq/+X5UEcT3Y7We
X-Gm-Gg: AZFdTZcO5Ob1b4cdCZ26OUPieukSa8Oo56C+5CLOE2cZ15snX8eLYlJAvq4rrpvf5VK
	FLtSivVDo7JqqDf0lCZG/e2+5Mdd9g+NOrMC+gCz95Fd+oNSiRgGcWlbcbeJdZrXgZPZYIMVte4
	As6kbmiaQIRxtZErdwNOaiqLZxwqTdOGigkofZtMO4PwXAvqG7xmtHddYYC9LcwxIdoAvBSN4Ba
	EnTDQ/0SGURWCkLBv5Oh/BxpBpof1p2B3boF7jz17A6oLcJetdz66NaTQWr4FO7ErdPiwdYDuIC
	rYnko2iwkyd6BXyjtoI+Xl9cZigQoI9hDGQRS6EME8ZN2G/JZlHMhll9R0UpEZOBCACzD9JHlEs
	VT3fiyADRAEJMq73UGYFRAlXxoUrZ8p9rCvV+lVkI5/8+zrshB++KaCSSdQ7HJJJuDOteNQUEp7
	NFO3eJL6/GdRuvis8szxksFeY89Z6/Hn+s39cM9wNY8ylVbNl7SflwnE2uq3Bp5Yb6Rdejy5F8v
	JrNaaqJZXMAwbRk4NoDJ92TZwTf9dOiF8cH14XT0z0KDsznLnFi6w1BLexHRr2xwjniCP/YqpI+
	lR7dNmvkuLjYhO4RFOml4UW86A3t2STzRrpeAAaBqWZCt5SUPmzDhpZe8MtpS+NzOVFDhXRrMmu
	JTIHwlwBP
X-Received: by 2002:a05:7300:8816:b0:381:5fe2:8008 with SMTP id 5a478bee46e88-38571b071d3mr821602eec.39.1795131007412;
        Thu, 19 Nov 2026 15:30:07 -0800 (PST)
Received: from lounas.tail428e48.ts.net ([157.131.129.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm176015eec.20.2026.11.19.15.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:30:06 -0800 (PST)
From: Louis Thiery <thiery.louis@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	linux-kernel@vger.kernel.org,
	Louis Thiery <thiery.louis@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] io_uring/net: don't charge the folio offset to truesize for managed frags
Date: Thu, 19 Nov 2026 23:29:35 +0000
Message-ID: <20261119232935.1708458-1-thiery.louis@gmail.com>
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

Registered buffers backed by huge pages are coalesced into one bvec per
folio, so bv_offset is relative to the folio, not to a 4K page.
io_sg_from_iter() adds PAGE_ALIGN(bv_len + bv_offset) to the skb
truesize, which charges the socket for the whole run-up inside the
folio. A 64K send from 1.5MB into a 2MB THP folio adds about 1.6MB of
truesize, and sk_wmem_queued fills long before any real memory is used.

The visible effect is a socket that looks full: with a 2MB send buffer
only 4 of 128 queued 64K sends complete before the sender blocks,
versus 30 of 128 with the same buffer registered as 4K pages, and most
pipelined send_zc requests come back short.

Only the in-page part of the offset matters for how much memory a
fragment ties up, so use offset_in_page(). This matches what
zerocopy_fill_skb_from_iter() charges for the same data.

Fixes: 57bebf807e2a ("io_uring/rsrc: optimise registered huge pages")
Cc: stable@vger.kernel.org
Signed-off-by: Louis Thiery <thiery.louis@gmail.com>
---
 io_uring/net.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index 533afd335..8afad1b2d 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1501,7 +1501,12 @@ static int io_sg_from_iter(struct sk_buff *skb,
 		struct bio_vec v = mp_bvec_iter_bvec(from->bvec, bi);
 
 		copied += v.bv_len;
-		truesize += PAGE_ALIGN(v.bv_len + v.bv_offset);
+		/*
+		 * bv_offset is relative to the folio for coalesced huge page
+		 * registrations, so only the in-page part of it matters for
+		 * how much memory this fragment ties up.
+		 */
+		truesize += PAGE_ALIGN(v.bv_len + offset_in_page(v.bv_offset));
 		__skb_fill_page_desc_noacc(shinfo, frag++, v.bv_page,
 					   v.bv_offset, v.bv_len);
 		bvec_iter_advance_single(from->bvec, &bi, v.bv_len);

base-commit: 0659e44ce739ecd856164c75a5325b7959a2921d
-- 
2.43.0

