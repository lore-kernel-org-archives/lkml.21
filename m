Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489810;
	b=md8/qQU3UI+Yk67VOeYTxTuFU9rdxGB8rwXiz/RscBb1hQsJochGZuPfzC4Q3fsKvDoz
	 67mremF0bBUnT8sPGxaD2XaBjBYf1ASF5PkjiFVF8mk/4tbkL+bO0Cq4kRSrHIbd9cLni
	 yqt4bDhACiBih2yxJgIybr1wG6xXrixOnrayGwQoASyl+ldiBGmFHUyaUTLFsgOrlFjOC
	 h1Zxy28t7qNf6m+Y/leILl61b87OtZKe65FnZcl3diDfX1RyXIiiBdMYODPPZgYskTyEe
	 0HVK1wpAm8tywFs1BQLesP6Cx8c2SpdwcuQYm0w4iVag9VmUhigvC4fsqzwMPxyEq6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0SW+r6INMyfKAJrCWPlacgZ/AfP72UDcjJhb3l6CPuE=;
	b=zoBLI6/N+ilPWnw5jqEvKcQv2UTiT4tYtWKlHD05UkANXML/X/w1VmH2Zaq5c5EVBpMh
	 zAkpZzfH+ewCevXS2BSS+j24/48jOnGG2MBQrVXJ1Bu6cts0crohS39/DDokcUO0Wh9fH
	 rovKZ4lctwQYw16/i+jila2Gz2dXemlplzkFVlBeUksr459JzqoluxIupsPo1eCzulNZx
	 +iybx9xBjVfuLCNsr4ebmAM0/PdYhTBS7L73eEXyVJ0LQwusUjPOdeKR7GLnsPGHdrU6y
	 Oyb/sn1Ww0WuX38Z8kM0xbu4kQuJTnsJ4sHh4MTG2kxYnYW60sKoQ+ePUqdMEbxpRsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SgA7F8vZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxha15Ko;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE7F606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE7F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SgA7F8vZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxha15Ko
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k62M901973
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SW+r6INMyfKAJrCWPlacgZ/AfP72UDcjJhb3l6CPuE=; b=SgA7F8vZYCl2eqhk
	Scqa9m7Y0kpz3s40wNs+bogYGfHThXyha2bNQyEtkVMHWn/0n/DTLJsdWVdAY4Bo
	Rq/WqAamOTw8+2Vq1eS9ARL7XXIsfEiIGk2o0eMQ1mGDqca70DLOtO8s/4Q/oAft
	48RYZyyTprsBFNKz6euynZEp66X7iOAuYnHO+V9CW8dAVoUrbYZtZwqMy1jycfLh
	Y/W7Ar3N2uGbJYPCFifapmjIiBeLdqLOXbz0w+gm0r0MGC01mUPPSlpKN6yqm6OV
	hf50Zb4DRqOBCLKvgL0qMcvqutPcA/AsMi1H56yrWUOQB5Ztv28A/HR137/tfH2c
	k9kCHQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6ss2bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:10:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so4453750eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795489808; x=1796094608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SW+r6INMyfKAJrCWPlacgZ/AfP72UDcjJhb3l6CPuE=;
        b=bxha15KovaW9h5pv4at8q6iqDyGmb3/N5WC7A20k8Z127RD7v5VGaLgApvhPV/U+M5
         bKadqMvSffGSWSz/psegRwkEK9R5mosT5DS0mXv19A5eAOsjJcHvgAb/QOK/XLxwANAg
         z/Qg9d69Fg46JuHmkCp2JMFrNpmnh+dnKq0sYOCt/gpu4sUKRRGyqzspUcr5VuoYRCRF
         8KQ2HFJo+ZKmtl6wmyjSh0Zh/R6bY3nlzfcAwfwcuAsJJhRd5hcGV4E9qfiW5IYktnK9
         wjevLybuEUK1mTvQ8tcLoJ50MmA6we9PJIzUzRnX34+VSwrmechCFpVmm3M6hm5MzkPE
         p1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489808; x=1796094608;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SW+r6INMyfKAJrCWPlacgZ/AfP72UDcjJhb3l6CPuE=;
        b=BglHh60SdUwN4sfyPcREOAgS3QrIYzbl7+vj2sOjXRZ73v+0THBRr8E2JCJs9lfvJT
         2cl4ZLedLdTDy80Qde2VMXAvY9VlpLY2BqwzuemTFY4kpI4i8DzWmZT4GbV6OqzxiIJ9
         /B4mNDE7p9fQHy8ySs7LhJa/uN+Nlya+XQQCn0E5diiTHd5RudgQmEqPHLA9aqgXlLwm
         3O3ffXkUq1YycWaRG1HBiqumIkgayyhOUXaRPCD6+MyAP1nUqb3eQQgkDKyCN6Bz7Jp2
         nXDCK31WxKUhzPN3Na+o1pI26jWHjrlty9Wl747IUSGU/ighj/AGpNQSS6LYb9D8JCpx
         bd8A==
X-Forwarded-Encrypted: i=1; AL+hErHM8PGV1cSuRLd5qMFF6juNzsVS15Nk3Vb42+fVIbPW9/SdaMz3xmNRQovUDPEdqZKidAa/OZVBz3cqObg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SOMwcHiBfhevTnCaUv/+WNj9SRYlmnsC5XcBVpP8xfdqxM0JS
	mbHybGA2XYWZtBmQrLCqIsyAUd9AP4ZlPANXqwEMUlwpRrdOOcIKgoIu0YIkb4i/T0bnK9eaOvI
	SP/6MA4X0+tIIUaweJ4olqpg+kahFiyVZ+DVF1jBbTOq6T/BWIAul0Yx02THAsq7DINQ=
X-Gm-Gg: AZFdTZe9X5zWuAebUUlMsi/hwLt5eF03Fh8nKKRtfNCSc8eHn5coUq3HthfHA7ZxkxA
	fT+VIfOMMH+2+6axsljNSHQ91/+vSfsvaqdfEn6NsphrTPqUZF7Pi63SlMR8MgqaYiYLdnWW4pn
	Mzy2RAga9v7GuaAy1PPL4UPAQiB4yiNlrmYXCcui1DtwTsKPe5XY2RT6cJDdcgQyo5pyQPpRlAr
	+KFE5Hl48ANOnalfqBWzQqo8kqfM7TrQwaT3UgR723ku3B888ScqR2+D3Zz/znX1i0V8uLi6Gu0
	NjxSo+UrtQjNlrnUQgiYH8JagDAUFhTH296NQca9vGWjaKcyb76xKOAXC/2i3Nvag6paBmLdxsZ
	dOeynTNdqBlwgOMB5zhNIj4UI2+Nms+B7rpGmzgll5tpA876APZ8fSqiDrxMFOqwCPFAVEixMAw
	rOwIJ5vA==
X-Received: by 2002:a05:7300:a228:b0:386:6685:1492 with SMTP id 5a478bee46e88-386668523cfmr12340351eec.12.1795489808097;
        Mon, 23 Nov 2026 19:10:08 -0800 (PST)
X-Received: by 2002:a05:7300:a228:b0:386:6685:1492 with SMTP id 5a478bee46e88-386668523cfmr12340327eec.12.1795489807624;
        Mon, 23 Nov 2026 19:10:07 -0800 (PST)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm36076974eec.2.2026.11.23.19.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:10:06 -0800 (PST)
Message-ID: <bdddf7b3-76d0-a8e5-2c9a-c23953e6b97d@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 08:40:00 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] media: iris: Skip redundant decoder input config
 params
Content-Language: en-US
To: bod@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
 <20261031-fix_dec_seek-v1-1-cfedf0c267ee@oss.qualcomm.com>
 <179492375803.2846709.17266637550647614190.b4-reply@b4>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <179492375803.2846709.17266637550647614190.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dPubYRkR82gfO8dzX7NFq6wR04EF_7lP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX63F6vujAqzWV
 kHcV58RmfLXO3VzPBM2ll6jLYm3K/txAVFwFkXxFXqGQ3PtKW6ncXuaS4W1Mnd4OgRjxfq78ZQ7
 QvWIBaeZ3HbGKRcPm2PB23YUQghQTqA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX8aQaVznbEwcd
 0gP/YZt14xQo/cS5c0HCK3VldZBy5nGkCvn0BUeTbBjo3gbLzCIcQ7mX6FKDyiCUxrFZQHZCUc3
 SglxVfDhHTPe4+Rz/hOnHweqcN7d3WDhaVV6xdqulHZH9ga+jEmwaFgcXl/zGlK3aAW4Ykil4AU
 PnDsWQi8H+PN6WLnocVsimMJFAgbvUxpiiPRBc1b1WHKZ1ORr/c8qE3g+3PDRn70QcYpnpphXkO
 LU4zKZtsfVzT7OWtkAE92AGJsbDRH8kuMRzQotpoxzb/RybS/B3SpqFoUH/4fIpfuC7FaywhOn3
 wXJqZ7XCAuZLTu5H24TUC+1hlYUw8/ZwWrOZQFkkaAKoZg79Uxp50Bf8YYqO+RnLfJVbl2IieRS
 f7yMZlZskiEzzbMDNnAgQ9LHIDGDnufbrIkN0DcszImkx8lvJA+8f+Q5h+HQ2c52mxX4OqtRmFz
 StbJ8yJ0Qi8cA3Q7jBg==
X-Proofpoint-ORIG-GUID: dPubYRkR82gfO8dzX7NFq6wR04EF_7lP
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b050010 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=RZcGvm1UZh7VgU8MZDwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240011


On 11/17/2026 7:25 PM, bod@kernel.org wrote:
> On 2026-10-31 01:49 +0530, Vishnu Reddy wrote:
>> The decoder input configuration parameters are sent to the firmware every
>> time the output plane is streamed on. This includes streamon after a seek.
>> Resending these parameters generates a port settings change (PSC) event
>> even when the input configuration has not changed. The client then
>> receives a redundant resolution change notification on every seek. A seek
>> hang was observed when redundant PSC events were generated for the same
>> configuration.
> Its not clear reading the git log here where that hang occurs. Userspace,
> kernel, firmware ? I think you should specify that.

Ack, the hang is in userspace. Will update the commit description.

> ---
> bod
>
>
