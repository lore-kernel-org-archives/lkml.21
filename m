Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749776;
	b=BuZcMmahJsz6lcA9HtoK5yyVbphGPldJwpRDkU5tiIjGRFR99HIEfeFE6M8DosVfTZh1
	 2A08kMdY8cpgTODt1DGp/ISA/Wd39UOShYkdALmsx7GVZbZQJ8GITlwGTP7LOKoJihwq4
	 Uk50a4FrDoOiPs0k5ivnFAYDlCIyKWYDf2Y3X+QZxfImh1o17j1eXpFtohq8WhN7Kao2O
	 1NPfNr68bSxcd779JcIxh1ZjK93UI7Te+GXy23uwUDIxQcZf6NHn57xaFyetn/qrZgTT+
	 2oPaycNMSykZ171GrrWVIxqURIRz4dgoMntGCP6YbT7vqtlp5/o6Pa5iN8vVUuCcaIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gVHH6+w6le0xTHPAQTaeEYW7nDPuhbJZlCxYM0Qfygw=;
	b=UxSV9dGJAR4uaDxyTjyjtk/I/Gs9jRexRwxv4xILre+a2KZXc/S6XOc3zbxA5pYssZKI
	 wk+6lAHVgza0qxc7o+PnNdlxZY3kRPpeWW0uRIJsvRh9VvSW9tc3vW2gxXhyP6MpXRLCy
	 dgpepeSsEc249BOV3KmDuMAhIapRmOyLI5ti7HtR2xoVw5nx+7TDB16OLfATsOwm/cI2e
	 JIYe1IokCuUUl0aTBpvg6I8CdO1kZyPU2i2KVG90LlGAb6tsfKhhCSg6TqlTFC0sFh7rA
	 e6e3NQZhKFgnymQIoUGQv6QBBiRDJTaNXsw3S2XUY5WXeUAPPOMvBOAwPs9FuAhD05g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NVqvKH5+;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426F8606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 426F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NVqvKH5+
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-385c497bf94so6918488eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795749775; x=1796354575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVHH6+w6le0xTHPAQTaeEYW7nDPuhbJZlCxYM0Qfygw=;
        b=NVqvKH5+lsTodiBLJrm31BYjG5CR5qysR7PW+JLyD1KrTWmHn87Y5QtlZhbOEVlcgT
         gpl7ODF5hxKwBlctYepCz0cihw/9QyiRSKBk5rlK1hxAwhIXnL2EeASnhia07xALY1fG
         d5f9CrxXgpXvnuP8NX031iTiXSQsBitNr+gG4ZONz318AXtdie4lfU1TSzggS+1oJRBN
         i3wIa0xYsWZTQ3dmXlMY7iZrsUSlFmjbhnM3yiH7H65SY5dr4o+TT53iFctxcBZ+C/1+
         ahpAfSJVyWv/ub0KDiBS8IVAaOZ4QCWwIzdF+zAKXazEUsNFimO+pld03eX96mTyiPGn
         UosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749775; x=1796354575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVHH6+w6le0xTHPAQTaeEYW7nDPuhbJZlCxYM0Qfygw=;
        b=yzgIgYvueCYY5/g/xY6i88X+tUNSn0x8h8AQbLq0c5HAxY+7OvTROoEjaONICkED5/
         Pl59uOPCNjukC6hSYCZnPSss+G/z2hKjX5Zh0HsKE7u9hXM4Raw+SrQwwqFXiGTQRley
         Gyr6ZLI4GgyvWEpyoGhXE6pm49AUkJw9G3H4X4cQJQ32QlYxXDL7sy4v+fRvUxoOuLN0
         qTjCoEz8SCw3eQ8+XzRRTB6QwvCSdaLoMTogJFzkmczEy6cuyuYNneOxsyUc/bI8fUoA
         KMrHpUmZ/D8bB+BlBhmd4Qr+vanK5dmzdq+EvufG6ATywks2fNBXRvYy9V+F+bIPV4VD
         TDsw==
X-Forwarded-Encrypted: i=1; AL+hErH2Wz0nzD36Wj21h5xZwAPDkgh+8ySwlXaP8xneKaTFeZJXHWkkve+lwlVnsrJxywMTtRkLBEW+u5lSUDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Wi46auPDBS8r9fRv7QT9VFLgGXbxuZzCUl2i9vtSLn25he/zN
	aF2yZnkBty7HzEc/YjgfY38A3z8c+aP9h8WO7xBce5REL6Rmc+3+nAAn
