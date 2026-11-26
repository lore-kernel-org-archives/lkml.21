Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795652562;
	b=IhNslz/1W36G8rUDEJdFtpt/bbb1cE8tJqQz1dOzrrpRA8xAzRRdl21lKDrHN6VZBZTf
	 pQnOJYy/3+BV3ZKTm9vL0CDkX7Ipz3KpHOm5/w/TLRtzBbpZhxEfChIOSNeZkD3qbm8j9
	 LFZJhjrV91OMLvp6oNwVG1tuOVaxVITU3O2yH2RJeJZmdj7MXWsDcJ/rwAyJiK8XExEVB
	 D5zozvb1nTSltHR08KCkk6sB7NYm7MIghJRBUd/Bl+J+7Zvt63JZFUR1pkiwgrMg6neBu
	 3D83gyZbT2TOPT6OlmwGZ8yb9tqd343alsxfodPU0OfMg+u3MR8G9tJTvoOh83A/oiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RvV89/qcgojhFu+RPZnXe+UxBxtm+exO0xuVGHxO5L4=;
	b=Iv3h8j//eA3U05AIF346jchMG0Bp3e4D2foESioxMYbKscXD2+izXL0b2Ptas9LvHeKL
	 wRrROF9aNOdL7RZr522kKHdfm00ymTnUCdM5CYlW8/Jc8305Lg9MSisZfG0KCxXG12Uag
	 K1J3tpk7UdoVLm0+Nm/I5eWiPGIF5PQcbQcQdTqhIbDuZqrSBy6ag5gg2WYktgyoLE6HA
	 9lG54FyUyYvfGC8FSD0noqNtuWQjUNj/i6AFNfbuhTpDGAExGOHsUq5/tZNUJ+PwAxyQi
	 mIP4FA0gs59LUUg5IwXiZNxQDCwq/4Fr5m0Gwr6RIsZUz+H+9C9OzXGH7gl5FGoUmuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=swOLv2Po;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FC0606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26FC0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=swOLv2Po
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so8637298c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795652561; x=1796257361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RvV89/qcgojhFu+RPZnXe+UxBxtm+exO0xuVGHxO5L4=;
        b=swOLv2PoVQfp7z0bWusZ1lYJb1ED6n6l6s0V0iFQrQ+SfblhZBYgl2eVq1PibYWMPq
         wmG5JQg6LaoHuWNcHgw9I2VpccmTMYHzbjAq7So23lsSk5gAHy5XDfmP5AoHW+o1Im12
         PFpv2+aPJytV2sA5DJREEuDBp4RwJ0cjqoj9N0j5LBWI2HEu0eSzXFwK5MsjpBwPDLyo
         U/wugmgwjip8CNjVuGbjfx6oGZaTG3KQnr0Rm5+3SZbVrxgXq5Pd9fqUiiDtYDO/s/rm
         5pAmaaSqcHMUTSGI9HCqBtOTFbfsFoDTqkOL+IlW92G/V3g8vreFdNqN9REiCRSkC2is
         BURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795652561; x=1796257361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RvV89/qcgojhFu+RPZnXe+UxBxtm+exO0xuVGHxO5L4=;
        b=qMR04PlxH/0GoGry5IFjDVVeozMQ7Kb6cevigGTvKqcNpcZoodjTN1/HxE7FzloRAX
         0XY35guf1z9kIGl8NT7wLgxP5IvbzYGKGqiFlcQ9g1ic+o2LZOWB8IRDeuMihFeVKXN2
         2GxAshE8jsd9K5hFWfU3WFaDt0jB4YbAfaj/aJ/dlUChwpVmJXF3tjoG/vBdi1U18/Li
         urr9q8a7mefhPWRlucRXWnfu1rjx4YqIIFsDLVvD1gQ5hExlGO3ZVqswWI8r9147XqsO
         DVdMku/l+SABIeab5dk3I/QOkpsiobVU3w103U2HH3gcoqUd+msffBDr65oqMBcAmrti
         RpgQ==
X-Forwarded-Encrypted: i=1; AL+hErHagJF8rwkqg6FnaEV2LCYIN8YsQ0lGoXoy1tAOnFoQF07CwY5tsPzAtuLqln0VgvRd0rLhybDBZV++rUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KbN2ULMPVGCC/+9FxiDZWwGwEc0HLhwC5FuAlzbnnhF3dG9ne
	95bh715+qA/PQrqq/7IBVt52jEHJiWZ879dKucJaPx6lfB2XtuufKzsW
X-Gm-Gg: AZFdTZcPTXQgKv6cmS1xkoQ57MVTS2UuWDeO1X54dO3/ArkvNOO4kltSl0oYMGUJejl
	WEvknspyxQiQhZR8I8hWgwFWFZQlaQyMbRBAXhVNz+nQ/PxyIMf6BmjKyqe+eR+0uOwiZCUOM9s
	QcgpZB+9KS5OKM4HGlApjlP0uMzZZkiJpl6TkHqRL4QLxNZo3PRSvttqmtvl6xdR0jaY7rAwcfP
	o8m2jYaKFi8bQE3BHNinNLH6H0HMLbrmWpza0YAaD1U/OXAwmcqRFB6UfMerlzvLELb+xUEZcQW
	ikjPl75oe6WmlBmtWzcfuVPpLom/PDykpKX/wahO1Va7p6dGiQrRAGoriOpWLBR3FO3TKb4PCel
	omrkFjHQXxwGJ9Lxh8vXFcPNRPe9Yl1EYTxo3YnpDeOVngXZ/QFiDwH2xDwBNaDrwWGpgDksyrP
	0BeG1+51B+ffOUsECDb5KJ3lthtXlpCDlTivPPelRRnCnQrf0CRxExRz3Kkrm4OXsu2AfwnQ90I
	75cBCskXyAscK/K6eyYtUT36TP0PTqRAEWqeDu++6iCS043Fufphe2e+tuvnFhSJfOPLA7fskiP
	uxIWBhJ+Rcxd7/StyF0GAfqdWpBHcuweY4u/S61OeSA6lshtYmgya1JZFPsvtof9EhxZ
