Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795457593;
	b=CWOcOK43v30MxI/tGfF2KvnVRRv/XXyYadrh6Q0Z3N0D/iMjqkYlQuHmzC1JRWx7Brr0
	 KXwd0s9RrynQyb+wen9yUO2XzD4ZwyOkqtnFmDcJjcT/wz2VmwuEyHO/nsy0upPeegKOj
	 C92V4W1CIS4N8N5l6JvEBZ5JWbMGAXTD9QYfqDwx/t0Y4bVsTkSuZ7rRuHK4RoiRx28Fx
	 oseUxf5BT2ZFSf0xXYsC5TwQql5VCzxJ72ItHFaV4ByAH36rKCmbFVoQsJHlk+JLEtppu
	 XE5ZPLmhcT+uOew+fuxZOYzd1iiZHh9IgoLe7qXaw5EtP3S3jItNnL4TEvI52SpMcpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W1rYKUQurdfUpTs0/e4xfd9Tck45cp/Lz+Egqb3NjbE=;
	b=h29NCgEl/lnQ2TbP4AT7CX8rmk8jBLKNiNc85ymXbKeVSs1Tru2NxoezxNswWMcRZVG7
	 KXopbF+vzfCWltbICgj4Dynld8+jWfalLyexDaAcTpw4fPdVzRncOEcJKNlVjCo8ULttb
	 fhxhFqOiDPwvlY7+KJSAF4CCdIL8J1PRqfdfKuu67ziDnVxFY7HykL6YSYbANGKkpLY4Y
	 MjezCLc+zTHUOa6R8Y/TToRj3ykWmzVK/eR4FaREJSX5I4Sw8Mmboa7jzcf/6heGFsSPN
	 G3YyWd3dnG5O5uZfiu6uHMMoioReaxaGONvYO+nKndfpgLn1CbPpXIcnee3IAkKqLLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0On3RRD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvWEHlaP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEF8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFEF8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0On3RRD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvWEHlaP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3Mv2844523
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=W1rYKUQurdfUpTs0/e4xfd9Tck45cp/Lz+Egqb3NjbE=; b=E0
	On3RRD8QKH+iGkuS4AgzN5qY2LFi1otifOJS7h/Hk1yBWlBIXCRxRCIwgZ4K4AU7
	YffkwXQauP7q/FQC+Jn2Jws3vSWSyEPR+idymqsoAuQp4EBLXF9r6rOWCqS/YzGZ
	LUnVkzGyeSW/LPn3RrLnicUR3KTHeLtpcaktSWLKr6J1/yBSWJVxv1qVjRr5FMbk
	Nxz7MIsFE8wRQPljU/1ArbiW5ZyWx7aXVpasruSTVo4jX4q2fNwNLKhTZsV2n/Ch
	NuXmmpHjLL9kZ9yCM7A4GwPYtfy5jRjYPGPEUataE/mhyDTSl+qqp6Ot9pIGfBYJ
	o6rKiUME3xccIp5UbV5w==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k2s55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:13:11 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-7052c0a5836so3223455eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:13:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795457591; cv=none;
        d=google.com; s=arc-20260327;
        b=Ci0ID8bvBchp5wLqQhum2htVf32CYlHbmcRfhStbXdTvSKk3rhaMs841ZeXno9GJeT
         Zy/WoNjlLB+CDnxdaazA6cSa7SVh2mQSuTn6sh38eBUGpQlaMlY8jpeuhLOvJoYvF7KV
         o43CmmisqjH3TsrbKf92ZT7/+WvsJzDeMy8lxkih7JTQXzANo4p9xN5NNRlGPkkbYFGF
         ntVVjacY2p7jiRJVLFXkEcgEUmvDqG4BcJJVV2pn3PGuhUb5nj6m8LGeXSqvmWydGSNY
         4uG0AAbVqk7HUClUZ4tWRK5QDfcWB8NdXBTtfZyMlf1r0HQTxgE0jKwI+r3kgaiDMEbK
         1k2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=W1rYKUQurdfUpTs0/e4xfd9Tck45cp/Lz+Egqb3NjbE=;
        fh=Nv1J39UOOOlwXVH76ucWUwORQVCe01zwO6tLhmROa+A=;
        b=YhApWBXAhE6ixcTey9dohqXEPbjw8MMaU6tRPX3BmhmvawrQ9oPzaK6iFwXYzCmEc3
         HSK42W4ncdQnaPx16rb+076bqgj43VjYmNuLDhY16BnquJmI9MIsWlkojc3+r1tG1Tvt
         VlsWwNt/14rKkkZ6+SzjgsOM4YZ9m9QS5FfNQorbNqGk5G4Vn4zJc0jQ8zUhLJl/1JzZ
         MY1wB6tDsGERSHhOQeK8afHLF5H5hGPsdu0ScS9Mvr6WghqY0oorfivXQHQh7LKlLJvg
         YoiMsxbxg4GKlvinUcabexXz13yuvB7XZjUORwfPjZNL8t+dBLkAGHk2jpCQju8TPzXh
         NHiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795457591; x=1796062391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W1rYKUQurdfUpTs0/e4xfd9Tck45cp/Lz+Egqb3NjbE=;
        b=bvWEHlaPPhN72i0U/jBrJwyueGJlKr57qTaY0ZlQv/pwGb7si5jLrNHSZ67tFFduKZ
         yck3OK22B5xEdqijoF3kFNTTnbUCe/+oolWojbubMKJejCqo6dE8qAO/fhpvD07FjhBC
         TifgjojAbFAERLEVQACcPuqiXoStuSr20EYvTNmF6buHh/Du2O9RuPlg2gU8hO6pJfGw
         1/al2Q8OT1i1gRuXbqfdVb+OV1JIlhvUENnxy21deDbkxRmcvNgA3+L5nvG82xE5uGG5
         5pMBOJQDf/GtzI5hMgTA3e7NES9nTowGCa5ZYkfO654MvnH6KlZVPos5rUaGnW3JEK84
         k9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457591; x=1796062391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1rYKUQurdfUpTs0/e4xfd9Tck45cp/Lz+Egqb3NjbE=;
        b=nbl/m4nM9LUX7nNzelVHQ3MeGuWrteWGJwDYtRXxu0fE6wUusnqIwPgPlmTw6eVwCQ
         15q/Jdc6GgLthLu3ReLdPQxEpeFtIX23GY0lDoIBGY3BnAr1EAgHWYzdZjPHzgAxDZ0b
         1OBz+hfj4+cY+cWqwsj/W4s6aTIA7d6ypSVtPm6YDuWVNOgUQqI1Lu2wyccQ63kr9dSO
         Tj2Mqs3nEMiVweuJD1Rwecr/TCgJFVUC4sohDW6U2MB/mIJhYpv3hBJ8nHCc8RWwele5
         LTQP0KmLObBtGHK10emIKLGpqTHN6iYLfwDYOlsJW3kRUJ2o1F1adJJeI6WTsD/aAug1
         DuVA==
