Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954319;
	b=hjzs1Fjs1jpVvo9nZ5TtFOtIBT6QfyQnNMQJ/NkmbWWqolk3CeA9fZph9vb4eip5NqZK
	 sd8eqfLot7BsEjsRhNstDTPgmzuv59BtB1+IytC2/albeNuH+pBA5mKCQMRwiV783oGx8
	 7FruM65TCU2U/nZZY3KJ3Ap8fsV4LIc/WYCsHOaJotL0JBlPLwL4CeC2dmuTs8j6UTWDU
	 WF2xFFfxVD7+2I4zP8aGxdwpvcDtTFXhAYX51S6r0TmkJMIT63SvGd3NLVUCxZx6qkgOa
	 I9zIUDMQ2cI8WLtGtct5Lu83GlpR1Dc6ONc8LKqwzn/SgCnNSZfmgcfpXBpvvcRu3tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954319;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3VeSk617D+v4O2b7XH5K6xESWUQk69Ood8RmJux2MOY=;
	b=2HlvlxUeQlAalwj1XQnVsUXMf4UpYuaK49GhPzoobafHIk0RKU+t47DJxeWMXEulx+y+
	 rpyGWTfXR9bkWv49Uwn1Z74mT59poe3WR7pyiNB5UXamQnt0Puhm3QoaWjOn/fBWDDpiX
	 ODXREfKz75TE/TP4teUco7YxbW+objCvnwZiX7MeFea1pCnRuRghyOqgR3V/oX6crZbhI
	 rZUVAuWGTfTRtnMqpIkE465Vn61lfIT6acN+hlkzKLHYdw7GhQOvlpjHetUHbgw2i4qSr
	 zjPbCy2vKlPOmpNjrI9BKP5TgRE22ZU+ablCRjKGVBpLeeHpicEKgKiGK6U9q37/L1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYlSZSDX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BSHQCXYv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95FA606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C95FA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYlSZSDX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BSHQCXYv
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHKex2o3912174
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VeSk617D+v4O2b7XH5K6xESWUQk69Ood8RmJux2MOY=; b=EYlSZSDXRmqrVoLt
	k/6Mv9GEXrCaVkLfZRE/AyzmzTsrHfaaa73bsqfIDRPTpBEGXPSj+UcLkPl5eO2t
	RuMEb/RjNGoL0GCBLLgmgSRH1mui0KY3nvAXU9nCyxZsDev9Rf0eJZhUwJfSy8k1
	LLZX121uR7DHfXcV4cinik9qNaf8gVJYuvWPWuybCvThfC+/+nw0uFg+UWquTSlu
	KonF1sy1yOh4ITORka+Vml8JS5U9w+45qwRtypsMlcsJrOaDCAEYNOLYMUBtGlsN
	NRRXBEyNWh8m9llvQWXg6qy+giUFUoH6CYnGuoBt9ZTJENvB93Gk626yNuCRv6jk
	S9E6Kg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0tbasfxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:25:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so514040eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794954316; x=1795559116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VeSk617D+v4O2b7XH5K6xESWUQk69Ood8RmJux2MOY=;
        b=BSHQCXYvdP4cUpyh8FkOQX1gEBGOPrBIN162x+RCVRkFUZKL8wvs8zTiHqM9i/t2G0
         ZV7LURdfwf2jmiMERjtPsfvts2CQttjghTxJUnN8wkZTgZ34muSPcTCj1o19ouV0mlxJ
         Anpzjopxzf4ll/YYOw8WMwz8cCFyhYGh/brtKDw3fBpDv0ComnwaPVlzwBlAeVx3coqo
         +hKHN77kvEJlPWnlSC3vZVcpposNMUdbZYJ3maV0q2ywhk2lVOr+LP5ZsHtPCflc9+w+
         hSGL3WIkLb0483Yeejn2Ag8bHqJwbp7R1tjv12BZaw++Pbl6ZMtITjR6eRET9quL6Tif
         M8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954316; x=1795559116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VeSk617D+v4O2b7XH5K6xESWUQk69Ood8RmJux2MOY=;
        b=Yt7nddej88I9yexOJo5rUPpWGad/SaOF/l7/BCNX8AQF8EcClVkgdp/OtBCrDL/NwU
         jSHcNDnytY2KugikNsG+TczhvdrWlht//sM+WQ1jq0XY3OuO71SKYRLN2BLSOfrp+4wx
         YUTPrLUDFEqurDughR/UiqGYB6qcV4rP+V9RWDFpI18BGec4MZMoLC4v2UlCtRMf/nzh
         lwpgezAgAGL9aMNVzqXrybvTXIE5ZbKeZvoREPwAV1d3oY9xh9bv+SSsDR3X5aQBAsFX
         BdrVYe2/7L61eyMFHOsN2AiPOzy7Sk6bowjfVkYTqg/TkLbbXbxlzQn64c2XMbAnizdR
         6OFw==
