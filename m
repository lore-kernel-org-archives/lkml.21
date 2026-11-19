Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099380;
	b=cG7IQBllfZT7LFLBr9P47Erq5fTuxky7z3h3bL5Dhq2kk4IUoLd0pAXKexC5vfwmU9zi
	 +sKEk4dQDH16147/mNnag46wgSjWc/Y96IhHD6bzQSrPt9tgLMCIvvwcMZj086GPKMgxe
	 cgUeFLhcw4ED2YRBCedGmpzBxNnJkU0OR47HrYqLX9tENizbVYvmTXYh6kBQqyPla1Cfw
	 yHpqbWw9o03Cln40KLzc8iVlh8i82JH9h+ewgGg57YZQpec9h7K16Sv+l2RIZ7xMCt/Yt
	 PV/iiaP3/NU/Raz3sqKu02GlKNiOWK3RKl27XncB1TRnj9JmptZF8UaIE3MGhUIRNCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GpxuYon9V61W9GAwJOVwMIhDSfl3FlFyTaxEoWjwIyE=;
	b=HrpkDT4MUsPGl55h95/XXmQMgFwyjIbmPKujQYiXEJXSs86tAtYmdOaxSTkL9Qmn0MBH
	 7NjDB5kj1QinSIyoo0DUhdiBL8NXqWReJFZrdx2KYWCFFc4iPKZtGw9Wg3jCJACpytrDf
	 PqG9iFkkJyCijErIIPyz2gLFunthZ5BwasJd9X/1ggXKDYoe+DWqxHe2eKNZIMlsiRP2s
	 pM5z+dUkfIoiNs+m5DNGpLmXFWAtybF6WPrfcOfu8QI5mWqlhtfzfi8T8gaQtG+GcEyt8
	 5+B58PeCru0rMWFipoBGAcuuvy3JcIdttrbyeUaB6lqb5zuIFTQdF62SSvNsAGQshkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SfBrjJsg;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEC9606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FEC9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SfBrjJsg
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-380b40312e2so6311472eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099379; x=1795704179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpxuYon9V61W9GAwJOVwMIhDSfl3FlFyTaxEoWjwIyE=;
        b=SfBrjJsgaM3SfnXmFkL//WeotaIyiccErOHnwP8Op/+jtmiZhZt6O/HPsaaXcSFv58
         XxhWTZrcYmWyzJ/G2dJ+bGuC/UAhDwuUWst8aT1V7pLd83JCfkGHLGLgPwXRWFTZtqaq
         yEntDwwWtY0r0BUaD5jcTHiuAO3+nfvr29+V6Ar++8T+/I8Wl/FrpMeva3Hz8rnj/c6Y
         IfaVNb41jSu276kHot/6XCbZVDNqJPRKTm7GNItXWAtih3Hy+fz5flJhnJVSTzrWFg8H
         oC96LLfAymtcgUYh42f5EPApHu9KXz5H1NumNZkj9BuIan//sKREg+/jXBGm+f+cr3e9
         QkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099379; x=1795704179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpxuYon9V61W9GAwJOVwMIhDSfl3FlFyTaxEoWjwIyE=;
        b=iKIEqGpRs4NT0PPsb/MlAxyasHDTEgneLiXqW5JJ9IU/YfKloCUpva/wabkd4GMxw2
         FAxERZGphFze46Bj2uLWECPpCK0XEQRazw0fzvHLR8yyQhQ1HnqHOycsy7sWH83Z8u/3
         WHAAa70gO1a/TxBw8j1e25k1oF+Fzhk6rIr0EjXVlUXWAYKETC1j4+ICXDkoA9YBm6T9
         BQdhv34pTozKmbxqV5aYt+8Co6g5hMmvF5dVKiYnOJqH+f9RbaXb4UbyQrIOitTjbb5b
         tJRWJkO3a0RrEZOAQjWUhYrQVlG91LffpSaumzgBJjs7s7OGMWJtUBvjPi/5p1tyTcmo
         ITnw==
