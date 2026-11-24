Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534682;
	b=d5ZvKEybeFd7925AXlCPHsZqM8l9CIuZRCIlF8O3wlB4AypU9+BEGL2vdcKpa+MDgcjw
	 AheoHp/Pnye1iXttDPSoU/HmV+bUZggV6oUAX0A8gvd05W+9ndg40uTGaypLIcd1xyDDN
	 DxVRzL0oNbLm+xdFbsKukM6YEavEdXzUh4yImcW91IvJ4YM3+e6dOvAwNgrZOSgeHCTFl
	 /4QWVhwPr0xEwOGbS6TM+e93sT+50IkUvVHVMhdlqCpBUtmITJ3k4Kwe5XljQkCZoEyi/
	 tQpBeGqkZP8gVSwO4+x/6Ptg/8ioJi8WZnWGJIAgtI8NjinMqyYbHePolkE9/bxjx8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UPNik2zvIMnBUa7IZjozMFZ8OPcZJz9a45E3NsIDV28=;
	b=yQdTlv5nEp1v8rXC1UH8dpjCC8KIMNNw1wt1WXb1E/zGnD8jpwHeh3qw1V6kVD5Ouy/d
	 28UIvLJ9j4rNUhDzb5ZOjAk7+RoFMKPrUxPsEV/OG9NW9I7O1vQglnRIGlnsk4Xm/yrHX
	 YmA9YhqZ81JSR5iJclUYPoT5Y1mrpuyi9Is6HSClP11Vr9x6GqBRq3cx+bVcQz1gf9MY8
	 1p2UE8MN59pkGQ8fkSi4OiDIszRX82iOU46CKkiGfYw9I4IJkCE7ZNc6wO26fJUjPjBMP
	 wVaNWMlpsz6XgUu5Lyht3InnWX8eXU3y6Z5MFOFdoceV/xyPavEe72tSpP9CGBi6Reg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+nZxpWk;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A873C606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A873C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+nZxpWk
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-833e671ee9fso4303982a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534680; x=1796139480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPNik2zvIMnBUa7IZjozMFZ8OPcZJz9a45E3NsIDV28=;
        b=f+nZxpWkXTIASogb1/i/10DjCbH7/VDfaCqceWoWD1okJs/eHwG9as2UUv7doyg4sj
         Se5Sd/sgSoM5+vAasPvRAGH2FFWKwyRIWPeImjnpY6cnnGKz90XlikEAfQ/wKWCTCZYE
         Hnu+3Oe6ZrcBCgbB+nURBkOpU7+IB20ppxLzGu+E3QMWouoaRILlLgtMuZZGAZ+3UImx
         hdwt9FHVuqRfL63nZUVYK40lx2zR8lZPuyQ4IRff9l0GjKNegUVJWCjCeXlESBRZHjHG
         gqYDNM7mww0Be+weYvQYTp+UX8xok4uBt6d0KXYAq/QHhGfpSWKRzrkkw9xu6j5p2tYk
         jNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534680; x=1796139480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPNik2zvIMnBUa7IZjozMFZ8OPcZJz9a45E3NsIDV28=;
        b=jlpHCiG8KmCRyQ4i4rx+Jx7Qbdy3SBQU/pvyNZ8dYEf13p9Hv8F5uhdlTBgVrZOKW2
         dCJBNExBwVH0ptI+eMtbi5A2jYPiUn/w17SsZNUjPBorXN52oGVjbf0mXr8RUD3dHQkk
         4pASM6LQ+bkifFB7rYlFTT3648uMdPbOI/PoDFmBfOipwcNPfz576C08r3uB9E6PapnK
         UNEkLTOofyRZNKVTE5LmUm//+lf+m56RJwPEHulPhfJt8SsXq9x5zi7vlvaoPU72t8Ne
         K9CWS9GTl9S0f+Ha2IfVGa1DAJOPT0qtAXOOWm7Qmk2yvPPMkwiijh7ADL0ARY7egCqP
         bN4g==
X-Forwarded-Encrypted: i=1; AL+hErHcVbX6wMwp4W9gI783WCIZ/0D8tL4ZdarQe0fZk+7uW6B69E7J5/E7XoB76h0I7Px77BWCIdF31AShk2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ixMMwdAnT8uUgLbZyF3d6tdmC3qWvpcP0yx7Jc8t5BqgiIMHK
	M8qoFFWu3vk2QA60VR/OI+opc+827AdJS4hTkLjtXVHiz8F/Kabj4rJu
