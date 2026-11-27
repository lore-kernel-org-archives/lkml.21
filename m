Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782778;
	b=UKzpo4V/MkeCVhR4GIpoDG/arvlQ8DI8mB3fXmxkPporGaXgDsm3kc0YIG/zzQ/OsVaC
	 Qgxaj47BQIyNU1ElbOvpzfb2pwaEI3XfIX7lueOpxCnHzqo932wlPTMmEQRHy6zMphcol
	 kug2XYnISIm/9iHTzzDQSYljg1TQ5+9GhOqD0OmZIsYWbHVFmIpvE6Xqbl+hPOJeCU7Mo
	 xtnNcVcPgmdzUoLiAe7Fq3YESK2ovnLQ8VdUHSamd9rzdr8qlzuTDZCQSh9h2moCtPpT7
	 CY+RP5N8IVfp5no64F1CqKTn8Yr+ena6i63asbwXeh2HSSFcTLR0BnOKdWupWaXKC4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lY5U//Y1MoIFQB+NMq1uCHmr9m0HETe5o13kE0TkWj8=;
	b=W4XiL68u1ZbdTj1R0xb2uTGccJv1xnNAMqfpdXH3OpaqDesiKQVjMGJy4KpG//EAF3pw
	 8nU+0Lavj0TssVGKV8o/UX9+BNvUMRU/Ul7w3K+b8JlTnzORENS93+BWSuB+fG8gQykpy
	 XGbe4ZtjJANBr1sPHWk7B3ail0pPo21lZM709omo42xpw68UZ6pv+29XyhjAfV6ELn49r
	 hXIF3xYw1Ohvkak0c3y+TnHxzDzeXeusbQ03jXeZiNvM08JzI3Z744uqPf6h2TH8BdWeo
	 ho8UhpMoFgOmPvHQ/qYh/Vtfv5Et4VaWAHtKr4mOCednMkYU86mOlcimqz3Tz1ZK5gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avzUtr3n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OeIBG/JF";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7F8606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE7F8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avzUtr3n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OeIBG/JF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp7gp1962127
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lY5U//Y1MoIFQB+NMq1uCHmr9m0HETe5o13kE0TkWj8=; b=avzUtr3nZXCAa9A4
	fuB56zcDLfz6KUeZQLgboRX+pXGjRywxmybliYiRv1AQ1m1OaMTk1ukT6MTqP2k3
	8Cq04pcryUblS1gl/0bA0cjsRywGwNr6fVCXtdFFTizxtux1LgyM4d046TpQcXv5
	U/C9IjuAFcTkPJBPuvNzoqrst8cgOIzZUPORcgcwgZU44MgMiBZTe+aq4EO5PzEm
	0NFoBcL4SrhVxFD+PjSolfypgrZ7kRg9yA7AXdRGauPAKolxGeXNWdpGwoL9dnut
	joEqwxaLezUrTXKMCdKawSX1vSewY4glR9e6ZzrCcwp6okqlHhzs7GAIbMOXJt5R
	iQwijg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hu0x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:32:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3854627c1c8so10645882eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782776; x=1796387576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lY5U//Y1MoIFQB+NMq1uCHmr9m0HETe5o13kE0TkWj8=;
        b=OeIBG/JF02GMhqHdhmrrT4r/7VlBXDKPu1kCWAeiEWbceJ8g6SKLAufZ9v3Lg6BkiF
         k1eW/ltEZUu0Hv82DZPFQMz8EjPDrvwSIsjRhcqQL+T2n0xMyTJZFkF7wD2CqScMBK1j
         lba5WV4o6yBJpIPG17SVTHQvNWI4IGVEbApUP18OXFdN1AW5D030CGTI1ITJfTNAZ3C/
         2dx87z4xUNaNMWeqXm/efpfPvN+SbFPU6/t8t9bYhD1W8HEVCTUQ49lVdwFrFhY9NnAj
         EXEwZ73VjqCyP93liR0yNc9NW/cjAgCJnelKe5/Bm0amdr1WZYJy/9rMdjuPhm9FSzNv
         Uz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782776; x=1796387576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lY5U//Y1MoIFQB+NMq1uCHmr9m0HETe5o13kE0TkWj8=;
        b=SBoog9d4AudMttHidKGHSKPHQukBVID4/F8x9yuXePsupcWR+WCFC1xfhvwF9OFwJq
         /xiZylWC9iDBDjroe5wEQIbbtZNOf93DLEmzastHduEXLOtCR5Dr6XbpvlPaPueZcPdz
         x4scWys0h4JB/1Pu0Urc9O9WQ/V3X3xJifCmWqj3XjVvv8RmcGvWbf6UTorKce/DXLJB
         i5QWg2t+IQpbVkxAicNSxxpX7rkG7StVehhbzd0fX40RGmZwEofUCV6LEy14eaRRxeLj
         lJ6KYceGofLiBprm0sniBOqxjL/jwxthquye2zx3grcGgZbndxfkoPp0bfYebN6dn3pX
         dovg==
X-Forwarded-Encrypted: i=1; AL+hErGgoGJiSYs+PxcOYu0YsR1P7jpn0rU3oHYZEDeVa3UW0QT3bRUXVjLu3LT8X3OuAp3q/fRfalUSsDFWPB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8EUlWiNgJlk74jxU/53kE6x2J0o+nZZTYZ6i9WaRxegIVpKAL
	8n5egeiR0xbLLffVEHrAK1WPEFytBIE39JvPPpLroTAGlzm90gB95PRb364Od47679WP7qzB9cE
	ljBMQWFc4ksL1VMDfJa+89nmo1CRJFR4l+47F2lrBv189ELkZN62d/W8de115o3QlS8Y=