X-Forwarded-Encrypted: i=1; AL+hErGUS3whGXYtzWbrqJ8n/Lo/AZA/JLRyqZiycTcJQmTrWMxvR7u4ZkPMKEsoBHFFMJTlWBHya5waeffrLwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tb03Lkwx0B+qRxpLVL+re4v5pzpGXXoyAbAAAVSoGPgqAUCyu
	YWHox1SSbSHzQH61bHPKZsVIzcDo7AXRBo2scJ+EGf0vCOVQZHBsQRq3
X-Gm-Gg: AZFdTZfy7cVfAf898L8bLPE6YFp0/6ROqXe+79aR6Dl+ywqjOXSurTRkCqxDKVH1O6T
	T8lczXKeryiJf/mgfEZiuWBqQoTPAnbAOc2nAoz9UOUKzvd9vzvhKJNPpyGxRDXhwR4XqFVD8Sd
	nHcnV3HIuTzk4hY+s9ZLWM5UyScS7drGbUGZoW3BcKjFLZtamHChuhfruqCIJUKutlZc53j4On8
	mpmxsby0ZGDnzKm40JNBq6VW1cnZrJsi/vcBpmQf3IzMzYp9Ax3T8p5WlyyyjG1mVnut2E0a0eN
	Y4BoQdS+/9j+1X9Jpqc0JuuPh/9O8+WeHnhEr52BAlBiDldVmXmrgf5mBxzrnpRyCWPGN6/255k
	Cv5P/n4pHDw5QhnrQwmyJzHBn8I+oWe7c8mqDeRHodakycbDl95zR80AEaCphSXVMGn/3NdNs2c
	rADqhczw8eNsSRtYdjL9xwNLvOd8/oEhIXiSfdOg9f9+RNtbhCpDRkYpP4Hfr+CUsqIB9aKpnVg
	GZvSiiUcrfviaX3zDKfIVDslR/ek5FcHmjq/IL5+3PaXHKCN3kOCfDtRBqTqQ3SdqhwQqO/VIY/
	L6DgpbqVLTOAiRA5fI3M8y+6E/yASgakCdsuEzAizzR8X1W//SXKWM6POUoammaeGujhaxI=
X-Received: by 2002:a05:7301:5f87:b0:381:9593:9984 with SMTP id 5a478bee46e88-38281626937mr5510080eec.37.1795099378702;
        Thu, 19 Nov 2026 06:42:58 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:42:58 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 2/4] tap: clamp zero-copy copylen to remaining payload length
Date: Thu, 19 Nov 2026 23:42:37 +0900
Message-ID: <20261119144241.360238-3-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119144241.360238-1-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
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

tap_get_user() chooses GOODCOPY_LEN when the virtio hdr_len is zero,
without limiting it to the payload remaining after the virtio header.
A 246-byte padded header and a 14-byte Ethernet frame give vhost-net a
260-byte TX descriptor, above its 256-byte zero-copy threshold. The
128-byte skb head then contains only 14 copied bytes; the rest can be
transmitted as stale kernel heap contents.

The original macvtap zero-copy support introduced the copylen choice.
Commit bab632d69ee4 ("vhost: vhost TX zero-copy support") connected
the in-tree vhost-net caller, so this case predates the v6.15 header
validation regression.

Clamp copylen to the remaining payload before allocating the skb. This
also covers cases where the entire frame fits in the skb's linear area.

An AI-assisted code review found this issue. An x86-64 QEMU/vhost-net
reproducer observed a 128-byte frame from 14 input bytes, including a
114-byte uncopied tail. The patched kernel delivered 14 bytes in the
same test and in 400 repeated short-frame sends.

Fixes: 97bc3633bec7 ("macvtap: macvtapTX zero-copy support")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 drivers/net/tap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 2f19fb07bb2d..f25c58d6e986 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -608,6 +608,8 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 		struct iov_iter i;
 
 		copylen = clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good_linear);
+		/* The remaining payload may be shorter than copylen. */
+		copylen = min_t(unsigned long, copylen, len);
 		linear = copylen;
 		i = *from;
 		iov_iter_advance(&i, copylen);
-- 
2.43.0