X-Forwarded-Encrypted: i=1; AL+hErFNv/1q5MlEeWwoBos/m594Wr/bQS92o5y3/555R5+tCM7cxMd94QuwgdJ7cH4GFeOQgov8BAi5zdntU2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J32tZK20JWhao7jw5zotj6AmK9Up7wwBth572uviYN8dD33h+
	iGerDdYGOuMT4vWF7GEKdGT60SLfwdfCSgFR2+EUMVxPT+JfMUUaWcDAGIDQGK8pCQ479fUYQKv
	VSekXT3p/mDd6xcO14UDQDE3m0smUIvg5VihhkupWtJHvm3rtW6j/PijU0B4wjSrpGxycmjAgOu
	kIEdJwtV3dewYgyKLnOfODk9XHwxlaK3h5zbobUP56MQ==
X-Gm-Gg: AZFdTZfKJoGTC2sxpn/oyE2RXBfOgVCZ0DW4j+1clYRFXB/hbeUfZT2Ra2GxZCFXW2h
	YjmU+bHst6oxbWKy2230nVyuDe0qHzaWdR8OkeNUBTgntBKOk2k9/8Eqc8PTb/V+EeBkcMcmDGm
	jEa40JYMITVlMw9/FDxj8lX3yHomwAgsXrMyTnX9w6DACExKJ1HlnhEosnyRDg+Y7uqaenYIj+9
	CMNdSi+0C5B7l00MxpLqQ==