X-Gm-Gg: AZFdTZdesq6DctBuC0ZhLUFCl+tSactiD3alGoImzJNee3HOtjkTpFraILrPpsdeF4w
	0DkWiTJNqljiwt+80kRP3AIMbSmGHTlwc6Rt4qoeyPKmu6SyVYWqIRpTJ9YP3qxppwa2IpiGIb7
	swS0IH9tCBVVyzji/KxmtMEnxApYNvubP979K+1QIL4+Aap4VfbybKK/gXWP6BwJVRlUdVTc5vn
	2rj2bstAwqU+YucZZUgpG7bo2AnpsmjT2cpDnqOSrThmlWpa+MYxhqNvLYvSY4rWaJYxy3UoJ8n
	tfNsCth9u/ejgX1+bF99bj6usKK6rdPtewDaYG0mjsjhbOTKUQN0Gk/vti/LccSRffILGVToc35
	muVg+x2kcUuOlxxXSc/mFROe7q2ZbQnscp6qWrpK8o3YsOE9LozNtRnU/gACF7j2FLzABmJUuUv
	HF6GiJZLfx8HzZsV7kiLe8wBa/sHY6Dzu5GXVuxCIuTul6ALJaS5uYdF6nRPa1Fj2KQ7fs3BE7p
	t5kE+H/lwPslrzrLj/+SfQRoan57Ms/iJ/abM+EjZt2ktw/7cqrRJOEguyMGbl4Hi4XfyV+557h
	/YxgzfRWPDxj2lPGh6ykt9+DIsr7GWYdFU0hMIcFib9WvlD2ZGWg5Mb0ku/HGZrXxd+Uyc7jjB+
	nPJeYPB2jpqDBcCxJS+JBQXuuDYwKeXi2ZadCVwMkvJYQRhz3oKMt+ITzRYAQO4NrCbFfldKT8w
	==
X-Received: by 2002:a05:7300:2728:b0:383:c2f0:e753 with SMTP id 5a478bee46e88-3856c0d0a68mr26266744eec.3.1795749775103;
        Thu, 26 Nov 2026 19:22:55 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm81845568eec.10.2026.11.26.19.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:22:54 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: [PATCH net v10 0/2] genetlink: Reject joining multicast groups no family owns
Date: Fri, 27 Nov 2026 03:22:44 +0000
Message-Id: <20261127032246.2886407-1-anilkaushikwireless@gmail.com>
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

genl_bind() lets any user join a multicast group ID that no family owns.
A family registered later can get that ID, and the socket stays a member
without a capability check. Patch 1 makes genl_bind() return -ENOENT for
such an ID. Patch 2 adds a selftest for it.

v10:
- In the selftest, unload drop_monitor only after the test loaded it,
  and ignore a missing modprobe, so that a skip cannot become a
  failure (Sashiko).
- Say in the skip message and the commit message that kernels before
  v6.17 skip the checks, as they have no fixed nsfs inode (Sashiko).
- Decode only the membership bytes the kernel copied (Sashiko).
- Patch 1 is unchanged.

v9: https://lore.kernel.org/netdev/20261125144514.2717012-1-anilkaushikwireless@gmail.com/
- In the selftest, find the initial network namespace with its fixed
  nsfs inode number, not by comparing with PID 1, which is in the same
  namespace as the test in a container (Sashiko).
- Unload drop_monitor at the end of the selftest, so that the next run
  does not skip that check (Sashiko).
- Patch 1 is unchanged. The Sashiko point on it in v8, a family
  unregistered during the join, is the window the commit message
  describes. The fix for it was patch 2 of v5, which was not accepted.

v8: https://lore.kernel.org/netdev/20261123155503.2497063-1-anilkaushikwireless@gmail.com/

I used an LLM to help write and review the code, the tests and the
commit messages of this series. I checked and tested every change
myself.

Anil Kaushik (2):
  genetlink: Reject joining multicast groups no family owns
  selftests: net: test joining genetlink groups no family owns

 include/linux/netlink.h                      |   3 +
 include/uapi/linux/net_dropmon.h             |   2 +
 net/netlink/af_netlink.c                     |   6 +
 net/netlink/genetlink.c                      |   5 +-
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 138 +++++++++++++++++++
 6 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py


base-commit: 7b0c5f0c757cb61e28dc4128633877aaa8f6f9bd
-- 
2.25.1

