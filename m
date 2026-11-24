Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536956;
	b=xFCplmwxh3dDpfk9Lg73Zd8W5cOp/Y0ObaPI+25RoilADRFXzSYtuNKcnkMMVlKC9hfE
	 /50TChDX5sDT4tNLx984dhx8r0mzkKqeBLDXWPUWZMpNUd13hRlNnjkIKkxRE1dGECC8l
	 Y2Qr2Gv2I3ZiascJhbbo3ERPffKWfP3Y3gQLp8us6NW70RMgFGMDy9cFQs+8UOk/M50hn
	 AkYJ9KkoTNwBgL82NlByT1ZwLT+2W8gfUocY+e1yLXRxcDB1X1w3ahYV6z0QD1rsx+nq+
	 m6wq80ujJaornQYyhVpE6uO4JpwME5um0B0r+wDBJxCf1qOEnR0N23rB2Btafq5eVJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hjuDGJo5FvaUieIpfh9C53hty/r27xIyrOja0aNCv4s=;
	b=O5D3p5l6uwclZyypXCx0xhIRCsXT8ZfyfxKMBOyw9l75cz6yvDmJEINMMRrWRyYXqEdo
	 IWh39SNlgifhYfH46WXEyZoUXRMKOWEz1tG+m2X/V87B7hEQ5EX2mnEfRzMKqmZdZ2cLL
	 J7lrsZOXCk7ksFckZRDs9LKYRfyoFuzwzruc2zFZzsjl01QChk5fRWC3lAibNA1g/0Guy
	 aToDx5AChO1E7KOSM6qNzmlkuqfUeKh7IzreL/em+xz8voEOfrfu+1ys8zQGTq/rqh145
	 BYQONN8QyWO9Jsx0+WU6P5ZFYsL3ZAwLqmDs736hlzHLZAw5FMDx9Ru3TWkTgm8MhDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HAcR+Bkp;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EB6606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59EB6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HAcR+Bkp
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b5786e099cso2623343c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795536955; x=1796141755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hjuDGJo5FvaUieIpfh9C53hty/r27xIyrOja0aNCv4s=;
        b=HAcR+Bkpa004HxRUfTJY3WEFugk4DrMtqa4cSyLAfM4p20HtROZ10+oEpJurO0468w
         oSARFv4ld0uL/WKYDQ1ysOlDze241XKkxnVxXWoj5+M0jnXXv+CeubUShIpVtJrjga38
         Lenmmko9r2krGUix85QfzV046IYDBbFSjPmfXgE3p9sZA6L14XSKas4ArpMKhJAhDR53
         K27odIoV/iuzpUtMIKkU2ncWlF+ha4o7UFsKNV3Kmq4PjltFKMGvFHi4jjdnZsTCOHbD
         vsgv6yewbqIY78yB/S7gkHTbmxQSfuSYljIuChlNNIAXkjC/3zjPifr6DO5hT17NXw83
         /I2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536955; x=1796141755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjuDGJo5FvaUieIpfh9C53hty/r27xIyrOja0aNCv4s=;
        b=lpXl7QdANHOE1+hMXu7uOXgUCw9bcOwuVY0WttYrKfF9PYHOBnFxN3FCxgUcGEQ1cO
         EA/cF/LU8BKNROCf3kKyratyjQ8xT/cIejzKtg2r4lcLPy7DMNQaLxL7s4teoabCTYGA
         OKLLOFTxjSyWgsLZdQkQpikp8v+zXeIBiiQbbfv75S4O7nuUl06ix2vp3fzYvxyeOpkg
         wkw6hIkn0cn4wg5Krrfgc3R3i511evn466TYrkpl8rykvWQBCkaNHpeGRXntCf4ZoriZ
         WN936DH0TX5qkG4qd75nZpqvFriHxx+oMXAuDG9HUIy+VGGL/MaBOBWOabBKf0Iua+oY
         2Miw==
X-Forwarded-Encrypted: i=1; AL+hErEO6C22/F2ewogUhvNsx/HNYb9EcP0OOthLKrc0ox5qcGEaa6MKv9nl7Cpv4ad028cR0aNYBx3MX3pW7/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xzFbCHuVU+qO4Oi/Z6HD5GM/dwtaEMIH+OtwxtuX0QpntiiJr
	TRUwS51oYnGnk1IQphj9SP6TjxVhX1XLLkfXXJsW3L4Ji0CsqRA2c5RI
