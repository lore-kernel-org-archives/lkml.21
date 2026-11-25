Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625478;
	b=10PR+0XKt5OtAoCeMlIB2AmcfxHnlz5aIRqkJGus2tkMOrUtFUGCjN/Hlb4qXaPS7Pa0
	 BIKiuDxT5Jrbw2AD3LPul2oMtKfMWY1J9H4wr80g+KhosQcHJEy2gxZSBpwJATe2eGBLs
	 MKtB2ej07YM/q0TPHXc22XH4KGLhakwJICM4JHPoiOSLQ2S7/Ll/6DJX+LcHvbMW28XL2
	 HDxmbQ1vXDJjZQwZN6lW7tHGJ/TP1JcIGnyXnyQzrUKGupJl+7EotZqw2jxFsH89cDCUO
	 TKa2DYWj6yoJ4cHIFOWTIi10Ys/h26Uxh5gH0BECTlNhlK2Vy+oYGXr0aEGRZR2aqxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FxhZu4tjMNL8HO5R7YNd87cuSZ/6nrHHIXT9pj3D72k=;
	b=KyStYB5qBJb8buPU2NkhLKraECj4z6CipO0fBPchGNRKev3HlrdfX1tO/sccY/YKSz3j
	 soyy9EUxAemZzugtD+3WYubXYbKw8joqEn6lXrPhsO+pkab4WJHlv00MwsUDwHZlIObn1
	 5TSWI9evqqHGgm3nwUg2D9jEvwM4e5t7Wvu0SPYJI1ejkY6yTCyl+ZZs5RIHf0yY+5Dgz
	 WLq/HeLR1+kvHptPOyS1s2JURwYDTcMJsYsruoL/7c8PH+uk+ePcjndVR/PRvCAKR9bYC
	 vOdO65xoMkJcfEntPbIVR1GrLOMJBgIlpOllPnerK5TdqL+YTsTxaNa8hRfUsGjpZwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aci266Nc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ihPHR2jD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5155C606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5155C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aci266Nc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ihPHR2jD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ7443998662
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FxhZu4tjMNL8HO5R7YNd87cuSZ/6nrHHIXT9pj3D72k=; b=aci266NcO9IYDL0H
	BQNF4F3NGya0s2kqOxtiwfJ5VCyiqQqNSlmBGyKdaKNfwjm4DTxBn7zpw9vnxO94
	Hneekdz2dm50SHEC63I11aGC86CLZgKcbTVbobCW7AyB4bm9XDyru47RctUMI5so
	+hRq2XNzMVKxEGTKJsiTgoyBNCSia/oOeRz2cj6GDFjhJ/W5JXSPhCV+j3J8qMbu
	YFdYqhiFkHxy/y23AC7jObddBO5MHdP0xWfuH4hFn4VwYvE+SJYmucEDNDj5Cjw3
	l68UIJ71xaMA2ZvAItl5Oxb62WeFTq5l0dCDvFoPX4m/WMhUyr9nohK5GEshIJR+
	vhjgrA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aegb5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:51:17 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaad8219b0so2001545e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795625476; x=1796230276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxhZu4tjMNL8HO5R7YNd87cuSZ/6nrHHIXT9pj3D72k=;
        b=ihPHR2jDRZ4jpMdcD/anMXwBkMZyW6/1dF1MsNe0lnxSYzfoiuRvPKa3vN0pXZXfH0
         1ju6+h7dmy+504/f3h2sPd3W/NxXzq1O/UpwLgHPGDCbhYpmYJqwicHNDDTEHeduHzL+
         Oyi5I8fZwJAP+/S8PXy3+wo5bxcy2f1clSpR2RsKbz0Ca8RYWYUWlvAfGvUOCV4PpUpw
         7eWlel9Q46v61v4tDR3kPjHUSFPDy7MZRZXq96QD4rCOWUv+mIHLhpyG7Uw7LZWz8Ay4
         MOqO9KY1g2rLicdUBtNmB88tHBIAbPUg8Pbm2vrtv73Xgpd/uBZh1p/LzcthlKxtj4QM
         qbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625476; x=1796230276;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxhZu4tjMNL8HO5R7YNd87cuSZ/6nrHHIXT9pj3D72k=;
        b=T9OIGa6cAhqq4g5w8IsBi7mAuUPumVNb6LUiPrN0ygaLJCPEKP0TkSRXjCUz6emNhz
         TTfLxroxbNuMKs+bqdAS5rsoJ3nhtYs9PJMERlUc2xVnpwxQE48zE53Zzq04XnnIHHBZ
         lnGoWqq7c9HimFHV7ItR7n83BS1uVsVncBQpFD0RAdb13oaT3azQe8qqzjI+bpTf+nsp
         A0ipMS9hgrmpsyCCd+dz/wAVeahA0kEUM4loJ5Q9oE62/oKyoYat52HfYTLJSXqphsuP
         TTRIlk5elx8ieE3Amdh50YaW1p3euoylyZgJCXmDP9q/nOwKI5v8syjsN2KWQHUX4em7
         xaHA==
