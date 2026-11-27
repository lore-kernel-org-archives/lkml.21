Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784391;
	b=x8SDHuvswWN74ShvRJEee8mXjur+76j4de9FT0zGGmnwtrLqdJFM7vodIucz7VWTXOGQ
	 86aldexdqLK5zsL9nL6CF/GsT0/7G8dKuQQCai6HtaF2z6a4rnnxrrRrnRM6bWGS2Klo8
	 bGupdv9gk4bky9EN7bsEzUOFUvhxgtezjU8POQs+LusiaFdsBkyvD2+cRA42APjb5O9YS
	 mPXVPpKhXAGNaXxkBV1BA4mXl+r4RI2P7MSBmpObvYcsHuBffyPTXV/IFe1GsBYu5td9O
	 YCLsww46lCY004qBtZ9wKKuoKFEE4aEgKSGXoK7nz+CIhpN8vMxznLf81KOHiaRhCzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vSNCzaWcLz5enfpu2X2uFBb6JUJJ015TishI/f0GKpA=;
	b=lQzF/q8D7c+zI+oneuWIQIh6yNuXn5/9oOxk0YGkJgy9vCCjTt0OgoZVJeG/4PX2siKQ
	 uo1+XlE8c+32bCB71IDOl1Vvl8T8D+HgUrwjmEiyd6Zgu7Vbt70X3icUrHn8wYYwJSBLl
	 dQSSU9FyJH0CyszOFTCiG5vr+i19j+D5zAqKF4DwjeOOgin5BtJXaEYnNOVmMYeFaLtOl
	 nIH7mT8vEoMdVvKVTwI2/NNqJ7L8YlCUVPGp0VT/1xbmhSUo04VGwGR9W1+jgA3j9sk7E
	 OUFTygwWPMAMeFXdUdGK4rPYmgiWrkU7JSNvEBV1QoLqed7K95ZDHvK8qiUOG1ke03A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="K37b8/KY";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYHHRRhw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6DC606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6DC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K37b8/KY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYHHRRhw
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChBSY296402
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vSNCzaWcLz5enfpu2X2uFBb6JUJJ015TishI/f0GKpA=; b=K37b8/KYM3/9P0lE
	T7rJfRvafX5SWfow3CeunNBrcy5sKIQ7Ch3b3UkT05+EftZblwKlisndkhJkuFsl
	6cvfLRmlN88CKklEaqcf1noPuqHB6JgclSK6dvs78vUj4oXC0J55siAzRfliSEkp
	U7KUk1ZzsrtJQFwXRMlSk4JUATfSyEro8FHL0vomdX78eGP0jnyWvRAlXh2QxLGN
	ItGb62cQDeBppz6FsqpA81OD8PIQq3ZYT724ebg/OFp4Dyj2iBdLAoo4g06MjUii
	OatYS9ZgineytS2cMOBp88g7GAlqDNCsmZE2XwHgdIApwryqnk47z9HIpk31TCFL
	d5sP3Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6sgd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:59:49 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so422904e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795784389; x=1796389189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vSNCzaWcLz5enfpu2X2uFBb6JUJJ015TishI/f0GKpA=;
        b=IYHHRRhwnFfzZw+pCqpvgYYdNC/+Fa1cz2yZnRU9O1I8o57h4IV9a4N8PJXmLKQWx3
         iNbUaY6CIZ1Fm6bXctXvL2N6fNZOsFnVii7pvaeMVHJQs/JAXQ9ZkcAK5vzfqSrqXxAZ
         JmN4QehEhP2bjktQaJMF1dlpbTM9t0Xl7yryNpA7S245YQrC0WK71s9UHuWVdPRwAzuC
         iFTillYDv7XjSmobigSZG3R/p42CBRmPSgZzWXNYUiy7uTMo/dEsfWd6cDgasRFBXvvJ
         RACBly79CamAJW63pJ9uUlaoERRfqCTyjKHq2pzM6P3a1kdWkCX9CBAjoXq8uOrcRaRG
         nF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784389; x=1796389189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vSNCzaWcLz5enfpu2X2uFBb6JUJJ015TishI/f0GKpA=;
        b=CqdV9Yz2XD2eQwbkThB+RX24bgNQ9HOz89T0AF3ivMsnRycjoUsQAk8lpiy6kK/Zbz
         L2b6lACZSLaqHR5OnZKmJMrq2PTGRpfC0E+nH3mN0NKWv2M/AdfMx8N/y5r+1l9b1aCZ
         A6gJN6rq9VTENJYWp0D6AALzx06OBHBBlctKW2f17PIxF4ZjA1bFczG6Pi661GH2gQft
         frBh0ncTSKTJDy515MgKAtxG0NbeZ058hEPjDsE4MjWi3o8cBgqpFTrFsSnQO/T9W+JV
         cBeBWVO7n8oFaWTiexWeK7thMEgw02YzV/ONC4fMeP6rDaShLsRO4u8RYoNorTjWK67U
         F6VQ==
