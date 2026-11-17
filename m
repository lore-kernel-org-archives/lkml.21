Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794956107;
	b=zh0Ha+KZFMfUhbSppIoWsmoSgjAchCdmwBBsiBTHz0rYZS7dO39La35koBFL/itgLFU8
	 1ZBmef93BUys4DwIc+P1pArDMdm5WeCqNH/yj2Isu1kC6s/OkTSe2x6//4Qbh08f5HKpV
	 +94SDmrj+gi0wCBX3ksgevCbfUR8TI7xWSTgmingMpDN1mt5OMzH8lfx7queoWXH5iFcG
	 KTl1074Sp04CKikmo0qPz+WtttRSItKOm38NzCfoWRjc1aed2+lyUX+yOm42ZVx+4zg0z
	 EFQkz58KINTrNos8NqpNQqYMxS2Gvq8N3yJutk8qEavAkfaD/FdhGNCQWcPyrYonzYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956107;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=XTWULvHY5M+9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=;
	b=EouTdGGDl5a3mXCNUTRBgQPSwoe6jnXmFIOX8960eE3bksaPjxofQhi0xuIPyQfneoey
	 g9OR2M0EDvvviTw1tPnEYX/HuRRd4QBTtjWCQHnjaE768lGKcM1OcmNEcENxsXZfSyle7
	 N78MSL8ZW78biCsK2Ibahcj6PT1HxW6vFf4DVHV//rTn/+Q1el0B6/ICbzOg5gy67bd7V
	 wJyLDSbF2fq9ZWkA/GgAIe9U1ZrHhaP7ure1OplBCdQ9tHMaUxUnvi5Qz39yXiniYog/B
	 ulLjrFzkVB6QbeEiTJcvBr/yPDUcuwgdsiFSdvNG5kzjpyQpObHJ8e8QVN4w/lBE6mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NPDWNUn6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53248606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53248606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NPDWNUn6
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMfYAD1270743
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:55:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=XTWULvHY5M+
	9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=; b=NPDWNUn628COc0atYZ/CbMaWxG+
	0TNGfxRCGsv1WrYANoIZaC+tKoYjD5X8kNmyXR8dpBZayuNDuuUCja+hWrjMqbQc
	XxkpdvsWiVArTT9UJfikfZbnelRb/DRpVlYgtxXFa3XtPyVF0540TWjYmvrsqO+P
	R+hi3LRmruY6Y/3r56HGQKoFy0CaepMpMmZG4klMBviT1U+1fEaeySnvKUF8n+Z1
	Wfi1IZWcGzocGnaz/SNYLQqLT3qgJR8XlBsQ+qKgyEYQQVpJE2NW3vnlCVKHFSdC
	M3nFonl+TButab+DN9Vmtl2UIUTzMNzzvKDIVO34G60V2AXaydz6Pdka2IA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu5g5n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:55:06 -0800 (PST)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso184508a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794956105; cv=none;
        d=google.com; s=arc-20260327;
        b=dq+2+B+riqrvRAz6aUlxuhKYQ8iqGHVL/Q91OYLBYT8XfZnPPVaSRb1NUrQoU556B7
         i2Gr+QECw6r/rDDWpqWN0JhglRRl5CKCbR7tjeX59MJhr+1RoqXDJ7KQOXAnWnkPZu/0
         yleNrJ8uSqNjAPkJQx+6FI6J7pMbZLAw0vMKrYTEY+anQ5zBM/OUVFHwB1fwGiUfqXPt
         qXVmFbQSelnAAByhTbrk2IVLCSML6GKOT3H35V0MxjztOU/Yh17cz4fWTXPT3PWUE8uD
         axIIZotUwDFCyJ35NAhXaIB6woPNX/2yuTZUSn1QC6Fpvtfv74+SsPXZ5gx/Rla4IN8j
         EN5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=XTWULvHY5M+9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=;
        fh=KS2FEfF3KVat2JnW1IyM3mV5mIIBOtxHGY5VfyrM7p4=;
        b=dQNBc9bKjDjybIRnTpR4UO5EdKtpjVzfjKDPkurxpEgaQHpnEiB/Q0NSe7sg1xwelg
         t+yI4jonYBk8630hixPSQtA0MQXNy3b/lQUlCijM4UxHt0pO4l+saTh2WShl5tK46xYR
         CEY3cHp7f3ZcH2LTDStUcyr41Gca4voWkE2LQX3wtwa+sghgkYZB9rfce3dfNDHWhwlq
         yhK4JNxkpDq30LLmSv3lp217z9vikar+zOsaYZBSHGoEim0ZBs+hQ10wHoI6/UV4Pvio
         VNKSGK6qSOZO+Ad8N6E3NBlYmMlriMnEThAY/dCIk2J4LKbo2vC6DVZNUClayJ7hlbtt
         YAig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956105; x=1795560905;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XTWULvHY5M+9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=;
        b=pTq1CwYIE7aoHTnvcDUV7IlN+td+B9MTQthjiFjTx0+s2838ajtX+T45Ng+16+F8oh
         DA/vlFSCkxU7qnbX3iyMWwTdVuesOXSwhI5GrGHmPn67KNAzTu1hMvE4bSDtBVFgzNXz
         2Txe/XStkwyK84a60bjEZCT92hN76HRkobJwSEn53F4OedK2PGrdWliOmdQDgGlKnyxu
         ggoY3kU1WmLj06xjYE4GaCLZOZcFPor/cweUQaoxRbMEhXw2b4r7SgtFbJMY/EiQSgmD
         JLjlTVBpQcD8Y+WTAOb6vXo9P7aWUeW1Bnk3MRCKi6DUSEunQr2iVfad0Pam/Q7ezSvm
         JJuA==
