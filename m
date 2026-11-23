Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413875;
	b=dWtczZ1AQX8Bu8Uj19KPIww+2TtumN5iwx+U22N2e6nIzx1npqJg9e6n4wt0+Og+SRRn
	 OzerZ8TewyEOk4e8w3ha+sUPIn+3X7DbBPlnjqXHAR2x9OjGOp4K4k/WS3blsXwicKSKC
	 2eLe/DnA+UXFJRFmi0tFJFUOjbSIeAhwyuzekyc6SBdOTdL9Zefpu8nQ0CD45DOm5jLZQ
	 4MvUGRni71q/q6Zbb2yG1GX5tQXv5IqPhO87q7nximFZqTWjN4+vS8Tup6rHl7SiZ4+yB
	 FfFvCCC6rLhDVMT8QPALcYB74KCsdlXL4HudPx+0uzIWAVSw1cUGfrksEvT/1jaPTuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Nsu4N0Rdllro8+TXtkYDOGeW85lDNvmYXwkzBCpjLp0=;
	b=nHKnV3V0uBHyp+Rc/OEuQqqYlI0/Pg/UAqMUi6Iwg8z3mWU97L4z9smXbfi8LmprHvn4
	 doMzOmfpPq/oA39K4nCfwnABv88egZARxtY5BGWJO4fU0VDlMBcIJmNEgX8BXaq4EBua4
	 wlh2NxujxwWVtLJQcZxdwpCDze9ZKKLn8vzdObnuI82lXxlXGKnRUqWMYxusIxJ/yYT2s
	 k6j4hGOt7dFV/MaJzUPMZ3QxRsQs6nF/8WHdrL6KEnN44vafdcY5y2ix35LDTDr2Lx101
	 RwhCJUzz4LQESBvEdSBdZUb8IfHGUGS9u6kY2SjFY/mkkXVmZXYyQLISAqiihi98//w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kKqiIDcX;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40934606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40934606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kKqiIDcX
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8629c7cc36eso1697531a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413874; x=1796018674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nsu4N0Rdllro8+TXtkYDOGeW85lDNvmYXwkzBCpjLp0=;
        b=kKqiIDcXBwQLluyzFnQsxWGULUPyPv9ILfAf9LaNyBqfcY9jYgPiybd+9rAZIA52Qv
         BJbNNJ42TnKmUnBMfItZRZccofjSdzVeXpVYNcqgaAsc82hIf3CJBjiyIApNj6AARID1
         1Av43TbYkdhwHpKvYBEI8vGXPAxfo1H+KP7cdHAehiSlDOWGpi370kGnCRW/9dTQDLQ3
         xxrVhBTqXqb8M51m2V1jIEYyQot4rhbQuI4+6PMUdeMgkWxJZD1oLTRV37egF9gDlcYe
         EkPxLSVwiI0A19WAZaghT/MFReEU3JkL42hh6slUOwcl+hINawmyby3JdpoDb0Nvi1ow
         G21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413874; x=1796018674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nsu4N0Rdllro8+TXtkYDOGeW85lDNvmYXwkzBCpjLp0=;
        b=x1MiZO4eUMxIejnlQmQjRB/gE0+R2sRZAzhfIE6VXqS4uYLW4gmxKWDhbAhpoGkdJI
         voYoinIaZVuRf8I/xTuZuHfQyPfWemfKQyZ863hjNJqytgV1yEHXWkbSlzflIE9+YhfG
         77mndGdUD0Cz5uq6NeRxC3vv3teh6ZMcifeuiXXOtN0esMolRliSRuFv3sIrTnPJrRyD
         B+WcN+jNvH7IQg+v+qJ83vq8OG7vrHTkMo4JO84DL8geWPiQ+rhmSLy0/rtSh/yN0suq
         1xp87knl1H2TjlAvmJS1sujQH8akIa22wUg4zyI+WVlgo8ybiWvKPrhTSlokQ9WtX/45
         qbjw==
X-Forwarded-Encrypted: i=1; AL+hErFUtOod4MGSBI0aCuoJdJcopYr+ixD5Kd8IJU0tLTcPvDmXrUqLJs8yOR+FSeoXLfftw2rqNYtpzo0RMiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PjbT9GczNP0JB8zU0FiEtOJxd8dzBbtLUkDEMpv7QaC7m2urI
	aN1FPpWdG5lu45MTDyhqM3vDcs+tZPif8OwA1NcUipRcq+ab0U65nhDm
