Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794953064;
	b=vn18VdDM7775bi+0+HTzbn4eO8JvIO7a22ZvQ5hvmctENTbf7Vzec4RISFSVRGs/nCxO
	 FaI6OJtruDQ6cUSNggEy7Ik/uaidi6jbNvpSjzNjaIoCJV/bxuhH6CV6zVBC07yVMAIS9
	 4h5zXtkKWBI2t0nCXfqlp4uVHgezdJkNSHmMyWvz5/1ZBCuZOvScujVrsYFxDpicvXYMp
	 2khqMgkE+22R3iPKL9D3ljE1VRsHQO73xwnvQMd2bzuf7u4i+sBPsmNnbz2Zf439QaMCh
	 PJ/vRXmzOGwx6epZ5zQOvvPxRaI6tXocN6Y575A4+LG/Yo9K86/zCLi1hxr58otYwdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=F0h8eziyjQaKcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=;
	b=SWYnd3dWKirVP2cMQoMfHP7zzP+lymE+pwU+cEnwGeRfsWAybPGC6pBGLASlqVsVwDo5
	 oRFg2JSg9jvtNHPTOWy0WFB1il7G//LC5Fn+MqOwkW5EMDg20BdzbhUUNk63XbWvNQAev
	 mjVfRJMIphHnVStd2Rdf2+9xdERhGTNw3JADQ9Evha3japifo8xTt895UxJ/626R+YEfL
	 3kwwNeQK4/YAF/YcHG2IjqVIAIfjHonXJVryGGA16kqyjpLTd8zN0vmKGMlYcNyCFVmfv
	 gpZePmgSTkkbT1Rfnf8KLohAWnxQYGxJViyUz7J4UKCQKv3zY4J/vPuDoSAYmjjkrDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=l7uGjHqQ;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBCD606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CBCD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=l7uGjHqQ
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM1o9m2406497
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:04:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=F0h8eziyjQa
	KcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=; b=l7uGjHqQiohs5ekfiARvjRSqonZ
	vfWTdNRDAMTgYbwgHd2DiCaSQiby1P8w8eUQPRR+TIo9nRLlBQFNdDnVag4VjV5v
	zrbZw23J8ETzA0nATXP0IVDkySa05zQZtoRlDwRuy1a2ZoxUH4Pp1yJR43RsCUgv
	tl+xcJlH6woyek733bANbYzH8HReXmgA4za22Txg6BnnOkOdLsXPCv3qcCky4PEl
	oTyV9zDt2xSDfhUpHFVmZaywQ69nMGDlbBxkhLjsgqHBVVkUhwg+7DJBMhDNzWHE
	pFQ8H/gSSYpsYTJQrKrhs1zeRTZ+DY87ItQdcFZRO3NzTPrKdYV1xdB2t8g==
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0sh5md4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:04:22 -0800 (PST)
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-492d47f142cso106787f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953061; cv=none;
        d=google.com; s=arc-20260327;
        b=K6fvoZAX+wQ3ZoOIqVPCCpL4XhZjUEjwOLkA5RLlxlbR4raZieE/cXKdnRpUg/7Aad
         9+el3l9iFY+4Vg6dv1v3tlJ6Rz5UMnbPDiC/jkvgOtpPaCYfC0i/HpEpBnKzcsA+xfvw
         I5wbctOL1UV3pLuVofPaSAafhgERuOFifc+GJbzW0JJ8i6TjIlwKAh6bEfNj2HkoGw3q
         wHnH6Zz1PkNE/F+1K/CF9Gc+hX21Kw64FtIMB/Pj0NgvC4Ynev7awJgiYBm7w4WaPcy1
         VMqc01nZWzmZb6zmNzBFeyaeu65qdjhUkBMIgIZhKxGA2rlQKqKC0remnu0ri/FeonQg
         Wnzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=F0h8eziyjQaKcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=;
        fh=j8UJOrcWCOjgA8VdefZhmx/pSyl9iVTEpBJuj3hLFok=;
        b=LUeSjPnYB/Jqs0N/UyBn2UCBwxQwBqDmRP8fHqxkrqazZMYRGtbjDt0ELdHWmm2h5F
         tMm74P1FX3/gukkjQxFAT5QBPzE9aqxsX9XZZNeazuS1t9ZoVwfpAihhd1/7WmEm34Sj
         qC1QFMHWntvfWFut7d0OLHHKmiD1RiO/LCyArosAldLCt5zz906AtpqMBUx/Png4ZcaT
         RUTW/YW9FaKSJYj/Ex20mXAdROhwd41hwwnt/ojIwEBCJ15XEkqvuKpVFfyH+ag5+mH2
         spktfZtiduD6LCgz9RDxzaNiB9qbWfu7PtslU9TYEcLVQ1XdofYEK/gZFNygbO60ChLe
         ENDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953061; x=1795557861;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F0h8eziyjQaKcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=;
        b=yr0n4oInCP1JMCRy8S3mwzOg+KjKkprCz2bIQjVS83WfIK9SRg4TV7aBxfLEiBaA0Q
         tgxA6gFwHpA85kq/IKpfNKG7TQ1+vIrBHca4rixVKbFx9qNUwSlbh6gPtSMZXd40Ptuj
         TSRiaNCE/8kyUKR9hZBdS0NNefXR9xWspaFBb9FZ73csRfj57yNyCn07d43DU5MUKEtl
         hAbPOYA2LHGWDr/21KvQlgyrcfOMs0n5koc7PpGO6uSTh+TbBBjPthVd5cap80Sv4CYJ
         BbT7RdkuSwECmXp6GISH9GoPkmH8VZvwNw363JspvvMKu8MR9S0NhuPy3TmY22H+BsPl
         Uuhg==