X-Forwarded-Encrypted: i=1; AL+hErFOWMfX/KxzuWWvVKp0gnV6MlBsz03EtkFyYz3oS5BZGtDrbgNHpoFXJRt+STruw5tb1CmnNpfqjL9H3SE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r9th7RORX1FnRP0QKf2m980A1RK01lRuVdAsEaeZEOPvfS/eW
	5N/JdYUzOBxsJYY7LOhQmRKSBfU+aDZsy6UgUnZloLYBf0vM+momMtY9c2yfX3A/7vPQmOJIGEL
	7R+g63CgH0A2apkEIUHRq0C6VJN4xLG+4AQMJDX9SRhkp5CqeKsPa9207Kumr43A8has=
X-Gm-Gg: AZFdTZe5tynIy0sQdIl4cXt4A77uvRlYPAfQJ/MvRLde517MlP+xak7bWNW5nb+oxvk
	RP+mYvGAzqheObbkwJaYg7cx66ii/vLznARwDROsyEab3jfAHK+bcOjzIn7C/zMTwXlDvrBVTCc
	51xwbHPXK3UGWLx+yP5+AGA4jS0YdDqpFbTW5OyR5J4oubpmWY5ujftmy2TdGtAKTp7JHbMTezE
	tHEtsfzQ+6kCU9pkA+3OLJVu4ixKj4pd0SgjCCDbRMnB7v07QEzFwCYnnRszK9kuBPQ4T/woqyl
	69roSvKqSnBP6L4BUg9YmYHhyBX2Owvi22YrlaQvh5c53KB3yXsIkn2yzyJX9NjF01zmFECr6U4
	a8k6KIp2BtqIUdPj58Nkj0xTYpyfdmePt2qFn/dfj4X0eX2XTtrDiyxNI8djyDXl/hWJnB6iDlQ
	==
X-Received: by 2002:a05:693c:415c:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3827dd05a3emr857611eec.5.1794954316338;
        Tue, 17 Nov 2026 14:25:16 -0800 (PST)
X-Received: by 2002:a05:693c:415c:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3827dd05a3emr857578eec.5.1794954315791;
        Tue, 17 Nov 2026 14:25:15 -0800 (PST)
Received: from [192.168.1.12] ([106.222.233.152])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm1041210eec.24.2026.11.17.14.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 14:25:15 -0800 (PST)
Message-ID: <dbf1487f-24ec-4f52-b8a6-0c63097d7b1e@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 03:55:07 +0530
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
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Add Adreno 753 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-1-a06a6c57bde7@oss.qualcomm.com>
 <0fe6b4f6-e510-4fcc-b1a8-785438fac3e4@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <0fe6b4f6-e510-4fcc-b1a8-785438fac3e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfX7mVDnkpSeTdd
 U289ti/xXqmzSnBKy+MJiL6r83RHEUqTTGVQknx5X6dR0JBlp+V+nH0af5GmhC0VEts3qS8hJka
 z2iabXSpzp8HjWj7LEhBbXVXtRLsx06lPgO3BvWQgJaglSG+cXQaurFnlysLCNk6mWYNH7IkZjC
 pjggg3IpLZF19A5OBHa5EY/KK0aWpu2HNZgaDq7ER4t6iVXWzm7xJw7XtR5A5FkmdRO7yIBBkQn
 pC/PPWlQ8e5KwUz9QaL9IMAuiUiIHqQ74nTmtt10rDatC/pDc/ubOBai0EAd3JOIByTkwbwFzn0
 skD6mnlqMvduY0uiCV9srOufnCt2Ps8ptiRdRxsXc3pNpwswvEWvXtCbudP1tX+i3aO6xs1VtqH
 T53gfJcJMBpVkXBI2aQGjUrOoacS9qt5Xln1KLeroJh16pnqchAl7g4rO8wqYzZstM5dNw7s0l2
 xB2tpkdpAWTOoRNezjg==
X-Proofpoint-ORIG-GUID: a7WQaJPHnqTzY7z_1jn2FHs5uOjSlb1k
X-Authority-Analysis: v=2.4 cv=Vsy2kO2n c=1 sm=1 tr=0 ts=6afcd44d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Q9FbUFTPKQUszr4Og8UIjA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ud8-AEEbLN8OrmE_FLQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: a7WQaJPHnqTzY7z_1jn2FHs5uOjSlb1k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfXz6ida/Baxsw9
 IzMc7JV4qGqMSu5mZdQoBRRodMSa6fwHb+MDH9gOTY2SBD0duf8z48D/k344ZRgXs+8mqe3dnEB
 qu7ATDKslxCBWa58qWBkIA6EKjbGyH4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170089



On 10/12/2026 5:51 PM, Konrad Dybcio wrote:
> On 10/8/26 11:06 PM, Akhil P Oommen wrote:
>> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
>>
>> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
>> the A7xx Gen3 family. It is derived from A750 and shares the same
>> IP-level configuration: protected registers, pwrup/IFPC register lists,
>> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
>> record size. The differences visible to the KMD are the chip id
>> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
>> firmware.
>>
>> The Nord primary GPU is the same as A750 but has a different chip id,
>> so it needs its own catalog entry. Add a new catalog entry for this
>> GPU and an adreno_is_a753() helper. HW clock gating is not working at
>> the moment, so it is kept disabled for now.
> 
> Do we know the reason? It seems that no other platform has this issue

For some reason, this is causing random GPU hangs. It is still under debug.

-Akhil

> 
> Konrad

