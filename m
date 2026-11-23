Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440485;
	b=mxjA40oel+UKkM3afreU6ASF8XXlFcTivIeB2m5C0dHGm4L5G6lzGrYhouBbAkzg6MVE
	 hvOitcJr4IY+tEc4uQqH4AwSlN1E3biTEjk8HnFEwA9XrDy1V12NAxmNK2G6BGdPpTepm
	 2r+4HSaBQh/LnZLTBzNtQZGr1BTNow1J8QoyOQ7rUal2AjHuO5IH/QmPdJrTZZppkZNJH
	 3F+tUge1O+WDh3Q44jPRCg3igaQFhzcYP/SelnWHm3NIUSIooTweW3t4UMYrqi7EI1SNS
	 24iP77Bs8Do4cSAmxMTqqN6PLwNG3UcY3vqiErA/bzSFh8yZYcQ/i3Gm3UmMH0vYdQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440485;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1v1w7MNAFfdBbxkmqzc73MBwGVULgs/BT1kSk/bAqls=;
	b=hZ+z+Tq8Oy/3p417KfQjAuJJvjO1GKFE/Rt4jY1YbmQvwsUdwK16a7D4zTieXwGXIKN8
	 W207zhdi/tPoW+D+wr7hlLuctKBqwHsrzA+Hi2EWl4kam4A2t+lQ0G6LHYjIoqj2odLnH
	 781jpVR50MtrEPY21X/Do8lnxaJ4NmwVpwwtNbcIJLQrMbiPOnD+hmgRalrsFsStOfEyj
	 jiRpH1IijuWoR+5l9OyBsna1l+0cAkASAeICKoEF7OeOs4sP2TIOizPbKv+i1PelMuS1x
	 8O+dq7XxTIF8Ns7eCkgy8VpGGUnEg5wiIXK+vx0znY2km4EYzv4yRfkbojYAWUpB/Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RQgXNE+q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dSR7jNdx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074CD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 074CD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RQgXNE+q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dSR7jNdx
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL0pO1937782
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1v1w7MNAFfdBbxkmqzc73MBwGVULgs/BT1kSk/bAqls=; b=RQgXNE+qC/2VTru9
	F52+bqz1hcdHng5YFEzD6FunAsLiPVOTJr4yD7UcXEAlnYr0csa6wJjb8rn98hXI
	mkj1oDxF9QrYPp+fobnupeFuVXLW72HMh5hwi5n8G8NtGViBHsX8dABcu/vUlAjE
	6YxxDwHSmZaMlUgocDocpjmoSzR08N0f5B5yeQmu8JSbWKepA9t9vM6Tn9zbV9Ml
	wSHXMxOPViIRARGkINXAe/3FLYVKknbKDua1cL+i8RT0gk6MH+4TpLp4zsKXU3fi
	TC3MRQG9CFGPIYLuk0NU8bcxoeh97lYgywPNSng9IZ9QZHMYdEt+1+xmFWo6cusj
	bj3ueA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx1rgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:28:03 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so2949832e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795440482; x=1796045282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1v1w7MNAFfdBbxkmqzc73MBwGVULgs/BT1kSk/bAqls=;
        b=dSR7jNdxOUQ6jeqUp35h8TW4kAVV3DYTyKjnxCIVYcSKHVryKRdj3Y5bpN/T/Rmq0b
         +Vkh+d2CPoz8e9akpY9FYl8lMK7/Q+AWkkLb4avPM3ZvrulbD7k2I3HKqnfew4BtVBN+
         MFYFSFI33BppzZMyXOSNCnt7xXeW4xY8Dt6lvodIr1XFNsMOJTFFN5UTrKuQn+GXAEQj
         rqWnAni9UwZ9ta5wBBpFj5uSpMx1zjtNV/MrU7XnSTITV1CEUkX1nZCJl25IT37zMRzc
         gWxm/bUoT7qzsAYqtTd/HqN0ShTFvQxJGvs2s1z5RwMGmOW9/7NjxKfX+3Xc3UtBQBeh
         on2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440482; x=1796045282;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1v1w7MNAFfdBbxkmqzc73MBwGVULgs/BT1kSk/bAqls=;
        b=1RG3+HXbIdw642hZtBaWHBhjn+1raVykSaNP/PrAqPMe/K0G4Wyhyj3a2vGvkXYXPI
         5z4Bju0+O1Eeaz7U3gS6dhH2Zw119xDRgoMZcrHA6mLb7cf7mU5daFh0uoKvcFEPy/uj
         ++rIcPGP7tT4ilanqBeBqDO+ky+k1qrpCgYwbDuHFH+VPIIAtMBANKBoBacIanZfRN1S
         TRgxiJSYr63szjXjkdC6FaZD+YA1maUUDRvtfu5zYR2cpHjjJToYwbSM+gY8sMgSS0It
         y3gKG37jreXy4Hn74TSVj7jjtvHtDn4pxrKebigObqGQ8HiAyK79FHdSyhJ1ol0Dwojo
         6etA==