X-Forwarded-Encrypted: i=1; AL+hErG6iaqfE4sy8koE7/FusVXVmuAGti+2RoqbegM+btVZqaYhpAMQHtx+kO4WmKHRHwt6SlHfZHrL47O9rFY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sVdPZfmXvOemBHfbUSpNBzSQsGHAM26PhcWL0JGLFAfa/ZHqM
	kioMTVk3s6a03FooDdZ6Ai5YMZ5DVL9XnbVKd/+B9qRKfUxAffRArH9jIJf+rGQdGLh5eWNXUf3
	frPwLNqSf+U0hxR0Qfl30IGIi3iI02p4wK6Yw6b/shvkVcpiA1XDZi00o5DHxfu4M4Iw=
X-Gm-Gg: AZFdTZdvBeo5pDXrEY24f22HuqXj/cYFYWHNNJEK6PnSxyU6SooLZr+pkMM6yGtLcU+
	WRpeZ7N9UEYl6mrm5ey9IAaCiFwdhe5uhlnvceJvbLnfMZuk91/A2j29D+AWPoXuYjL2CLbsqjx
	ysBervL3312CC62pM0kGj2t09S1iZGr/JVYtKPRB3WkodItvHBQSY+vAD4uEudnrbsS3+7+IUfX
	v7abAEPdQeWSmljq6JwIzBW4ymE/tqCi1sbJOgKAqUK0c9cy6R7RolgDic6FwSh4LB5aASIsUfT
	ySfrWajkFpK222a100s2A/n4Wc8+q2GATUc1SnBeycSS4Zfqo8y6/uEeas1GCuyrJKKftj96guj
	pPTUpqOypC8fK0IGdPKAoVPRRhWskYmTvynb/cHawXWUv59LvrM1wsXG4WUO7DBPyqVlIxYs=
X-Received: by 2002:a05:6122:6846:20b0:5ec:b437:e670 with SMTP id 71dfb90a1353d-5ee8aeb50e2mr17023557e0c.3.1795784389109;
        Fri, 27 Nov 2026 04:59:49 -0800 (PST)
X-Received: by 2002:a05:6122:6846:20b0:5ec:b437:e670 with SMTP id 71dfb90a1353d-5ee8aeb50e2mr17023510e0c.3.1795784388390;
        Fri, 27 Nov 2026 04:59:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8db37sm859734566b.35.2026.11.27.04.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:59:47 -0800 (PST)
Message-ID: <7c1d9d6e-91f1-465d-832b-d521caaca734@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:59:45 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: fix GPU peak bandwidth votes
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dragon@radxa.com
References: <20261116-sc8280xp-gpu-bw-v1-1-cfffc13f2fbe@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-sc8280xp-gpu-bw-v1-1-cfffc13f2fbe@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KSwdAmYhwh0dmD455avM6EZzU-es2xai
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b097ec5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=67GPwzqqGCJse-r6Am8A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MSBTYWx0ZWRfXxEplFM8YNzmS
 eWm8KHMzRHEpXOOiSQWoS5uwTKuqsR55EYuVCA1p40zvVv3B6fPMAxkAh50B8EBsxxICiIjajaH
 ncUF2TEh/HJksTyha/KXeOLmel00Cm0=
X-Proofpoint-GUID: KSwdAmYhwh0dmD455avM6EZzU-es2xai
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MSBTYWx0ZWRfX2ylXIh0UVday
 IG4DREcXNzf+TbpIsqHMmGIIaCNqDHyfZC2+delbm9pJqSJ/NX4lfBUgS9i/iGRPD5W8iz259a+
 41gskKJWcS1shxQqletmqCgtbDQP2umcJR2JLJ3KJH1tuWb618Zmr/Jz67OXuVxx8ufH1/JfKsi
 SqIsB/i9fOzbRJiNrB1OHkgqCLsHj9TT0vAR8MDFQSo7BnEQXCbpKm0vpq9fFLGn6VZA6ugtt6b
 eSz5o+rXDEXuoODh6OvdNdk9s3vMS1vcgaZQghZNYcxqJprK82w4jOaU/Ewp6gJ8iWRGY3tSESC
 Tany1LGIRW9ngM0iNvBj1rhj7tHP1OVLlR1plBIWOD7eiacXajrchTfU52/uFK/oFJmcN7mwPH6
 83VVnUWaWsnfoE/KNFUSQH4mef89J+aDRx+g3kVJMyfnztT+QEpvmN0YUdXkC3ckRnYgFVKPmFy
 ZZyXq5bDxwrXEnU613Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270051

On 11/16/26 3:43 PM, Xilin Wu wrote:
> The GPU OPP peak bandwidths omit the four-byte DDR interface width.
> As a result, the interconnect receives a quarter of the intended peak
> bandwidth, which can limit performance under memory-intensive loads.
> 
> Include the interface width when converting the existing DDR frequency
> levels to decimal kB/s.
> 
> With this change, clpeak --opencl --bandwidth reports an increase in
> bandwidth from 23.3 GB/s to 60.5 GB/s.
> 
> Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
