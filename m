Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632406;
	b=c/My/hvRokJnoNKu3JC/v2oC3SJ0SRK2WSftAab2huAnT9iRUiq8jQnxPcp6ijbxtZYm
	 yF3SJEDHUHCJ4kHApGBy4DciCLSo54+5Yb5Wf6mNhOVW2Xam85TPehY/BDSF++P7ekZGu
	 yzeLAohbWoRjGuEMFw4cXeDQ25u35F9j7WICpDHqWZyf6894Fj0QklfSCilhbZMaeFJdH
	 jTMSdX5rg5H7xcAuOBIT6HoZ7zn+GpMlvA1rUwbfx3q6NyZwjU5ULLiwYWUy7np8SXMYw
	 YFI8roKIm6OKRdBspVt1qFqTA/3jnz7YKZHQJMqeshuAZdln2s3/qnWj3eriL19CcJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nlXgo9XIqJkHCFxu94kRbXHgwwOM/0hHr2hEt1w28IQ=;
	b=mob0dDWDfTB1HV1i4VOZHuTAyuci56E2kVuUDivWXamMXSZfm1uLq4RNeDVyWVVcZE0V
	 ui3gOTvIkc1SomQcTj5NGuouEiel1nvdBIo2rufFppnzNMuFDfntwTQz2fdk2OAmG99el
	 xn1yT9rneGZEsBU1NuceHtCCFYPMY654iQttwrBTaE/zQXI3Rhbs+x+EVtT2PIjAacCS5
	 nI0nXDkaQJIE/80XzoTLPQTlQ+ySDS+Y+8EPiFIJnZFvhqGwqDJfDm4ooSq2h2eZdzRrm
	 pqjPOt5qY8hYPxgEVH7MFVD40SUnepe4EdgsAtE1yrtVqOhh475aMfVwoVm6a/f7KOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1SqUFdg;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C6A606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21C6A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1SqUFdg
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-385c497bf94so3531350eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795632404; x=1796237204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nlXgo9XIqJkHCFxu94kRbXHgwwOM/0hHr2hEt1w28IQ=;
        b=r1SqUFdgtywlp6NtGK87jQIKzVZWl4F4rhmtw2lFuyqtW5LN80z0HdqMFC4lFxtzfc
         sPv4eFs6n8T7bTK/Y9uNNqWqxK1mnqOMLd1ofQxA88TSPdSpJqY5atzRQPqsV3Cnu0Kz
         xdMkDPd65NMvuX/yI/s9lxRKvbzxjxrz7nCG67nKPjfnov/so2vKenfxWXzXJV41RrRa
         /UQeQ5Fv0/CXsdcVZmci8NcFbJ1Q7asEHy8hTzkq+/+C8o+U3P2KSgycADkqraemK6x/
         eYiiJmsP4dj36xpRNEgKFxe3w2joSwKqW128/Cmjv43sSkRH0jqUBIVyHKkny1z9/9Xw
         qG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632404; x=1796237204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nlXgo9XIqJkHCFxu94kRbXHgwwOM/0hHr2hEt1w28IQ=;
        b=ZwouZF9zkht6o4r4jAh7IVmU0o2elChPaMwWGT+ZNUKVJPrsOSLt6TxZMRcsIn0Uso
         OdkfMPtuURxkD4ELA8unVdaRE3dG5Y+iQAWEoqYS50xq1WXhqR9lO0fX0mvK2QkHmph7
         L+MG0GPJK7bDTBm9VXbC+5gnc1sYNk5DnrTkZ1uSSbb8MQmT3aGJLYiN6lYS5ZoEEdpK
         WSDsNqT8aXYv9gAz2OIfAHFs0nnE6V4EF1zHlHTRdb+3osK+EUySLLKcDRfH3uYSgYVz
         sPsCwWjI1i/edmOF1s1L8pYPTlOO1hquRKo5XrJAE4W1nb2XyJjcfJwrfghxIGu24odk
         czUw==
X-Forwarded-Encrypted: i=1; AL+hErHvgPo19sCyHjZRTnUTwR2VbVaUVeH49RZVwvvjD9d6LjUfHPFp+WpKpbu3ncM23JgZd2HqZMneAI/rwGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q7F0T7iHJiHpelShZNw8VNNXLM0779BawemSofPLS6i6jEhtJ
	QAgvj5y9pKM9UXgJFu/oFbXa4hdZ/GSXsbqbltuSxd1vq2NvW6BevK3w
