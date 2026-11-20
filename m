Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165959;
	b=BU1Xh7onBVqLi6mJWxrwKUpssq493aYbi/H0YSQD4MlezmeyqVYKtM05il06Y5zj8FFQ
	 nvDW4wU2z0kR0acY+nkKO1XIYch3fh1hX0tYQo+klD/bBNYjYBeESZhK0lL0Wj9+e1BeT
	 hBvjt9nPw4UTBc5boUX2oRrhZzi7hpXhRDnO2Mq6wTZOm8Tt/2W+qhYEqGJ0q/8A0AyBk
	 Swu3rudsbnDqiEOrVM7SlohshjTc+Rd079/x1QTz4neTFi4qe+fsOJdhYOXXymw6umOaZ
	 B/aLoTh0cp1PdMKchWIXbN//IyjhHSgJC0uJeLszRyGcL4FvS1OWKM8LursOjoghCvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
	b=EyHbNYqFzGGMe6QTgvK1kyp0EZYnQ9nBJPNsBbz/13g3ZTe2ZD5WAnMZ/4kmuZ1oBQ3t
	 kOD9tVFsXIYHZLA6uGMVUZpl6bpUev14T+L3cxlsSVeMeaulhpgCIOEGnJs2z3fucIhM3
	 u4iqjqyvL5oQ028mGPd/vfkvjta8pQMRruTYAsIMIQgLsxWEa2p4146FdH5lV8tI6OYFH
	 BAIYd2pUdNZcZH5qJY+80wmX8YpfMJqylk1uxmBBo4e48vn5JA3QW9P276uvp51yN4vW0
	 sV7APiOMuM3yRK+jQffLa4/O9tAsu6iRZ+kkC2AuTekoOu7DEBLznSuKocNKaYXw5Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gVmAKGJ+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eW3Qo8ui;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F336606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F336606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gVmAKGJ+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eW3Qo8ui
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f6dl1742184
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=; b=gVmAKGJ+bahJTHDM
	2Q5EMVxlNljNWHr5+3+5k0Kj/AS+2b+xDCkX7V3JNA26pZfiwl5qg+zSYgbuzCra
	T5F+/FhO2o1HuwI8Q3VQh7Ygj6v9U9rg+x5DYySeRj2ocL+oA/ddxmYQfAeDPrI0
	fI6zq2cvljcn1ONBrR1dCE8bhD4Et8tjGNVpLcfJkEkodMvxaju+ct3EXu5FkY6U
	ZtRsgNtZE352+kkE8H534/8c8XW3HgBC2CA6YdqWHCtZ3vTKzLPBKRbBaQ0DyCg4
	nQcZXCbuZqSFHMMq5IdXJI08/e4decKvfpkDYEBhfC3E4Y4SVBSfyjtgqQN6aiMk
	Y4QjDg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yh3jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:12:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3a9826f6dso792389a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165957; x=1795770757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
        b=eW3Qo8uiqxjMDKgH/wEW7yBPXsyMvciW2yMkJJ2z3R8UVdyrNa3aIZZs9vop/LfnSL
         9GKwYGY5TjrVDuer5mP3X+CefYs5IFtfVPM78GxBLAbFjBhIKoXrtj9NbnI3nGLxsiV1
         F2H4Ihy8rDlId0G0LmQ4itX8sOEIjSFw2QVXEHQk2rjgzW9iRQiqInMx/4hWsYtQlX1x
         yxQKzwlypTvCtiZTC8BsalFv7YO1+rzJ8YNvF7Np2dPvJnNzNIwSdtyhW/dP90Hc8DsM
         4EZYg5JOKGm9UM1GU3WqugNBhnQD0Q2Aoq7ENWlwhNqhYvIw+jp6ueOqnbqw+lJjoRv8
         /+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165957; x=1795770757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
        b=ZueVlOdfu6uYqdKyDi3BTywLzpX+P3L1RBKSzHdmddh4y7w1Z5H40R6m8E7Z/mw4Av
         bF17szyzOlCH1Q4ULRQJNlmEar/d+0s5f5PfEhKhx6Wzu2gJ0LknbrNktyCEgV8nhe9+
         /lFnkdN/8/wqa58RQM7OX6GElZyTL8ayGww4LB4i83JP0Sdgs1p1ig1PJXvnsfWQyX8D
         wlYeKQ11ji2BUNyLMy63NMqDWNXVNCHQ/E+H+52W2xteDu4pG9HnS9QumPvxnKYNQK+o
         vNsRaHi4k1V9RKvtyicMHbiMqCjqlhE9W4ACiFAIF7Dyb0MV++HksQZa2UZ6gmIalE8a
         IgLg==
