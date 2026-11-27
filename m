Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795790620;
	b=GaNvFPMwmgoZfvSj6if5b9hhd6wwsf2OHdBX1EN8DaOC39cj/6QzoVOh+OeRMYG8Qp2h
	 xzjiapjerqpliPnztcGhnHeZbCPzDhtTNloZn7kHX3qHYC0gSXYdzMUpRsc5i44MxmmSt
	 PvenrgHoGK0rYSmn+wU0wZBN0D0rh3xyZKL3YM99xo/dGC8ojpretvo3qGK4DrKcI8m8U
	 U0t9QPHmlJZaRMJX4URqTfd8t7NIofOlpeJhBbysYFNUBuNXRWUFeGLMNL/C3KjpNrpnd
	 fVlJpAipZ4aprPFeJ2lcaOYNRdPayVO9CJ0beqRrzpkkk9ozYSxQDnqElUb9kLgIvaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RRK9YDLFBZXwKuXQtKu/5tdjSq98zFs+D+5971VO7Ts=;
	b=1Ib035YhpXR7NuKgjXYAaK2iyzDHD1OnE7CHzo+nXVNXno7Cybv3g8n0lPwCa/WI98g9
	 MXQaBDAJ2tz9RLvhbrTigUVOWiNq8rpte9OCrmMcqPt/fMgeEFBYdEg7UVDYlIIUaKCDw
	 53rb4DQTM+yruaosa5Nr+LgQhcS1qUvdmhHzh6G1Rvw99bRAd5mmB1M2WZBIF1P3DjoZp
	 g2r1ME7IF3bDH2bjM0S/Vki2Cwvr0nyiBV+Rz94Tq5uJ48UvBW6chAbrBBWSDg8q2tzhn
	 beXmWMPDFLB2ixMDyJV/o0LjAm5WiG0d7Q+ViU++9rxChG0QBkl7mlJWWrjyMs/2jHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hqqAxN0G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ive80ljp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C100606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C100606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hqqAxN0G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ive80ljp
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1S2T2376489
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RRK9YDLFBZXwKuXQtKu/5tdjSq98zFs+D+5971VO7Ts=; b=hqqAxN0GNzYrANOV
	N2LnDp+WhRYAw5kO2qoaodHMWpgO1mRSPdHr6G4WTJr5xKodB9R6r09G2H4x/iqE
	PnyZsab4IDxYmr0fxMvAGWKx9GqI5zzxccRRLd0p4C6/Soqs8dBhPFfgRXvUMc7Z
	4V3Ck2+Z7aLypxXvpTLf2sDY5GKFou7RenLThyN+AFu2KnWq8lMuilTB9U06dXHf
	VXyhsr/dwmTe7fzQGf7UvGCxTFwUEWo+mixbwtNFIxcRbedlpKm+6A6B0G/FkSsX
	X+7ANsCnk0zfTQgnlSwTHDSmiBCXJoNdeNdulwyyXatOHD8AroEeHbqvjdzlkMfW
	ooGJpQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hughe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:43:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so6653230a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:43:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795790619; cv=none;
        d=google.com; s=arc-20260327;
        b=LxZeaYI/CXwD7TeS4SOUO60lXr9x3Xz7+7J70XHDyJz9W6cYYY2Uh3UlB7yflYaIWK
         n2U1zSBrEUeloRXyZcIMWr74Z7DPivMHZQQnb27FJqRm703mCixayyA+lYBedaQGZNSi
         MQyaOO5OSfA0q4dxISD4K6o1uIpBS7IEhoMtzQmBkxDtH5HlhQliOM6AmARRW1ImHG/R
         IXE+7+do4v0Ns7QNR9/6l0XOmKsaTSTFCU38rlUH8gqZ+9w2aIvJ7I9ld0dWOOX3STBm
         XFHyld1/PjLi8HbOVfBtOQX6AcfuTxj2La2gO00MW6rlyxH9/foOMxUztlxEDhOT/wz/
         ms7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RRK9YDLFBZXwKuXQtKu/5tdjSq98zFs+D+5971VO7Ts=;
        fh=03SaCIBPbrA/uFJB+lHHjpf8yAqbm7h5RS7NFw3nMGc=;
        b=RcD2g1Xvr+qFxsRbozM+1I6VoLBojr521174XGBU6SJCMrMq5DeYeu8e7Sd4XU6xkW
         VXdojl2LcqPLm4Y5cH+c4CGvjTl1LQc3R+iJlbsiTsK2/4LXmTLltk29CY42DQrndRRq
         Rim2/UZFWhyRhi8wxGK3YlcvKtEsVKfy6Et1pt/rYWnTFboc7Zt5NtoyMxk2uj2lfoee
         n8PqqHQlfPi6+mEz2CstsfC3UwiVrqkeBlNeCEpPmsU8SMXk4Q/NiWW84g/xS8z2NaJq
         8rA7Nva8kWTvItg9wMfNQyGA5S83nBtev/Zac3x6dr3evO28QeB1jnj5Tk3qYVHC6vwu
         5KLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795790619; x=1796395419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RRK9YDLFBZXwKuXQtKu/5tdjSq98zFs+D+5971VO7Ts=;
        b=Ive80ljphiblUd6oBrSDkkQ4Ujj+O7m1A6KYZfCqm8isuPE1D2SomIvANEOHE+vK+d
         mhuWn6OT6I3yKbjAGNsoEL3sxBcgZB/guqEV3EvRjmXGcNPDHNOlBSoQ2S3YGdrLMW9B
         6S70TD8PGZMz9hclf1njOAvGt1xl315sSiDAOAXG4bu9wOSNTfrll/quSk/ZPIpr97XD
         oMojht29XHNS91l+byTSsGC//gQsWJaB2brp3HkQLzPr6pVVsHkr08ecbhYXZ6NoZJQ7
         jmL2PnZL5iiiSjX/o4wqgfuYLeJeEMEwl38sJkwrz+Jl9tTfTYrZwaFI9vfkpe0ES0uC
         YZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790619; x=1796395419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RRK9YDLFBZXwKuXQtKu/5tdjSq98zFs+D+5971VO7Ts=;
        b=ukK0nMZXUImIKJrx+2fyBT6x+8AKiND0RRfooZJ/j2vO7Sq2gTacoqQ81Xq2U6Ge3Q
         fhOX7gPl9Pzw/6N+45w5XXY7Xg4cfMJudgsUk8g5FuAI4w32Hw0AJmmPo+At2ZqeehgW
         R+Gn+zgJyZ1LaxqaPPqXpSvJy9+JWn3mNvkW5+cKdev6vp69pTX9hKduu/EbA0W+Ulsn
         v6TTfMWA3OGcVIZbliw/uIthSmDUG782Pol/saV3jybRRHFVLjkZ+D6lMzztZ4sgtIPL
         kihmhdG8eeVev9uqOD0G3EQ9dfiFfS6we3E10EbhFAGmwPRpGBVjdxT7Bcx/6f+fvWSv
         qoyA==
