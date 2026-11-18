Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989630;
	b=e3LXN3sChe+Vj8Va7fZPDCESe1bt71DSwZU9JI6fC+N8q+TRVVOABfenMPhtk+BJ2nB/
	 IAXgbLTeStqR4rV6bWtUxMZ2veTs8D2to3BqSAOyOj37E9Pae5dRhj8cxAh6LT60X70wv
	 7uA661HjHysTjXQY5psnT2YKYCNwy6wHOthrwZEf/2V3358Vl+8kQfyIL09SzsDk7sPFX
	 J3YJZ6dm4g1fUHQb+o49L8/h1yU2Tw7JnZp+MTvVyFiw1riNlRFU3vKjDKabmYzY+Mlii
	 /BwfzLjD7pBXAOPPquP0X/sa7US8P9EGfwyHDeTFuPmd5V3vA9D8Y8+YJ94aPSU+rOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LrvbirXIkv4em6QifUd4OnpixRUwowvXHi+8bl2oRk4=;
	b=P+ptpqqXoLOrGWnpdE+VLT5ogBjPRMGl9br4R8U0Ns0ulgSlTkMSMIrkzIhRtkBm/kNu
	 EAYUSSFj4s6ScpIYGRUpZbLjJm4xqytfP3E2cLhQM3epHNhGfCUq9awQ0UKBh8JqfXAhg
	 hry6IXiGo5ietRKoZ4PIkgUWvR7AFwMdQBttOxVn9g1kywGVKU8vzYpgMFVwayrvFlhex
	 PLrnAW8YdYHk1JThxVz9vRT0bgYuR8gOrQFDOI/ti/CRT/SbGzszjZpMt18nJZy2IqYYg
	 muW4JYIj4gLKz0ihcRnJGyk/AHDG6W/PhTqxge8CdHkcaW5whTV9XxiJ0BJ4+wtKJ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="F16/qyxe";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD52606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFD52606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F16/qyxe
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so408437a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794989629; x=1795594429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrvbirXIkv4em6QifUd4OnpixRUwowvXHi+8bl2oRk4=;
        b=F16/qyxeJCnpp8cEUhvsIzwqbJ3dET3mcVkZCGuvG84FDRLSUKSXvBkFC/dcL95h3O
         nH+PR4V5h9u/CXPhFMsj2uTIAQIRtXn9Cs1Qc/obD1SHjPm/7cFXYoBKt0lWew4PsVZv
         Nkpu6WKaEpUTkfV/bxzun+N3aGLK08cjIVlgVcr3l+1DTbZCgg/jynXsSXRv4Tb1f8Wd
         0jYwQESDhgu9TfRoJ8wWU03yiHbjIPY74faHqETp1xJiWE+6/NB0rxJ7NGS/x48BzyGh
         1H1KNf+bmnqCe57I/4C9YZGtKmqRqeBA9oS2Uu+UmUlnQiI0uSKN2Rv8yBHqPAacLIN0
         yjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989629; x=1795594429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrvbirXIkv4em6QifUd4OnpixRUwowvXHi+8bl2oRk4=;
        b=ncsz7iPlKsA5JjEyAYU/Wf2KpgfdgYuuvtOV8OasR+jVJacqVjuRuK5d6GGho20UVi
         XNhhVVMeYcY4dXe2fhcN872jK2Pty0csI8/WYRm0yfl0t4FIgDXZSfgVYLySj33O1n2J
         H1+ZADsfIAY05y10dDttF5y6FhJYFB6+zjuRMr+B7GCm7k2B2C5hZW53mi6BPiKeSj2p
         hgz/OsYFOzzOUEwkY9cLDht3OWJZtl1x1aaEdgmpPrJEuufLf9A91VFdHgJJ7Tva6IEr
         ASk90OKHK8qLRN/uMY2gsOcBnCx045mRRZnbDRBxcuN6hAxGjvHFvIP+UlJEmPUAHqvh
         b5sw==