X-Gm-Gg: AZFdTZfaArgkw/aZbL6G56xJmLuVMd4wKcz1Iu+Sp6Z8YRiGS+d86eO87c+mo2xy0cW
	iNSNWjXaJOQxiSNRjWLx5I2oNXTXBlnQE/7YI8yiUXhsT9fgcXsyfg1BD1fxO81x3qUbi01srQY
	0H74cSTqE5buWE3/4++Oi6f8Imu1BjDTzSp+mYztLdQ91p5nAmMbN/xUiln+kKB3GgMn87ddrT/
	gEeFGg3cgXfSJbVhUGsg7G6oUDl3aFVCAov00AyrXUsxxpg3iHcGTkoWpFKVLQXcmweHyiEGZ5s
	TtX+FoCY8hZtBeH37EmpGb41tW5OtmNBvhaGU/KX5wd2GRlpAXL7NH9dWgkxKIJlWCimpV4Tgoi
	sUrv/BdPFrcCF0MkMAwqJftMeEqlPQTvYmJKG1ZOI9fjmYE00dgmzkI3Xo5EbmtsiEDMWsUk32e
	Y2qH7o
X-Received: by 2002:a05:7301:6187:10b0:386:a193:7eeb with SMTP id 5a478bee46e88-386a1938b8dmr19602456eec.30.1795782776490;
        Fri, 27 Nov 2026 04:32:56 -0800 (PST)
X-Received: by 2002:a05:7301:6187:10b0:386:a193:7eeb with SMTP id 5a478bee46e88-386a1938b8dmr19602440eec.30.1795782775925;
        Fri, 27 Nov 2026 04:32:55 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm39048211eec.27.2026.11.27.04.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:32:55 -0800 (PST)
Message-ID: <576033e7-e52a-4ad6-a594-d64b3fe9987f@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 18:02:49 +0530
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
Subject: Re: [PATCH v2] media: iris: Fix out-of-bounds read in timestamp
 metadata fallback
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Birk Skyum <birk.skyum@pm.me>,
        Deepa Madivalara <deepa.madivalara@oss.qualcomm.com>
References: <20261117-fix-oob-tss-v2-1-8bbf753a4ee0@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261117-fix-oob-tss-v2-1-8bbf753a4ee0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX77F1Du0xYJ5E
 tTrXPyqohvb8S/bkMH5wfyXw4lJvhbuWg6iBDPdvPJITT6pKIL11/SQkrOk8pS4oYIyQhGkSLAr
 JPICcOK+gAMJhRBbXR8OWeUWkw2V7+M=
X-Proofpoint-GUID: GcDemJrfLkFQsyKV-S2FtLPgx-rGzOVV
X-Proofpoint-ORIG-GUID: GcDemJrfLkFQsyKV-S2FtLPgx-rGzOVV
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b097879 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OTlaKp2eM8LF8brwo7IA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX7xnPrt1Zc2+h
 rG8iZ9iFdXRlZw+AeOkEd4i1F/X4owYTf6VJOKEA5sLZ9jgjhpsKR0rNjQJvKh5oMIqdwsP9V9p
 eQJi1nMtraMzjjWxNjpcczY+ls5Udz9XZbjvs8zbwgH5vcxlwakCj2FvX6RZl9bAjCB6EWCGzA0
 VgpL/N9Xu/iFGioQQKgMSNkPSNX9U/AvsnfENi+eRyfz8Y7qEnpoG3r9G/4ThdMOiEF5XtGLuM6
 KTQvBHO+CInctoX4T0mFwUGKy67W07ejg4L8ur0BIa9N99/UG7oS7NMsC4KfiEba1OchVSXX9H7
 paqRxlrytywVG6Ua0D/d9jxQWkzHxLxPfONf26oQkbNBhvrzmVE0WukKBu1U6EkJw+meK6lYjVO
 yHp/VM6YDUm95eEEVURKbAN81bxQ/y3gsGO7pYAlatZXt6ctPfwCknZqOcmSAG+5CG8a0iFvTUG
 ryZMc3nUZWlVhqadU4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049


On 11/17/2026 5:13 PM, Vishnu Reddy wrote:
> inst->tss[] has VIDEO_MAX_FRAME (32) entries, so valid indexes are 0
> through 31. iris_set_ts_metadata() writes at metadata_idx and then
> increments it, wrapping only on the next call. After the 32nd input
> buffer, metadata_idx is 32 until the next input buffer is queued.
> 
> If iris_get_ts_metadata() finds no matching timestamp in that window,
> its fallback reads inst->tss[32], one entry past the end of the array.
> UBSAN reports this as an array-index-out-of-bounds error.
> 
> Advance metadata_idx before the write instead, starting from the last
> slot so the first write still lands in slot 0. The index then always
> refers to the last written entry and is never out of range, so the
> fallback read needs no special handling.
> 
> Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
> Cc:stable@vger.kernel.org
> Tested-by: Birk Skyum<birk.skyum@pm.me> # Lenovo Yoga Slim 7x (X1E80100)
> Tested-by: Deepa Madivalara<deepa.madivalara@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Wrap metadata_idx in iris_set_ts_metadata() instead of fixing the fallback read (Bryan)
> - Link to v1:https://patch.msgid.link/20261017-fix-oob-tss-v1-1- 
> fb86f4cabf65@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/iris/iris_common.c | 4 ++--
>   drivers/media/platform/qcom/iris/iris_vidc.c   | 1 +
>   2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