X-Forwarded-Encrypted: i=1; AL+hErGPrt1/qsTn3NaPZzuHucc6pOXlE1uFbt5fBktITKRGygfbKOY1TXKHNHHxrT/+fYykY1JImsPvV8Vmvs4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uRSYUSHRgH5WSg2RRaFk/lG/IhiYDbs5iaqLoFmPIgxiNlESo
	Txndm/O2CdnHeC0X8SXkdbJiDRwbWIN0iQmsjwzZeL9gaRkJKCJKzcCczPFRv+E0BenE37tuf69
	rXJsw2nwnhPT7Y8dEz6dmML0dIdPHAWtjZXbCoQ8AJq0rhzpf2EyWwQnVXhejkALgR1VRgf7X+w
	p4hbg0W9NKg01JBWcN+rBmLjO7rF0O3O2x6q5SXwPxFXC4D01W6Q==
X-Gm-Gg: AZFdTZdczO6gFnB+zXY5Z/6LNRGVjamnYQBKNlSvZBRCHxhzfgtutAhGgRAgMEzak/A
	wh7MinSoEtaDYeJEJufHjPO3091sSk1iremoPd12FdcuNdbjAU4ZLkyP6dZePGqHAz1GO22Tdzr
	0xJR1bfqso6xEm804Tu+j/cG17bgWaxfp8Ly17XwovIU7aObJZGyAnK4swnA==
