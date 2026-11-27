Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789780;
	b=TzKujC/AVGSMEyMrP1aY/gvk8PQzLKCkIA2Ve1LINd8IS53V9tDMXDFtpztnbVAqmvMd
	 OejCu0qME1jrWVGSrufAD/lV4D9VFkIF+F9Ci5lOxj6kZgAb+qvqCv3L7Gl0J/EVzNUns
	 3sp0T1EwiMPG4QZAS0uLKTT9/y83FqxuByXWJxOshq1zftE4rwrRiOeVzTGFTHaYF83gZ
	 uGNlxt0lMWgKrcIhSP2mBhOFtoYaawNYk0A+Dzh3tpmpkKlemafjFE7iZ8GjNi+8THAK7
	 3hfRJDCchUQ6gk+xu+YDMPTTJa6X/h0aaJVfqdewQMRU3O5wbt0wLYwYR18KCFLtumQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yiGZwT/Bg5TvVGfD5LTWL0XbZSBeVdRVsOxaeXrrotQ=;
	b=nhEPdaE1V2XAb8x9pHC+0fvHIFRd6MRW6drOk2IynTvT9fdDHr9JcObHFQTPRNJNZbdl
	 78o8bDmUOMjWEY9DwKscT7cNY3/9SmzwOPWs/YYmRMR2Zyzr/R7iWXSR1aZSEqPSeAfRP
	 HxIBbs5xCCXYPK78nQyfZwcSWA9QYt0VhTtTxErsANagTjEr0wMeDeVxEhzUgqgM+herV
	 DwEaX5nuXvVHQIz+ZijRtGmU9EfDFhpViLZest7TANbmduPSVvj1TAE0uWI5T53nweS0/
	 HFhmGVcunSLiPVf2lhcw0dU7zbtZTZq3ki7q/naIppcg7ixvA1wQ2md81NAx86crcIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="frmY5Q5/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PoO82paV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1B8606A6AA
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D1B8606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=frmY5Q5/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PoO82paV
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1djY1971467
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yiGZwT/Bg5TvVGfD5LTWL0XbZSBeVdRVsOxaeXrrotQ=; b=frmY5Q5/Hv73oFzh
	4JN3ioKtzpQFVghVg2v9548Rcgh+YvrUYwJPhSeOH6hrBGW3u3r3O1NvynCbSvVu
	MWom51hfpgCUctmURY/zzxET8ztHqI4/G+oJfqY9+Rmz4pL8eOs4Rx0iZNpkmRx0
	gyhvtgCj9bdze/nNIhlefKqE/+26DkKQztAfxN9sgXR1W3HU/5zQt9VyqExmFKGJ
	C3KPjOCODnhbQMe95X8VIksts5T5JupcjITJgkpMXIVG5b0sSTDNf0S8bclKPZAi
	ltnXVO471hDorpL32gJ0uavZtzJWjFTiahz4gi7tC1pMp2MXotbgJaFyRhRKEduf
	aOuY+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55uc8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:29:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-945e8a244bfso87100385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789778; x=1796394578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yiGZwT/Bg5TvVGfD5LTWL0XbZSBeVdRVsOxaeXrrotQ=;
        b=PoO82paVdPLZRAZeYh3X+7HBRrCUFj1amdIUq+4TIGg1GCmgNTTn+uiPQi7737zzxv
         SYRkR+UrUR2KFFv+McNlB+FvjVfuC5FJMpWxDt5paBv2zcpVZo3Zh5SlwgaPmA1onrzr
         6HjgKHCNyWIMMcI7RnWiYaP2O9/LI9qQnKPoary5E/C0XM4aPkYXxhcAfXDO+km7McS/
         kJKoPirjhs6r1nos3zSZvEBxF/uSohUadBXwbScRWJPmMfqrc4weIwa94ISCkqC9sNRr
         b4mAX51xj4xXCyDvB5+p7b4a8tHu+M5EKxI5ysgSEBbL2jwCCGhbYRBkBRbNUiGnTSJi
         pAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789778; x=1796394578;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiGZwT/Bg5TvVGfD5LTWL0XbZSBeVdRVsOxaeXrrotQ=;
        b=QsL15FLvwUANg2uMQHlqDMBRYUDU9y5CPkkLqbt064Xipwa+fnyi7DlOKyAiBo+j8n
         NB7OEWFIvyIl+ovyJHyvZ+8OLH9rpMdp0bKB9AgS7zqFHuow8U5Lj13P2T/uO/hFdawz
         mRGsG3sX6RpEckXMliDV4LImUc8V6FVffhkvjQFqYOi5AQGnfbQebkk1HBsz0nOl/fKM
         aQlZJsdU0P4vipukzQB2+nTBk4bOY6v7tOShaCSpM39/i3fz9uqTSMifOD2Mduw2apY/
         XEG/av0NatXohcRdFY6NpsE54QWBptg3HT9hTbyyBj/cMjNHUIM/GaP3ZzEJZDUw6ZAA
         mXnw==