X-Received: by 2002:a05:7300:f0c2:b0:386:688:7f25 with SMTP id 5a478bee46e88-386068880f5mr19561356eec.18.1795652561111;
        Wed, 25 Nov 2026 16:22:41 -0800 (PST)
Received: from localhost.localdomain (wood.seclab.cs.ucsb.edu. [128.111.49.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm101632315eec.3.2026.11.25.16.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:22:40 -0800 (PST)
From: Praneeth Balasubramanian <praneethb2002@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Praneeth Balasubramanian <praneeth@ucsb.edu>,
	stable@vger.kernel.org
Subject: [PATCH v2] RDMA/srp: Reserve send queue and CQ space for ib_drain_qp()
Date: Wed, 25 Nov 2026 16:22:27 -0800
Message-Id: <20261126002227.3598226-1-praneethb2002@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <70bd9162-e9f9-4580-bfb5-cc29107a4126@acm.org>
References: <70bd9162-e9f9-4580-bfb5-cc29107a4126@acm.org>
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

From: Praneeth Balasubramanian <praneeth@ucsb.edu>

srp_destroy_qp() calls ib_drain_qp(), which also drains the send queue.
ib_drain_sq() requires the caller to "ensure there is room in the CQ and
SQ for the drain work request and completion".

SRP reserves that room on the receive side, where the queue and CQ have
queue_size + 1 entries. Commit 9294000d6d89 ("IB/srp: Drain the send
queue before destroying a QP") switched from ib_drain_rq() to
ib_drain_qp() but did not grow the send side. The send queue and send
CQ hold exactly m * queue_size entries, which is the most work requests
SRP can have outstanding. If the channel is torn down while the send
queue is full, for example during error handling after a target stops
responding, posting the drain work request can fail with "failed to
drain send queue", or its completion can find the CQ full. The QP is
then destroyed without the guarantee that ib_drain_qp() is meant to
provide.

Add one entry to the send queue and the send CQ, as nvme-rdma and iser
already do.

The missing reservation was found with an LLM-based tool that checks
callers against the rules stated in kernel comments.

Fixes: 9294000d6d89 ("IB/srp: Drain the send queue before destroying a QP")
Cc: stable@vger.kernel.org
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Praneeth Balasubramanian <praneeth@ucsb.edu>
---

Notes:
    v2:
    - No code change.
    - The author now matches the Signed-off-by. v1 went out with the gmail
      address as the From: header.
    - Added Bart's Reviewed-by and Cc: stable.
    
    This was found by an LLM-based static analysis (GPT-5.6) that checks
    kernel code against the rules stated in its comments, as part of research
    at UCSB SecLab. The patch and changelog were drafted with Claude Opus 5.5.
    I reviewed the patch and take responsibility for it.
    
    Testing: builds without new warnings with W=1 (x86_64). Not
    runtime-tested. I do not have an SRP target setup, and I have not
    observed the drain failure myself. The change only follows the
    ib_drain_sq() contract and matches the receive side and nvme-rdma.
    
    The patch applies to mainline 9ba46df34488 and to next-20261116.

 drivers/infiniband/ulp/srp/ib_srp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/ulp/srp/ib_srp.c b/drivers/infiniband/ulp/srp/ib_srp.c
index 955f36efeebd3..2cd0b728424e2 100644
--- a/drivers/infiniband/ulp/srp/ib_srp.c
+++ b/drivers/infiniband/ulp/srp/ib_srp.c
@@ -546,7 +546,8 @@ static int srp_create_ch_ib(struct srp_rdma_ch *ch)
 		goto err;
 	}
 
-	send_cq = ib_alloc_cq(dev->dev, ch, m * target->queue_size,
+	/* m * queue_size + 1 for ib_drain_sq() */
+	send_cq = ib_alloc_cq(dev->dev, ch, m * target->queue_size + 1,
 				ch->comp_vector, IB_POLL_DIRECT);
 	if (IS_ERR(send_cq)) {
 		ret = PTR_ERR(send_cq);
@@ -554,7 +555,7 @@ static int srp_create_ch_ib(struct srp_rdma_ch *ch)
 	}
 
 	init_attr->event_handler       = srp_qp_event;
-	init_attr->cap.max_send_wr     = m * target->queue_size;
+	init_attr->cap.max_send_wr     = m * target->queue_size + 1;
 	init_attr->cap.max_recv_wr     = target->queue_size + 1;
 	init_attr->cap.max_recv_sge    = 1;
 	init_attr->cap.max_send_sge    = min(attr->max_send_sge, SRP_MAX_SGE);
-- 
2.25.1

