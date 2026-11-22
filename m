Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329752;
	b=xYIHPEpIXDsJxPvMLu+oqtliHzRwsRSghU3SYaU+4s7VgoGL3adDSqVQjVnqv5gyOiG7
	 /rvZmukg7BFtqrR0o+h7SA2Pxt1rnbJt3yycUk/TNqRC6Dce5D/dzeEBaoAWwnc1TgQHV
	 s9V/BBwZ7Aee2l0rBWbkgfv+7BzX5f7seLzKYp9NvPd6qFh3KZ+s92WI3C3JR0pAQ798Z
	 ncQLzR/CPbgsWh3ci/etpUsV01NHOT5RjPs7fLKcy2KsyHjk3OQ2+H3jNkWiBQhHECyoI
	 rZL/x0+Adt1zSHyjTbe4+BszWWM46U7cCz5SBA8xsqNCOy9w9IBNtAp4qQT3xgssT0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AVCB0HTxvq9FD9Zr9BvahtZR+AMCtDmJhUDjR2kvGM4=;
	b=1WgCXvlWIpAa4dv3gLmt5IpWtWpYsxU/tdjVeZPYfiVND4/oqWwOcIYAM1SdJmzJxPlB
	 Lgi9Vl/BTseClRhe6H45gAhFpntLssrrCdGmMRrhWik4WfFx+8UOdMTzyI8XG39rwI9sa
	 fmgz96t4imlcRzkR6drTiu3a5Ew+VHByoUE0DkWO+9e5+fNK3xfGphvKIdsESgr29Fkbw
	 OmDGKaQrw9PTRWfekL+TnH/IegsrmWXWykj99bhDcmRS7Dgen6VB8ISy1ugRh9cmCjGUt
	 m0o+Q4/kYbkTIiOUJyVLNYbuOZ40VRvZosVBuGwdFuJeKyVQ7RNOG6eABgvEAMWrfgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ywyM6oUy;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8318F606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8318F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ywyM6oUy
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so26856115e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795329750; x=1795934550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVCB0HTxvq9FD9Zr9BvahtZR+AMCtDmJhUDjR2kvGM4=;
        b=ywyM6oUyz76x6mwkCve2+pHTwiP5a4/k+93GHzzUVrarrMdmOyzeNZGofKeGIbY0Sl
         58QgHWIYtsHBUwKDM8S9/lHoJTYeIJyWGyXbH2FLgwbamPRP4pxNtDZYDFwZI773qYsM
         NXqLotGHpcxIwIdqrt6nFIrTP+f9Mu4gFo6zPTZZOXcw+VXbs8Peco7twgSCsN+2izMa
         CTfq1PRnq7etNRwgE9rQ0WuzgEX965SmCiChq9YgR0QsnmkdfOyxRQV7aC2smlyk6qHO
         zOZVjtMKQ84ixZSr/QNsZeA8ogfLZXyWuIbHIyBZ3J4yaxBdpoPDns4CW7aHatWdbf1+
         FCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795329750; x=1795934550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVCB0HTxvq9FD9Zr9BvahtZR+AMCtDmJhUDjR2kvGM4=;
        b=KY+j5ufa7auV8Lm3rhM17CSCmpcT6RbV4mYfq0iaPq3+DmElHrQw0G8xQrPSHvYNk6
         iPs8nVSd8MGzlIkiie9yTj/lhyYcMin0HOZzHC4uhRWse9gTlqmdvcU/ZNDze5uy92Qr
         g3cKxJMfavm18ePDYm4CspIUY5nyN/k7c9FfSQH5Yl2IOObOrhLcmWyeazBon/hC4OF0
         HrnE/W39txEtEOheVkke5fK14OEa41/UuyC6im8Ei1B2uDf6DaC5h5juMVOQ4hcdSYxA
         OvXJW6jC4FvuOodbJgfdyiWtuI5WlEHa93n3KkQCjAGqYxY///kCXuoDgh2ZIuEkq6pq
         607w==
X-Forwarded-Encrypted: i=1; AL+hErFPV/qCjiwEWjR+C7yMysXS5dVor46FmtQ410kb7WV3d7vUCSym+Bk6BDjHyHh0uC1Zjy9YG/I4erOIv4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VxTM5oAa0A20RTTWWrzydo7xcsILXNEaFnvYhuibkW3JaeseA
	+0EjsACjpV2ZjykE7R4JCQwTI9rgu6KTWQejMPUwik2aQ8WdXB4LC6cG