X-Forwarded-Encrypted: i=1; AL+hErEOLoMXPvLH54O73wfO40Nb8OGMrcJGhwQrurm45AoRz/Fp8a4j3iy5VIgFk0autY0DxGvy67/+g6CzY1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z880jRqAvNiHqJq7vx0f7qEzAQmtc/6mqGO9ZMM4gJoNHHrbevV
	L1mrC/IPnaXrZKfnUz78iKGnvkLy6UC8IbiOurBaaKDojoj8ucWLWKiM3MOeeHT5XT89v9qORkx
	1LmSDnBwp8/HSJPf5m759bPUx2iq0DE+NR8vA3VPNq1WTzChb4up2pTybb5oVqOeV0yI=
X-Gm-Gg: AZFdTZf3HkDdrsVxP0SMN+LHzWozwRzAJTzUBcCWn9Vna42jx9LOuym/VUh6VmTjOm5
	qO2a2TtIegYULEYmopfaM9fJ3UTNrzU8H9+sCLryO5zwBWsybpthN096Lhzh6iYuofc2uYY+QKy
	/9dNruo9zzV0XskdlWgJDwR/NIji8iv9m+c7acc6Zw50mRpRcTgHrfbMPMeiBRJXG+qETq1DDXa
	zH7bKiGnN+4IqvcGRmhwbhI/lBuHwhZJwDQwnbkYBZbcM8mAvoSyQSvBA892TisouOQ0Nj0UQhE
	IzCf1dkVMCPhD2PEPv6NU8WR1pt40LbyjGgS68lquAPxIntY7KHxivnwRDTzuVf6Qr+fucQs8Eo
	0Zlfc6eGXhWd8Vl0FvdAVoIK399j6hLzM2dD3nld0ZRvfeUuAIbsJW0Wk9brxq5cikGt4OETZvL
	3EAEwyEw==
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr1980985a91.7.1795165956832;
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr1980952a91.7.1795165956350;
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm3483495a91.13.2026.11.20.01.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
Message-ID: <8d7db2dd-6338-43d2-8eca-fd6db3e7c512@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:42:29 +0530
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
Subject: Re: [PATCH v2 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
 support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
 <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b000f05 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-HzP2oy_C0ZWqF548KoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfX6Nv609fXwkbC
 uofVSuiTBJF42wyMZ/FwUCa5QzrA6YQon3PgvFwgDv+mFTa1J0OzkpYE57I5leAPnKmHLVPPHms
 mJOk4TRpQ7bYQbb+6flhiGx1K8whGCRxY7La9cKmak+k90TUXrIZclTZo4eZtRzL7Egyd3wdxdr
 fQ5iFxcG4ANBsZGdF9jFGpdk0ZYO1w1077xx5eV4R6FVTi5itqLFTX4RjvmXJjDR5tHmxzNsrLW
 otZSudnjSp9LdGkP7k3ikwD4bgf/Rtt7dHh7iTgsDcycoAIhC4zdzeLT48CCJoTPMpWzVQWzZLS
 A/l9oZQVyprilywsoKW1lgtw0jJmN3YUx2TcH2AobPYP+yXTXU1Vh4Ji2nHgFIzHBNzqgMqDRQU
 UVhk0+ayucLoioG3z6cyf8GCy995ez8J5Q4bagijllibNKXA3D8lLIt6ItkYxPNosvzsyr77Sk4
 aHolaGGRGlPyCRNgsCA==
X-Proofpoint-GUID: EP_DqLRIMYUZ_NmeQtJOOrMMn4C5xLqY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfXyknB1H0cK7EK
 t1Dsxmtr00AHBjHTWsKA7dmd3tEwZ3VxhVzTqYROXVg0l7gbqSi/XPzxACD8f5tXJnxKstfZOZt
 /3BJ8CCJOUBSC121+qj630GiLLlOX10=
X-Proofpoint-ORIG-GUID: EP_DqLRIMYUZ_NmeQtJOOrMMn4C5xLqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200036



On 11/19/2026 10:34 PM, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/segcc-nord.c | 135 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 135 insertions(+)


Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh
