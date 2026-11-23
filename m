Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413867;
	b=FwVdtvvPv3zDi5WI2AqJQaGwdjj1xyn1wxRyK6lxW3WFo6XeDYnj70G8nD1LyL6WUagi
	 J8qsPOgNLx4wGUa4VHVxipgBTReV3Zgb75RjZEU/UaX8lyrHdGcjHw305GDkAK221z+kN
	 HvWPPd88kYRqx6REhjDdsytO90umQ5EHg0Nr3qrtvgQPMrFulCIB2H55HQ7nKUZJ14bIc
	 R/9d/Cos1RAKpS+QoI4e4pbkdlgROjZ0dW2T0441X3XWFUJspWHvvp6D8gbvE/C7IOaYc
	 ZVUvGUiTwGRm68Gu7ShTHjN57WHNecs4LydXcA83MLvaad9Eo4SAsJC57d9LUEboV+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jsXyhz1mAQcwd9IrBSuTqhPASB08uhszosgJWkzp21o=;
	b=jqq1oFSBckLNV+sahJBWIXGLrInVP135iHoIOichkO2L1vRKNZEj7jut5lnIHb0XgfkA
	 TbGrFsWjoR+a7heeoHT+v0u9L4EHesNFoan7+tCOPy2UxNsrVUZ5AeualLEtHiL4AKKXe
	 Nnz14aeisX3HNy2Zkz/x9QZ+agjjj7kGK2qj+wLluSRqCGsycUi12QVqVKYiS4CEPSY0u
	 3sRGtx6RlYnqTxLp+TWdFv3nw4/L7jpQ00zVAmY7Y7DdrbriwzIpy6y0k95CDNnJEMG8q
	 VTzcNG6TxQhdsKnkc+81kgsr/kyPQqBqJVu7iePGjE1XkrWT9Wz9TZeDSsqbN3/qyHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afE+iKsH;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E44A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E44A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afE+iKsH
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-86298f9267fso1662344a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413866; x=1796018666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jsXyhz1mAQcwd9IrBSuTqhPASB08uhszosgJWkzp21o=;
        b=afE+iKsHfc4xGQWKOR9pz5A41wAXP75O50BOpyebZ4JW8StnnX1LTIhxWRUrAShViR
         qQNMp84nRhljzEPNLAc74NKlS7CsjTTT63KRIuLGIbu2KwtxbCbYPMjK6NmNBZOw8Kb0
         4FjZTMAeO3YVOXM8B8oqOTgSGAL1o9fojxL9ItczwQDPZd/mrNy50SAYyX9AL0gdi8FO
         Glq2bhaxRSdayPKI+wUF621gGIC3T880/5LpBjfepvnaTdgOt7oUIyoshjiJ5+nz70OT
         gXLJwQAUbE1Qo0BFnC1lrrDB3yXo61yWL/pU1DsvUqobuJX5B9cDKbGmEItZKPUR6fZu
         Iq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413866; x=1796018666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsXyhz1mAQcwd9IrBSuTqhPASB08uhszosgJWkzp21o=;
        b=hXfCJsf4/iq5aHi/Z0AFgZeE/N2ZFK36j0Bjcy3w/MEpGDP9MfCUM1jjq3ifrBrpRV
         uQXWr9IprXIGeMPvorObt5PhsYZjAhzcIyoCT9AlhtVJMvnD9proaYkAYlatRpNJloKa
         9D9XUKwR8C7Nxr54e5Wy7vq7YK9k4laSIREilpRuZsaYywKH9EDBFb5+QVgR8tIvhBIl
         y7oK4dx4QIf7a/5EFJWDVErv+eRMAjy8KvfsArX9ogYGL919Z7iAM0M/59nHRFx5vvQP
         NrskBlVL41pZQQkwRqF5sXLkHexz97XRz3WbCugV6ExAj9Vf5b6TH0m+elRrBsxuseIa
         6xqA==
X-Forwarded-Encrypted: i=1; AL+hErHkhE9HkatwO1e/Xb2vAjUrhcgelnQLCWSA2YwYMCCZjiby9kb0of19ETL+8upU4dpCzcYzJyFzk3HCweQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9apF9cj+Yf5qon1g4/mz7Fjy32sQ+ULNmyGQxpj6eGvoRIrrqs
	qPio+OWzyVwX2AmYYUgJDcXSxVl+xKmCTs2Frxew8wb4J5OEoNvnqZOu2dfKZWbL
