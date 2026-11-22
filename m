Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373118;
	b=YcPyjo/gwVWjiX7bbqVnqtZ7KYo53cXwPy/0uYWm+a2FBpAgaefAbhNnz+Iw2qJ8Y4u+
	 yQ2wdOf+Ht4JFBoAfDjIuVALqYZi4YxpbAE8tQWoXjBXruMuBujQHuhrujWaEhgcdfqjN
	 JwLP3/0UoFW7NPhwyF5fgUyRBTR19q5gPYuc0O1PlCu+9FgNmPy78zk0iUL0TKjRf3E0Y
	 iSfW/Ow2V9mQnm9XeCNkEesQ8qO6LWT3KNSqmqiONkCrOxG7+9wJ6h/PS0m/xjst4o6Lg
	 nLwqqSbODOvDSRAjF0cyMtFbYaNx6Cf8+en4jMvm1fBEemb4ONa8k52jxYfMrLGQlQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=e4YD2Qkz46kmJnaOLt6bMlNGRTvVnPoZLyisE+0GvOE=;
	b=2Gw1gVkXIxOYYrGFd6SMVRa2AgOi2ANNcagBAkYN5lrjfLY7wHM3rJVotslY5Kcg1CF+
	 6zxyb2yc3A2cYEjMvEaVyl4/jIh+VyzzVYn7fKQ2beczRffuWoZXfLbad1EAy6EeS+NV+
	 GSIjBdgNOMFqPu/MuGnzVPedWKOT7ygGPszWqb0oZYvDIhGHHoVgcE5aIgqSeFFCzCfsK
	 9B2EG6G4pp97Trhz7pMrtBZdBgz0QVC/4c0V/BOS4JIoTnOMe6v8/Jrtuj/7KIFXgSD8Y
	 dwTvGw+Nc9imbtcenOzIod7WvH8g2A6xHGQdIXrS63uRswjxHD6EyL0xrTtKhvXQnTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vogv+Bam;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73262606A6B2
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73262606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vogv+Bam
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so4198931a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373118; x=1795977918; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4YD2Qkz46kmJnaOLt6bMlNGRTvVnPoZLyisE+0GvOE=;
        b=Vogv+Bam29wyp0IflkdLeOXUnOM72L04+hkeoEhbvIRON0gQbyjOfW01y3OvrsEO8m
         Gjh/aD4tlZyAPZUVDeuXpghcW1vJS5YQpfNtWRipOOog856bYORenuaSkToPVE9JppHG
         OJ729oMKfoDd/MtVY23hokiCEI3z6gFoBvQkn0PqZrwvjli3+GqhkYKr1NHgahbkcs3y
         ZlTEk3iEKDglpRils2S/gk9KLR/c9gUny7eyponCClAIsdYInHSKBzqhQ8/megS3hiNo
         VXEnyqM8Lve6PMc7eU9ekC7JzHelbUePXteVZDWwQkvVWtlHbmDV9FjurK4jj+QZZ0yY
         gV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373118; x=1795977918;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4YD2Qkz46kmJnaOLt6bMlNGRTvVnPoZLyisE+0GvOE=;
        b=RJlU0Pfqu6e741zF7ZXhmeRacOUW6illgTTvUpRk1sbxDt8i9b8+L7zwl6fdeW90W9
         SvXkYUUKkbioZgAVIrguleRrdfjrMwrJa2+flB0dnqy65BmHTZ5xSuvoeuIEvf5p3INl
         ck4mdgePEtr76n5PEqIkaOqxaxaR2prkgqOCYM1eM4uwrwQc3LEKIoR0PB01ZdPr+a3A
         78WAbuAXBRNG7a6bJhVRraq5Ipoik6bwWWI0a5/a/k4PkxaePI2Mqr7oM2l+IH77p51t
         QcaMcUywPJa5Ju55MVMGJapnk9nF7PM3Lmurs+QhwG1VV1d3il8W5/RBxHg42S0wtedq
         c+eg==
X-Forwarded-Encrypted: i=1; AL+hErFHK+8EBkX6Y/Tyzftbna6tyxaE50Xy0RzuZb0gSDP4K8QksriBBoqrBG1PUDq2JM3YDW5rsrLAmR6DVdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N1gTWeEFEx+5cPpKs3VCpzXUeWcOCQbXu9iW6DtFR4qWCv2w4
	2rg8SpTpOjSmQwdmHAlOBJZukPMlzpL218jLEjedDaRl4P8746pMtljuu2BsBpHfeafLyXVAWE7
	h7bbZ0/dWd5jTG5VRc36iUQ==
X-Received: from pgdo12-n2.prod.google.com ([2002:a05:6a02:620c:20b0:cdb:928c:57fa])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2f8c:b0:3b0:b556:ba9b with SMTP id 98e67ed59e1d1-3b41c9b227fmr8076249a91.23.1795373117646;
 Sun, 22 Nov 2026 10:45:17 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:51 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-18-jthoughton@google.com>
Subject: [PATCH v3 17/19 DO-NOT-MERGE] arm64: Drop BBML3 requirement for HVO
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

With PMD updates being done with the Access Flag trick, BBML3 is no
longer needed.

Dropping this requirement vastly widens the pool of systems this
optimization is valid for.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kernel/cpufeature.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index d241638b5143..6281769f4df9 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2062,12 +2062,11 @@ static bool has_bbm_through_af(const struct arm64_cpu_capabilities *caps, int sc
 	}
 
 	/*
-	 * We need BBML3 to support Block -> Table transitions without taking
-	 * faults, and we need HW AF support to support changing the OA without
-	 * taking faults. has_cpuid_feature() checks HAFDBS >= AF, reading the
-	 * local CPU's register when verifying a late CPU.
+	 * We need HW AF support to support changing the vmemmap mapping level
+	 * and OA without taking faults. has_cpuid_feature() checks HAFDBS >= AF,
+	 * reading the local CPU's register when verifying a late CPU.
 	 */
-	return cpu_supports_bbml3() && has_cpuid_feature(caps, scope);
+	return has_cpuid_feature(caps, scope);
 }
 
 static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
-- 
2.56.1.809.ga0b61035b5-goog

