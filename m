Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627227;
	b=af9cfp4PCBR2HxtZqyzuLoiPvcywV6nAC6MjqyYcAXnyS1FW/OFP+lOUlcEDv7xCb4vS
	 OPG5A/inlNq9AsBZlDKRd1q7lVw24X0MuTcO8LS21f6GA3H+IKPKky9hqnqB3wsMWQq9H
	 xPNsIlFER3OtfYh58SuP1WVUMWoD20GAiLmEZ99ttDStjm1/tEimv7CtTcrDQYfICJa3J
	 lp1thlYJitPAG3hffIH52PTBrw9Fhdrd5KAgS2lahbFNdrxjtDlLNOGZYfJloA6HSP7cr
	 pJWju6OhC5r//aoLQxv4uItqLhbRR0OineWm1jt5vRSvRdXqaFvO82e1kWuB99zYYbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qz7iwpD+T7mmeMKXzktrMNh0w5s186HdlphGIpLEmgY=;
	b=1BD7hll6O5EOIpMeaI1djmPG+gIYEHtif/9eFaLKHkZ2cyE7uD19IiJalxOTHFicZclC
	 v3L/PuGFuizZjG5mEDYS/MV6M5oyp/yQy02aX4rXKDhbXWZ8ppAD9X3IKa+PCo+VKXD5U
	 nPa7uU8l5aTf3R1zQ9m0UJYq6CkoPw6J7SQe9DTu0dyhq0WqTaPlg5UH99uVB72HJlU2g
	 CTU1MMTstc/pzn9jJ9G8gWDzknH/4LGc1uLAx43lIQVuCHVWlTzrEUQVuTV6UNMF3tqw7
	 5MbcxN6kB+iHOzx3qH6oGCGlxTXeh9Gc5fZgmqBs9D8KbVbEi7QC/gbQVG6g6l7+kKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lC9r/a0u";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C527606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C527606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lC9r/a0u
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso3379721eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795627227; x=1796232027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qz7iwpD+T7mmeMKXzktrMNh0w5s186HdlphGIpLEmgY=;
        b=lC9r/a0u2sIwOi3TRlxPQDOagS68l2RVkFP90XIzYLTdcNtaXrLLjG64z1uJtDbjC+
         rN17cA9BQAEfV/NtS4hs97ZyClcrTNQz2oKmTkhhwcQi+uP1dksDG855oNzyA1DwZm2z
         xuwhIB6lPA4zocJg0Ji0a4YFLqFmp+gr+52ohREpbmWcN7+Bsd7jPVMicssmn7+iJu8g
         2j7UvPw2T2fqfG0MUNVWJb+0cJlVdzRAK7tOESFSSqhDuSJVgtt6E4j5lPUOuCkks4Nm
         3lbZ0Mn//ImVCI4AYVL9gnHN2xyKyHTAHeD+tFSlu/L/+HyeUM24eKsWkwDllfchPL74
         AehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627227; x=1796232027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qz7iwpD+T7mmeMKXzktrMNh0w5s186HdlphGIpLEmgY=;
        b=bMNoNKWfeo3595nLTTgMSbyVZSWcOwp/3DEdifcNyqv4wlzT8gWioK7YZU7Y6ytsw8
         jsmzx/LryOPNWBDPlSd6irO5enP0tzIszdNiZd8bE6scCE/LvUHR6MvkvXGmDI5krpaa
         DKrgNwb4AsccSEkB5wou4Dhlqs86Ptij6OA/jLzqyGgSVcsZX8tmWdJnHzvIQGDSuAQU
         TkVRJYgxphHav8912qnAP3vgCWWrmZpxqgGo4ixLBodHZe5CaFpPb+JNRwPC3wQJv/mi
         Ej7Ipyjic5kzssNXDJBHbjUEI3BxDst+jyiYgC/m5iP2VJveIImkbEwvBBEMZLueNyGI
         yrbw==
