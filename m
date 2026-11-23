Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447408;
	b=HaQgsXjN6g8adwE/xE9ItYjKBU8T+vsS/h/VZN+U3DXJBVW2FNY+lHIe/0IdXAmohcg0
	 16yhWjdnTbHQUVh9gZ5QL2WW5wZgb1qBmVsS2QM3NdTz9aN4bPOgNEjZpB7wyqypHGQpr
	 VlPBpEU6QnKx6cFPH3zgVgt71x+S9/8gNU/RqWAw75ep7YOvDxjDS3iaPdR7qdh8iInIx
	 Q7462WfjCsPpoFvh2pqqK4fkvZD7kv2mxiodqAvaWPq2iuK60ujXKjPpmU4yiM9MfX+w2
	 kDCMXhVP127akWOvuJlALq1/3lqd1BLaadEIgRgmIpii3seEc7eSmoXReofh6o/xl9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447408;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hlb6BJq9p61fYoar56ASHEQgHyDDnHMDuFb4MoZS8Cw=;
	b=GQhahoq/WmgbvAMwczAH555aFaSMyZ7hhVvJb9ojHt7Y2ZKu/+vl4ygwvt4jTBor4ZuM
	 ji8+8nKh/ZuOyy6iN2ISyiOm+/x47f/T3QiPf7n74O1GEZprDsVgNx60d0q4Y5N5aUOdD
	 mrcpsQrl2I9Kr0tqJ242h7vE7suBboV1cVsYF71FCgO44VWea+GfIJDOeYrTHZqJAcBwQ
	 2Cuya2eKhkfKveUNLEXpf69nnOP+yhYh7IAG7RQ7TumffPhxQgJRxnta2pZzujd18vsqv
	 SnfkdOT96BAWZkyZNi00G4qNPdO81YnjkXR6NkMnbDqeAQcxPyC0iPHd10erx8Of1iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RqsFUyhC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CEYz68q6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2586A606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2586A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RqsFUyhC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CEYz68q6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL1ek3072474
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hlb6BJq9p61fYoar56ASHEQgHyDDnHMDuFb4MoZS8Cw=; b=RqsFUyhCmepWWsF/
	rr280aDKH8Udvemg/SSbsq46+Fl38Lr5q8W/RJfdI82TM0AvpGnhAhCOvXHxJ5gV
	ZWfcZS1BYbQCSc9EtWGfw+zcgQL6q/sW4IxJVvBHEOGv3ISBggRgbQWys24T+eh8
	57YYXbJEDWSqU/Uo5q/XEsOJuP1++7UBc+wsX9uX2FTX+pTqS+vICcJiphPvS+A0
	E6fjdqh+7UAFny+VyWZCL6Ozik+9HYUwqkLb23pkos+54xiJwdRKy0suXfn8PbC4
	0aLJ1FXhBwzRwXUqZ6GMLlFxKAKpO5j136LPCR5do5Ld+YyIQX3g7yy7g4fAZ3v5
	ObYn3g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7sp2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:23:27 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecba171914so96957e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447406; x=1796052206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlb6BJq9p61fYoar56ASHEQgHyDDnHMDuFb4MoZS8Cw=;
        b=CEYz68q649iRL8iRrFg14o4fvCsMa7TdBAdob1ypyZXeUxk5hQeCjm0vq/r+4nz9QT
         2G3wYc5zHgFS5qt7adxiEoY0LmqBep1m3LwMUZBAg9QR9IDp/gZ0p9sniks77rKmiFXS
         nQVJDgMc9wskAm39FCNi1xCz46p1AoyL9XHHshMHg2KTXBGVxQBpVJop5XoH+dAUIRo3
         6tq8F6bgYLD5608Y6pAer9vx126VvRQE2dVBSb/bnynqd6Wekd0sxmX7p8WYFbeA61x5
         vc5U7GlqIGCAWoopGdNkbwBMursmQCfL+OG0mnuudZhnPZTxDOt+UOOjaptkZA2G9OGa
         6fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447406; x=1796052206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlb6BJq9p61fYoar56ASHEQgHyDDnHMDuFb4MoZS8Cw=;
        b=0xPC5eFPcZ2lNC8Ddcl4+oclMNzqcADDbMlNTAk9rcmE477zJaiGIO9W7gWQY7Si0h
         /HvxJlBv+cup8G22Qhz9+5L9L1C0S31ioOQHumbIFtW5aUDyUrY454BrVJsYt6Pb4ZvP
         1MXXf78jVjlzpweXNTQuNDDod2lSajQ9R4jXN0Fo0BY1P2ti2Te11ttBX45Q8QdLGOni
         BpwtEti+EzcVF21pgEUGHOt5MEli1fKHVcSnMD6nEWZyzoNmbiC4sZH2aYuLepMoiZQt
         LO4WvjbMT7NFJO3ICxUVCGdcDzdYUfGx+cduVas83tzqBEHlbD5YZlTibPOaDnigC0mN
         KIQw==