X-Gm-Gg: AZFdTZcENsRADLor+nsBgrg2VPDOVtviLRJj48upsFJvyVRiA5dzDuciOl7f8CeHoK7
	T889ALg7NCQmsAhVfSSaNHVCGC4C0OA8+7yyZl32tjQoM7hWdNhaSUEOClFqs657KsNwHRWJfcl
	YgwE1QQSxRoILQ6VLsvonYIfkWqkQ4VffMkEZ939dmMvXpulI/wyZMLJjIjbO0Iob1CP6SlMedZ
	6cPYx25p0n8iHseGD9M2dNEu9dSIoUzC2Cb3TKY7D7sns4NCQgg8NE0P5M2NZfqpw/7wtgo8MP2
	fLPQ4tI7RrvwYW0VUvoARuPHpR0ndY+eYzyo5n0nD4o1cCMvZ2FP04gy0a8tW97DNtjx2Km/rAP
	MafxTlrVeUIULUKtoXPmYTi8w5VowbIXtMel1py/64qT5qSEu1R1wf3HZUOaYqN6x4L77qWba8q
	nlhXX+uRB60wlWQzdbNzgz2kdJ1tUXgq1FDyMT4vqEAWZJe+xA6Hr3784AJnbidqCrRCDox23Iu
	IJ4aPyOa6wOgtADRalsIXI+g5sm0MKcKD1gO7t1QlDUwVg5yMpZWB5DixwPkQBdwv+wB+gf4uFg
	3C+TIspheFzvbtaqxjZMbAl1SesdX7z5UZ5KXvYhevJ+HaYDZbIwiVDG+7PrWemTmwA+4XJEQiB
	iE7TeScr5dor5flxlXPcxBKnrz4fRHDklVfiu2mB83wMb3FOhJE5Xm+V+EI2siTCQjlQp/VHbcV
	9MYhFkKW33cV5A
X-Received: by 2002:a05:6808:4fe1:b0:4fb:bfc2:1a64 with SMTP id 5614622812f47-57a0b44cd17mr16836640b6e.31.1795534680520;
        Tue, 24 Nov 2026 07:38:00 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a347636b9sm11718810b6e.7.2026.11.24.07.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:37:59 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Nicolas Pitre <nico@fluxnic.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH] ARM: vexpress: Fix device_node reference leak in tc2_pm_init()
Date: Tue, 24 Nov 2026 15:37:35 +0000
Message-ID: <20261124153755.338370-2-oss.patchbox@gmail.com>
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

tc2_pm_init() looks up the SCC node with of_find_compatible_node(),
which returns the node with its reference count raised, and passes it
to of_iomap() and irq_of_parse_and_map(). Neither of them keeps the
node, and none of the function's exits drops the reference.
tc2_pm_init() runs once as an early initcall, so this leaks a single
reference at boot.

Declare np with __free(device_node) so that the reference is dropped
when the function returns, as is already done in vexpress_flags_set()
and vexpress_smp_dt_prepare_cpus().

Fixes: 11b277eabe70 ("ARM: vexpress/TC2: basic PM support")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (ARM multi_v7_defconfig, W=1). I have no TC2 board
to test it on.

 arch/arm/mach-versatile/tc2_pm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-versatile/tc2_pm.c b/arch/arm/mach-versatile/tc2_pm.c
index 0fe78da0c109..0e471a76bc98 100644
--- a/arch/arm/mach-versatile/tc2_pm.c
+++ b/arch/arm/mach-versatile/tc2_pm.c
@@ -202,15 +202,15 @@ static int __init tc2_pm_init(void)
 	unsigned int mpidr, cpu, cluster;
 	int ret, irq;
 	u32 a15_cluster_id, a7_cluster_id, sys_info;
-	struct device_node *np;
 
 	/*
 	 * The power management-related features are hidden behind
 	 * SCC registers. We need to extract runtime information like
 	 * cluster ids and number of CPUs really available in clusters.
 	 */
-	np = of_find_compatible_node(NULL, NULL,
-			"arm,vexpress-scc,v2p-ca15_a7");
+	struct device_node *np __free(device_node) =
+		of_find_compatible_node(NULL, NULL,
+					"arm,vexpress-scc,v2p-ca15_a7");
 	scc = of_iomap(np, 0);
 	if (!scc)
 		return -ENODEV;

base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
-- 
2.56.1