X-Forwarded-Encrypted: i=1; AL+hErGMT8oqhcf9vCkwaDyKvQh1/WXyYM3fs7PMUe0G4DiLuEs6sAwlydSZX5HGs9mjGuP0pJcajxSKRVT7CNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J9xKeuBBuRzsCnnrfAMD3ToLImYznpZYU8OzFbJ1jHyxXRMuH
	CwxQiDIkhXuKaR3W7927hfPIGQ16WPeoXGPeb8l1esU84Ma5HXUidWp7
X-Gm-Gg: AZFdTZf8VkgO7GGWwyTWW+5x45bLg+x8kHBCnHK44Jd+DfzxviYBQ/vMdAJ7lUMqZUW
	rPQuv33HBHQXP8sXc7n96VD5lCRCLUComQv/jxwW9TOmgaebSasZ+RNg/BIVZPD52HQ0MOlaQfC
	BmZfP1hM4iCvKMDVtnF5XocnTdoguip8nJavE1l7JUY7x3Ugy5uh9MR8F3TS/LuI/QJTNQ4AOAs
	CuormNXsyJve+xJF71VZ05z9eowRtuPpCOBuGiYrpIUU/JTO1aY+onM2/A5Z/7R0U6EPhTsip4Z
	HZ4nU65CuvGj1ktkrn34ISPQu7HJp5tZQyfAKUhdTc/jVr5/szhl7cl2u1CoaMJaG/1r7QL2MoR
	rTuWax+GA3KgiVQRC9NEijvrZTpTRqJNG1piyfjMu6L8Ozy5CgvX89RVT0xOV8dQ/3i6udBLU9G
	dKfdNPFp5K239xf6cJAJ/vQrk3/IrsYyW1dQ3a2UJgEXvKwXAPl9ZrJDTk54eye2uD1LlULdHFL
	vIAAF9eeCM6+ab0LN317tP8yPYG7++0gUdGjkeVxZaAELU4UyLRQIdLP25zRLT6TpQVOtxhOGrG
	cOtEt5v6WTXHDS6ef+zS
X-Received: by 2002:a05:693c:42da:b0:386:95e7:8497 with SMTP id 5a478bee46e88-38695e790e1mr15040048eec.28.1795627226405;
        Wed, 25 Nov 2026 09:20:26 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm57637757eec.28.2026.11.25.09.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:20:25 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] gpu: host1x: Document the get, put, mmap and munmap operations
Date: Wed, 25 Nov 2026 17:20:22 +0000
Message-ID: <20261125172022.2344949-1-takano32@gmail.com>
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

struct host1x_bo_ops documents its pin and unpin operations but not the
four that take a reference on a bo and map it into the kernel address
space, so kernel-doc reports each of them as undescribed:

  include/linux/host1x.h:159 struct member 'get' not described in 'host1x_bo_ops'
  include/linux/host1x.h:159 struct member 'put' not described in 'host1x_bo_ops'
  include/linux/host1x.h:159 struct member 'mmap' not described in 'host1x_bo_ops'
  include/linux/host1x.h:159 struct member 'munmap' not described in 'host1x_bo_ops'

Describe them from what the implementations do: get takes a reference and
returns the bo, put drops the reference, mmap maps the bo into the kernel
address space and returns the address, munmap unmaps the address that mmap
returned.

kernel-doc on the file prints eight warnings before the change and none
after it.

Written with Hermes Agent, an LLM assistant; the author reviewed it and ran
kernel-doc on the file with and without the change.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 include/linux/host1x.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index e7ba601b2afb..411a1c84eb61 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -146,8 +146,12 @@ static inline struct host1x_bo_mapping *to_host1x_bo_mapping(struct kref *ref)
 /**
  * struct host1x_bo_ops - operations implemented by a host1x_bo provider
  *
+ * @get: take a reference on the bo and return it.
+ * @put: drop a reference on the bo.
  * @pin: create a DMA mapping. Implementation must not touch the bo's refcount.
  * @unpin: destroy a DMA mapping. Implementation must not touch the bo's refcount.
+ * @mmap: map the bo into the kernel address space and return the address.
+ * @munmap: unmap the address @mmap returned.
  */
 struct host1x_bo_ops {
 	struct host1x_bo *(*get)(struct host1x_bo *bo);

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

