Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439188;
	b=VI2hd/C/momA6V5fbF+DRWIJrRG8yszOk1fn1nRtCvGbYE7/AU28KmSUfjWuR3foMiqX
	 Wt4lKsIs5FiV/pj6U6RdVEyWNbWR5+J5zrzPkVIl8EN93cmHFhVnwleWgv63sCs0Q3C5k
	 L2Ds6HqZ3kygyUOGAijMHXAa6IU9hFQ6zEKxTx1lBQJYgQ+4CfJzJgSiOXZX9ZuqQmpgO
	 z/07YlARPxxbmBPnGwKx5+N9a6JPG1BSlcre5nIKL7DhEFhuHhJw1Mx+OvGS992DWM+VI
	 n+Pz8dyqEfjy5X+vn9D8uh5YXkCTFvhhic3OTMMjVhu5I8OJfqwcs5qgqE4LczcCg0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CYvomfEjy39LuVTvYKKSBWmOSbB1CxQU1hTSsCOWzQI=;
	b=3Sp/ffbLkQGdsCFd7o5Y+3FL65w8fR7XavIszc6sXtQ8DfscaAJz75xvc6HPIMDGrpKg
	 v1Z3vaQrBeGkmwJ9xV5uGrpZ/Ww2LM8GzClNQafIsBUVElYS+7xLglrKS7AqohjrAw+FO
	 gwzLptLc/O9D/LyIZ7H/kvuPzocqjcC/dFy8gdz8I9kfW0u3fEL+UfzKUQT0j0jmYhdE1
	 OZg60v8MCs7pB0wZ0RZAy5haQu6kC6FwuTjCC5cjbeSpOAmp/dXli4j8sIhmaiLbvmvPk
	 OhUa+kWU4JccDg67ODc0KSGzYcY3wAq6TKpc/mxKHn66qaXCU7Vyu8k6ItYlnYBm+1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEIydQaC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I6XzR0nP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648BC606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 648BC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEIydQaC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I6XzR0nP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCG1jf1794902
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CYvomfEjy39LuVTvYKKSBWmO
	SbB1CxQU1hTSsCOWzQI=; b=mEIydQaCn0XOeUq26SvZH5rXZXsBnUtA86crINI3
	snB9cfnqZz4RfgGxGYq4Poscsyax+YyNHO5xdFGxn32s6EuXjwXX3Pd4298x9SRe
	ZvYiubIY4v+ozxCjCri5iJXj855ctOQJiNsspG+Z7Ir+U7ZeP6fn3c8oDaE2Zkp0
	rTDLlVzIFjHnEXtrKIj2E7200CXRM75WKB0cUaDl77xGecAysds7yOJfybEdl5P0
	X/p86r1LgtOjOVowX5l+S3VEUnI5FiedS9sKi+ScUyl92/bEsyORYUzzavHjkWL+
	UnhZD+SzRSRiLTP3VOmpXO0wY3svAF6k6U8u3c9283T+Bg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx1pdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:06:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so4137049eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795439186; x=1796043986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CYvomfEjy39LuVTvYKKSBWmOSbB1CxQU1hTSsCOWzQI=;
        b=I6XzR0nP8Wvn+QBoOYKjqtSj1mbkb1jTdnF+/ukuIz5rCVQxKGSaFN4lJOANWAYR3/
         eRU8qfozUtc6UeY3oNwEni2VOdLz18b0RQX4B9bhBMq0O07qJLZyQIqy9qg1PS8G0HiB
         +fHfXTHlmsRsCixXTeH2D99nRfEVhTop210guW2Z+6plUmJHZ/NwEMXohRa7stUjMThC
         hrYOaa+49s2mQEQR39F+rPlh1bw1/E0rlZBjpQg7c5GXk8GFO6b21/uyIEJLQMQXNQ2I
         Qw+D9w3NbqDN/toztQwhmpaZCJwocY3u9hqRyWG79q/fcnxd/PylfcOKttCpThjCA/5z
         cGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439186; x=1796043986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYvomfEjy39LuVTvYKKSBWmOSbB1CxQU1hTSsCOWzQI=;
        b=WhLJT8kPE2I0T0gRrO9w0PgGbpl/MngRLmgiXFpS6VfWmcdAziLKHmLJsJCkiSjMDJ
         OyKMokp21aL34VFyZmcq60JQtIIW3ZuCwhbUGe4paJ5tzO+lzeqaehLZkmHEjIvEQkh/
         d9kut7waXWSOjQ0gIL7V8OMjgW5yf/qTkXXyZlGgYKcZ6ItOEvHJAzx/8D1KZLYRJPhe
         HAZwTCgZnZHgW0wntoFarvuYcgCfPzMx4CPknFT4ika09lqcx2nKCe3biBia/iHAKT6j
         Wbd2Vt5naKGOQEbKw6eEjCSHgr6nkwnhNkHBkqPue/jhfkSU/JWtbUvdIr2rRVdn/fEt
         HS2w==