X-Forwarded-Encrypted: i=1; AL+hErHwV71fZTsexaiIrrhVxwsC5B4mVQyzXQ0Tl9ry9VAVLYd7iMJw4wy0IHgC270oPNseLGKmbqF8F9MN6mA=@vger.kernel.org
X-Gm-Message-State: APuU4Z94fqAGPQBxknWEkcYaYL1MNBeY2eohjVyxiafd4do3SNP5kmxf
	GrpWBpHKXsOzSsYHXmcKp7YP8i1p3O+Tq8xtuDE61Yc3Rfo4K5gONp6K8KAOSU7WJxOLf9ZDLxO
	HU5Zl+XSFg6ZBcTA6A7AHMR9rTGozDI59DUtoWl8HRmTPxx9I0rZsHpVVIiftvqEINwXamP3IkZ
	0aSLBltgAeKBf4k0NDVtE8H6HpU1qQe/htpW7DybA=
X-Gm-Gg: AZFdTZes8IOVjVthscVzHlUcPiygr2NibrPTOIWU3x7uYgCZoPmK8L8EgrDHCO1gDRJ
	3eJwJpc90IIBmyGf0w7z/uI7IxMQAjwTM3siEMEc1DB5EzILFwNz9J7sq4SludA1Rtn5u+f9n3x
	pfARb5GCm2CTHT6poo5sP4I37z5bXVsVkwqNOXnIRUeWEO5akmAWSVNwL3AWi4HUNNKKDZ3jIJN
	Z/WMWUPWLZzbFexXe8gXGXz6xRjp+zDEN/J1YrA1SJp54nJSpc=
X-Received: by 2002:a05:6000:4213:b0:49a:94e6:378d with SMTP id ffacd0b85a97d-4a377f4f68bmr8136029f8f.30.1794953061546;
        Tue, 17 Nov 2026 14:04:21 -0800 (PST)
X-Received: by 2002:a05:6000:4213:b0:49a:94e6:378d with SMTP id
 ffacd0b85a97d-4a377f4f68bmr8135992f8f.30.1794953061161; Tue, 17 Nov 2026
 14:04:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-9-toddfreed@meta.com> <179471270271.2199510.4403404984222798506@kernel.org>
In-Reply-To: <179471270271.2199510.4403404984222798506@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:04:09 -0800
X-Gm-Features: Aa3M54r8wXLJNYnHzeKDYLuWuEkGFgDFBdsvsZ-D9Jbgov-qnF9vSIAxOghmZf8
Message-ID: <CADh2yMyL_SSJqD4=H4zkzmUCJCL4OwxeY+iPq5FQrBZyCb8+tg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 08/15] psp: only give time-wait sockets of psp
 connections a validator
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
X-Proofpoint-ORIG-GUID: Yuysjchj9RCK7c8T6H7p1owW_CxG21BO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4NyBTYWx0ZWRfXx1NL5CJHhk6g
 BTAkl4V6vfqkNZfyhAG8kdyiklIga1L6fG7+85I9SljiiFUpG2liZajDkUWj5Ejo+a+SiLzE+pI
 Y8O1GJ0yKZhVQNidPpTcb3+yQCtgmYs=
X-Authority-Analysis: v=2.4 cv=A+H5rKWG c=1 sm=1 tr=0 ts=6afccf67 cx=c_pps
 a=CsXZvLRfiTx/ye2xXAwb9g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=kH2YsCX8xyqK-3fOXDQA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=F7q00xkr9EfWfQvbdVXI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4NyBTYWx0ZWRfX75T+DS9I8fdh
 QitI+NKGcGg5MEWXA8iNpVbR3h1R6zyd8+Klg4zPp0yx6lB6G0ED7w3W6GGUvCVOMFFtNh0vuZx
 jelec7DtQsJBu25DQoOaHO2n62Pj0FYM2MYNe48DnMb07rYIvUfckAIJUq86tETGKqXIz1p/sJm
 WZBdJ1r3ShNO9JwhKmUdfDIAV4/yKUsuEibB3WtrgdNIG4z4b/EE+o59ci8EXYO3vP4ifJkO6YK
 Gh/gu9Qo8Tp8zcQxW3QCOch/92T9xq7oUZsXUgbPty3s71QOpqMR6K+2JOgVP3ic5FfIKRw1HEa
 tz/qWN1XSw80Jl2fAbmPl9Q1wT/DBGCb379KSck7tDRzx2lDUXcQVjRnf5pI1yptVkQ+AYrC5iK
 ACSFeMh4DiCeDXqQYZNISC2xRtF57qk+XNhZJQgZ4iY7pp6hTm1VMuaCmJloE4KaRg5b8LaU4kA
 h0Bs2HGPyu0k8Q+gfrQ==
X-Proofpoint-GUID: Yuysjchj9RCK7c8T6H7p1owW_CxG21BO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: High]
> Should this also check pas->tx.spi? As written, an Rx-only association
> (pas->tx.spi == 0) also gets the validator here.

This patch has been re-posted to net, as patch 3 in the series "net: don't
redirect decrypted skbs to ingress, psp time-wait validator".

It is now checking pas->tx.spi, as suggested here.

-Todd
