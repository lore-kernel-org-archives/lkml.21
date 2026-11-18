Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989638;
	b=h4u+GbJl4doh4/4btHAYp8vafNxt3jcx2ydDqnJSavDAXK1qxYvdLW/daIGlv5P6TNXX
	 EXJcpgggMxkBE/EL2nDn1A7DL4NzQWkMJLycaPpqudMN5eevtttuPxQeFPmwOEzgGqNpY
	 NQ2/qM0SpMQa4V/fbPaMOyEon79Kmo3H6098rhgSvFVz2B+VR4y6/61SqMM8P9z5Y4zV4
	 NHuAQ/5fR8L7NY0MQMmLxiICBsQIOPjsS+NoGRg92BU9H71kMLHNLxVMU7z+qMvgjvxJ4
	 xktzaU9T9UOhpQbs95RF8DTo/vh8Pc0eLBW8C262ojdRtNrOEwru5rexbkPyoaWs8Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XJZ+Hdtk3ZgO4GcY5jYam6jCeDolIL+Wbgosemj6TVw=;
	b=jc2xCVcD7wIQ6TqcRBiZIH2De4sB9OvpuPDHt04COShECSiRQ3xhiOlxjXMWojSOjytg
	 sRCDpaZqHAPt7CC00C9JOi68kkOZ77q0tlA/JkX+jqCopkTNCn92krRG8rx1K6ZYPt99o
	 GqupznE92kD7PC3BITImn+hrEannwhHZu8uQMtuTvLFbGLpbE5TyL/9/uLvWpykf0ku/E
	 xoVfilybF4xyMJSQHfbiaqV7V+oPB2V/h3JY0Ij3g/qCIO6nCk75nBtnCZoDNK9QCTFjz
	 uklZCB+SijOBU9FTBE8p/dYRxgkuET3PryLx8ExW/ksSO7UDWH29oV2VDlkXDxUCN9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CIunQBLg;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEA7606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EEA7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CIunQBLg
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb684859cbso478350a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794989638; x=1795594438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJZ+Hdtk3ZgO4GcY5jYam6jCeDolIL+Wbgosemj6TVw=;
        b=CIunQBLgc0sEPmk5ppffRBSZDZbkW76BiQOaZUO8soHExpBHJnYv8WDK4meLo+agIy
         vzIkRO+obk6Ot1fmhUYUiuYvABmbRemfhQuQUOV2jdimXfCnYvtX0z/+0uFTcD5uBq6v
         Zm/G0xUvKa7xXb3P6PtdF3bbeTMmH5XitnUspTjYLOWzUXJXsyh5ma7+MYGvcq/mCPES
         6GlWX5i55NsE+df9rb6hhDEQKBzvirUY7tAzV1kj7U3hn/59uBGkFtUYz8Xe95QrQqhT
         WySkCR11s4NpK6cZiPLtRM5nQIr9L0rcKuKwYdEvVTutvsF8xk7vB4ParRr9xy+5ClKp
         dt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989638; x=1795594438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJZ+Hdtk3ZgO4GcY5jYam6jCeDolIL+Wbgosemj6TVw=;
        b=UVzkJgcPzWqPHiUNY4w2G8ffZpwuzqrZMdbVyLIcKsU/9XI+y4awzDnl4O5OX5NAZX
         G8uT8t0ZIhd8rAtmKNlaQB5KMcOZxibq0MpA0aw260YWv6xD/8u9MGkBxykwL2+TiKc3
         wWCAXDdU5y5Bvj25ujsf8jV2rCPS9fmx1TsGolPt8Ywldd7ya83GeJFUNDQgxup4xIq1
         XXhHUl4EqIUzJ4bdnneDJFnKAFh1yk4djQrftC8j3v0zJNOPWDKHlmvtDeQxJHgbdCEs
         67J+2Ybl1/5o/jSat7yj0g80Tjn8TBTmeAV4vtB4XEo1raZE2eyjz7NyZ+VMXmwY7aTr
         CJwA==
