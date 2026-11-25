Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613173;
	b=E77KNG3pf4qU4kv86OmAxf/NZ1G0V4/N0jzTLhx6YDHo+ZJG1s/LuNUPjeE+dFUk7LQQ
	 7d6rgGD+/SFxbcOyVRUdbwofUyisGcQ8Ut3txhrAjieRSEY7wY44tBVlum6ftJVjYXyRg
	 9i4X2LMwKDIjiM/QQ0C2swyYE9/KVcEq6rBe/XaQhjQAHBa1/ddI9dYD+wBC8MI8SDiI3
	 Rv/nYOCBPL8SWeha9RUrRZDcX3R7WCGmlZWaV1i//ihc0GUVVgbEYGUL4OVaemadpAe5V
	 afbFv2vUsjwMG25u+FRlwGedbvKVJvB7o3OQl9HDH0oV4XIazrBYh/l5VFzhxtNqTYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o7rHexeHj+vCB2QshFklwCHahWTd+0U+7e2vWqXL3r8=;
	b=WoNVv3lqcKFkzrG+ro+UvCf/SgNx4pkezqyC43hfrIIdpq9OJQhW5qmERu7GGL9IjDpz
	 5pWqEYYcrnPFYN0oQMNTelDSco9vy6NHNKjWzKHZHIv39PmpVkKzrtAv8TEWXXGvU+qiv
	 1pfgpnX9kF6qvq905oh+ocpxwRvq3Z1KFWHQG8v6FNY/klH87ifk2h/fwUjAuaBQddrA6
	 b/r69UWadD8e0Ygf5HvKevZcK3HcjT8djywJWLcJNg9+NwxUnZMQgAF0gu+pwrjijtXtH
	 5Vjc68lXKLbo4Jqmk+8DyUIlKXtFlEdNmJckuq+25BfRPSrDblopQ//tzuAjG9bHaXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AgLXKBue;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A72606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A72606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AgLXKBue
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9912c47367cso3707171241.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795613171; x=1796217971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7rHexeHj+vCB2QshFklwCHahWTd+0U+7e2vWqXL3r8=;
        b=AgLXKBuefEKZAenUhUtEAbKqyUonO4KpU9lkPjT2QKAdfYEXOVxF+Yk5NmgeEEyPLS
         djEHHWaDUXCV891EslYE4n0o/R3gBv2JnzSdoMizsaLNuTDn2efcRr55l5eT3QEH6J2x
         /fMR2hW2IFwe0cZQcB0EoUJ5goN/+POkAopoS8Vi/ElimgEfj5bTmjZ0bbt2erDYpJdW
         z1yLQlfIUxib2UuxlbJb9EPCeeDkeKDYbpuDXk4BbCy4TygcY8j1bnN9Dm5fCdfkcdbc
         MIUI3n74uWf1M/UqYj/OJ+4j3ARR5iehux1EF9Lm17QRYVff2PpPGJ1mJLNZyP/33Bzw
         P0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613171; x=1796217971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7rHexeHj+vCB2QshFklwCHahWTd+0U+7e2vWqXL3r8=;
        b=Mt1hAI4hxrbYpsQYkxB2BiWvGxGjGrSuNunv/YIi1x1gltrYDtMVBT1OpHj4n6dfyh
         Gb1WoDtTWdbjSHEbRneOW5Ffh6d/X8hDV/83TXUYYq8r24nmQlq9uS5ullz7OBPVW4RS
         NWxYJmhR+klvaGE1/BSHwmJpN75PRUWeTm1PlSwkdWxw+aVGnFAXZfxQS0fvAfG5KtN/
         BdIOXA3VQRt7Dy7hwRNSf8LQ+7JaQglbQNvEOYrLDfLPN7X4M0tb3ZrbAMMkMteICXS6
         qz+JBddejSKD25fIGbVvDrwMXllww38tRk+h4u9SnJkMrVwogX910mjIHexxwLHiFa0R
         2iIA==
X-Forwarded-Encrypted: i=1; AL+hErETLTSiTK2nnISGUqUfdLgejnRD65Bq3jD8m8FYnaJzo7MI1Q9ThCIZleyrWCrUVv564F33u9U/PnoGGD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZKh3qNgu+uEddpsEQXV+u+45bq2ifx9ttQB8R0buFp+hzXZT7
	mXeXUsFrQOVLxUktXsehfrVYDS7qdYZS71SQYWtexos30+n6qIFBqRQL