X-Received: by 2002:a05:6820:570c:10b0:71a:f390:ae4c with SMTP id 006d021491bc7-71b396335cemr6592071eaf.82.1795457591003;
        Mon, 23 Nov 2026 10:13:11 -0800 (PST)
X-Received: by 2002:a05:6820:570c:10b0:71a:f390:ae4c with SMTP id
 006d021491bc7-71b396335cemr6592049eaf.82.1795457590649; Mon, 23 Nov 2026
 10:13:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123172025.402295-1-robin.clark@oss.qualcomm.com> <40157685-826e-4011-93f2-1632b244a1df@oss.qualcomm.com>
In-Reply-To: <40157685-826e-4011-93f2-1632b244a1df@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:12:59 -0800
X-Gm-Features: Aa3M54pc3x4GvgAvloxZVUq-tvmXPPOywnjTSJ1ICbSrR3N_W2wUuR71qCW52GE
Message-ID: <CACSVV01GuU5N1TcSP9mK-Um-KrKeowuBQcc7PTOPHirX01_y_A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a8xx: Add missing preempt_record_size
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MiBTYWx0ZWRfX/pD1uliSxVd5
 ibCoaPTpguQsgcj4tAzajAcjphLF/BD4dpEZAr6/wV1XxA1i11FzH20Z+7HpMV/emYKzePkQadX
 Ez62HABZcTHjRbNmeQQU4wWQqRBM4D4=
X-Proofpoint-GUID: ju1Oco4sN8XXWmk3cskE00A1_EmrP3Oi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MiBTYWx0ZWRfX8u3vbHmk/QKL
 70bTzPLXY94YwUvyMw31MKajNKlHmmNaMHZDwLRHVu1Op4roGysgxKUrlfy/5M3NYxJDy1eHiFv
 Vyx0c3ZBV+okXb/ibBJ8Wzqzx5x0/SkbOFTezz27MyTU90a3Xw1DQoIn5c4CMf5fnw96H4cB1Za
 4Vn8o6JfgjdZdSM5iXL6MBd9lh0v2mCFVe/kY6knHKo6n54+OfKDIBqGsgXc8JnbHhrxn6jUTyN
 dbPd6jQMTy7e/6CxPfiFbhNv1nObAAh32msFZJ82lhKN3J1MxLiKeQO4r1MaB6UXM4KU5Ekl188
 e7A/y+Ehh5EsIyVWJr0aQV83MRvgSJnp1cCcNr5SbPVR9RYDUpu/UF4pBwWCg4EalmEm9Dz7stV
 9okwjc7yIP3Gg/wFq/N9p9pELbhodKLjdjl7jd4LqIRhYwFNhysJOlFuy3wUghYiX4laC2yFDkW
 //pysQrR0TjYX4qtTKA==
X-Proofpoint-ORIG-GUID: ju1Oco4sN8XXWmk3cskE00A1_EmrP3Oi
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b048237 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=z8o7zT-b7kWXHJIS-gcA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230072

On Mon, Nov 23, 2026 at 9:23=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/23/26 6:20 PM, Rob Clark wrote:
> > Somehow this got overlooked, and Glymur/Mahua were falling back to the
> > default 4MB.  Which is way too small for the amount of GMEM on these
> > devices, causing faults in cases where preemption needs to same GMEM
>
> s/same/save?

oops, yes.. fixing in v2

> > contents.
> >
> > Reported-by: Connor Abbott <cwabbott0@gmail.com>
> > Fixes: 7fad33097e67 ("drm/msm/a6xx: Enable Preemption on X2-85")
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
