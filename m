Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964037;
	b=llT9FY+gSEjO4Ti+/71YywBcSnKbws2ZGg+4r/IhkUykh+2MXuVpbELQx0Urlt5F6i9F
	 v9qz9YnhbrRdYMdTDYvtDX3I26ULMqS+Amavrt+3J3dBztXwrM4N0yGpZd8NW0lcqRHYY
	 2Sviwdi+S4xtpu/fEO4xQptL3ZsmQHLO9cbsslmj7SKbhVTx0Nhyt2/U3M9gairbG2iFw
	 ZqBUokzyRgpU/XExS9VvRdXlwwCwN+TMOUC2NTnhAyBWqJoOTFfExbUkjSuTGsMAKgXsY
	 uBhbbQuFxVDoWXwXLgDnWC6sFxHoE11GNp4oEgmGhZWrSqj2PkPhWMzo51VHKyPMCSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964037;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=;
	b=5inp+E/VY1gzl8UzsdhKtF3LDMMbm7DU9ZLbbqbr0z1ILa0fyEi1GIhXQ5BWsuzmrDdF
	 xrkBxka7mmMvPapiI7DMNbyi/DwlxGsNXa+0L2yYYoFOiOnKgRNCclHBXoiD2r9zm6gui
	 5ddW2Gkz0CEmKR3Z4mjJ+awsISW5cnDRudtIhTNB1lWZz4eO/9arXSWY7LxVMycXkRt88
	 LQ/vxTArIHjL0QTxwaXh08K3DkYYg9a28OEMYjhQCJRuyVBXXWAtjEkbJIF/+U9uThHaY
	 /mPN3bhnVaHUgsS/aNbCGd0pQW4ZjEOW6O+bO19p/lNGXb1R0Eea7eXLrIXfokGfNnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0vFrXLK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SnMS6qEU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA974606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA974606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0vFrXLK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SnMS6qEU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI0PYwQ1715995
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=; b=E0vFrXLKHchFOKxN
	ecQsM1ZRtXi0Ym6SsPb7jY1o5WiKjJH3ZSYYHxZYRHFZ9OI+gjScKS8IUSOxjr9I
	CkRGyFvhUGTsghPY4aYuRNVbbD1wVcdHGTvsFGxwNLIkGrZ0bLc0qPZ4zgXUdTfN
	70LfnKL458QRMf27y/T8m4066XpVDnpSmMezQ6wm9EXdSqkodGPQeLRPtTuU7jDc
	8XQJHvsxD1i6T/bcMZ6xC+pXsA9BM/K1DuNW0G0iznp/wWbxbXLsYD1CIWClOcSP
	1l02aOG641oFsNWQf4zaniM9hf5SlhcMKGaq8QzwvMrJZ0sJlq6JVFNSmh5cnsYx
	o6BmTQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8gf31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:07:15 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso393972c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794964034; x=1795568834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=;
        b=SnMS6qEUIhsA1ZNPGX2d63ztD0osxhdZTzmcxrGI9jtu2ny83ZBbhlOGPqVAQkdo1C
         +f6PRT4xuyPIPQgNKKchJuV8aP3tsZ8nWfcVGpcs2WTeukTJp2Vv96YhqqLfSjMB/Gob
         eKHIwPJYt9ZTB5p184UG3b1o6N8AMohPRl8PNRJK1s8u9JTz7jnAGiZb39Ta43az5uLg
         7/0X3F8TXWkOIOs66So/KXrvI+ycTnKpwk3CV0kaG+kCstX3+nnGPOJej/3S5UTntmkZ
         bSGeiArNrtHDy/cZ6PgUZILWSxictyTlIGV/PC/yN+ZRs0bJLvAi7O9KEfRIwBFs4n6Z
         X7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794964034; x=1795568834;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=;
        b=fLoarhgChJcD97DzBDeooY8ACRF51bZOVgJZ59M44ZyXAFvN8I+LbzzTfAhDzs+nYx
         0duwdoQ+rFZJUkraap16iukV13Gj0ggK0fEahdjNBj+P4anqLcYRkE6xoGAX7a/0vbT9
         ssxIZeqSWIpDSZYDyQb4Fb4zvH2YrVK7Ps1efSCKIpSEZAJDPOPVYs+iYZYaBeMjrS6t
         WgRp3L/5Ea+/3W68LayRDK997DskktxAW5NENQHqGzNgUqbvNushh5fU35PqIDpkHbo7
         XwRnDB7vF3e8zgYl1PYfick9bK3Mwr3OFqcpDnmfNyf3sYLiTDDY+94PJRp1jkvZdI6X
         UagA==
X-Gm-Message-State: APuU4Z+yCYvw/oox3uymLCyUc9Wa8gGCWX6mwdqFNjf1HVZN0RXKgSw0
	UoUfvgbF1MzK44RMKAPdBUb8z+1SXL1znsej83v0dxzyDdfQFKQTENmsQmquQRgm60dNBeDj2xN
	CTRzE5V9+PnSMPSOdWbzX8cNrSWfoL5QT7JiyMVCl6ZNWNmG8rKAzwvlPQlQvOxTPfa8=
