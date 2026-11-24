Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536346;
	b=GWmg7cm9rzTqdFnIDukTbFjNorYXQntGLHReHunFIuYDBXq61ZlHvDPT69gbdUz/1Sjw
	 4mdQVAF20SDVD2QVhkJ0t+YSw7pEdY9A5E0wIHv9906rF3uiCub7t4l3N9yixg4xTUAm2
	 gj9QIP3srm+JMC9/p9HuXXCmm87mfSvwkkFyOLEGXvXLKIDEKeFgwRlIvrL/NaBdPdaJG
	 SQFcs/Nr41q1RmO0rzvyNYRs1DWb1GKx6uUioXK8Bsxw97LrtQDjRRzRDmlMK/G5ZLcl0
	 i3yR+afZfAheARvVJfV6GLoergJh18Xp3rTFls79Dc4CBAVOOdlHc0Z6AqEXKiUdAXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aVV/DiQS9aUfxWsfiGy1Q/fbEqtV4Kq+84dgYbtXPGA=;
	b=rYiXPq2QPU0OcPse2kLBpiRPyL7X9/LWnsH/5gD/byR2cQZUDSmy2i2R+zv/PUvcXl9X
	 TMUT4KrR6g8Tv4oxy8ZmpQSyf9PRRjmxL5mz1SMu8xSoRjwmPFVu6BazuRNPnKq0heId2
	 D8vuxlLyLo9gEhvF7oh8Le4q5Hd0Me6l5iv24FhxY/tvqOlwShVhRzaFkWA4BRL0mEpNV
	 9caazqrfSYPmr1GB/5BZcaRc6lqHGNqZwrOTpJSn0DPswsI1VbWLLb9ba/P5SLhHsQiPM
	 IBr2z0fYZn2I2uNlEuvpPayKQ9EaX/LWH11aof8qH+3VrZK//lMbd/23P5j8lUMxIHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mw1QJSMP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxnNsYYX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26719606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26719606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mw1QJSMP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxnNsYYX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL2eT1183783
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aVV/DiQS9aUfxWsfiGy1Q/fbEqtV4Kq+84dgYbtXPGA=; b=mw1QJSMPkzhPdgAC
	WXDML3CeNT+ar8JzKKkJz0EtokbT34gjv1QpDPAmWC0z/LP28nDQu8/S/B6f/jlC
	K2mxkL+tJiiSwcTyE11oqRhZLBjzB9n3v4j1CPCjjQ9QE8n7hrqZ7FvAzzGeFEAi
	uZWq3dk3dOAO0k8LxWq5vV6DsxA2CjAtzff9lKiz3db5NFlwEw/7Yf94JcSFaOO3
	GJUY9bCCL3Hb7GYmrmLFiIH7xD2VEePYOI9rpgcvardFC+OU/TLvQtdmwu0ZlFN9
	cx9lbDw8+YmZd3Vj23E/tsuFR0MMQQXbld4j8cp+rMzJR6qcdwS7vVrss8ZMIhOb
	z18Jmg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky3jby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:05:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so3932152a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795536344; x=1796141144; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aVV/DiQS9aUfxWsfiGy1Q/fbEqtV4Kq+84dgYbtXPGA=;
        b=jxnNsYYXTJbRIab+Wk61x2NzBmU1VThle2sgZdexj5j7f66ffzIzPtcioDzES0Ingl
         BoSr4yOqeyYCdHVPCyNzNX8jiHjxnnC9Ipou/iG3ZA9U4YQC26BBZE6uItEFOpS6B6DW
         ItSSHiPYgVrQBKkxeX6pqnqjiGUmPLsxOsj1QAm0mJTExsthRFqHy9jXYeoH7zU0kBCl
         eMnsyzaOzoZwqncCtfnEEvNe7cQUGvT/KT6x3NgnMS/XEBzjwzbRM6EhzTuSDgiVKZRl
         JrsC0V3V2JhcL415+dcikvWlBP0sr3XqiMI8Lv6U1qNDe6lH5DI3N7QGP70Bgknx3p64
         lztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536344; x=1796141144;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVV/DiQS9aUfxWsfiGy1Q/fbEqtV4Kq+84dgYbtXPGA=;
        b=zNrEfrRtfz66MeIVa31rF1w6wZEwz9t+v+eEajhHpXmPLz+rYJbDH9ElRK6Lcgrmzx
         3FXdoU0IJgUtL+GO9EBpKwZMfWTrDTeevPRioWeGpB4Pe52OjJMyf7Z820Wom9NNUvzn
         Tr+U798Vz0y7uWGZJqYCeE8+/H6LGd/h6DDhnSzbvSMNST+D7aINYIMow35uUAvSQSNw
         YaiAKvS7sXQZtnJzhUBSj1Wh4CvigAVA1XCfYx+AEDoMw+bUVLdCYWnRZvR6RU3rX4ix
         kyLvKmXaclAS+LL9KbLbwIFxtexctCwNk4U/jgEM9SRtF03PY2uI3u0hUbWVSVq3g1Kl
         yaXQ==
X-Forwarded-Encrypted: i=1; AL+hErHyjq7LHa5mq2GTViCAQcxy3tweHzX7K01dRL3J+/dPUK9mA0qSslgmBgdIOvHtwp712c034qqcmy4p650=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xcH5glnSbkPOsjLcWCzfdZ0YqS2YQk+0RfO4OW0vbMGoLXdbG
	13+mDHAK8v1mtVPmXl+t14VWQDt0FzIPxTp/s4b8U5IIbjIMeEWHrOC40kvaBWgMm3yE0R5Q9Tr
	LC8rLdm+cfZn6o8+PLcBs7QjqJEF46rKerPjFJWuHBrhVSGUGksLuPmFReE2gvEwbin4=
X-Gm-Gg: AZFdTZfNbd2eMLKplDAdauqDZ+3QcUBOcL7x92HulVTixRmltQ5xbnHCpaBF4JGQeUa
	sDqqbHkX/7Ozb5Za7K4NtrgHs9fYmhyOtxCFFPemxkIviGW29UTpCaLNhFODKLl9zcXI63S3My/
	UuSIasXzxcEVMYuEqwecz34Fj+tGzUXINx7cEq5wNRFyRRss+539tY4rH48xZ9DBGc3/5dKjZFM
	JZsAcEQj2DgmB/9RufwRXWQstYjtLCwc4NHW2t+EAEyFWZjUfNdI8H6+sruzIjcvODPJMCDmid3
	MrYmWn+j5TED4sY0/2LGDl5AH0lxeIKwNHcm8s5LyFo2RpFxi8Ap+THov7rEUWoTn7SbJn3skv6
	/ebNVGM0tEx6j9pp3NqJz6usSjd5MOLsrYXFVImbbLMRoKDBNJa1CBQ==
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id 98e67ed59e1d1-3b41c9b9dc1mr14552657a91.61.1795536344440;
        Tue, 24 Nov 2026 08:05:44 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id 98e67ed59e1d1-3b41c9b9dc1mr14552613a91.61.1795536343930;
        Tue, 24 Nov 2026 08:05:43 -0800 (PST)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm23275610a91.11.2026.11.24.08.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 08:05:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 00:05:28 +0800
Message-Id: <DN3KIA4URDQ5.2MNEHHDE6WLAJ@oss.qualcomm.com>
Cc: "Atish Patra" <atish.patra@linux.dev>, "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
        <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <majiuyue@bosc.ac.cn>, <anzoso@outlook.com>,
        "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: KVM: Flush VS-stage TLB before reusing a host
 CPU
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "BillXiang" <xiangwencheng@lanxincomputing.com>,
        "guoyaxing"
 <guoyaxing@bosc.ac.cn>,
        "Anup Patel" <anup@brainfault.org>
X-Mailer: aerc 0.22.0.r49.g9313f0f0
References: <20260817102447.40259-1-guoyaxing@bosc.ac.cn>
 <CAAhSdy2qwdHE7SB2gRK3_PQ6m_bMSfWpvcuSG-31W2yd3-UTKg@mail.gmail.com>
 <285419e5-c4fc-4c75-a765-436165bdc8b9@bosc.ac.cn>
 <CAAhSdy1Q7a+54qn0xNBQBd1eV2ve+Nzqz9uRsWrGSmTn35z8=A@mail.gmail.com>
 <c050c85c-482a-4351-b627-ac074f7f7952@bosc.ac.cn>
 <bddcd13b-b97d-4c24-8f08-e0a239065e68@lanxincomputing.com>
