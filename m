Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535923;
	b=xLRzoP3HrvoMiq6xoibjV9awzWQ3ielo/CldBF3C+z3kRcKYNvrx0M2wQahhapwpFJxN
	 j667kMTW3n6mxEEcSDLEmjuER80yMfAy5yOlqM7I3sIv0kb6/RcA274fGU6PhQjdKpYMT
	 xETeDeY9LL1ajn1uO490EPX0tEOKeCFxP7pZcgALuGsAnExgGHN8877gE2GJ66ij2UACX
	 ikmbClsjgqdkzDTpP640j/JNgbzOUC26uSuxxbB3L7Y+4nTRIxq6N/snPS9GOv6QaUIOS
	 /N26c+TFP+GrkuXpcRhbvFsqqSuKYlyMEdydE78NtHAGnP4+XSS0VmUKIVCnYebzzgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eDmWsXhPBYZY/Mx/SOcZ92wFv5oQpu2+A0EXYzERrQo=;
	b=Gc1GawhfgiOcSnXjYp47mjh67QCIYVg/BZkaQYuuY58It/QjKIwgwZ7QJuTHy/2Rbi+C
	 EnJGYSf/HwkzkdKp8yG6nF+htgoCcLG8iOR3CHZJVmdRpRZrtHl1leu+qYVDlXH82jGu3
	 KEJ8RlRdU7c/ZYmTNpyR1t5bqAVvDIhK7cEW04fGjMzk+dUoR9pMtcfLaxG4W6bg7ST5E
	 dsRHOQZgHuFQ/UrK6nupCc/QF8BUtuo32NiwZzMBbPBf1oCHriOLJJFGLrARk4lf4uHpD
	 uITNP5qk9SE1k3ZXtrBcrNEhPjC4PH8WD5XN0okxxGj7PmHRQR7unshadF0tDmQtcyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PM0Psqvf;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F419606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F419606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PM0Psqvf
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-86103aaac12so3115681a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535922; x=1796140722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eDmWsXhPBYZY/Mx/SOcZ92wFv5oQpu2+A0EXYzERrQo=;
        b=PM0PsqvfYDluIDPaRGnjOU10Fe92gpx/pNuoC0DXrzGZgmG3483UoGFlky/KAA6PJg
         GcJ5DaCAzaSBV2r21eOOCGkBafruYhLDpOyl4DSGjNrrgA/4mKcyT1dkEBTOWCxl7h80
         ksp8ktatBWFTk6Voc68tyBqwYAo8rUcvoALoja8+NR4iAUDKzbz1xWEQcctaYQi0HpZW
         IwimJViVMMITpdFbPMHs+BZX/ttgOgLyLjmHHGntY5g3k2iGA1Tvs+pDvjKoyAT1FAPp
         gly+VC4f7jY6AVCNKqD3jok9z/JkDDUNa/J4FKTCPnmbnPdVFaE49lbKX+yzdVyi3XLR
         4fQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535922; x=1796140722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eDmWsXhPBYZY/Mx/SOcZ92wFv5oQpu2+A0EXYzERrQo=;
        b=M5DKdvFw5UtI7mgn468M8CIYnPZyAWRvUSNOWlHF3nDQBKmQsG56oUyJsAgWCDLUdR
         nm1c4JRXzBT4N+NlS4XQ4s0A5GcICSGzjcR8cYCQMVe+HZcyXy/jrlMEcu+QUu5I4EkP
         iNXS8MDaGHxuTraAKGHxI68p+6UOfYut80/kHlRx53qMie6ad3Xej+U7vq/R5R1wLpfc
         WCFFtRWF0sSqxyl+ZvVv4e+se6yIjp9zTludBgBaJrXBjBVsE+cc9sfmeP2U/Pe8eGJG
         vF0+rQgTRdZyhbCNdmEU1hve7og43YDnI+LwxEpF5tyXvgqzb6BhZqui8h4tgyH0jAlS
         6p7g==
X-Forwarded-Encrypted: i=1; AL+hErGi+m3smefgD41j7T6U2kzIKDGVa4on/lNvRCGSHmZX7g1+uWDjLglbxcnNhCxBw666lbI215ZdIdqVTPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/qZI7ULDTIzNJI157OsNIHvlupvjxrdJbwj4C15v+n3KrZIgH
	mIf1Us4/PH5+ouWeNi+StDEeiE6LdGc3EOqqqNtvO3h/I1xaWdvv15Ss
