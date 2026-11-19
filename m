Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060091;
	b=YggpZL5lEASaIA2jurQYCoRAcuHGNYYVDK5EE4d3ST6BJXPe4Ya8QY0ZBghHZOhXHtT9
	 CA6xgwCgmU5MMb7AMr8uu92qHUBcRdh9Y9c+V//tvWSZd2Jl44X/fLtK60YunkuloS+Bb
	 FALagjJhqaDdy7h2+CrEz2s7Z//jN/sokfCV/ti27S8z5l++X8FPxnVTluGmWNWqy9Pnf
	 9zZDy17akdVdJ7s+gfaYJ80g4nzEpdly3j0OXDdodWKnl2Nat/8wq3ZhfYF16MTuM4tqn
	 +gtEkLao36g0EikvxUxmKkyg3SM4Xd5IcY7ehFP1OSEP3Q5n8nkap79xXnD0+RVJOeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S5D8kWPJIdUaQq5yb68+AQ6+c9WqO7R4Em+vte/XbIk=;
	b=YL0a1bgLvmSBvLh0j3OEssJsCw4kYJZVjalDNdnqMqRxM31jKeJ3mjeUpFd06rdapl6c
	 ZcdmylGAGdbWiYm2ieAAu2Fww/tdft4AOJX+ljCORYXWLeTgslAKyBUQizEagpgW6cqmC
	 0kusD7MxAEjHxbwZhOS405lXShZSTG7/Kk2atQQgEdJRNogKpWsGWwZRFafswHAfBgfAP
	 SyF8GgnXelVCd8dfl2g3qrzHF1vJRokDy+jM27qesCNGg3vtVYCAw102uJPJf2Sn0dG9X
	 j8z2gNVza26zuYTnGomO2p+ztZlRm4gOcwPxunZ0t8KgJsJ8WqIITKkIau6+LxQ8Zpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X9R2psxl;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946A1606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 946A1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X9R2psxl
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cddff772fffso606732a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795060090; x=1795664890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5D8kWPJIdUaQq5yb68+AQ6+c9WqO7R4Em+vte/XbIk=;
        b=X9R2psxl/Q2649gdnN0PuQFx0A8OsZgJ0zF36kzeEn8A1fSUVc/ZNrRMUYVTDRTkvm
         jbPvHL/++HGajfR+RBB5T4zjK6ZpNxLyUFe9kCR4YfcyLlD3QDZ9Eg6YVPyUzJ4jfrS1
         XVsNfJp+6KfEIy0usrBzX1UBz8w05UWjg526OgPCShxgbLZDEY5Xs7TFNhTASXEg6sCS
         yBPzowEPMiroW64x3VCdt1GwRLVdw6CSAon+0w07S0fwujpCrwqMI3CWl7omXHaOE/TM
         wmQH5wlSMXS7T2o3hRC5aa23/p/N6ekNt6+YiizVQ+JsxMb1aYFD2nQ+VUAJDJmh7GSy
         1OTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060090; x=1795664890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5D8kWPJIdUaQq5yb68+AQ6+c9WqO7R4Em+vte/XbIk=;
        b=MxzkINdwaGMVmykoWudulbvVLtXi1ann6WOaH/ypcqPIOkYkUsjiqSFreKDeIOnRLh
         78e01UCf7sjtVSYQoK2ayYYzNuKEWqJBQpBHPOhQT2KmTwtU9jEfGMINAwMv8KEnvtfI
         OTnbzjnk5dQvq4m3YwaNx1UeYvi2gy1RIm+OUjWViLM9xoudgoFARbKBex5OWg10QrBl
         9cX4lRAsmKptIpPKuEMFi7hitV52EZ8M+4TQdFVNn4jdMyEAfbYOnyQRwHKlesynGRpv
         Rxwnh8v28VnvZmY4RXre9BuMYGbEKCIFqvlteKL1lhfca5LZ9TuKHzudRj3ZGAdKLj5e
         I/MQ==
X-Forwarded-Encrypted: i=1; AL+hErGyr9wBDpS7hHOdFtuYYZXs9waqsf2dtOh+lw7otJc2PqKszsC1JKlG7bMbYX1kKUSkEcCecvmJn6gzh+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mziVj7foDmpJhQQ8QG39jalxxy8RTo62vB21S6kDfREwczTir
	m0RO0Hocoj9ykz8h8JSsMp1n5fG+M91UVjOpLC/FDbG8vcf59sHR7n0w
X-Gm-Gg: AZFdTZfU1lfBrbdlY2mOUt8fJ8mR8K1LWJb0C8CWI6hFw4AMTWe7EhhC6lt8CLWTA/6
	L21AV+cKVBfMfbGkqoiHtMiKTYJPmXFnSds1Y1x4DlN/MvlG9PMAf5sJtwVLQ58uhw4CmL2EeO8
	MCCyH/rZ0at8k8Cjuffbe5whEJ8KNaJuhefWEebMtd4N+h4U7d4uA/FfJHHdgEovrWiuSkJkRdS
	svvwSpJYbf+v8z3CePV6yFyf0aLsm81+c1oC50ghC8/hVY3E3MyhojN5fEmReS55dLid2QqCc8M
	2MocGByco9QzYusff8BEU41WXrUfuxdI4cmlGQBM1IUVjeMtqt4nX9limckms8aYiw4ClldmWBl
	u25yADzK1RqhpC6fUo6pywbd7xwov78mejw1IMsJsKpFgDw2hYw7gQMIU3nfqzk9gs9yosaAbZV
	IsCyCxojGBnbQ1vZn7MErqA0vJMAxIUtsLjF2jhRAMlx2iup0zCm03PnyBQyjo+jaF2j50Y4K/5
	K1fOiZLA2z2Xx4oFq8UXWp+2ymJQAUv879qQao/PzzUDBQvV++EoiyPKzXQvuSLjvtETSOV3atu
	9jeLAgPY4aNOf9iVxHW9ViEaLXaxTM7eKLJyI9KbWH6W5ZCO
X-Received: by 2002:a17:90a:d445:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b3d0686792mr4179890a91.6.1795060089811;
        Wed, 18 Nov 2026 19:48:09 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d629ccsm316045a91.7.2026.11.18.19.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:48:09 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] powerpc/papr_scm: initialise metadata_size before reading it
Date: Thu, 19 Nov 2026 12:47:45 +0900
Message-ID: <20261119034745.1460361-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

papr_scm_probe() reads "ibm,metadata-size" into metadata_size without
checking the return value, and the property is optional, as the comment
right above the call says.  of_property_read_u32() only writes the output
when it can decode a value, so for a device tree without that property
p->metadata_size is set from an uninitialised stack value.

p->metadata_size is the bound for the metadata get/set commands:

	if ((hdr->in_offset + hdr->in_length) > p->metadata_size)

so a garbage value decides which metadata accesses are accepted.
Initialise it to zero, which makes those commands reject every access
when the platform does not advertise a metadata area.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
Cc: stable@vger.kernel.org
---
 arch/powerpc/platforms/pseries/papr_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 5c3bf06bb59b..e9895e9b070c 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -1361,7 +1361,7 @@ static struct notifier_block mce_ue_nb =
 static int papr_scm_probe(struct platform_device *pdev)
 {
 	struct device_node *dn = pdev->dev.of_node;
-	u32 drc_index, metadata_size;
+	u32 drc_index, metadata_size = 0;
 	u64 blocks, block_size;
 	struct papr_scm_priv *p;
 	u8 uuid_raw[UUID_SIZE];
-- 
2.51.0