X-Received: by 2002:a17:90b:4a47:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3b41c8fe84amr25941780a91.10.1795790618994;
        Fri, 27 Nov 2026 06:43:38 -0800 (PST)
X-Received: by 2002:a17:90b:4a47:b0:3a8:9d0d:ca50 with SMTP id
 98e67ed59e1d1-3b41c8fe84amr25941754a91.10.1795790618594; Fri, 27 Nov 2026
 06:43:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-db9e3c75b3-memstick-1@mail.sdu.edu.cn>
In-Reply-To: <20261104-db9e3c75b3-memstick-1@mail.sdu.edu.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:43:27 +0100
X-Gm-Features: Aa3M54rAfwIYDABxWCNYEdkvpiiKvboY2-gyIiFTT9Xk0nwjfgKFrPw3cxJtvSk
Message-ID: <CAPx+jO-e4iQtrziy=MJ7zbTRbvEJzQkrU=31J-L1DSKVj1_aYg@mail.gmail.com>
Subject: Re: [PATCH] memstick: ms_block: Fix potential block buffer leak
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX3bcyg5jcH/IV
 zNiGtCncSvhYP0PVpQcfBQNAgd+SSj8M3ZaGrnwEyfdj/fYwRwSAVgongh+KAE1pqYxpKj32LYl
 tNxp5fJCemKbo/TijObrvoFcStn21wA=
X-Proofpoint-GUID: K6NHL1xeF112HUJvXNvK3d5SWHURoS78
X-Proofpoint-ORIG-GUID: K6NHL1xeF112HUJvXNvK3d5SWHURoS78
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09971b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=ZXBGRh9IYtYWsRDO8FYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX82yAIANd/jQt
 MvgHHI5t5T0EkHUYAH0CA8q4I0U4RACCAnBZR4cG1sfMLY4BhRoPuyIFXu+REdB8mWypjKj5GrS
 Tq62L18CrNxJzbIQqN/TDEno0EMPL8S4K0gnZbq/MSvktLX3vADtL71x1vI1JEBVkh9UZw0XKm7
 hlf115YFkmuFmcCBv4ygG4yO9nsqnWwEe2FMpQdT1IH6qmqtze+MD1YZrwvAQO7m65VdoLciC47
 RMElIGBCEHtsQg6JnjQW2SItaLzsfkWXDq+0sY/s7l7IhgEtS7iUo4IbVnypJqFu/WncZ0ip82s
 TdelYRmv5Mkk1jDYGfMHDQKwCcrvVeDprGaFSd4tmVEhfvN36HulQ6gz7dZXzOV3evugededyyB
 L7bqyPtXqH2jmtr4w2q0D7mkkoynlDV9r6ineVD3tKgibZd2wkfGi/fFMPKq1NFQ4jthlEwSpHS
 RR/FJ9MUX5L4RqmjUyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270058

On Wed, Nov 4, 2026 at 3:33=E2=80=AFAM Guangshuo Li <liguangshuo@mail.sdu.e=
du.cn> wrote:
>
> msb_init_card() allocates a block buffer, but msb_data_clear() does
> not free it. The buffer is leaked on probe failure, removal and
> when discarding the temporary card state used during resume.
>
> Free it with the other allocations in msb_data_clear().
>
> This issue was found by our static analysis tool under development.
>
> Fixes: 0ab30494bc4f ("memstick: add support for legacy memorysticks")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> Build-tested the changed object with x86_64 GCC W=3D1, using defconfig
> with the driver dependencies enabled. No hardware/kernel runtime test or =
full linked-kernel
> build.
> OpenAI Codex assisted with source review, patch implementation and
> commit-message drafting. The submitter has reviewed the changes.
>
>  drivers/memstick/core/ms_block.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_=
block.c
> index cd4ff1b79a6d..d62350f9ef5b 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -1953,6 +1953,7 @@ static void msb_data_clear(struct msb_data *msb)
>         bitmap_free(msb->erased_blocks_bitmap);
>         kfree(msb->lba_to_pba_table);
>         kfree(msb->cache);
> +       kfree(msb->block_buffer);
>         msb->card =3D NULL;
>  }
>
>
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