X-Gm-Gg: AZFdTZc4VzkT9RN0Nkwzx1QEx9RDitT9i+eB4E8jJvMTBZykjWqHuREPvJqIddX+GEH
	dovR1Zi22HNjhxAypDM04nawlo9fAgwOySj1AZ/aeD7oijFM0m+PFvUEtaoCSTkfywJGmYt6Bqt
	gIFBqcLANcuw32Y6RxBVAgy8DcGXhKKDnYhsTo3JSPvXKbysyHQyoTfPI+EbKSAx8Unm1AM1xtl
	TJ8XPYHYQIjD1+NBviZJnNprHAv7fClhGYxxGlSVIYmk97BKxpb9qrfXRZXM0ZkzW7QwJfmanzl
	ZXFTcQBZQ8UvM5+CeCwHLqi9bCk6RC51rh4PLhL6l1uF0vKxksxmKkwlfTIOdEePR/MeaJ5is9E
	dVbIama+CqBv09ts0Lu/lePJyLQzTBuoeLNUeLQglQclvOBpQzxoxC8MBgdCzloxywQrhscLA6m
	O4n1Zm2swEf3woVEN2lIVKeSc4B7rRI5tny9A8Zv0+LxyWL/PRn/yNs+Um1cN6uxvFuEKj/VddG
	yq+5Sqlj85OhXxEZfaaXDtwbSaB8ThsBQp9aDvtigvt6CpgG/c3JfejMYU2Vkoc3Z8iW5zb6IRJ
	uT2j+Scq4/QW3pfdkllIXJwVIkAFH6paEp6i4QIT5Ims/s60LUhEZhweMMVyQMEI6WLhRaBNAJl
	ylRYm72qQMnC6E7qzy9czvfhRB7K3RFTpuJgP8qHR+y4loVDlXbXzvCX3+vIEu7CWGxJsRvr87+
	pt3JC6MV/ycbdV4yBmFgf0ufiqxq8=
X-Received: by 2002:a05:6102:1489:b0:7cb:cfcf:3d01 with SMTP id ada2fe7eead31-7d6dba0f7f0mr7262935137.33.1795613171034;
        Wed, 25 Nov 2026 05:26:11 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:44ee:a48f:70d7:4696])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cdfbasm163149316d6.17.2026.11.25.05.26.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 05:26:10 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: Zhu Yanjun <yanjun.zhu@linux.dev>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rdma-rc] RDMA/rxe: Zero the AtomicETH compare field in fetch-and-add requests
Date: Wed, 25 Nov 2026 08:26:05 -0500
Message-ID: <20261125132605.44412-1-astellman@stellman-greene.com>
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

init_req_packet() fills the AtomicETH compare field for compare-and-swap
requests but leaves it unwritten for fetch-and-add requests. The field is
eight bytes in the transmitted packet.

With init_on_alloc=0, all 200 fetch-and-add requests captured between
two rxe devices had nonzero bytes in that field, including printable
text. After this change, all 200 had zero there. Compare-and-swap
requests sent their compare value before and after the change.

Set the unused compare field to zero when constructing fetch-and-add
requests.

The issue was found by Claude Opus 5.5 while checking rxe for other
unzeroed memory, as Zhu Yanjun asked in his review of the rxe_mmap_info
patch. The fix and this changelog were drafted with OpenAI GPT-6
(Codex) and reviewed by me.

Fixes: 8700e3e7c485 ("Soft RoCE driver")
Cc: stable@vger.kernel.org
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
A reproducer is available on request.

 drivers/infiniband/sw/rxe/rxe_req.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/infiniband/sw/rxe/rxe_req.c b/drivers/infiniband/sw/rxe/rxe_req.c
index 4f353abd76f5..a1e7fa48c665 100644
--- a/drivers/infiniband/sw/rxe/rxe_req.c
+++ b/drivers/infiniband/sw/rxe/rxe_req.c
@@ -483,6 +483,7 @@ static struct sk_buff *init_req_packet(struct rxe_qp *qp,
 			atmeth_set_comp(pkt, ibwr->wr.atomic.compare_add);
 		} else {
 			atmeth_set_swap_add(pkt, ibwr->wr.atomic.compare_add);
+			atmeth_set_comp(pkt, 0);
 		}
 		atmeth_set_rkey(pkt, ibwr->wr.atomic.rkey);
 	}
-- 
2.43.0