X-Gm-Gg: AZFdTZfy8Y/Jph3PHdMecuL04s0EbtmULUAPnaTCLYgJjErz0dTuFf+cC3ngDlZOClo
	thm+JQMBG8HWnOGDm8q41y3dejfBIFB6UgnPMI+fNUuqyNNMqkG/nJ8k677yMkmxMGnwWxH3QS8
	9kz3bnuwMEaikflpIzsxV7DaGSIZg4db+1Wx7g7HstCwbnUnbp1vsKIWKZsPXLJFwutiLENWIhe
	dlNQ36oE6VQErHiftm6uoMMJL+DO9QirevqN/2Dsm0Kl/K1ogRIajnm4QVMA7UlPyzFZIe4sPZ9
	JYRwnonOfm0L901rmAzmOmWAc3B4Z7COrb8MrNwH020FC3LhTalgDCP9weCwfoCkefXDK2rYcR8
	Lc5pwcU+aOMMxEtyFNv+aGkqrBvfYVjDU5YmyMFq3c2bVC1RClwpKsSOk2njX00HUZOUS1etU2K
	Zj5sU2Frmhk0fgW+42IbJlceN0HlhoJamP6UE4OTbyKFE5Oia6d2ME4LoO7O1tEVzC3bndFDEHY
	Y4SHZaghxHPz+ULlNfAgLGc8z9MEN8mQ2p5lSSnFp6L8atM9u3DG5g+rt8Mt/S5kaODeJz+LKEM
	Uv4lFqvJuY9oeed2LztsZHw8F9tMSbVGZZLfU5RA0qaVQGH0Y6hf52d3bSWskZFAn37ycTuUmlz
	vea1bIRCMdoGhWSo5KyzGtG2F1s0bM+YXxkVoy3Qz/GEdgeIhDjgMsudztsUTvT3B0NTNzdDVwB
	yNjIFUZt0kP49i
X-Received: by 2002:a05:6830:310c:b0:862:8871:5bd3 with SMTP id 46e09a7af769-86309309ab8mr13573667a34.37.1795535922312;
        Tue, 24 Nov 2026 07:58:42 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f784fsm11128168a34.16.2026.11.24.07.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:58:41 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH] ARM: vexpress: Fix SCU mapping leak in vexpress_smp_dt_prepare_cpus()
Date: Tue, 24 Nov 2026 15:58:35 +0000
Message-ID: <20261124155839.388319-2-oss.patchbox@gmail.com>
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

vexpress_smp_dt_prepare_cpus() maps the SCU with of_iomap() only to
pass it to scu_enable(), and never unmaps it. scu_enable() does not
keep the address, and nothing else in the vexpress SMP code uses the
SCU, so the mapping is leaked. The function runs once while bringing up
the secondary CPUs, so a single mapping is leaked at boot.

Unmap the SCU after enabling it, as hisi_enable_scu_a9() does. Also
skip scu_enable() when of_iomap() fails, instead of passing it a NULL
pointer.

Fixes: d2606f81d563 ("ARM: vexpress: Simplify SMP operations for DT-powered system")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Tested on QEMU vexpress-a9 (-smp 4) with multi_v7_defconfig, on top of
8dac6df92a2e. Without this patch, /proc/vmallocinfo still lists the SCU
mapping after boot:

  8192 vexpress_smp_dt_prepare_cpus+0x28/0x54 phys=0x1e000000 ioremap

With it, that entry is gone, and all four CPUs still come online
("SMP: Total of 4 processors activated").

 arch/arm/mach-versatile/platsmp-vexpress.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-versatile/platsmp-vexpress.c b/arch/arm/mach-versatile/platsmp-vexpress.c
index b810ad50b98c..e373d75653cf 100644
--- a/arch/arm/mach-versatile/platsmp-vexpress.c
+++ b/arch/arm/mach-versatile/platsmp-vexpress.c
@@ -64,8 +64,14 @@ static void __init vexpress_smp_dt_prepare_cpus(unsigned int max_cpus)
 	struct device_node *scu __free(device_node) =
 		of_find_matching_node(NULL, vexpress_smp_dt_scu_match);
 
-	if (scu)
-		scu_enable(of_iomap(scu, 0));
+	if (scu) {
+		void __iomem *scu_base = of_iomap(scu, 0);
+
+		if (scu_base) {
+			scu_enable(scu_base);
+			iounmap(scu_base);
+		}
+	}
 
 	/*
 	 * Write the address of secondary startup into the

base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
-- 
2.56.1