X-Forwarded-Encrypted: i=1; AL+hErFmsJs9uMsJ7JzXLWVSPzeF7KU5LCpl0REBaXQQjM0GuPUQwWp8yKswoUhmX+yAiHaIl8UtTqVnrpKqmKU=@vger.kernel.org
X-Gm-Message-State: APuU4Z//7nrQ9AvWwh3KwmZiba5jc6I5ds2mkevRRpoSikrvcldcenfq
	qm2yU+Tj3k28mhwW1iynFjvhHdTwHuJaz8NLP2MJE0dFJkFOcVKlOiA9xSGjvWtIIXXZLFNDzov
	a6fckwGpLMhTIxZEgHGg7NvD4PWofAWJ3pMmKeIAJlIz/VTsklsrEQPS27YAMK42/ParxpquFg7
	I=
X-Gm-Gg: AZFdTZf2PGuA3eomrszsi1OyT06ECngLAFYFWFlINadMwJJZJHetMQd97HRJEgngDRq
	oxKIe7P2j9GgH5GoF7AVgJS59aXR3a9+xO9b16z/6l4hcmO5ZCeQ2szzBXqEriQ8UyVMtLJoSNL
	G3+fzXnI6PRyEoipGujcGRw0KVvaD1mOEMyh+LdVp3hsmddZRvcUol0EaRqtiSmwLxEYrjsa0sb
	Ng1a/IeR1XrHO2nRuDDkh6Or4fVxzCL2aJ8FiyLIgqUQVjwOWmpImTZbjsUP6D9LHKqwUQpxWMS
	rUS2SDDrJDoSlim8+IzH7kJlta6u4aavAA60IOYS+LO+h9kiq7zCozbj5eFlNd3ExvzFgQNBvrX
	z4m7vqYa5wo9tgXespmUCtn91T6r1pdSAh1+25qQksGQMYuF13vrhL/q+fHLfy+Q57Yj7IvMFOX
	9ZdtWkdd4Lo9aetrU=
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr11688991eec.41.1795439185676;
        Mon, 23 Nov 2026 05:06:25 -0800 (PST)
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr11688972eec.41.1795439185184;
        Mon, 23 Nov 2026 05:06:25 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm37649809eec.12.2026.11.23.05.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:06:24 -0800 (PST)
Date: Mon, 23 Nov 2026 21:06:17 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: qcom: socinfo: Drop DT bindings with IDs
Message-ID: <awQ6SS1GVPz-QUYb@QCOM-aGQu4IUr3Y>
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b043a52 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xlrlT0MJ9oWSHFZ2GFAA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: bkgPRvEKoojm2XmipdbR35BbqCCFTJ2d
X-Proofpoint-GUID: bkgPRvEKoojm2XmipdbR35BbqCCFTJ2d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MiBTYWx0ZWRfX9x0qSd/iWQnx
 ulp7v015S5d7m5UWHFgKvi08mnoMaVYHl95VGtsZE98vRoXSm0qHb3tRLBT17/qnzFsVySuuOTk
 5DN68zpNxISfDbEjCrNvgNfiOqSk/fQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MiBTYWx0ZWRfXzQPzmvVXZads
 iOhFcqgvLP4TTf+e/N8eKcQVZzf/0NkE70NxCvEyj8p20HUkDa2odOdkrP2dmbUtM3rWvhH+mF7
 lzUSgafAuZU4WCesarRV11S26WwQGZhs76DmBJ7Mcj/JyPvANZi3RNvznt8775T310CKRL4uMt1
 k5qfJEI+oG0pBHMyPJQFQyhYLycjqZ03QqyR/e7OnWzzkF0JqSBg23Rq/fPPbGYcbfhbYePe76I
 rHWo2J9cbJW4Yv3utLK0wjWj65IX38fgOISgypzTAl1xQz7oz+QD6uLSYvyHvvG5Ac+BawLEioU
 zsS+oISejuw0rBzu4Br48POnvDDMmsovPqw6HCNbGoqOIhmm9Y1xDmPoRtk5MqsC6Nm3MHelh7M
 D4ATVC2IXTgwN5B96Qp4O+r7c2Gvd0M5OoSKfgcCpBVXi2t/7YOcmDbnrqa9MkqE042opNccmX1
 HJQYmERuqBqoEqKVKyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230052

On Sun, Nov 22, 2026 at 06:46:19PM +0100, Krzysztof Kozlowski wrote:
> It turns out that people add SoC IDs as Devicetree bindings, thus ABI,
> and then want to change them, for example because whatever
> renaming/marketing happened.  Well, that makes little sense - either
> this is ABI and cannot be changed, or is not an ABI and can be changed.

I like this cleanup. Keeping ABI as necessary as possible makes sense to
me.

Shawn

> 
> https://lore.kernel.org/all/9eda2209-d64a-4a1c-915d-4415ac47df45@kernel.org/
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (2):
>       soc: qcom: socinfo: Copy new SoC IDs from bindings
>       dt-bindings: qcom: qcom,ids: Remove unneeded ID constants
> 
>  drivers/clk/qcom/apss-ipq6018.c      |  2 +-
>  drivers/cpufreq/qcom-cpufreq-nvmem.c |  1 +
>  include/dt-bindings/arm/qcom,ids.h   | 93 +----------------------------------
>  include/linux/soc/qcom/socinfo.h     | 94 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 97 insertions(+), 93 deletions(-)
> ---
> base-commit: 74ceacafec02465d922ad68dce9498c8f50e5f5d
> change-id: 20261122-qcom-socinfo-id-dt-bindings-e6fe815b4480
> 
> Best regards,
> --  
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> 