X-Gm-Message-State: APuU4Z+sKSJuk7WTyqfnbz8vujoMO0lbI55GsvsEBXPK5LHJeDR7GHTu
	XIBl9VMyL6MdfWwvMaNTXXnbFeplNbESSOdxlqM8/KwTGUUZJIDdM2bC5iWLX8xfjOc6P+oLUFF
	DGdSJ836ls9UHB2Sq1FLj2XSNt05vuMFPucOjSoSOKDsQ1w7JHAG7uEEAMhwaj3J3uC0=
X-Gm-Gg: AZFdTZdk/TeB8FCgZS+Tr+EMiDJGXLMC5u5EWomKZtgoC9fqF+Y7Nb2grdUVEjX/n3s
	gsc0Q8okJHEZPkDMopOJskmSY/2YVOHnUYbwMOzZl3ZTpcoQWFkq6pW+9tbPTHBf2xPcP9Oy4Wc
	5gkf/kWs2Wy0OlsUyGQAjjUBlReAv7QNV5bEZDJEQ4hbNhvXPj2ZeTS2RacsY+rOJFTVem6nfUb
	6mLNKRVHKaKe59ITULcNfgo4e46Qdqc+Bycv9hn+RHgISLU8xdXGsY5isDeGFvEmls7S1ExAiMo
	cwqwrGG+zXoUBjM6PR5uFgbJZPwQNCpItn2JuTRkQ+o4RG80XtMKM+jc67hh7H+/exINoWmOPzB
	RM/gBf6NtghjacFPFJg22/qfMp3kSOqryEC9bG0cKmxM/EIlxnxA4agq52V6tiwM7UJhgnY+GeH
	Flp7HnYDozFc6ezEqaeAQMXbH9SSyxqL5BWRk=
X-Received: by 2002:a05:6122:6286:b0:5e9:5e79:ab3 with SMTP id 71dfb90a1353d-5ee8af6ff11mr10400381e0c.21.1795625476360;
        Wed, 25 Nov 2026 08:51:16 -0800 (PST)
X-Received: by 2002:a05:6122:6286:b0:5e9:5e79:ab3 with SMTP id 71dfb90a1353d-5ee8af6ff11mr10400349e0c.21.1795625475813;
        Wed, 25 Nov 2026 08:51:15 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:ae4e:e70c:bc04:68c3? ([2a05:6e02:1041:c10:ae4e:e70c:bc04:68c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm517242145e9.15.2026.11.25.08.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 08:51:15 -0800 (PST)
Message-ID: <1732de8a-6a55-492c-8b26-dd81f3f4dbe5@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:51:14 +0100
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
Subject: Re: [PATCH RESEND] clocksource/timer-riscv: use
 riscv_has_extension_likely
To: Jisheng Zhang <jszhang@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20261107134952.17873-1-jszhang@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261107134952.17873-1-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2NyBTYWx0ZWRfXxkcBeJmoPWq9
 SDa8loi1vZJlG8Q0W+8o5TKlJVabykgqeaVibKdvrf0ISYFDgTJ05fFs9BnWVJUQQ6dqFJhfxZF
 n5qudUZkm33UYBi7vgpdveBXzS/4vAdxuG9r1w0b9EodTwd6MWmt17sHuNH1auV6LKsd59W1KKJ
 VmQ68/NbBDI3/h2F3S85JPN62yljizt89oqNXBHKdRQ77Bmr/s8s47K8Ddua1g0gKp5wr5B7i9Q
 K4ejKND8Vw3Mlfh0HDg8VX5mho4YKBZCiVNTp8R1leLgfb46gbRoeg/H/ExQFJoFQRx3SKGyK1Q
 cms7XIhYzCYnkJK5L5sMGzNkBx17rnazVmbpMDeLsXwkYirTwnP3Qy2sdFSFgMs0Znxf8RBVDrE
 SrkTXEjYbI3IPWQwl3g3+U7rffx75ylnQsR2mNGcn0T/cJ5AeTX52OKEID1s/X+2+wXTzHmPava
 cHLC5zaIIowgt/iTAnA==
X-Proofpoint-GUID: mX2kjS2mZNhYrspKuueXg6uygxvGPljk
X-Proofpoint-ORIG-GUID: mX2kjS2mZNhYrspKuueXg6uygxvGPljk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2NyBTYWx0ZWRfX5DpfkqrCivcP
 2/Wq1ZRrtjTLUWzREa5u95PE4vfVe3BbRUQcCiDllSmoFbF2FThQcyjx6erTW8ZdjU9950akqwP
 vrgULALtvQmHIw/S5mrBH00VcdVFVW8=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b071205 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=inWZCpT9pWDABBVAoXcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250067

On 11/7/26 14:49, Jisheng Zhang wrote:
> Instead of static branch, use riscv_has_extension_likely() to check
> whether SSTC is supported or not. For one thing, this is straight
> forward, no need to add and enable/disable a static branch during
> probe; For another, riscv_has_extension_likely() is based on
> alternative mechanism, it avoid some downsides of static branch, for
> example static branch's metadata in the __jump_table section, which is
> not discarded after ISA extensions are finalized, wastes some space.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Still waiting for maintainers' blessing ...