X-Forwarded-Encrypted: i=1; AL+hErGdi3K3wIYFIJmmDPUzkFBNIHpSU/Y/IldKYICVOzFeNB/IQaSH5nEsvFTweK+SMmRIGsdGOEGEJzQxSvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GqQuV8ai+dgd40fhZ3p3A30GK7bI5KdmL4jCDigTQ/hcyQkn1
	83a3Nvoy2cfJrOItNaCkAG1L9Mtx/ffrF3MRBZINckTNoM142wyEdloCPaUQH0P0CNlQHEhrShZ
	tB5hCJG/3PrbFqfc4StxcJPYDhSoVWWoFlokE3TH+veU8Dx4hTVZV9DgrUeTHBrV5Zmr74t+a4H
	dGQhXeoYpYs88fLo+7op/yVSluqzb5hx0uLqtWuk8=
X-Gm-Gg: AZFdTZcmRpAIIG2zvHjqal9g7FaNudE3CDw5tARsarx/JdLPVPNQKMGScKQtAtSL377
	Yab99f/RJC7WNpz2Rw3etNia2yGEm7nGBO0RcXjGWonBgk2u01cgqiGkQH6o+M2reXq6XUSu0Nk
	xJmi8+zms/fXup86BU0uzrRikHVVIOxipG8/iLpFcQ5uIVGZO7SEbRLsVOVfU/G5B7CJhaMuHEF
	iS1omUbRly/tdACdElewU0EcD5H7AVRKhLTAz5tnZNIWxvRKgI=
X-Received: by 2002:a17:90b:5390:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3b3d0640f3bmr891153a91.6.1794956105128;
        Tue, 17 Nov 2026 14:55:05 -0800 (PST)
X-Received: by 2002:a17:90b:5390:b0:3ab:2d17:51c5 with SMTP id
 98e67ed59e1d1-3b3d0640f3bmr891106a91.6.1794956104611; Tue, 17 Nov 2026
 14:55:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-11-toddfreed@meta.com> <179471270629.2199510.9480561958902023552@kernel.org>
In-Reply-To: <179471270629.2199510.9480561958902023552@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:54:52 -0800
X-Gm-Features: Aa3M54pEdqPp10DAjnIjgsYaaHWMRisY79HeZKYFQbRbnu5DENxcJuo9y0o8SvU
Message-ID: <CADh2yMxPrJZNtVdCgQWkHsKBk0cnAZ-0RiVaCMquQNSH8K32Mw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 10/15] net/sched: flower: add psp_spi,
 psp_ver, and psp_dev matches
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX8utgo87qmHA7
 LA70K/bvmmIvKVAqZKjp7t8kz8PJlTE0lh3RjJiqIXcNmH+klOUwFdXWtR1d2/i0p+WqYCHBBiq
 nn2Z100mhg4+1VXqHosNiX1+zkl32Wk=
X-Authority-Analysis: v=2.4 cv=ePyGH3p1 c=1 sm=1 tr=0 ts=6afcdb4a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=jCddH8ec0KUNCymVuxII:22
 a=e8l9bKk9WhIOE85pT1MA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: h3mBKdmIvMDBTzdq_6sDoGDlTJQbn6B3
X-Proofpoint-GUID: h3mBKdmIvMDBTzdq_6sDoGDlTJQbn6B3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX7J34Q0Tp3Q3N
 10Hmz2ubn7zA+d1fAVGaKsLq9wNQGjgmIZPfa3pRICpKjMofXdXhKn712wRpnq7Y/RTNey/3j7q
 0t2ltSkH7SWif2yIQHN+9L/zLXqviOaAL1i6vjCROJzcttPJCliGp7yIqUbpisTMf31qk0h0dXq
 1XZOJpynKz+/OqX+eZUwRChURv7QU+O783P4yW8K6H+rFyEWRQ8disBBp+PdgTPFsRnkFMsly/m
 PjDEW8QZgfEiYjVqgMF3j8XlgPkbpGFomkTzqB8F7geGwRtV9vcSnXAZ/NNFDnK8SWCyAJ46Qan
 J5r4fwmjt10b0Xal0p2P5i0wlUWLiUVih6kRDH/ev4M6nFIoDWfU/bticP9azAr4IlbrobijsdR
 GZXWzoP7CpeAYll50Rx32Qw4Sy05EGM+qlDhuexBW4jOodOMMsijFESH8X3VCO7xp6Bw81VReQV
 OwxGTIMeq2dDG5RJ+Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
> Does the commit message describe the right failure mode for rules that
> are still installed after two key rotations?
>
> The commit message says:
>
>   Together these matches tie a rule to one association, ...
>
> and:
>
>   this means that a rule matching packets that correspond to an rx
>   association which is stale (two rotations have passed), can still match.
>
> The "Socket-less associations" text that a later patch in this series
> adds to Documentation/networking/psp.rst has the same gap. It only says
> userspace should replace such rules before two rotations, and it repeats
> that the matches tie a decap rule to one Rx association. No later patch
> in the series adds a generation match or any enforcement.
>
> Could the commit message and the documentation say that a stale rule can
> end up matching a different association that reused the SPI, rather
> than the stale association itself?

In v2, there are no Rx associations. It will be more clear that matches tie a
rule to a SPI not to an association. And the reliance on userspace to replace
rules before that SPI could be re-used, will be further highlighted.

-Todd