X-Gm-Message-State: APuU4Z/FliRedCp16WtNu7qKYMz7MdOwh3uVYEk1rbiim0Cfla9vr5Lq
	IpODLRiMr3tw6ebQFKU2ybxehWbf0nx35ETIkCfPnmDmKuuIepXpi1FlM6xI7Gb21DA=
X-Gm-Gg: AZFdTZdEV5cxthH7KsTb0hn7cHOJM6dzPzhfjXwTP3qabGoGzaYB1DV5EPbaMn1YlW6
	OOigqf7wcqwhYWjLwwlCsKWVqpCMlySUNvMSDXgyMxXSFCNapWvwjX3gEi9KDa+NVhVw/SPUELf
	TgvtpZdmqgOck9KMZ20Slx2ku6dlsmQVwhVM/qGicTgPNuh/+0In6czp+lXHSxaAov0Vhzx8roW
	yW6jUI3euu4YJUhl90/mqcv10VvsXsK3dfwq+9OI6Jr52h0UYa36kLSeDOK+sHPSduaKYAIufRP
	zQ7IO0SH1U4H9UKdZgqfSYl8mjEtRYNC9DV4z7D6klzQI0+srYcEZ7K05/PRuAruBSa9q1DIVLo
	StBhdqbS/NS70+in5jDoC4vScc4lcn91KmEgbprQccUzKHcvrGQ9s0JdM446g/S6BhAW1crhSX9
	IqCQblzDgDA64UuGbcFcZ2q/fZt5ya8iMqwkeMjjTWf48whF66V5FCYKxeEswuioEDM8MUhE5Ja
	jVeo9vNTmf10xrZIImwLbuHPS9WnGm0c4TdquIlIyci5v/oUmQ4cT2SB3zLD2+AtCxwIIIw9d5h
	/XhXtzQNeGkF3+pTYB3zq0sxpFITouHX1ptdaWord+7HHCQWfXlNAcradiA1ocd6qQtjKPdOK8B
	UTQOZ+OA=
X-Received: by 2002:a17:90b:1e48:b0:3ac:9e76:aa97 with SMTP id 98e67ed59e1d1-3b3d0640e52mr1931726a91.6.1794989637815;
        Wed, 18 Nov 2026 00:13:57 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3254680a91.14.2026.11.18.00.13.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 00:13:57 -0800 (PST)
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
Subject: [RFC PATCH v1 2/5] riscv: Detect Smpdis and Sspdis ISA extensions
Date: Wed, 18 Nov 2026 16:13:30 +0800
Message-ID: <20261118081327.10684-9-zhangzhanpeng.jasper@bytedance.com>
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

Register separate machine and supervisor PDIS extension bits with the
existing ISA parser. Reuse the DT extension-list and legacy/RHCT parsing
paths without adding userspace hwprobe bits or inferring S-mode access
from an M-mode declaration.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b5952db9259f..0eea8158b4af 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -126,6 +126,8 @@
 #define RISCV_ISA_EXT_ZIC64B		116
 #define RISCV_ISA_EXT_SV48		117
 #define RISCV_ISA_EXT_SV57		118
+#define RISCV_ISA_EXT_SMPDIS		119
+#define RISCV_ISA_EXT_SSPDIS		120
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 72bce616491f..982231fa290a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -651,12 +651,14 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_DATA(smpdis, RISCV_ISA_EXT_SMPDIS),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA_VALIDATE(ssccfg, RISCV_ISA_EXT_SSCCFG, riscv_ext_ssccfg_validate),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_DATA(sspdis, RISCV_ISA_EXT_SSPDIS),
 	__RISCV_ISA_EXT_DATA(ssqosid, RISCV_ISA_EXT_SSQOSID),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
-- 
2.50.1 (Apple Git-155)

