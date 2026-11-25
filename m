Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586817;
	b=P2Ok0uSAkfUthrkzaUStFEh3Rg5FFbAELOMTYvX+uRUswjyTohIq+xjy0F69AERXWOJy
	 EuClriEbeK1F3yLBbGdsjGUWP7Ajmyo289IyZLGR+soucXsyXh5XfY0j34iBG4KGXbTlB
	 nmkZJfjRuIdmLog5yFsRdZxdIhIdY4kluwZTP9kbDpCScwis3o6ZSjqs/yo0Km9G7quZT
	 brS9ubabZ09DTLmRe/1+K/wee39qnZA4Vp9AQoA8FlbbbnSuThs/JjUQLI9UTQfnTgWs9
	 gxc4/c7ZxEUxUkOuE4YyXhap0ln9g3yydiCR0y1JIT0/kl3XwTVPG19gQIagR20SxqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Cc:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S/j/fokvVKGClygxW4zKgxB1rxF0i22APYl8+ucIMeU=;
	b=BBA08dKlJ+DHEuTt3Wpzc3uk0jhpWUgAo+6ov9kQ1TBJNIgFlNW3MnRw8ijcuc/p4NAJ
	 Zg8nqKepN4NGlQWFmmFbRskmFIQO/MDN+AR0uThEL5wCrFU3gzNfnT/uKDLTAiOkwsMrM
	 stbuqZxYBQaWLyfzKYaZyNQgMAj2FCLvxYXQmVoUKNxCyfVzL5efI2Ce9EVly0vNRbbHY
	 oS9eothLK5bPj1qNBsroKG2m5GqPXBhM9v0XDiI/7XpZBEcGtbPue2VHyPOStYKJGeDsE
	 Nb7Mo9+rHYnwTJHbNL6iH83DBpY9HDAIyvQImGC3MXJVQbNcF9780lec31xtFW76LcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=el3yKmm8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e0sMkvGd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88174606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88174606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=el3yKmm8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e0sMkvGd
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2As9Z2109346
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/j/fokvVKGClygxW4zKgxB1rxF0i22APYl8+ucIMeU=; b=el3yKmm8H366C4vQ
	rbSTnJzefuOqwWPVz5gQaLQhXIKkLk3c0+5JKspHcJoYLuTCB/NBQbYvQn4+0/6t
	BSF1A0V1niV45qBCBmOu5K8Npg/MDQ8HPQavJnSLmDpAC3LGxJxlvni819Go97qI
	CKs2NXaiCaBKP1ux3ylCV4YsthF99ql6WvNoGlSp90abEyeJmA93ag1W4x3B2234
	u79gpEjnr+6kO+dafaCmTooT/Rn2BR8ldaM53ka+mGE/n0BlIyJ0G8G7WyGALF4x
	LNMDgnAnFStmRmjpH5Ts7SVBVShtt1IMkIB2MjR1f2+H6GndQW8x8sBUsqoNdV3e
	jLLmyg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydagq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:06:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0291cc0f2so67927195ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795586815; x=1796191615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/j/fokvVKGClygxW4zKgxB1rxF0i22APYl8+ucIMeU=;
        b=e0sMkvGdF62FIMQTPgeATiDrrJ76NDm+eBbg+4knWqnRzIlrm9L2aXr429xsroNTDK
         jhJcdhqYLVZR9OUYlI+3BQSl6xI6BlcTXKCSLrjHPE7xYtmAWfMNlOes5S41mdBJljIJ
         83LPwEK6Wgdh5dOGTpJLSWBv2SZpfkJ2hWr7WrWBtxD+J2ajFOmVPdPD9RT0Gj6rYgqf
         gN1U2juqhLxauMqBtHbRAPdcWAVbEFZukgFeK7PkJHRjPFo+ik6+oWODNjjMc4F6mF9T
         qYNtyePPbGoKZkwD+ocACFe9qhWzskWNpCGFf1xks0xvklmS+F99dK/eHv0ZkL+bBwtI
         qzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795586815; x=1796191615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/j/fokvVKGClygxW4zKgxB1rxF0i22APYl8+ucIMeU=;
        b=xZLjdwRcB7emQ9J/O2OhjpTzD/B+sLHPIuvUuLGGsc0hsW3PzZToMMPgnFCfykQPM1
         1pxsjHFXp2s5JP7EIG5V7AJ98t31SFbCZyjxr873C9w77qF5bR/+IRlkk07TzQB1pqIJ
         oCGIbQxFN8DGaxfYrlxgf5JI7bRlor2bBMplEU9yU4JAg2lD68ZW7cY/BDEGkH8rVe9G
         0BviBvuQGt31rvkngdKT3HmVC7zF/ki/kkZvXfIiMpR07/i4GEuclLFyqoS1/lxhJrSU
         tRSZL7Qn57JaIue9c1Tm+IAjn6zoA6SJLUEldBVGraDEwQDmwcRIgzj0mCeN6hIq28Lr
         7ZeQ==
