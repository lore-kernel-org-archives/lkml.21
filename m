Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687043;
	b=h9I4xiRz/fnA4UvZaRseBmZ5Xv1gYhwwroEN7H4qptNMvxeyDdLVG2FaxTlEhV7EEoeF
	 64o52GNeXJXIIQa8PDOs4JYsOAbqoGSsCcrOdTUas8nRahVT8Ml88XBDg1B+6LBC2iTXg
	 ppIF6zicgqUe4vNYHld3AT4G6TvxH/YwlDQSl5KCWrwk78inCF9CUMH5eNl1e/FnZT7PT
	 mrNvR4QhD2LOI2jG5yLwCpSgMXMClQiBJ57t/tZT6Zi23+ouKDpTm+yyKbDw2ZmitAMyy
	 CiU164+kTk6j/TuJt3O4h6Caiwi6+e7CAa4FtcrFM4hvmTGYNq4Y3JGBobS96/8IOzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687043;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=obgiFy1H0lI5H7NGxtwendTt7NW8zlTVxZLQefWj/Zg=;
	b=pydKZ7zoCP0LnCoXpQyFTPq1SI0Z/FZwz8hnLc8GCXvIc2fgAFORuiCKv0gxhy3HOU+x
	 q+qajtQlan2V4qI4jgy3m+qbbpI6vkb64yiCmFKFwecYvsQAefXLOm3DHMYJIK31mhE2p
	 N8gNdtAX5x/cq5Edxgbm9Hh+g1+UbYe2dXR3PWwDLHCjMB3z6qQrnxTuOYJDOzh+TJDHs
	 N7SB+i0b1kbL+LqYkhFoOjhp4z4y5Rsa2on4LThSPuD3s4bM6D0jqAZCAtJXLC3rAFZc3
	 +nwhww+39d5EHrOm+GwXrC9o95By8FjBl++xI0m5Xs01zJqETKdw2vGw42/3/EVVN3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bDMNli9R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5x6WCcI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCE4606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BCE4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bDMNli9R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5x6WCcI
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Avij695012
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=obgiFy1H0lI
	5H7NGxtwendTt7NW8zlTVxZLQefWj/Zg=; b=bDMNli9RA8rApI9q5re75anXk5a
	A8vVmy5/Ry1dOvVyWwbltvqRODvnqBZKTcWEZDM0WSAWl7xb+x22KyBpuQRYEGKY
	NnoFpJWWznUEtYd/5daXt8S5ZINtuz0cbbEXU+/uEaSJqZvG3FPEFB8QWRPDyrZd
	Ktu7IfFN4nguumWel4scsmk5VFkuSKpJhNRlWJKNQBG3Nu2Bk8S4HOh19Gy/fyZx
	gUm4A0htHAXGpe9klBd3AKCARiZljm7Fo4Nlhmz/OCucfaeLW4OJtwfN8t+3ySfd
	5ijlP2wDjA1mg3F5Wvym6mgdVu3amfIEkKq/5EL9+05DxTlUvIOIcmJ+gKw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7rqh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:57:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b456fee3b2so4619151a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687040; x=1796291840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=obgiFy1H0lI5H7NGxtwendTt7NW8zlTVxZLQefWj/Zg=;
        b=L5x6WCcIWNBTRXrmwCp0TEltj++q8Odv2eIGad4pz73xdcaMt1JpsfZDmJicL3Av6j
         Fxf6Sh5n++aV2vIOrB9Z33EB6g1FK8cCfAXmqklc64ppVOhqb+J1p7u9O7a9JuzsDM5l
         QiYJffhE6zLW6u8wzq6IdfYs2fy/mhqgNE1kvJhhbYFe5nzlOhyJB6sVTjg0xH+8nS32
         0r0MGI3ktR/yOsv9PtKKv+B6xE2TlsJfbNl87TQJPwK4fwNbolvqfsic2ktcKw5p1xH5
         +M2hihkIqtQve66+mTY6YTgRcBzwAVgfcV0o4Knyac6kslXCzU4tLDIgKDAS6GMx57ug
         GXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687040; x=1796291840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=obgiFy1H0lI5H7NGxtwendTt7NW8zlTVxZLQefWj/Zg=;
        b=vsl2QwcYsdyf0nMF0q2xbAEIyZENnGVHwV7bnPgA6nGlkqzcS2ZHV/rA766sJ/45tS
         JiF1lp/Z3rgYHFaGa1JUPzdrefTDJnbO7yUW4n+ajDKc4lxeNHMcOA/HcneMWAk6BZXb
         459cjkwcmcvvA0s/zzHZJAaviZJEjwQxczhxiVDTgl4ZrOExvApGyZSvm5lCgSI4dg76
         Eg7CJMgLzHa4owxHlnAZvaO88hp5Jj9kft1QqjLkOSoXfiGjXebSMnRJFHrkcYmLGeu7
         7EXkU3ZumW/zY0YMELTxjRKOUNxz4m9I6vOGJHXmWvMLLpdRpS99oQc8qfUQf16NnmDr
         O7IQ==