X-Gm-Gg: AZFdTZdWTV+rM9YbFiX5CAT2YxjM/QE1qx0LDV3ywBhQNigPlRuUSqwj39PLhh5S+wN
	aHTwGS5D0Ocl53WLtApBdRJwbL5hDzFK7VeK3Ec/I1bCzyA87cF4AUwHvkkSG/H43Am3iEad17a
	t0Alk657/bY60Gi+4XNvpO+lqWw1ARBnyjq2tsqxEJ18B+dFPtAaIM7wC5J8sE25CXIyPNXbYc8
	F3diW3w4p2i4zhIxQkw/GQ4gog08CTZ9L6ytDGt5FN/qmYmMe3eIShnl1p2PSA14A6JKCzKPnKQ
	ppqgN+35gsG61vMd8yng/dKRSsZhq7kZLV2AIoZlpZDTXV6TiOVujrNNB6CYmt5msLvBIfPLtWp
	8gMlxxumX0jQk31XJoIqgbAkhaYBDTd/3M0a5hKPSCe0DKUmUWunImVBNcx3tJWtWCUv/UGi7YY
	5WV090tFDmqR0t6FxQ0SvvoNSrOtfOS1DF+LGJWufKmlFnBgOs0h6cDYnqvbL+Tz3usQA34ZqKr
	RxAvNbekxV3mGKoJ0f7WkxYuNOHvDL/lTWoAh+IJOKRylFs7kakl217aj5zX+xR56xO4Z3Bd0R7
	XQUAFfuK3rjzHkzE9jOMV0IJXBKwlOqNBQ+EmO2/rQ==
X-Received: by 2002:a05:7300:fe4c:b0:386:9b1e:dcd2 with SMTP id 5a478bee46e88-3869b1edd57mr16448894eec.20.1795632404041;
        Wed, 25 Nov 2026 10:46:44 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm57691480eec.12.2026.11.25.10.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:46:43 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] net: page_pool: Drop fast and slow from the params kernel-doc
Date: Wed, 25 Nov 2026 18:46:40 +0000
Message-ID: <20261125184640.2407270-1-takano32@gmail.com>
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

struct page_pool_params groups its members with struct_group_tagged(),
so fast and slow are group names, not members.  kernel-doc does not
expand the group, and reports both as excess:

  Warning: include/net/page_pool/types.h:105 Excess struct member 'fast'
  description in 'page_pool_params' (did you mean one of: 'flags',
  'offset')
  Warning: include/net/page_pool/types.h:105 Excess struct member 'slow'
  description in 'page_pool_params'

Each one is reported twice.  Drop the two @-lines and say in the
description which members are read on the hotpath, where a reader of
the rendered page looks for it.

Verification: kernel-doc -none include/net/page_pool/types.h prints the
four warnings before the change and nothing after it.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 include/net/page_pool/types.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
index 6d543076a0c0..5306e34105eb 100644
--- a/include/net/page_pool/types.h
+++ b/include/net/page_pool/types.h
@@ -69,7 +69,10 @@ struct pp_alloc_cache {
 
 /**
  * struct page_pool_params - page pool parameters
- * @fast:	params accessed frequently on hotpath
+ *
+ * The members in the fast group are read on the hotpath; the ones in the
+ * slow group are read during initialization and by Netlink only.
+ *
  * @order:	2^order pages on allocation
  * @pool_size:	size of the ptr_ring
  * @nid:	NUMA node id to allocate from pages from
@@ -78,7 +81,6 @@ struct pp_alloc_cache {
  * @dma_dir:	DMA mapping direction
  * @max_len:	max DMA sync memory size for PP_FLAG_DMA_SYNC_DEV
  * @offset:	DMA sync address offset for PP_FLAG_DMA_SYNC_DEV
- * @slow:	params with slowpath access only (initialization and Netlink)
  * @netdev:	netdev this pool will serve (leave as NULL if none or multiple)
  * @queue_idx:	queue idx this page_pool is being created for.
  * @flags:	PP_FLAG_DMA_MAP, PP_FLAG_DMA_SYNC_DEV, PP_FLAG_SYSTEM_POOL,

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