X-Gm-Message-State: APuU4Z9vDBsBB8qW+gIYACkP6lnJDXPGAOf9r+4v4+7AgkqFHY6m3pGo
	Nxt+IOb7HqjdVprLOT6FJz8ySbptzKN++u5384nQxDgx9E6hqNqTEbck4F8X9JYrrnw=
X-Gm-Gg: AZFdTZeD/hqNcC9jiK3oIJmzLTxylY1EeQG8DWJfyYtv6ew9aMW6mNu84mNjJkw/jzy
	HuImPeMETXoHyWbugIyGqzq6JPqbDjo+iAWfLqolbYjV7Y49dO0Jil3vIZOa2feANWud9A9TWZE
	x7eIN2X+c7wQITJrS9JDfgDjc9vPLc2MxVSxbWz92s1uA4vsFRRjVuZ1/StLKovxILI9rijwK7l
	zAN0P+AKl9uYt0vpN+pqa1szsLDr3RNtly5PJNQ/Hv37cJ/42O8C51bfYmYE1p6JgnbzvpasAnZ
	hhM7dE9GBf/yi6Pgq2PON91Ha6NlGqiRE7iKli8CMWX+Ul68/eFimGkatDJnKd3Fo77eH/oPhip
	5ZVwuOakxbAKiHSF/E0OH7fWl7FXj8pSmpJdrKjH1CK1RdGAzQusrYvI5ANDvh3jZHgS0uAOHLJ
	KNIrNz+GPjWer1mJ5PqvUkwo6uqrxWBwY9GteOap2cUXwhfLP/MKqNJF4jVFAr/vx+iCj58mnD3
	mOYPrTokz5jpttw5VOKXFC01gSilZLR9GfCMs4WLW7xY/dcSMqtre85a6d2AnsH+IAyRL5vRHdw
	0RbLV8rHh/mZ0LGPIyLZw6m7VaDZuemHp9DdoisnoRpwwrNKp9pjpZ9K3u1JnuhJFK/FNsPQTD6
	6zp2rdoo=
X-Received: by 2002:a17:90b:3943:b0:3b0:a7b5:c046 with SMTP id 98e67ed59e1d1-3b3d07e09f4mr2098689a91.54.1794989628976;
        Wed, 18 Nov 2026 00:13:48 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3254680a91.14.2026.11.18.00.13.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 00:13:48 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andrew.jones@linux.dev,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	atish.patra@linux.dev,
	anup@brainfault.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	yuanzhu@bytedance.com,
	cuiyunhui@bytedance.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	will@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: [RFC PATCH v1 1/5] dt-bindings: riscv: Add Smpdis and Sspdis ISA extensions
Date: Wed, 18 Nov 2026 16:13:29 +0800
Message-ID: <20261118081327.10684-8-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
References: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
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

Describe the machine and supervisor PDIS extensions using the pinned
sampling draft. Machine support alone does not grant supervisor access.
These are draft bindings, not ratified extension or CSR allocations.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 79491ef8f86a..afda76b9c7c4 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -214,6 +214,15 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: smpdis
+          description: |
+            The draft Smpdis machine-level extension for Precise Decoded
+            Instruction Sampling, as described at commit
+            2de60e18118ce78e2da82ec33296345c94d8560c of the
+            riscv-performance-event-sampling specification. It defines
+            instruction selection, filtering and sample collection across
+            privilege levels. This does not imply supervisor access to PDIS.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
@@ -269,6 +278,16 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: sspdis
+          description: |
+            The draft Sspdis supervisor-level extension for Precise Decoded
+            Instruction Sampling, as described at commit
+            2de60e18118ce78e2da82ec33296345c94d8560c of the
+            riscv-performance-event-sampling specification. It provides the
+            supervisor-visible PDIS registers and behavior, excluding the
+            machine-only state. Firmware must make this state accessible to
+            supervisor software before reporting this extension.
+
         - const: ssqosid
           description: |
             The standard Ssqosid extension for Quality of Service ID is
-- 
2.50.1 (Apple Git-155)