X-Forwarded-Encrypted: i=1; AL+hErGMl+0Sj/EwBXTP3bbjPIciJ4cVZZRqd+DeZCYMebNYLBjzan4xJXyiBFrP2AXtjLRSfMqYGu1++VhAoV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9hXU9tejHCmXfLt58Bhly37UrYfJNuhU/56wTLXzvx3/w72EV
	Te5+yfKB0riymDCv+OaO860K8KB4UQ2yLwJesQnWym9AQMBg1mmmew+LSgbFHCtpj2WT46ZUgQI
	xAW3ZxYnPox13wSev3UrapPSWlmO3o1QJ2A920zIDrXJa+9LExwEFIDM+TGlbvcQBJ2iLpW/EgT
	o=
X-Gm-Gg: AZFdTZdKhLaRD9SLKUa5QEv5C7xnMHdiFjb3nUKFkYRZtg/RV8F8OETN5/G2U6PVfWG
	fWZu2OnEXwmhfPFqi4kxb3IxpvJ5am/tXFpTBorlVAgZe8+j2JfcH0i3/QBsPudmMnD7AE4UW0f
	qgXZjrXG9TCoD/wKnEGngWEmuZgJXj1ilZe4VZzTZhMdCT/I7rnTRciWm7EhJlrlI3r0J0Q+nQE
	0sFc3Pe5QjeXQ6ggxUDpuLfzHAttA4eprsdQlMz461vPMEO+SOr1g45C/FV7Pd+ha+XJICvsiCG
	58Gc3ne0ie+xNQm2Ni7GTHnsx10KQRGYBC1zoMTkJ/VH85pHt/vklbA3HRudeNpwsDq727ME4BR
	n/cg9wcA7/4fXgI4+97gi0dwLCjMIvhOoJ77uYJaY1PHWum7Xu86DAFJTdGrnSlVp1UoGURqSln
	SP
X-Received: by 2002:a05:6122:8c8c:b0:5ec:e6b8:ebad with SMTP id 71dfb90a1353d-5ee8af4a759mr5658309e0c.10.1795440482129;
        Mon, 23 Nov 2026 05:28:02 -0800 (PST)
X-Received: by 2002:a05:6122:8c8c:b0:5ec:e6b8:ebad with SMTP id 71dfb90a1353d-5ee8af4a759mr5658291e0c.10.1795440481691;
        Mon, 23 Nov 2026 05:28:01 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm401690135e9.7.2026.11.23.05.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:28:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Dean Sellers <dean@sellers.id.au>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: restore output registers before direction on resume
Date: Mon, 23 Nov 2026 14:27:59 +0100
Message-ID: <179544047516.57001.1642387166743976170.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118070321.2557621-1-dean@sellers.id.au>
References: <20261118070321.2557621-1-dean@sellers.id.au>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b043f63 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VMBGBFbNl3An4jpmTXsA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: p48XpPVUK4Fo3U7417RSbrcAvgmeBQLd
X-Proofpoint-GUID: p48XpPVUK4Fo3U7417RSbrcAvgmeBQLd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfX5PH4G/bJtbrb
 dik1tBAl65JHKuphRjBV0rdNqtm5+Oz4N4YhMdgWpamdjaQxSVPjfSTuCuCfrLyqdu1nxp2vDD5
 yqBg7KXDOXzCZq5+J73XTuDJGvp3OA0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfX9FnGc2QDU1TS
 uqDJ6aBmjZRKkB7eVD/K2XqWjG0HsVuJ7plSZ7MWpoCAjKf6+GbjLzVNlgwRp6wwD8ntunN+mDe
 Iqo9XiMeSBhu6mlqjR/J8rZ215kh6BYR2IjW5FBU+jTx4A5mOPIHtyHpPNTxql+VRJL5c0slUTt
 GS+lbBT6V/7xMJwyt2BDv1eEsh95EhqJEXksEqZguSK95Cnu0Ctr6BrABzKuuj+QdmyW7dr59X6
 elSR06a43/O5Cl8CFKWkVkQxLcvttkx8PjOb4WZIsOX7RZyiGshaBJVYAI7QhEpyllAEDQolBA2
 ioWtAGCo4NQ70mk3lAXb8nV95UCmi0cMY0iHM1BlI7g6s1PMhIs1i9ROp4YdCMAexnBWKR/wKRn
 q+tN9MlpGVJo+OBqIN3V5mgKW/yAH0+IYwRZvkYUB2DSP5AmzIYKaJakOekXl1TQ/NrA/Yybpny
 3iqVaQN9wl19jA7Q61w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230053


On Wed, 18 Nov 2026 18:03:21 +1100, Dean Sellers wrote:
> pca953x_regcache_sync() restores the direction registers before the
> output registers. If the chip lost power across suspend, it comes back
> with every line an input and its output registers at their power-on
> value, which is all-high on most of these parts. Restoring direction
> first turns the configured lines back into outputs while the output
> registers still hold that value. Every line programmed low is then
> driven high for the duration of the direction write and the output write
> that follows. Where those lines drive a load, there is potential for a
> spurious output.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: restore output registers before direction on resume
      https://git.kernel.org/brgl/c/354e4d6f907ad7a60377bf817c700a674f063044

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