X-Gm-Gg: AZFdTZfZiuHKC36sxj+85ZntDWGY8ohGwsilGxv7Youwd8g76HjvGz3C3fD0mnaRB8f
	huid75PQlCmShw4liwGNLvVkbZbuvJ/dyfCc369RIcCuQm+6bKwHlBaw6RMzwQhjFIG9KpFrs9L
	Ytei+L863/MHjqHBlw1LGHNW112nrI7wG4OC8JHaT+lSPBwONEpHy87isIzCP2KGsruJ45rkH0m
	Ml594BwMJoqaoOm1dMgzKXW6mmrVqV7ySXgNx5mZeABAsLsAqYkdVx1XUpTcKTb1j5CXBKvpCkl
	L0DgM+/bH8nxI95RQ4TGzzYgsbl6iXYB+VmQljLoYcBZnVA37ZbDEzLGEXg20rdLkreTGHJ28+p
	RXyiKEbFmEq9OtuTC4El+F2pxVyNKJSFdvP3fWRY9fjrQvtheUJ8kq36GORQ18J1mn5g+l4/0Gv
	cx7udFtGDocqOz3waho3g1ijW2tEKQ+Lz/1A0vJcMnpmqy/vGRea+rIAOXAmeGNHd21kMMecx/E
	5fjmbU6KyCs+Xu9GNDvfkLAdHJuF9e+9x9g4d2xwVE12FxuDKMAepUD9TcMYxRKV6oYu4gNwEb9
	rxNiwXKzlbefYq6E1ILKJVo80JlRJNzpw796dbUC7r66xXuPj1GKYn1VpDxhBfHoDGIVSBVzHwp
	IxSvZtax9yUimhH0rny2Agj7ZjEi5BqBoKfCd57Y7R57HgX/AlqFGpVvipImlfjhJ6WY=
X-Received: by 2002:a05:6830:4c18:b0:862:ca2e:918e with SMTP id 46e09a7af769-863152d09cdmr12157738a34.1.1795413874172;
        Sun, 22 Nov 2026 22:04:34 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631681f30asm7644864a34.1.2026.11.22.22.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:04:33 -0800 (PST)
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
	Yuho Choi <oss.patchbox@gmail.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v3 2/2] iommu/hyperv: Keep a new domain's page tables if it cannot be deleted
Date: Mon, 23 Nov 2026 06:01:56 +0000
Message-ID: <20261123060419.119078-6-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123060419.119078-4-oss.patchbox@gmail.com>
References: <20261123060419.119078-4-oss.patchbox@gmail.com>
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

When hv_iommu_domain_alloc_paging() fails to configure a new device
domain, hv_create_configure_device_domain() deletes the domain again,
and the caller then frees the page tables with pt_iommu_deinit(). The
page tables are freed even if the delete fails and the hypervisor
still has the domain.

The current Hyper-V implementation does not adopt the page table root
when HVCALL_CONFIGURE_DEVICE_DOMAIN fails, so the page tables are not
referenced in this case today. This change is defensive: it avoids
relying on that while the hypervisor still has the domain.

Create and configure the domain in hv_iommu_domain_alloc_paging()
itself, and leak the page tables and the domain when the delete fails,
as hv_iommu_paging_domain_free() does.

Reported-by: Jacob Pan <jacob.pan@linux.microsoft.com>
Closes: https://lore.kernel.org/all/20261105141427.00005946@linux.microsoft.com/
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 drivers/iommu/hyperv/hv-iommu-guest.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/hyperv/hv-iommu-guest.c b/drivers/iommu/hyperv/hv-iommu-guest.c
index aa1db9db1e97..0110a1529a23 100644
--- a/drivers/iommu/hyperv/hv-iommu-guest.c
+++ b/drivers/iommu/hyperv/hv-iommu-guest.c
@@ -540,10 +540,23 @@ static struct iommu_domain *hv_iommu_domain_alloc_paging(struct device *dev)
 	settings.page_table_root = pt_info.gcr3_pt;
 	settings.flags.first_stage_paging_mode = pt_info.levels == 5;
 
-	ret = hv_create_configure_device_domain(hv_domain, &settings);
+	ret = hv_create_device_domain(hv_domain);
 	if (ret)
 		goto err_pt_deinit;
 
+	ret = hv_configure_device_domain(hv_domain, &settings);
+	if (ret) {
+		/*
+		 * The current hypervisor does not adopt the page table root
+		 * when the configure call fails. Still, keep the page tables
+		 * while it has the domain, as hv_iommu_paging_domain_free()
+		 * does.
+		 */
+		if (hv_delete_device_domain(hv_domain))
+			return ERR_PTR(ret);
+		goto err_pt_deinit;
+	}
+
 	return &hv_domain->domain;
 
 err_pt_deinit:
-- 
2.56.1

