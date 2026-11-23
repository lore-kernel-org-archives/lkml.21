Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461674;
	b=jcIjcUz2j5x40h7Yglm+1W4H2BRxPan6llmmvJNDdycjQ7hdAG7OQBfrv6fO0hRfNbRi
	 tUZF8PR1WLyZasdQgibTHVPP82MEjaBX9R7sPT2ydbR7Fv3Fc5Jjk82ZYo1jwIauzbHko
	 y8P1nKz72NjczVWgd6QQeQ2Vq5OQ25qJZXPqrfUlubDbZo/t3wW0fE2nQy/OFtK9LSbJc
	 0xMiwR1Ei1fsFF2HlOrcam86I3wZO2v1QwTND2onf+EIOxMRaedjoqT2XcMloUvqOL8Yn
	 7nmSZHKD5VuydvhCMIWaV0VBfHtGgE3Ppdq1PvCLz1crfw/mOIHAoX+IkOx3D7RsTKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+w2oHKX7khEVelfhN/5lzN7uXffLARt2uBhawgZmWH0=;
	b=bI56+GRNKMERSZJDidGgfgcHcvFKV4AKvabeWuOJdMUQn1rTzSbDW22wAxYd9MsOtHd1
	 y7jDTCuKdaOxb/6YMMB/U+2rtVPTMnLcbmoU946JoPBL5izTtCD2qlHfhZY69gUDYKdj1
	 DnyT88haQKi+j9/SRIrMFgFfLglOtDvUX30KFeDfEXM3TdJqcPuKqTikNiHSvFNPfSWQd
	 NOcX7IgnZf+C97RhalZ/U/QInhY/iByp3S3/rjh0ABlCjP+n6SoOlSptQ9G3m/uXknFC/
	 1xmD1VgIrQnq3idzadStWu7+3WdoWEHTuV94wG444eH12uaBUE0Tk7AciGS/6sWDl3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EnS5fuCk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WKrZCJGM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5245606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5245606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EnS5fuCk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WKrZCJGM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnda3025350
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+w2oHKX7khEVelfhN/5lzN7uXffLARt2uBhawgZmWH0=; b=EnS5fuCkPPHmMcAc
	1PQi00QEQIZpN+D3wUtebaKQnK/T3CJq3qdEk1uV7pP+o/CfPfWejo6IeiYSpKX9
	alTkAFcN0dAAdt0kt7YV3SIpLqS3yLkpn54znWXCoGYfEVUzjQ7bqLROEmH1hPT9
	pJLNnipFow7Vbdb0ZnI0shFMjy77umrgkJ3erl2q0afDhMYC1fr+267SynfT9UAH
	Gt65X13eH30K4lvQg+JzHEOBz8maiX75LPwgrmMRGjGfPyd08cPADNXTwxLMj3tE
	7SttL++XAMG/A63h2hrNUBBWS1N4yBsSFyM9Azum+IRsFuOFmUB6P9oC3gvuNNdW
	Rp5DKw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb3aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:21:12 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso145502e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461671; x=1796066471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+w2oHKX7khEVelfhN/5lzN7uXffLARt2uBhawgZmWH0=;
        b=WKrZCJGMOMuXgSA7Zi4KPs1fKFAx4HcPEPkp1PUli7BXOifpqXNyM9g/IAbhfTRDsP
         cI9T5vj3/Yov4/viU4/N05hIEdcpREyd84OlnjmJtS9vuJE0oUiGMwV5tVV7iP7qA8aV
         nuplk6Cz34rEfzpdZX/K77/7q5OBMtSqqHcDLWNIwIhrkO6+1S7Br2HqYb5M4TfxAIZu
         qdFCGcY+AI0xKqm18kSVGcxZGbjU1HvVDCit3CzGUx9+V9dRspDpHq+oX+iAJLQEiy5c
         TIfybP4Vgi7MSeWG3VxTHj1akXSLRTR+MkZM8DKY7PHruM0nJl2+dIw2dVG91a3zbT8l
         BMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461671; x=1796066471;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+w2oHKX7khEVelfhN/5lzN7uXffLARt2uBhawgZmWH0=;
        b=ACbzpEYjGdf3BAMv5Jr2MM3AlyvpjyAE2F/a3WkBybvVAd9gHcZj5xotqWTvX/whXR
         a7v7DnmN0VZpxHPPVuKDNxYYDS9v55P3MOfnUaDRgOAE9UpZc5ylaQ2OgunWVh9dwEvW
         6YV/kef4aPr+vX1d5r5gD9BWPLLV9MT4KazAS4yTTlU3zAJrfhTasGiiQBGbGtKl+eac
         DshvqLUTE8QaHZ4R3CketXQAChRf7HZnUyvw5PCOG0p0GpANRNywFRuXXlAsSIVymw79
         oWx/nDEX4yl6MBBL+vGlc8Q37UnAVI1hSPkQs+1eq6lswV3/I8TJiGLxivNNxuR+OACz
         zXVg==