X-Forwarded-Encrypted: i=1; AL+hErErz0mVLYXd1Nsow78w52rwdLVDFYKhkrN6Q2HGhiaL0jZCccU8h1feuUV+sqABulJ9364sQzATw8nGOnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/MjeDmpnQXfL8K5nbkjObUi1Q4tZCRCv1lbdSlEZzp5Qg/GEN
	yMXUF/cS9r08+UeoQr+6FndraJaoApmjxe9PNiIRoj03TKHuiKWHfNnlAspU/FpgjWMPl73Z7CH
	tud/l3L1fkDDd9lY0H9YnSfrXKsNXI+ZxqrrpIll2ChFCmdTMsAaCQPvRUBF3V38+5ME=
X-Gm-Gg: AZFdTZezURn2vMwuU8PboTlbolDADLbURircsNE6NZt20rIcCYttazW8eOofJSBRsEi
	9Vnk7ekOn4PrqT+zU/4u0Osdaj/9vuDuIM/8Z12KPmjWgcvUyp8CemZmbJappaItL0pLl+pVyCK
	qqUEuwPc2qIn7Q6iZjCm4HkL+AFJxA/h5soyzGv5idbh5aaHPt1DcgvlqUN+TSYEMbXZIL7Cvqe
	X0S1Qmi96+rrAq3Mcglszb6ZCkvfx4uAm922gEPy9GKhp+AKTmwY1dSueHC5BSuENuf1agiW85m
	TNOJ+aqd/7yV9bhUgsTuONR5nKEAQUGSurar6nX6sRP/+n0KQRdsFg2/Z2sqMInMChzM1l+envm
	aHY1PFGECnjgNVuzfjnNo0OGrAYX2BcV2zSFRc+gnUqL+UUP/Gb4hV4raV+0DErlGST7LFiY=
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr4319169385a.6.1795789778387;
        Fri, 27 Nov 2026 06:29:38 -0800 (PST)
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr4319162185a.6.1795789777741;
        Fri, 27 Nov 2026 06:29:37 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad01afbsm876223566b.5.2026.11.27.06.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:29:37 -0800 (PST)
Message-ID: <8f1d775f-2418-4763-83bc-2963bac8f5ea@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:29:35 +0100
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
Subject: Re: [PATCH] drm/msm/adreno: Improve AHB error messages
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261111171417.249152-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111171417.249152-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXxZ2whkJKq/4z
 hx98r/iJkdJWjnmK1iSe3kabdH8Pxrj3XiHTi8S/bxHGN7HZu9qCRtAJbWa25NqtF+Y2+Z4WUaX
 I5Tc5BXPqWawTZUX+tuVKRzYzEXWxOA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX20LyHrLR2GZn
 23YFPK8kPNzhv5tdMxk6RFvn+MEf4FsXpz5L4VYx2HJteGUcXb/4GE/aUju0MQbDUDE0GL+qqtL
 8AjdwrjURADxD4Lj/zI1TUd3YGJ08H8kgVToU9O/NMDzIJcd/uS7g6+4k3qIu6hgDggRn3KuDo0
 J+ElHT17YmVk9zHX2P0CW46aH9/MTlR3h6eo+B/H61ds5fcSGCx1AiB/UZRFhb2wrGKl2M/xMOL
 EnB/FDn6eFUDW2lqnZAHUNkZeeZLUzRz17Uoca3lXuAuG9AxcSBb7KMO5yDFN69bKpO5a/7G8ht
 qe18//JTTcZ2y7zn6A5Kui05D4PkF5cQ7p0svGlwtpsI05go8lPkkHTqWFlnsqZnODl2CldZjJW
 2K2zDLLR/rBSmSVoAmO+1q8xyuqvGYiqT3I8fHLTpUTreuOZcs1gG3O65oz3SAucLc+smD/NQd4
 sUNfYSDfspHoHTWQcOw==
X-Proofpoint-ORIG-GUID: hFFXyddtDVrIIjUeOhPlK49UWCo4YTnH
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b0993d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OLKaC8uE9iNfMb6uFF0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: hFFXyddtDVrIIjUeOhPlK49UWCo4YTnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

On 11/11/26 6:14 PM, Rob Clark wrote:
> On a7xx/a8xx we can get some details out of the CP_RL_ERROR_DETAILS
> registers.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
