Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605367;
	b=huM4SECmYtWG7C5wvSF2LeZVZZwDRHMLhj8HbA2IjsmiT9n68IlUrSgeVmNKxW795+aJ
	 lVUSNWmbfvjZ0CedE7Z9qBr70G4WJK5rMGmNWogPLS0y+IEbjtSflLkP0yYH5LZQAgnNN
	 7P3lb9wn2sCOjpIqksAYH4bUx8MR8urIN61tAiZz3WcIt3tKDP4EoTDzNf0UZDhyW+nRC
	 5yerGB9TqebZdoXkFqZOrl6KwcttGiUBiq+IXk0/up2+CoJ3LyyoqKzmmH8sviHzJFkMp
	 rDakLK/CZdlOgqHWO3M9oTvdp9s19UOF8ft8le7yAlxMsxAeA3G1hiy8lwh4dDfY4mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605367;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ydO6s6zouR5jlGhUAX7WLid8Ob4ZCGvRRCC4HGa45LE=;
	b=as589LimArlf2hUXqAs7mP+4HQ5omDkXivj1Y0LgQax0hjK1q9OMRH8WHHPU/8GQ93SR
	 jYAq2UPcVDzZLu8VI4tnprvGqXhrl1satPGtpb9wJj7oMLKjpIRKvhdZCnOWdhni1iZFF
	 KF7ENMMKZWTudp71oYKz81WExcLju/MPx8UXgEX4On2OeksP3B5zUp40SdWrkPfaAtjbV
	 IDKuiWWuBFYSu0JtdY1NApbFFCtYA86QczIOUrvkWlYha6sGPfJIyQHoEeBUfyBjK3ZI9
	 2/e+nSAFM8f+nesLGh9gckX6JoOODyTwr099vM8x8D7mJ2yf8qrWojGkrh56owY0nvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LUxhB7zc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffBqD2Y2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E482606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E482606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LUxhB7zc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffBqD2Y2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mit33642178
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ydO6s6zouR5jlGhUAX7WLid8Ob4ZCGvRRCC4HGa45LE=; b=LUxhB7zc7CmsqzkO
	r3ZGWJCLWUe4qD2tPmoMv77pxKvjzq8P4+TO5PY4/RQeTJfNmf91Ujh/0LYX/1kO
	Gf8mfM+QZVvshnmFF6afeDPWclv+8wQPmTyWK2EQeS+Vm9Xq1xLcSzE3jNMJ0GKN
	y9SRAQJ2urUf6F5SgQp/aglydY5YIyCl52xXbUeHMUKhbKIusf9n4oxQgm54KJ48
	yKZfO/w/nWuiUG770y7fgmoa2sQD6WOoUyPaZnEHmdkLWQeJSKVE0WRa7ADkEGAy
	sRYcxTYhspE4kqW7pzRlMWST/nm3EF3uwxZ5Qd+zLrIuwM+O+1OkDlR7zlKhsycD
	3DepQA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2ahvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:16:06 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5edc82ecc78so209054e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605365; x=1796210165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ydO6s6zouR5jlGhUAX7WLid8Ob4ZCGvRRCC4HGa45LE=;
        b=ffBqD2Y2aO+WAqVaCmzZ/zOCTzJjeHYop5E9eL4Nsgf3ZQUbfuM8KtFPlTBgRH3H3Q
         jreHsXhb2CvOr1hHwHLSVsnUT2Bnme7P02otpD+njccRhdb5C0dlUSf0ooS2yz9YmlYL
         I/Fj8Bl6v50IgJ5UmYF/otEUoAURDlJMpItnZMzQPfIH8cEjh6jxMBEVGtopbeFbvlgg
         k/LfF6oCR2Obu7oCtJRx0og6oskQmsY3x6hvol9jDqWiLvmoxCJ/hwYJk090RoXpeNvo
         5X3iZ+lLPupIHmHqAkjGNoZx+R0EVutm1USKA/4uNvoHlwHnq0BFwSmJAqD62eXH46Ej
         1qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605365; x=1796210165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydO6s6zouR5jlGhUAX7WLid8Ob4ZCGvRRCC4HGa45LE=;
        b=l/ux5wM5tsIlmixM5Ecknr+ANF6dmJfvGXGe4426UbMH9NAAvBlFqHhaXhzEKEhKv1
         XDM11mlAdyOFF2a4mJTe00th5jnfKishfisQDmZsOwSFYZUEBgeBd29S1Te4rlRNy3fo
         NK40PpCT9qDWifObAtqkGw/FeYxrencgBBFfzuyxPJ6TZQTZR8hat0/X69ySyA7ex/FA
         /VIArztFygS8sbgaIcqOIInPhm122O6BqVZ59Fyl+Z5vd10BGzunCmzeNAzWUXyTI7uA
         ch/8m8q1lzk4D9j/KD944MR4ItA5dfqfQMkKQ2mob7TKHjfOSFStS7ZwN5jxzJg/fT5N
         59IA==