X-Forwarded-Encrypted: i=1; AL+hErGJuWvyfw1s9onRJs/NXVsdREigMCySh3SAVa0a8EBIpmqj22brk87rI9dCGZVyo2WP119m2y78BAlY/z0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bRdqYjUo4KhnNSEAj1uGzZ/n7Vl2mOvOv/iwZ0FxA8wzq7KK6
	Lc0WzH7cmNYuGE9ZrKn4cAz7RiNpaTshFxWRYH7CsNh3hU7Lo935ENRxnhoYUl/oCwAkljPKEzF
	CtpBxMg5FS+Z29XHyYIFZf8QmtUim/fB7gV/tYXLYZU3snhGJhmLC49kmSFgxZ5CrBUk=
X-Gm-Gg: AZFdTZcRu1LUGOaaPgaE4iG20DJfx/F0LuHnDbYehEjDs4pB6XZuL4zH8rV54pjP55T
	d/rRkkwve4wzHoTKetuY6C+6axIZbvnB7LRLA5ZwYe0ye7ATBiuKeZ2sAQ342Q3JDdK50wDXzY9
	nXgzB4t+C6AIqFn0yEKQb15gP9jTR9oX3efUky4fPe7mFvUftwqS/UmsTAZ3/wDJQDTXcPbrIPS
	9hZUvyLDpjk5inBVRLGa9+9MM9YSxBbIUp5nU9KWxUxSsy70L4ffbqFO6PR7e2AxSSQdU2FG19l
	CmnHIg0/eGjMpdZhd6fBtAutpKt51wDkxt93Nhcw/DZUbbXtKdjoatc5RhtNzC1PorR7AgcflFS
	5FeiqlihQzXOi8J91ulu5Pw8SYH4OTMfQXSF4Bgv3mSCBZlj/bjglq6rB8dG7Vd04UhKQ6rmRsw
	d/0W6CxGIFReCPhdhgDh6CkNzPOsPJQdMNA6rmy7g562M=
X-Received: by 2002:a17:903:b4f:b0:2ed:3c61:bb83 with SMTP id d9443c01a7336-2f03f1cee2amr178125295ad.16.1795586814825;
        Tue, 24 Nov 2026 22:06:54 -0800 (PST)
X-Received: by 2002:a17:903:b4f:b0:2ed:3c61:bb83 with SMTP id d9443c01a7336-2f03f1cee2amr178124855ad.16.1795586814357;
        Tue, 24 Nov 2026 22:06:54 -0800 (PST)