X-Forwarded-Encrypted: i=1; AL+hErHvvQ/qdKE3l9Miqd08SsuhSOjX0mgckQkbyBCMoGzAxM1A0TvhYYgCfyDezGb+s/vw9+WZUHY6EUjuPVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AngnUdxCBOcA92fmnbnwkltFwzUyguPHNLMbaxjUONYpig6xH
	/dK+Hp2KduUOuSMm3UseO4hbUHUmxBfKd6yFIwiIA+A0643NlLPjIzDQpbiWOC76+7J8IfI6kEH
	+KgLZQfdrrFNg0ivnrjGYxjTkXUdKqZmQiH/Bin+Op7gZYeyE/Ka2rgLE1EdQMpgLJpg=
X-Gm-Gg: AZFdTZdR8oULi3ZiOmMKoMIICx/XcIotfKmbgF+7i+2dfAiBdvC00EwwJoWTVvzvnYP
	fophYeBagZ3QrsQN9lE82hEwQqjmXXFme3yvlGyK2E4YNxutXq+q4e3Hdv7V8QxgK5kCJIM0rbt
	3r1RK5cbf5A1Y8i/y9xR2ULg9rQe1lZu+XRZOZwZ/xzMy3n+pI1M1JKPfySXX9xABNBX1FGisKN
	RkLagwDxTuaz3SosKsEhodeLAga4OxRvMOdz+836ZDddQovnO2th7QKWSS4laK3Mjb5EaDl/55J
	xS9yA04Qt5ABNOCMgRcVAlHQ0tlrfV3FDZsVhc40tstp7QCSlK/1VYTplDsxXbSU3D/zPyBWqIG
	f2cVPE2tCuYPtH/+fVj7/nA/NZ69q6qR2TIRCytdHBIOq4/8xDxm/buHgQenmbFzI0ZK5XLSQMG
	su8ZLVpVrW0rNO3QOB1r25tIwN7NlHZNJipq63d6oJvDi88Xh/IIjKvGZNwGdWs2+TLM70PdR6Z
	w==
X-Received: by 2002:a17:90b:3bc5:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3b41cb3e213mr18167403a91.60.1795687040425;
        Thu, 26 Nov 2026 01:57:20 -0800 (PST)
X-Received: by 2002:a17:90b:3bc5:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3b41cb3e213mr18167372a91.60.1795687039952;
        Thu, 26 Nov 2026 01:57:19 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:19 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 10/14] riscv: Enable DMA_RESTRICTED_POOL in defconfig
Date: Thu, 26 Nov 2026 15:25:31 +0530
Message-ID: <25bc9b86281e3bee6ed8140e56779d38ca36b1d0.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXzSvrAnDiqLAD
 8gW17mXbEPko09rxOb5jmHBcWUVuPualcT59YfL7g51JHbvRCDregaqc4ejRKy3OTo0tj/3Nivr
 cSwa9PlBI27C3vynIotbDV8dKI5HxAw=
X-Proofpoint-GUID: 5N4txUrL2_ZDBsOaDoxtx_DP2-0yu8Es
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX41VMVkwDcF31
 PvAcE1RMW9mo+KzSoQRA/SWZPv4W472XsuXIm3hwD7jqz0VccWVertLxDGF/JX81181387Uo3JB
 czL69iHOJRwRk7T3oej1kBSUdXX2Riwuto7GzVMmxjxlCCimF7gYX+7IKnTicKvDaaru9QoJ3dA
 nhCzEWwFsGsTwp8j7rPGYvr0k39R2P8reZPTOYQPX3/6UddQyZIcHf9M8fepxCRibzySngLiEMB
 ao+kUxzlnzLqgbfXmw4nfs1cRmB0Xsn5rKAR1ITXAPpGJe9rH4lvGp14hcehQjbDeJiDnCS4HST
 py0oQjFM+ivmMQeDB3LMJDAqHw48A5zBpFXaLT06pzt7ISlOOH6Cznw10203tneW9dRoMQWSTMd
 pgvXazRweFj9ml/NrBoY+S5vpUemh29CXmfYF21Mz0W5mFqPSmvM0uiBzzQOZ9c1c23y8JOS/lh
 XsrNiUrcZxkAXyxMxxw==
X-Proofpoint-ORIG-GUID: 5N4txUrL2_ZDBsOaDoxtx_DP2-0yu8Es
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b080281 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=GbvFXuxacV0FzgsEJgAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260038

From: Anup Patel <anup.patel@oss.qualcomm.com>

The RISC-V ramsink trace component may have implementation specific
restrictions such that the component can only write trace data in
particular parts of DRAM.

Enable DMA_RESTRICTED_POOL in the defconfig so that dma_alloc_*()
and dma_free_*() APIs work for devices with DMA address restrictions.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 383fdd07a99f..af2852687dcc 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -308,6 +308,7 @@ CONFIG_SECURITY_APPARMOR=y
 CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_DMA_RESTRICTED_POOL=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_FS=y
-- 
2.43.0

