Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706712;
	b=DHlQ1GU2BkgHrtNrBIu5mn2TtAI2j3pmyyyJgpy6SVUYLTXnl1UwycERQwZA5g2Fenao
	 43BkfGRvV5MWJon3U+CfaPb+48aX5VXYpMQVZsv1uOHHzkMpoCQTY6ujn5LS5IV+Tc6xe
	 zwF7/O94w5KP8XC+sxFNPgMNFQ7gaM9rISJSMqipmSOdqWKDvsPFf32Db94TCzhfu2AMD
	 1BdIYqaNzVaqm2F/RRO2keogiFsjsZdPnBcWhg3Wywq6AuuSVYFY/hIOjduqoPQVmHpb+
	 5xA3MTNjt6JW3BIukCiA5wMNHzmvXJTaprfIJVpz8kMttEPgrMDCZ/v9lcIu25Dj02A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BqRG1LuOpDExRDTrGF23oj6l4nQRPQ7+tHM4PrJN7Ec=;
	b=r4XsaE8M1PRI/k+VlYsI9Fa8KGhW2jtgABn0wwP2Zu7h34F0OGiDuGG1FlS3amm6kj4U
	 Rz8Snr0LmOHDm5+ztqAcI1FpDcokgQ3n+pqybDy6rRm4ani1bAUtlLKrd5HTHMXHWMiWi
	 8Jb31yW0yZ9XmplWojtay0fhm2bevuh6VdE7aCJkh+dmw72o5z/79cnZyRT4547h4nzTU
	 cJJoQUgnSxGxr3npzF8iZnB/XgW93SJj7rFC+vo4bjHb4X3/3DUb3FCrK3uNGEJ/uTkKV
	 EDnBTc+g2RG22QrAnJjMqeRjDWmBzHxtPLLqkLIj8QKKHPNgS4L0WrB+ASa2bGOVfyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EdMblo7x;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EBE606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14EBE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EdMblo7x
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4aa5833c263so6885260f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795706710; x=1796311510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BqRG1LuOpDExRDTrGF23oj6l4nQRPQ7+tHM4PrJN7Ec=;
        b=EdMblo7xTVv1VlX7s7P2BkDQnlDGm6fIOiZerAetXQOyPS177WLQ+MmIgLMm9Yv4fv
         PEWd7KN8X1I3aHAf0rW8DAkM/lg0ty2ssHgeIY9Jbn4TT6+BvxdWzBUsKKhZvAZQpbl3
         KMtQAu92o0YrbiYjFxehvJvHzyRMF6fWI6ksbsfEnr+nGw2tjomwv5xW1RmlISLsIWfS
         Z0JzPZXTGOiPQWIlYV4w/pAVgOZZHWssLV7FnpJ5iy8yg5jz3yTY8eRPC9j+LCXHgpqw
         HjqwGGEc4wv1M7Af0gLTi6Y6zduTvIfMuAuDeEjsINBbdz0j/Y/6c5gtcON0O3LWqOl1
         6jtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706710; x=1796311510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BqRG1LuOpDExRDTrGF23oj6l4nQRPQ7+tHM4PrJN7Ec=;
        b=Vf055guRBqCmT6v7Hf+PQGyoUeCaA6s1DzNxugMXg0bQsggjPHDn4g+SMdxGDBd/gL
         64mRF9aJUIfnfONdfsR5VOlYD4aqow/aJGjih8W0aEHzOj2srC4W5HFybB0Z0FII5bHB
         bbGFNTVsvMXcLfPdNf0NS77D5op6aljaAn0vMFyOp/w5oizrAGnL85UkCRpomkd9xdez
         xkDCEmLKo+0/rlziL3nGQ9t+j9y+4z720KuqE12GQREUQb8e0o8FrgvkMNPBtGcZnu9B
         qf/pj6Xw60/CsJ6Vgs6WeLUNcGXSZQrv3UWYYi+o8opjGrrSUIt/Ud32KQJY6MfAsuYX
         YupQ==