X-Forwarded-Encrypted: i=1; AL+hErFsSD/mpvVrrm5suAhOl2sDTasE2sKYeTmVbiv2ZbCrF8wf92HPYQfcN5Z5pqaEVmsINFtRkTukRnQrudU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f3llnBvLLVypl3aivn/PbG0xMIC/ybohAu6h0+Y4uRDBd9N7X
	2sXXcSALkbMwiJH8u0+v5wNaWAUZFnxjhKsGSYNnvveEPw/kjc7Aw60T/AcmpVCahKkjBONjrBk
	6Nh8WSvHU9fB8FkTZcITwqJ/FbEOfE579HH05KkoGyFaxG/sJL9qQ9dCh9y0n5qSzsz4=
X-Gm-Gg: AZFdTZdET7ElAR63d7YHp+F/jivQfm46MKF071UBXokQICTPIMxCfEdnd3+LeggiOUc
	2evopcw+tnBCtSlRJI44Ec1/BaDlgZRrwy0SzFw25qPw7hkRQ8V0/RUMh7FyNl14eN7c1vJB2RX
	eb5ymK+ostXqoCBAooHRiMYI6QvNXarvKI9ciz+Gd6zLi3xlTLpp44d74u10zpLRiKgUx9jkG65
	TekgM/WvJG/PYpQjCHxthlKXBom30lv2UuEAKZ/iX9N3usqK9ynxv/PBPYEYGDLyCKGOt4ySDav
	4R8kZuJiDdSwkNfB/sfZ3w5Q3kw/OjIoNe8pOVhxUaLprMjglaQUpzdN4MF5bVtPwJNFWi9xNOv
	7P6uLsR6oidn/3E3R06t5N6eJ1zPpOIJr5LAhXuZ2/u7Bk/lp3u8eE3bUUokn45IiX4IsfeI=
X-Received: by 2002:a05:6123:59c:10b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ee8b009d61mr10785997e0c.5.1795605365377;
        Wed, 25 Nov 2026 03:16:05 -0800 (PST)
X-Received: by 2002:a05:6123:59c:10b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ee8b009d61mr10785962e0c.5.1795605364872;
        Wed, 25 Nov 2026 03:16:04 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b03723bsm614271666b.87.2026.11.25.03.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:16:04 -0800 (PST)
Message-ID: <0d58f23d-cd7a-4a9b-9f22-c5ee4dea05a0@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:15:59 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: talos-evk-som: disable PCIe L1SS for
 QCA6698
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, mani@kernel.org, vkoul@kernel.org,
        neil.armstrong@linaro.org
Cc: Sudarshan Shetty <tessolveupstream@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        qiang.yu@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112022619.277383-1-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112022619.277383-1-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06c376 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=NtwryRwz0H4I5a1WLC8A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: Frk4hb971Hv4KTdQdAIx33cj5GsC3USO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX/EDbpfz9tYqD
 +kmpMQUBhS6tbpvy9yd50uze3bbQQHvbxE1HJp+ZMC/vkJVgqmi5VXy7Id7C+x1lP2LWs5nc12O
 Q58FJfUnx8poPi+TJY006Y2puWkNdU1vTcCSHIP1uP8D0nv3hb+7k5EkK58H4nTqC3v1nCPxqD3
 DBNjt+d8SDAwSfvHFJHDZfZ5ue+VQwUfstd+r80o/ysd9KMgZAeNmkSlrhXPARQ3mY4CSbmFs08
 bBcNyt6tFSUheVx6n2Uympwb1A/mTULnITFtjjWHYW/omL8XlaLAnDCiNGVIGVA9uPBsBmGWoM4
 gTA6SVRo3ObdrtP3OJkNzXrs0XKPSjLw6iiigSoQM2iKhM0qscNeZnaQQaT3xOmySRoVEgEnmnS
 3urgFJKyg7M07hcwxdPNhXydDpqnC6A4FXKsuWgRu9b7cKsZ7pHzdqG39BS7qEJ3ySTH4XQu+TQ
 IH4qy6mGhoI3O23hu1A==
X-Proofpoint-ORIG-GUID: Frk4hb971Hv4KTdQdAIx33cj5GsC3USO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX19h2jN77+aEn
 HKZqMuvIwVYgpn9zXaFtZdVWWlUzbrSSv3PCrhboQ34ThL4PDwshgfOfyX5FKGbRQMujsKvmumY
 HYb8v630SXIPaYA2oaOH4Cj9e2alIis=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250044

On 11/12/26 3:26 AM, Ziyue Zhang wrote:
> The CLKREQ# signal for PCIe port0 is not properly routed on the
> QCS615 Talos EVK board. This prevents the QCA6698 WLAN device from
> driving CLKREQ# low to maintain the reference clock during L1 PM
> Substate (L1SS) entry. As a result, the reference clock is gated
> prematurely when L1SS is enabled.
> 
> Add the 'aspm-no-l1ss' Device Tree property to the PCIe port0 node so
> the ASPM driver disables L1SS on this link.
> 
> Fixes: 0f9e6db8a223 ("arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board")
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