Received: from [10.249.29.132] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c6e50sm79782845ad.13.2026.11.24.22.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 22:06:53 -0800 (PST)
Message-ID: <3d04aa51-7301-4d8b-93d4-1a7d28e6c614@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:06:47 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 0/3] media: qcom: iris: Fix IRQ synchronization during
 power-off
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyMyBTYWx0ZWRfXx7xLvveCyIg8
 fa6Vp8tDCxoV+NQLvvqXX/3+FkH+kRAvYXtlZAyxgrl73JKFw7M9ZGH7LcRQZADRJofQJJQcmba
 TJdAnTC7YDjq32qDqT3Zf3Sr2HESiYE=
X-Proofpoint-ORIG-GUID: 1wdcvw4yzKC9npd9AgluUnUCsqauZm93
X-Proofpoint-GUID: 1wdcvw4yzKC9npd9AgluUnUCsqauZm93
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b067aff cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=F58wanNFIcC05fkyUe0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyMyBTYWx0ZWRfXx5eqBCEgzK0V
 Caab6Rty66WgQP9nJ6xXPZZY6iSpGD05qHBLVcjJX23wmGicD1GNoC6xNDvSUI96Doe8NXU7S5s
 me1rwjvdhN2i8NvNHTSFJno4ZZhY1CjWAzEqciJNnbkDT54QGE+AI9GJCz9qHxUvQyB7fqkgqZj
 3zMw3Y/9Rt2OR82PwTJX8+p+WILAq7Ixfw4cVCW3KKAn+NGJHtk+KQtCtkB9dkUglrRH+f4c2OS
 MsfjS1eeuSDxW39rYSjiHaGFqh4IQIgsN3+EHe3bjH96boMcfMVgI6wr1wI/8as+f2mc7JKbeS0
 KpQQjIC1H3IZ49x9uGK918FiiXeayODEy64wMrZSnv5+Kj0mvOHty98m6bLUSptdAVcxSHiL/g4
 kUe9JhVo0zDC88EFb6Na3Y941c19m21/n/vqWac8yg3cOuOlrBzdqNdOjQxAV4BBUh0FauRlBOE
 7zJvSnTJ7drd+wGX9Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250023

On 2026/11/20 15:42, Vishnu Reddy wrote:
> Commit b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during
> power-off") changed the VPU power-off sequence to use disable_irq()
> instead of disable_irq_nosync(). This was intended to stop a queued
> threaded IRQ handler from accessing the hardware after power-off.
> 
> However, iris_vpu_power_off() is called with core->lock held, and the
> threaded IRQ handler (iris_hfi_isr_handler()) takes this same lock. If
> the handler is queued when power-off begins, disable_irq() blocks
> waiting for the handler, while the handler blocks waiting for
> core->lock. This results in a deadlock.
> 
> This series reverts the commit that introduced the deadlock and fixes
> the IRQ handling around power-off. It keeps the IRQ disable depth
> balanced across power-off and power-on, and makes sure a handler queued
> around power-off does not access the registers of powered-off hardware.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v3:
> - Used IRQF_ONESHOT and dropped the manual IRQ disable/enable (Bryan)
> - Avoided the irq_disabling flag, waitqueue and unlock of core->lock during power-off
> - Skipped the register access once the hardware is powered off
> - Link to v2: https://patch.msgid.link/20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com
> 
> Changes in v2:
> - Added new patch to handle the irq depth
> - Link to v1: https://patch.msgid.link/20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com
> 
> ---
> Vishnu Reddy (3):
>        Revert "media: qcom: iris: use disable_irq() during power-off"
>        media: qcom: iris: Fix IRQ disable depth imbalance on watchdog interrupt
>        media: qcom: iris: Skip register access in IRQ handler after power-off
> 
>   drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
>   drivers/media/platform/qcom/iris/iris_hfi_common.c | 20 ++++++++++----------
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 -
>   drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++--
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  9 +++++++--
>   5 files changed, 24 insertions(+), 15 deletions(-)
> ---
> base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
> change-id: 20261004-fix-disable-irq-safely-15b2f712800b
> 
> Best regards,
> --
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

-- 
Best Regards,
Wangao