X-Gm-Gg: AZFdTZemgJ5Ff9N9Gf8SkLfEXRiRqZibzMyF7QPB0keMpofTU5v0FhgdGUzY9yMpec6
	KxNygF9817Gf+Py1drs8+Tbk1uRseUGCsYta46nzr6GjSGdt6ibW6f+j61FwV6eZq6xQJr7cHo0
	BN37Eo7Dc1xYMUYKsn4c/Uz30pluxsLB16rQnKb4dqqy0AOH/UzFBks3pVtMxgGR33JUoU+ttvi
	izyniygJBh4OlQ5bTksFhXsjVICMPu0fFXcpu9auGTx1+iuGKbUCLie8RS9TTGmiun5sw2JWBQ7
	nPkhcUMqtEMCF+ox4D5VOgHsCa2srql02GbEFR4LWrFZFFzOEBYPXrwfPB7rlEpqiimJn2LVKyx
	WuTpRNuUUfMBHOTD7K8soJBiVMfRoJd+O6Hcx2YeFtnx0rkdRqYpKD5CuDxwvQFhBQbDZ0ZiVlP
	lGoDm9pQ4WvUbtWbIX6feq5T0Ar8yoYOpT68AB9I6lyUnRLqynGS3fiFVgpsg3t0Xcz8ST395Pa
	0dpmrA4e5Q4cQX7hOH5/0Rx1+pA0iMPAKYYSQURj3w1KZQBXEe/GTAPEUpcNQt5ig0fUo0d+W22
	9Nu/CpBq5LXiuHgkiiMygNk/q8IX/ZGZsYDIybHoUA==
X-Received: by 2002:a05:600c:310f:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb8881f9b7mr179283065e9.34.1795329750289;
        Sat, 21 Nov 2026 22:42:30 -0800 (PST)
Received: from localhost.localdomain ([102.187.134.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61ddsm13745986f8f.12.2026.11.21.22.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:42:29 -0800 (PST)
From: Mohamed Dawod <mhm.dawod@gmail.com>
To: netdev@vger.kernel.org
Cc: vinicius.gomes@intel.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ye.zh-yuan@socionext.com,
	linux-kernel@vger.kernel.org,
	Mohamed Dawod <mhm.dawod@gmail.com>
Subject: [PATCH net v2] net/sched: cbs: fix 32-bit overflow in transmission time estimate
Date: Sun, 22 Nov 2026 08:41:55 +0200
Message-Id: <20261122064155.2094434-1-mhm.dawod@gmail.com>
X-Mailer: git-send-email 2.25.1
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

cbs_dequeue_soft() estimates when the transmission of a packet completes:

	q->last = now + div64_s64(len * NSEC_PER_SEC, port_rate);

len is an int and NSEC_PER_SEC is 1000000000L. On 32-bit architectures
long is 32 bits wide, so the product is computed in 32 bits and wraps
before it is widened for div64_s64(). For a 1242 byte frame the product
is 1242000000000 mod 2^32 = 754451456, which gives a transmission time
of about 60 ns at 100 Mbit/s instead of about 99 us.

As a result q->last stays almost equal to now and the packet sending
time is ignored again, which is the problem 'commit 961d0e5b3294
("net: cbs: Fix software cbs to consider packet sending time")'
set out to fix. The throughput becomes

	idleslope * port_rate / |sendslope|

instead of idleslope.

Measured on a BeagleBone Black (32-bit ARM, CPSW, 100 Mbit/s full
duplex) with software CBS (offload 0), one UDP flow with a 1200 byte
payload (1242 byte frames), sendslope = idleslope - 100000. The rate
was read from the qdisc byte counters:

	idleslope [kbit/s]   before [Mbit/s]   after [Mbit/s]
	10000                11.1              10
	20000                25.0              20
	30000                42.9              30

Cast len to s64 so the multiplication is done in 64 bits on all
architectures.

Fixes: 961d0e5b3294 ("net: cbs: Fix software cbs to consider packet sending time")
Signed-off-by: Mohamed Dawod <mhm.dawod@gmail.com>
Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 net/sched/sch_cbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/sch_cbs.c b/net/sched/sch_cbs.c
index 1c93469c56e3..107c2b6e9da3 100644
--- a/net/sched/sch_cbs.c
+++ b/net/sched/sch_cbs.c
@@ -222,7 +222,7 @@ static struct sk_buff *cbs_dequeue_soft(struct Qdisc *sch)
 	if (unlikely(atomic64_read(&q->port_rate) == 0))
 		q->last = now;
 	else
-		q->last = now + div64_s64(len * NSEC_PER_SEC,
+		q->last = now + div64_s64((s64)len * NSEC_PER_SEC,
 					  atomic64_read(&q->port_rate));
 
 	return skb;
-- 
2.25.1