In-Reply-To: <bddcd13b-b97d-4c24-8f08-e0a239065e68@lanxincomputing.com>
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05b5d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=4BKX8IsyAAAA:8 a=EUspDBNiAAAA:8
 a=M4cLWJfQvEUUaw9dnqQA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=bflBWynC2lygM3eL1Mvi:22
X-Proofpoint-GUID: ZI0WQ8tBxnxfekLEneZ0EzeaO1QBvJcA
X-Proofpoint-ORIG-GUID: ZI0WQ8tBxnxfekLEneZ0EzeaO1QBvJcA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfXyReG/PfImXGN
 qRYRHIEzAY31LmHgO0c5yGJ3GG41C34om9CQ0dWRPBDRU5rvS52UbRBFAzpW/ea8SeMn4isYgQa
 IOQ5CyOPhFmmBpIjg36BEavnEAFTkII=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfX2szwXC09MO8p
 3PxXipORS4gOz1jvuOUcQHPgxjiG9JdP7j8Zce6IU7EV2rk6b047+mEN4Gu76rKTaeSR8Ur9ZjE
 z3lvNpm+8Ppy+YgyNWYcpH9yxnu+FWhtl/wRjkkrs+/gfQi6wXpjwuhMXZSDjIFgg5FW2NkS2p4
 KM65Dc3sWsQV7NqnmlfAGpIK/HpSOz6EFbKQQZlCE8I/2MRX7ckCWBHxvvgHozxBghoMvsxETYT
 tDO4eIQhbkGgMEdQRiRRAyP8K6wfxk3LP9rSzxDKWUbu/2dBvpec2UuHmKNT1c9lv54AhVQKQHy
 gYlPh3kz125k+tMb6CIwP4gIdNeOKfHJCH5i+qhbjtCaJi7rvEfzU+VVcbzlCCV661m/wWQe8Sw
 LO1C6ZqxDahq8ow/7EiHUNZxQFqWFbbeoO70sU9uVGHTqSjHiwU/mc63189uSlO4f66HCocq5oe
 xhzjKvrfjTcrheCj3lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240063

On Wed Oct 21, 2026 at 5:32 PM CST, BillXiang wrote:
> On 10/10/2026 5:06 PM, guoyaxing wrote:
>>=20

[ ... ]

>> In other words, I am not sure this case is covered by a full guest TLB=
=20
>> flush to all VCPUs on the mapping update. Guest shootdown looks=20
>> mm_cpumask-based, and host pCPU migration of a vCPU does not by itself=
=20
>> add other vCPUs that never ran the mm into that mask.
>>=20
>> The earlier RFC note has a bit more detail on the flow we observed:
>> https://lore.kernel.org/kvm/0d15b098-b8f7-4080-9f33-=20
>> e8c49c2331e1@bosc.ac.cn/
>>=20
>> Please let me know if I misunderstood the intended invalidation path her=
e.
>>=20
>> Thanks,
>> Yaxing
>>=20
>
> Hi Yaxing,
>
> Thanks for your work. To help review and validate this patch, I am=20
> sharing the two programs below, which were generated with the help of an=
=20
> AI assistant. I reviewed the code and ran it on my test system: without=
=20
> this patch the reproducer triggers the stale VS-stage TLB entry, and=20
> with the patch applied it no longer does.
>

[ ... ]

> --- 8< --- end --- 8< ---
>
> Tested-by: BillXiang <xiangwencheng@lanxincomputing.com>
>

Thanks Bill.

I reproduced the same failure on SpacemiT K3 and V100, adapted from your
reproducer: the guest side drives the same four phases over the console
instead of TCP, so it also runs from an initramfs on a bare board.

  Platform      | Host kernel                | Iters | Hits
  --------------+----------------------------+-------+----------
  SpacemiT K3   | v7.4-rc1, unpatched        |  19   | 15
  SpacemiT K3   | v7.4-rc1 + fix             |  20   |  0
  SpacemiT v100 | Ubuntu 7.0.0-30, untouched |  42   | 36 (86%)

Code and notes:
https://github.com/Sutter099/llscripts/tree/main/work/vstlb-repro

Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>
