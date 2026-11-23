Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447598;
	b=CScDRajfQMGnYLOJZIusUAy5Y/LqgeyXu1g+UQg2fkfUDxV6VZ9FWt49fVXvte+JGNWX
	 Y3G6WFYdrQ6AqW+0wGJ71SvDZJhN6Lic9a6RyqeE6f/XwvbjO5QiBKMW2P3Tfbi190jsY
	 bKwjRUopdrwni7U+StoKfdt+EtFuFu+3FMg8GdZsp1lv+IK+71NtAkzbzdxhAVKujLIA6
	 4Xr9wqTbY38jNGa0/P0KJEDVA1OXSfoNuHDqth9vFxaswnb6JxwVxFWosBy9tKkIU3+DE
	 ivBnHbQlcj/bqMo2/0jIZuZ8hkJdUqdetW6xuGV4dh5lxZfTojlbUcUlnyOpotlBa/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447598;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WuUxIXOTitidaH3hOzfbjH0n5miOrk3cJGjFf9YeLq4=;
	b=wfpxD680sYnz7mLLfSvQn5yL3qPdocThbTARuYKMY6qq7w6dXneQQFfzexPD3OmEcUII
	 sZ3ZG06GPTVBB3Fo1eJ7ZaE/9fKdyToMaJdCVXissget/UW7Yfc7tgmIIEDBP0X0Zz0N/
	 C9p7WpHgNvuDjXDNguLv5J8N0odx5v1QOyombDtp66DZN1zmVpVKXyJvcL3RIZRgTq+Zw
	 RLsbB5AidefED7GbFz7y3uZk2jcACQBa9y/gziGfIMO2qkln/1GDyHzRcRTYYqVJYMsV9
	 5NYgFIAg8wmp3x/nTuPq0xYdI6t8VxIuU3jaPiwep7RVw+t4qRcnkGnkLx/IoYK06cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dW4qkRhD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V28LrlRp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EDF606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0EDF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dW4qkRhD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V28LrlRp
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL2OC3072544
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WuUxIXOTitidaH3hOzfbjH0n5miOrk3cJGjFf9YeLq4=; b=dW4qkRhD6imxWpO8
	u5HFt+cbJ2A5mj1c1Ds7HXJFBiwHhG8/isQUmEVOmN7Q5yCgvPESuKphzSseuY4X
	F9YEIBVBT1rILBMztZWXjiPF+1SnhEwm5opt4/mrlJNr0M6zeY/dB36oxtnRyUoM
	tDMuRHv5ZaVAwy8If3ybdWC85Fbh0ZVD+q6ZeC2t2NuTIqYUGrLY3sdwXP2lBrbd
	Z9w4j5qU5t1595g8SPztX96GWeNFLLPFKdg3McdjKgraKLdhZahNnueNV0togGOP
	KfoZa9K1/Q+EdN7BO+S9pKid3qQllXMCtbsoH4td8IOMjY46VyK6qcXYVJWcNfBV
	OubzFg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7speq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:26:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ee433ab272so94089e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447595; x=1796052395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WuUxIXOTitidaH3hOzfbjH0n5miOrk3cJGjFf9YeLq4=;
        b=V28LrlRpTMct+D7dJUYrxLp+GV9hljsC7Ycb/Y/2lV4SnqzeNTcg6agujnLiybBWd2
         +D2gBxOFCN9ED11KMHk9/0QY4nn3OBua/8nRzDMb8cTthUiriTMfVEQgK79ZZgaWycaF
         EMZUQSg7aeq21h7eeeQ7+NOfHYu/0otDFJhbd+hwdA8h0svBSqTZcRzy59mhDSGuT9E1
         Jm1b94HBwAJ8fzlA3rmRMDUCePcBI+diNUgg0Y5VQrTk9I4RjtnjhLA2H5hkyQ5I9stT
         sHDgK2RCEAVtVFQaMEkWU1vLzbFGL6wJiOueervUx8+sjMwq2qWApiEjtQ0w34UcgFSV
         PW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447595; x=1796052395;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuUxIXOTitidaH3hOzfbjH0n5miOrk3cJGjFf9YeLq4=;
        b=JtXTmDek08HMQ520eYvqVlRUHRrVJmqDFPb4v0UOHuhsMXt+wHZ8r1sTa4e72BRQx0
         rOQ5/2s5qTK9WlqVmFa9m5yhRDP5Ab+TnZ1j1cpjolS+w2TNpqJdp2w/hLpgeQe7yLJs
         7WiGg8q9TjA649kEaKFwH7MgvI6ckfA4ED3KTkR1pU3CaRVdFLHd8+GPPk4DU6ZyYgTZ
         /og9ELdjB56rvq+APxhTtedD9ycK5wBS7V29dsfbOSud4qpIIzlkNDcm6+hLWMJ8wIdr
         Q8weQTblqPOqDNgMtFSg/fzZQ65fOy+NC+CPxjn7D5vK7oHSpy+3g1RIANT0W2gGruJV
         Gklw==
X-Forwarded-Encrypted: i=1; AL+hErHTGed7xHMDs1XMa78q5lzLMGeopAIz9uBN+XbFlbuF4P87iXTSSxP3n16JixsGHHonbSZV6BEDk5BUcCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gYit17Cnh0jjFarYBRVtJKciAMhj5/bXTny/NjFrCKQpQlmuo
	zb8M2pC7IqUwMyd3N1lIsubjsUVYq7mXWovxkeXdCaMREnqPAfslfY5L41CkSo1VPhqGQYyVKTJ
	rVg4vYIFHvXLes5qRuzwN/cHObf4AcQz88P6fbGvJti/cD5ykWZ3jzA7C4qezoCI0sfQ=
X-Gm-Gg: AZFdTZfA52fztZYMqVIlALMqqOZRin9Mi+Crqwl4EYp91txwZzXAU3rArPKXEjS4zTC
	ZpFnv6U1QzHDbYP5/yQklmd4zl6G1kDilBppW6QdcMLgHBN5olWoGCQJ/eOdUjAs9TALkkdb+4X
	RWT0BENokpCsdIydiJKMwPMT04iG9LTBugFauWGUtyt9zSikkzjFNQV6WlwCm8akUs+srrdRjRI
	IBdr7JhdBGhS8I7aSQOI9LZewTfpl7JcT68MjJeXu/kxIXd5Kn/wA3LjzLPgV4KsWGNQhVXrRaX
	B/YfjIM/z/hqljezN3UeV1eFEjrJj3ORMqTJgRVUj4UC03qb/HQKbKPTDaEX+2/ClqrSCyDktJ+
	68CsgOVFJo5ZUX3AyZW5P6L6lHsmf6CZ0Off7XJ1UD6TgxhWHpGOYJbpuJvJWYvlMP3+5O9M=
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr7291731e0c.4.1795447595301;
        Mon, 23 Nov 2026 07:26:35 -0800 (PST)
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr7291684e0c.4.1795447594833;
        Mon, 23 Nov 2026 07:26:34 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe25asm420926666b.11.2026.11.23.07.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:26:34 -0800 (PST)
Message-ID: <8560f4a8-41e4-4f78-bd0f-3aabe731b79a@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:26:32 +0100
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
Subject: Re: [PATCH] iommu/qcom: Disable clocks if restoring the secure config
 fails
To: shyckless@gmail.com, joro@8bytes.org, will@kernel.org,
        robin.clark@oss.qualcomm.com
Cc: iommu@lists.linux.dev, robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261122-qcom-iommu-v1-1-ecb20a28871f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-qcom-iommu-v1-1-ecb20a28871f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b045b2c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_2H1bLmklXDtjbdw0hQA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX1t8PxOGf5vyi
 J4SP5f/IyYGG/628/dhxA9gMn48ex+VOqikSZxP+2xqSfaSBSDLggP79GskIBdKAKreu9a13PJB
 IvAClC4KofDDJSDjfOgrAe+TAtOg5RCTAGk9NnN8dx53pU0dwkzcBUwh3OpVlYro/ZOE44w4xpg
 nLTwta8SQE4/4BjiGRfG5AKr6fq8CslKHGnflWYdKX4e6j/7dC0iP1k5/io7MjbOSedMfU4hgG/
 Di8a3j4/03UhoudmL59A4ZwGzwwQJxQwBojgTId+oud1JBOsVfbcANRxthpGwCnE72hbXRjFcfw
 lKj/MOaJfu1NxbiuN2mYFZVjW62bpGF9RFn++DPop4NOBTmBflOj5BavcHW4w1elfTTQI6y9Lfg
 kcjGyocttEnSvRjQKUttEJzTEz/yaok0SzcVNkZ/nwU9mkaM59ER3sNyzdhgnfqT1XzZt/ACZAK
 p+aB/hqbkbzHISlwjIw==
X-Proofpoint-GUID: BfmAwJB7YkM5kn53F1S4wC8oPwIRmQjm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX+2FUc0/DuaCb
 GaiJ6+ffFQ24BTOVGLguMgDU1qfacGH36y71e5WSqbsQCj6s47TJ+eJfod7X6m++s0pyghXmQjW
 +5RDiOyLUfTFVTl1j7gVbP0E+4gO3WU=
X-Proofpoint-ORIG-GUID: BfmAwJB7YkM5kn53F1S4wC8oPwIRmQjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/22/26 11:11 AM, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> qcom_iommu_resume() enables the clocks and then, for an IOMMU with a
> power domain, calls qcom_scm_restore_sec_cfg(). If that call fails, the
> error is returned but the clocks stay enabled. The PM core then treats
> the device as still suspended, so qcom_iommu_suspend() will not run to
> turn them off.
> 
> Disable the clocks again when qcom_scm_restore_sec_cfg() fails.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 268dd4edb748 ("iommu/qcom: restore IOMMU state if needed")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> ---
> Compile tested on arm64 (W=1). I don't have the hardware.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