X-Gm-Gg: AZFdTZcoqMhYwYoK6a0zH/3DXuc8Y2Dm/V+sD3gVXzKT8td7GzGk5jHsNB3fQKUvO+w
	M+0+lqNuLeiFbfnpPmszsol6qCyCU3qOQr+iQ8U3ObU7m/hoVWrkIhFF1OZoheJIzJPCzT3pR4Q
	YmbEnLaz0/oPfa63ZxHvQCRI8hpEhcuyyzfG4u1JnW1H+SnaIvx00zvecJ8/pCzQwUaA911zecK
	6VZPyGxq4S5eBUsJUU0j/C2dhTXu8xlHJfAONVI9ebH0kDWRZk3IvH48dmAq+jbhnxIJRCW5oBE
	/QIOVVc2Tg0e1cTbSON1VZgSWbrQdknXQwMptUO3AM/4Zt/xiSjdcbWSpOa06qkO0J7SNoBHZ0p
	hv8bkxRj2Uj7hOxH9k0JIqD5DvjDEOxSQYzN7gRMMHwTIPyvuJwpSgEPu3qGdqq6CpT6OArUpS2
	e6S/4X+43UcXcayCibVsoRPEDxpMhZIM2Aw61divz1qnndoldOErQehP4/Qjg7SJu9D0o/2IU5S
	VUNKMEZXTS3iM7l7IBnZ+IjJ4NRkxNeooFiKgNw1q4LhbS/6DNqLfhLQiNcGyScW/oR06OBQyPh
	anL2v3A8TO/urEyWhevsbaYdtlJsBIY3qxl5QiWQJ8cZsrrK1u4gKslnO0RYqsqTnNYk5ZpeWyL
	fDCH2TY8hYA==
X-Received: by 2002:a05:701b:250c:b0:1b2:557a:aa12 with SMTP id a92af1059eb24-1b5568b35b5mr13133875c88.15.1795536955278;
        Tue, 24 Nov 2026 08:15:55 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm49454679eec.14.2026.11.24.08.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:15:54 -0800 (PST)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] sched_ext: reject oversized exit_dump_len
Date: Tue, 24 Nov 2026 16:15:39 +0000
Message-ID: <20261124161543.1225966-1-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.56.1
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

When a BPF scheduler is enabled, alloc_exit_info() allocates the exit
dump buffer with kvzalloc(ops->exit_dump_len). bpf_scx_init_member()
stores exit_dump_len from the struct_ops map value without an upper
bound, so a length above INT_MAX reaches kvzalloc(), which warns and
fails, and the enable fails with -ENOMEM.

bpf_scx_init_member() already rejects oversized dispatch_max_batch and
timeout_ms values with -E2BIG. Reject an exit_dump_len above INT_MAX in
the same way, so that the map update fails before the value is used.

Fixes: 07814a9439a3 ("sched_ext: Print debug dump after an error exit")
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
v2:
- Read exit_dump_len once into a local (Tejun)

v1: https://lore.kernel.org/all/20261124100508.1060692-1-rhkrqnwk98@gmail.com/

 kernel/sched/ext/ext.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 10de6bd865e8..18bfb1815a4a 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -9220,10 +9220,14 @@ static int bpf_scx_init_member(const struct btf_type *t,
 			return -E2BIG;
 		ops->timeout_ms = *(u32 *)(udata + moff);
 		return 1;
-	case offsetof(struct sched_ext_ops, exit_dump_len):
-		ops->exit_dump_len =
-			*(u32 *)(udata + moff) ?: SCX_EXIT_DUMP_DFL_LEN;
+	case offsetof(struct sched_ext_ops, exit_dump_len): {
+		u32 dump_len = *(u32 *)(udata + moff);
+
+		if (dump_len > INT_MAX)
+			return -E2BIG;
+		ops->exit_dump_len = dump_len ?: SCX_EXIT_DUMP_DFL_LEN;
 		return 1;
+	}
 	case offsetof(struct sched_ext_ops, hotplug_seq):
 		ops->hotplug_seq = *(u64 *)(udata + moff);
 		return 1;
-- 
2.56.1