X-Gm-Message-State: APuU4Z8G02LgKnMAwWt5D4wdueYkFhcixP55iI35DSiowzCfCQGXWXsX
	jh/+LsHmsuz/wxjFVAlDGcZlTrDwPDlgEQZJIXSPmPu3vn8GhezFg9OdYd83zLI/+kbeoWlRm2A
	FCExfyI8=
X-Gm-Gg: AZFdTZcsyUx2YKS8D2OIv6bTVmenninM3v/QTUgNhlCbh54iXsNmwK/4l0w1CP9ClGE
	jM3alHoyZ9o/ZWXxQ08BdMMIdmgG7/xwHTUlva/gKuXxavCFIhCABLac2bCz/Deesx3hP+doopr
	ROyPlke+2LpcVcsWRAKUUm5t6g6iODJruZnO6SztmlDX9Rh9EXddYd9LoFxxugeoMIUVq2aVanJ
	RAITiuYahX+39IxLle25Uj+otVsir0AyvcWbHCTncH0KxnNjEuvCt/Mo/Db38svxdIrNnLpdkuN
	5M7bT6s3OWF0KawT/uV4bG45njybkpKs9ziqbr9UtVOQsq76EnGKq4uUooBvU8NULY/FlPoidlg
	l3ZyTdRj8a+oqbmnpIvJcQSrIPu41vJVqDGJipY0z5XU11ULiGDrazDlESMO2sSyha5K5lRcyAz
	MoggOv/nYq7SbkwRC6AVaSCi8rEcKamLoK2d8dxc4vty7T9l/p6uWt2mF3tUNPq4QQwf9oDCzUs
	EwqcapZOiSPgEKaH/+AL/ISb0u6benjqIsob90sqhT0bIKqfw8Dc5ipIbZtYoPV8q26169vkK4T
	S8Q2jYRw24Nz0tkYbXH5mQ82Phhne8X2Z+LkwqLj46Iu1nLEAWD7
X-Received: by 2002:a05:600c:1c08:b0:4bb:7757:fe6d with SMTP id 5b1f17b1804b1-4bb88804c5fmr541557365e9.11.1795706710375;
        Thu, 26 Nov 2026 07:25:10 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm569944295e9.2.2026.11.26.07.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:25:10 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH RFC 3/3] workqueue: doc: Document WQ_PREFER_PERCPU
Date: Thu, 26 Nov 2026 16:24:58 +0100
Message-ID: <20261126152458.742942-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126152458.742942-1-marco.crivellari@suse.com>
References: <20261126152458.742942-1-marco.crivellari@suse.com>
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

WQ_PREFER_PERCPU implies WQ_PERCPU, so its work items run on the queueing
CPU and are concurrency managed. While a CPU is isolated, through
isolcpus=domain or a cgroup v2 isolated partition, the work items queued
on it run on an unbound worker pool on the housekeeping CPUs instead.

Describe the flag next to WQ_PERCPU, with the cases it is meant for:
work that prefers the local CPU for cache locality but doesn't need it
for correctness.

Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/core-api/workqueue.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index ef8f613ce402..44349c33e154 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -189,6 +189,14 @@ resources, scheduled and executed.
 
   This flag is the complement of ``WQ_UNBOUND``.
 
+``WQ_PREFER_PERCPU``
+  Implies ``WQ_PERCPU``: work items run on the queueing CPU and are
+  concurrency managed. While a CPU is isolated, through ``isolcpus=domain``
+  or a cgroup v2 isolated partition, work items queued on it run on an
+  unbound worker pool on the housekeeping CPUs instead. Use it for work
+  that prefers the local CPU for cache locality but doesn't need it for
+  correctness.
+
 ``WQ_UNBOUND``
   Workqueues without ``WQ_PERCPU`` are unbound by default, except for
   ``WQ_BH`` workqueues, which are always per-CPU.
-- 
2.56.0