X-Gm-Message-State: APuU4Z+ze8DK58i8Rzn7uKXwcqKxX0jNRrAmetUgKVAwNNS632Vy2OgH
	jB8hewDhDwyC6htZtuZJOqblvbHkAIuXqrJQ0+2hEAX2MhhXjeqys51CWrHBBO9HCZl9pRyRHE0
	iDDRDXdu3/MOWZj0I6vP+iJfN2hvZTaERe983TdHShNrX0FpyZvPIGXRZGwj5HdZsTro=
X-Gm-Gg: AZFdTZdLGzwlc2LmOFKvxLPnQ7Gk+Z60UPhyvVzI4PC29hK3AW5Fp1WuJX7dDoHggoq
	kYh4TPWDf4tiQBBevY6/ReKOdEQgSoUoGl0yO4MfugZwMq5hQzNVnfdXP/cn9729SIt7csg0aIw
	c7qjHqMFGytkDqDhs4uCSW52QAPtwIB+GIQBloq8MolvIEmkciSr2Ogkq5loogMwAtwBiJGZHT3
	we5+qCuKVtdmm2Us4ksZW6hCF3hvpk/c0YQ+Mtj7OjVZt1oxVIpm07VsDi+eCSULS7ha8NS5NHN
	FGA77VcBh0LlJBg42wAacvJfvwCwFup1Wnkrql4cU6xk5FRUwGDo8xWSjv+TENvh7Ai+HZkFIh2
	4tZFS5vnw1hjUJhxQKzIRhSs35QI59IIj61dfMz4pPlZD26XUmPqca1VFQDTAd2Wg4MvXdzs=
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr9546147e0c.2.1795461671609;
        Mon, 23 Nov 2026 11:21:11 -0800 (PST)
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr9546105e0c.2.1795461671135;
        Mon, 23 Nov 2026 11:21:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbc67sm5754903a12.11.2026.11.23.11.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:21:10 -0800 (PST)
Message-ID: <e62c6b40-5c2c-4a31-9d44-dd4770486de7@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 20:21:07 +0100
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
Subject: Re: [PATCH] phy: qualcomm: Allow compile testing a few SATA and
 UNIPHY 28LP drivers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
References: <20261123190541.262138-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123190541.262138-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kH0u8tr7MmZqbZP8mamZ03rdsJ4xB4zl
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b049228 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bASQEeq-Kk1eUeroIz8A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX9wM5cfGnWajS
 cXGSFannL5FSWQT/uU72p7UHzcYi565UnuZNh0/X/L/2oXQM+u+sl2QLLBi5GIoRbwn2GOYbv1e
 Ia2xtYMdmVHc8Od4ajSYGT/8wvH0aiQ=
X-Proofpoint-ORIG-GUID: kH0u8tr7MmZqbZP8mamZ03rdsJ4xB4zl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfXxxm+um8y5HxB
 ZkzjuZrjOrouMHCv3SHmfopDvINAwTUPvuTpAkxcOHahnhXxW96ZGDmEVcciSeH15ZPDvCVcdh0
 ZIm4iyN/kUBNbwQKkZ+FFjWCyJxIFagfpIJlzzyO8rWpxbrtlKHqCcJejlx6VA4CqOQIw0bdejo
 Q6PpHN4r/tEWkdMLq2DUp2GnDOOiUVpUmLaW2okk/zbtUgrRJvytT6GDMTeCQzxXqqHk8N47TGB
 vSQ61aPrk8WCtul2EPcWijQiRw5IrtsW/VYICa1GFI8w8NiO3UVySGoTz3jjB/BAu5K9dpgYN/q
 pm+Ykxz3XrgvEGMUjEf255LZG61QjqtQiGt7ExMxhhYZL/RxlLACCV7igZYHatu3uZwUEovBXJ9
 sTXJD9N3ufJiWgM6Bj/lhJoiQ7SK/flmvEw4SeLlmSHphcth4iqRPB13G/YZ+tZkJ1A8Obovpvc
 rjm2wX/IMriE71r1qEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230077

On 11/23/26 8:05 PM, Krzysztof Kozlowski wrote:
> There is nothing architecture specific relevant to building of
> PHY_QCOM_APQ8064_SATA, PHY_QCOM_IPQ806X_SATA and
> PHY_QCOM_UNIPHY_PCIE_28LP, so allow compile testing for increased build
> coverage.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