X-Forwarded-Encrypted: i=1; AL+hErG5r6dijJ6DaG+K2ns16GSs/xWn6cJ89ZDimMKB+KGUQQ5WDAS8SyZvrOT2oNqQ6RXDEG+34XMCcywWIK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EnSGE1bELvEQuRkm1LozNHyFEVlh/bKC6RJhYMmZs8yJgSmE7
	Ag++GbwTotpuKpG3vzkRqQrcDcgpA89pELH5XstzztascUCyqDudo5S3HqvRSZStNnusdbQlBrQ
	+S+qVz+HcVjSwHsyYTcwjwQL2Q8yM0ZoD+p7s1uzpM561SesMTh7Fzth5gFhjtQAxZqmkdsX/Tn
	c=
X-Gm-Gg: AZFdTZfzL5PDPvwahgkYrsSOlKz5HZICD4f15ThhuQYKxZog9dk74xrNjwabYTHX8ZP
	GxlZC2IVncJqW57RhLX21wQ2IUieg01qGpPuv7sT0BX9PnkBc4CI6I7HkfMeKQSh4etMUBCIAu4
	6B9m5OZI6Mpcm3LD/+wdsvuGJtd4sHYYSY854P8Ol34L9p5zW5oDFg5J6KRmJ9gh7I63Y5Yw0IJ
	SJL+I2gcdKBbBhleyNOYw9JcBg8oVVobz4NY3If7a8WyACN5xsi/NGFML1jBY70cem6uSmf/Dfu
	UdVLtNFbyA8oGfuCS/lMq6SHHR1CiDjXTQ0IGeDhf0ZC2h8OCOHZkUCUZ2YwjJO8hERkauHNcf3
	qXntBYSuAWW2G3alSgUDl2V3Bte9AelIbEzHR/5pLmXUXPLCMP6YqjwKsSz5GbsU2TBivb0M=
X-Received: by 2002:ac5:c00a:0:20b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ee8ae00500mr7085652e0c.2.1795447406533;
        Mon, 23 Nov 2026 07:23:26 -0800 (PST)
X-Received: by 2002:ac5:c00a:0:20b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ee8ae00500mr7085607e0c.2.1795447406114;
        Mon, 23 Nov 2026 07:23:26 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeabdcbsm420368466b.46.2026.11.23.07.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:23:25 -0800 (PST)
Message-ID: <15b682bb-4f5e-4084-86e8-df4ccd538720@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:23:23 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm6375: Mark RPM message RAM as
 no-memory-wc
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-3-3e868b4bfa48@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-3-3e868b4bfa48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b045a6f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=948W2wBnRhwx5lWVa8gA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfXzuCNTPX5wkT8
 c6IgfHxGB+AjRNXyxySgcGTguMNyVIDvnke3nuPMWZVDwMr0wzgJyhjiJFk1QN6dzjzSxe2OAU2
 wyGNCLbxxz6Ma8g4wX5GQ992Y7yIwUnHeoLlsNicwvyl/BLlltCvTdTucsw9p7TPZOMst3UdxWV
 1MbAX/aVZf7kojET3pY04ZUmTKdctoGogiMZPHoja0H/fKSmWe6ptVHT+W8SlIjeHerELEDLb01
 XFxigoho8DBvB2xz9VItOijNfFgvNP1+/Ym3SjBoz0UEzPIwAp2qpD+L2megjF7aU3n0Meui9IZ
 TFUEtHsg1KA80kUJc+KqnwzabYb4j38WD7Ob8qCvq9pXtYab104uxG1fUuk5zdWKJzV62rDBaWL
 4D9iLSN2D1Gtz/NYpIFwhn7d4hnRyiwLPyyRXU6jpBzB2Z0V5GQkCZJZRC8VsIldvytEnYZc83c
 Et0Rlzb74d9WfE2PZDg==
X-Proofpoint-GUID: gD065NZGD8yMPkcJaxbBEVnN1LrHprNi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX0W3FcXoesPNk
 Nrl5gQDZMyuDsbBL95oimvro10swThFh6qwIuE8gEX2NixzUOAozH30DA4DBmJznsAG9lbpF7ts
 c4mLd+NpqaKzm8qZtMPN41RmwV+4c14=
X-Proofpoint-ORIG-GUID: gD065NZGD8yMPkcJaxbBEVnN1LrHprNi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/23/26 7:18 AM, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts.
> 
> When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
> and the write-combined mapping takes effect, so such reads can result
> in XPU violations. When Linux runs at EL1 under a hypervisor such as
> Gunyah, a Device mapping of the region at stage-2 hides the issue, as
> the stricter memory type applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: d3246a0cf43f ("arm64: dts: qcom: sm6375: Hook up MPM")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