X-Gm-Gg: AYBFou05ub4jDVZYy2QwDL1ymKI2AIG9hdJpQFfeluMHhgd4ZWoNK6F4VXoparOqQLe
	iRLmqqhXrjsDTDRLNHksuoiDqyp8GyW+bOEYk0cdQ8NPj2XyTUTCvFoXwPsuguFukvG9u6VMQ4A
	cV39FwhFn+rn70B4f7kbMrJ8ZwrLarEH2+j+SVqotVEpveDct+OgOKUjeEfCvVwasTJCQu2ca9D
	Kd3cLj7/LLiNgwl8Kjvo8ao9zr4BAdLXg8WsNrCu8Q+fTcsZHbFLRKQwHbz0/SRFrJrZ8te7S5g
	po8xSGndprjFPPMkHeS7KQizNU08KAeQ0njggUD0V3xfvm9qNz5uUKJPVmzOqDfnkQV6yf2JO90
	9AlSKoXMTjlUcBWJy0DIkh9EMCH6yaQ4tqYaCUBxJ4/C904P94jR8FF8CmOgFjihFxvN+KGji9t
	ggPKeKSH0ZYsHI6p4f7mbV/ZtMCDY=
X-Received: by 2002:a05:701b:2901:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b543d0daf5mr1270267c88.23.1794964034459;
        Tue, 17 Nov 2026 17:07:14 -0800 (PST)
X-Received: by 2002:a05:701b:2901:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b543d0daf5mr1270241c88.23.1794964033945;
        Tue, 17 Nov 2026 17:07:13 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544830c99sm3101462c88.15.2026.11.17.17.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:07:13 -0800 (PST)
Date: Tue, 17 Nov 2026 17:07:09 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261117170709.00002088@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nU0yn_kkFdokfcciunwLuV0SLABMjGjv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAwNCBTYWx0ZWRfX53s4xNKHs9Rm
 HgvRS0IsxfLSLqZu4aax7SgcsZEEzx0S36c6ot9n/bf1LeVw1TznMONq/AVEosH+MAFIjkGCuqJ
 gD1YacYK3x0ajI2X6kWuv9HJkdkR9E4=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afcfa43 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=FHltUQ19mvutv370iQ0A:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAwNCBTYWx0ZWRfX94umYHD6yHtq
 C6h1puH+e1o2+aqIuW40Eo7+bzOlngxaGbF0Py9bK3BwsE/fp6axZJN0EOwGagcCl+gYwEzN07K
 ZYuz9GDFJDJAzI7WmG82UXg1qkQum1q3me6hYaGxvT7bKoOez/UxTfKgZAXsTVgxOZ7igGKCLBi
 fdOSW29N9QLRZ57h13zqm6FZrFh4YpiyTpN/8F+4Q80CiEYKL0ggIyWUmFR47VcXAfIuSIhmfzG
 1rhWkEmBBzA9uslBayWviNKUsa9Fi8nreU7B15EN1aBGagtHvUQFM2/VUTxQzD09ulb51UWetGc
 q9s5LVIg7BwHJWlJclcuuCtumwkwFLcK9QTWQbqMST/IMBl3xiv7hFLgWUDlZZll/WtysC/O7l3
 HYEF16eB1Cf+X2VLh1TOEZx9tMiRD3xs77n5jaTYC9L+EbtWg5X6Iswd+3Qph6VhNYNG5x0RXql
 CL7oZUzEc0R1zeNwhMw==
X-Proofpoint-ORIG-GUID: nU0yn_kkFdokfcciunwLuV0SLABMjGjv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180004

On Mon,  9 Nov 2026 09:11:46 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Hi all,
> 
> [TLDR Summary]
>  [V15 highlights]
>  - general cleanup and hardening driven by reviews
>  - improved TDCF access routines to minimize lost samples under load
>  - completed ABI docs
> 
>  [V16 TODO]
>   - address any remaining V15 outstanding Sashiko/reviewers issues
> 
> The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> dedicated to System Telemetry.

This is one from the family of issues you find when reviewing ones own
(well LLM generated) emulation, realizing it doesn't match the spec,
and yet works.

This works fine without the required SCMI protocol property in ACPI.
2.2.2 of ACPI for System Control and Management Interface 1.0
Platform Design Document. 111115A 1.0

Now, in here is an informative statement...

Protocols not listed using a property may not be enumerate by the operating system.

But they are... 

So, obviously we can ignore informative spec lines but that is a pretty strong
sentence. I can't immediately think of what would go wrong if we ignored it
- maybe we'd not pick an exclusive PCC and fallback to a common one the firmware
doesn't want us to use?  But if it doesn't want us to use it why make Telemetry
discoverable on it.

Should that be wired through from the ACPI parsing code?

Anyhow, not something I care that much about but thought I'd call it out
as an oddity.

Jonathan