X-Gm-Gg: AZFdTZersIbOkT5cXGmiSlD38A0obc3F7dyZOeOnZoXroM0kbullSXRovPoEJCWvgKz
	D4JrbQmed9M5eMbjzsi8I0zrTMWN7a8XNAqYxDWVyLumygF2uBWxyW0rfBhOjJzaXau/VQVO0kD
	AOcdNsv5iffyas9MVsMRoVVrVsW4uTdTNysQTp5vYRu5l09ay1L4913oM2p5CalZBgCfzfdTrpE
	fxBHr+NbBmB0b6KyG42qLFI9QOwGZyq3pJ5ZKhs7uowFIRQt8POacgB6yEqrupzY7jmxOZJ7G2H
	W4S8av3oids3azzz4ecUU1KTgw61EpUqSF+I3Eyz5phWQkCW6NxXshjQgd/i0zYtQesfTwUcUEK
	M6hD7AhjZ2SvPSHrA1st+OqryUU5yBKddx+uj5Tq6Kc4DkAZeVRTIy0ppWgVVdZUeMx7rfkidei
	SZjdkzC2G3YVUBJpqEBc9XH3NGG61HWxsGV/2yTMq4DR8tb96NzMN1PGuQex54cazTRWJG88aHs
	7UqnfEOShptgQmDZRiwuICe/24sIeOzrGdHtj8SIp/4e870drrsJ5lZKacm6Hh4jLg4YknCptmE
	o8lxlNMV9pEKgmnBt6jlhy5LVP5UR/OEGK1UbIjru6X/AlNvUXmLq0ZkFNlr3GCREDaKgUAcMlW
	MaHNnI0q8Cj7VaIBVz80lD1lBOm7A/K0k7t5Wq6NbMhvjmL3VY25UlKqnx+rU/f0Z+KxmD5/2Xc
	nC3MjO/Lflf1rd
X-Received: by 2002:a05:6830:2696:b0:862:c9e8:5788 with SMTP id 46e09a7af769-86314febd1cmr11692365a34.0.1795413866122;
        Sun, 22 Nov 2026 22:04:26 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631681f30asm7644864a34.1.2026.11.22.22.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:04:25 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Wei Liu <wei.liu@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Yu Zhang <zhangyu1@linux.microsoft.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	iommu@lists.linux.dev,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v3 0/2] iommu/hyperv: Don't free a paging domain the hypervisor did not delete
Date: Mon, 23 Nov 2026 06:01:54 +0000
Message-ID: <20261123060419.119078-4-oss.patchbox@gmail.com>
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

The Hyper-V IOMMU driver frees a paging domain's page tables even when
HVCALL_DELETE_DEVICE_DOMAIN fails and the hypervisor still has the
domain. Patch 1 fixes this when a domain is freed. Patch 2 handles the
same failure when the allocation of a new domain fails after the domain
has been created. As Yu pointed out, the current Hyper-V implementation
does not adopt the page table root in that case, so patch 2 is
defensive.

Changes since v2:
- Patch 1: Added Yu's Reviewed-by. No other change.
- Patch 2: Reworded the commit message and the comment to say that the
  current Hyper-V implementation does not adopt the page table root
  when HVCALL_CONFIGURE_DEVICE_DOMAIN fails, and that the change is
  defensive (Yu). Dropped the Fixes tag for the same reason. Added the
  Reviewed-by tags from Jason and Easwar. No code change other than
  the comment.
- Rebased on current mainline (8dac6df92a2e).

Both are compile-tested only (x86_64 with HYPERV and HYPERV_PVIOMMU,
W=1). I have no Hyper-V guest with the para-virtualized IOMMU to test
them on.

v2: https://lore.kernel.org/all/20261112195710.1417744-4-oss.patchbox@gmail.com/
v1: https://lore.kernel.org/all/20261105192738.70664-2-oss.patchbox@gmail.com/

Yuho Choi (2):
  iommu/hyperv: Don't free a paging domain the hypervisor did not delete
  iommu/hyperv: Keep a new domain's page tables if it cannot be deleted

 drivers/iommu/hyperv/hv-iommu-guest.c | 34 ++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 6 deletions(-)


base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
-- 
2.56.1

