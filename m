Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872258;
	b=nwdoGDVbPR7+9oc8RT8klsaYcVdMuTK8IFnxyeQEzKdD2FUu/MgNNtHEW+W6VhoGCWdG
	 lngILFaaKQ0znc6C3lW+QPdp/Rqu26RuMjX/sQjvnNzJtjtwb3rYzNXuA4XLp2KrLxD76
	 KUddmSRPsqq+ZRDxnIJsbB/aYvtGVTBpPsa9XZ9kdP5hklr3HNJF4Z6sEL645HaumdcCT
	 HZZV6NwW0TqCf4gK3krET8DyYzXUSGANwNR6G0e+aRjkWBHJbOEhMMJayn8zhHoctCq9z
	 CxqIHu2vRy6XB2l9nRgBpGFDWQZnrpLRQaM/IK6j7dt+Y9O2FEYVf7xziPfcfuD3wqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872258;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Cc:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ACwliXaCJJD7FrV5x6q3pmOUcm99a/XLmBi1r3FE8HI=;
	b=b0KK+98/37/fzzy38q2cPN7sgSRl1uJeRbcdC+VA+yyDf4z5YMfN4vE1BttpHiNrlWDt
	 SfZUFFjqvUyLvHdFSNBYG7s0lxXnNDimn1ctQBKEy7KTbRlD+JFsdWKqPnC7L7wedrO97
	 FPdyIMSV75zxMU5o621txUQJTEGoSsS0hbczJA34fQ/RaWlwcYwPTDjOCBxIlNTQ60ear
	 cOxKrX6Th7LWdJMT9yKpvEPa/iMc8HcD7Zr6+UOP2SU3OItdBV4rq2iQ+wCQ4/dYMIQIx
	 a7v9rRaUssMVq39thezFFyMPzN4Q6aFec4gmXpq8pLSMJ9POjll8cdmX4lDd+JW7rQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+lF8yh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PHC2Mk8+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31361606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31361606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+lF8yh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PHC2Mk8+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ASCosmc994172
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACwliXaCJJD7FrV5x6q3pmOUcm99a/XLmBi1r3FE8HI=; b=Wp+lF8yhgd5EagvZ
	ZlGochIrvz1wwGt2IFybyBygUZLyxb1s5Z9tL29R9F8xYL0jjJvPMvpSgwZixvwr
	K+YsVPDZiSgBIg8eyaJECboDT8pLKLN/J8NmGNTXCRCRSDqVHf6TvyhJwvqEPwuz
	BftIJlqseFFJcHGD5/aEqfMWTejPGPBM88iqXG35/t9ZGX9qI1+siL5nkYoWZS9p
	4dZyaDSm5rt3jksBn3slUfXoKvvEh3QOlj4S1GFfPjk+HHFUyRsAr2chCeb+JbsB
	iqDLAMbJ2uM7SBylGs7Lm8R/5KDUvrAiJ4geFq2rkjJVbBNFM1jckn5eU7f9il74
	zmxp6g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7q630xe4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:24:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386b8624cf7so1546488eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795872257; x=1796477057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACwliXaCJJD7FrV5x6q3pmOUcm99a/XLmBi1r3FE8HI=;
        b=PHC2Mk8+s8pd8pdplxfbmJWFVIddanZeM5KSzRzhvWBr8vTviZn1Gw4HiJjo+0cuYM
         JTsYbybIV5aTEs5PE2p+bBBuFkbQIcPMU/P/ZvsuW1+0+v0kGeNQkOtYNNH1BTF2khdg
         BI+YMTSfZD6lK5+74mLKHHIZta2VyX8+Y2rV3q9pSZDkf2/YDdZixWeydqI6nqtW/9Q6
         iVG3vYkX1d27uJroMmjjwRajlrvGknXi1wsDHCW1Wlt5yTy0aZbnpbc/eilq3z/W9wAL
         rLwm6UZcBtV+CJylo4dqnzyWW1EXKTEZc1LJWNtMOn+b7SreUlAhefsSYxO4ap172zWc
         5ICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795872257; x=1796477057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACwliXaCJJD7FrV5x6q3pmOUcm99a/XLmBi1r3FE8HI=;
        b=KsdZIf27iwn7HBBI9rT1QY+LeGD7GLB6CRr+oLRoFQsAeAlXfvCpgt4Cb87SwDWFU3
         CI9EXRk5doTl3LtAbtnji4cOOSNUdHqnr1VNBNxzPfG9D7CFl6Ly/1MpbUudWA/809tX
         ZBZjxYeB/V6NCiH84o0AAT7Svn+C1rGchR9MZgabtE8nLLCBxyte30apexnlwLHzMczD
         ZQomQMsHNvlmJcYXPhZMnQZSDjhilxSt8MBdxhDIODHcvUk2ipNjfiSoCtvXQn8qFyeL
         m0qlF/uEXeosXCsaPIGm3RGwbEgyqT+2wkJQoXfUMgx4vMTtZG4tHFcAyoZtd7tqVco5
         61TA==
X-Forwarded-Encrypted: i=1; AL+hErHktgq3SGZxD7nZ/ri1RHVgyPgj/jWxP5mjr7+M3zsAUbVvl0JE3e5VUX7+z8w1oQ2QJ7+5zL/K4IGdsdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GeJgp3v0YSiuy97bR4OGX2B9F6wc6lN3uNjshZOtPdmfV5mSk
	pJOvRJHU9rQ56GLtoizjMHaHFQnbDeWF0N8E5qFNQhlycRk0RwXl16bgsxgeiubz7FfIrKb9Tol
	EvhX7TRhMGJaB52Q007zKTehJL7hZ/h8y2IvBD1zsjWVnR34M2XBcG8q5ecQnQrdc8u0=
X-Gm-Gg: AZFdTZfF2NOKlTROUMZ3kapJCRy5cmdl6oYjSg/fXQtp7mkE5weVNjKFGg9unm+KBr/
	UaSSlc0U2B3fQ6Z6KB6yKyMLHsg1oo7ShlMTJqnmTu2GHQHXFr51Jyhna3h7DaMc44m4dfS8Z5v
	4PRdwUUBIX8sZsUlncWjx3Cw0GSEAr2C0N+4+7Kwypm1qh9gMeP0KDIKgmV3Q17jtVfDOBtqDMF
	wjgn2uI0dTynWsOazEq/M8kRdUz1LDQQ75lbLB3waQz5EGbvh5QhLz77ijoPPsnyYhvcK88nh45
	NhEo0hkVmvDmlE+/Bq/X8olMxtqYg5clRTiC2lMPWSB44AvE1KfmGr8rx3AZNznJmcW66icJDeR
	iplJ9sVB3KKh0e41u6zllKvy1LXoFytVKkCFXVqzve6TqcADarvuX6IbfiJIsOFszLYXcsJWcZp
	m4pPSNgm4Pzk0KMndvfw==
X-Received: by 2002:a05:693c:42c2:b0:386:bc8f:b603 with SMTP id 5a478bee46e88-386bc8fbce1mr15633668eec.38.1795872256485;
        Sat, 28 Nov 2026 05:24:16 -0800 (PST)
X-Received: by 2002:a05:693c:42c2:b0:386:bc8f:b603 with SMTP id 5a478bee46e88-386bc8fbce1mr15633653eec.38.1795872256027;
        Sat, 28 Nov 2026 05:24:16 -0800 (PST)
Received: from [192.168.29.140] ([49.47.242.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386ffc4ab65sm269036eec.22.2026.11.28.05.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2026 05:24:15 -0800 (PST)
Message-ID: <bb9e02e9-6738-4aa3-94b5-817d01c3a747@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 18:54:08 +0530
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
Cc: karthikeyan.periyasamy@oss.qualcomm.com, jjohnson@kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, rameshkumar.sundaram@oss.qualcomm.com,
        baochen.qiang@oss.qualcomm.com, quic_cjhuang@quicinc.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com, quic_bperumal@quicinc.com,
        kvalo@kernel.org, quic_pradeepc@quicinc.com
Subject: Re: [PATCH ath-next] wifi: ath12k: drop decapped frames with a source
 other than the station
To: Julius Bairaktaris <julius@bairaktaris.de>
References: <20261122210809.2087836-1-julius@bairaktaris.de>
 <e019d2d7-de8d-44aa-8fdb-e6770938c409@oss.qualcomm.com>
 <20261128115312.428133-1-julius@bairaktaris.de>
Content-Language: en-US
From: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
In-Reply-To: <20261128115312.428133-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDA1MyBTYWx0ZWRfX62KVAWv6QuX0
 rCCOumExUKp+KBiTCEezySdAA3Etp/wzvh0+Mm//Ub84WgdmvqvyKL6lmDyaWrmXzY1Yx+6HPBg
 vYqn320py9cwd1BMKzI/MNIEnZnwhK8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDA1MyBTYWx0ZWRfXzNZ2haEekRMv
 83tFB0uGfROC2bmNnptzMKrBJANADlAwOL6tWQnR32gFbd63kYNGp5A5RovPMfaS4VRolm4OROA
 j3WZcISHV9LrkTQ3BO12VPRtZHY1F30Gm8/lWklPR8N207U1uRdzaKqqIJdtbNDNu1Kzngdfcs2
 wWI8wHUN+JNWB/ECqcZNIMGZVl7K8zOI47Ab08ld3rKxlocl6naWGE41yCscX/N3PZFCR8nader
 8LM82C4elju+gsbI0/j3L8eTwdajyh0qUCuKUjzJ00us7+I1VLEAtJ/O6UrjoO7aOMmENfgx2GO
 Q+S91FhGLX2mPmeeCXMcdgRUa6/1z4023j+4IdbW8TqWuI01zT6g3DG7QePwyk0gO3NVBRwPT1N
 akpCLuUM3DRG1q/wSQLS/dfjaSVcZmGmQ1F2+kltGr3Dhbj80UAGQ39ZyOQXF+6nf+9jucMsLx+
 Q1wWeiq3EVo9FHD60iw==
X-Proofpoint-ORIG-GUID: 1AZ5EAk3hJmqrNoHmROVDqSk2K1MdI5z
X-Authority-Analysis: v=2.4 cv=WtO+otfv c=1 sm=1 tr=0 ts=6b0ad601 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=gdHwamPtuzoUoDSM7zGmJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=f3ww0dcz35mcA5LW8GUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 1AZ5EAk3hJmqrNoHmROVDqSk2K1MdI5z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611280053



On 11/28/2026 5:23 PM, Julius Bairaktaris wrote:
> On 11/25/2026 2:26 PM, Karthikeyan Periyasamy wrote:
>> Can you explain the test scenario ?
> 
> There is none: I have no ath12k hardware to test with.
> Found by an LLM review (Claude) of the code, comparing the decap path
> with ieee80211_amsdu_to_8023s(), which drops such a subframe.
> 
>> How the user trigger this issue ?
> 
> A station associated to an ath12k AP with Ethernet decap, without
> 4-address mode, sends a 3-address A-MSDU whose subframe header carries
> another host's MAC address as source. If the hardware writes that
> address into the decapped header, ath12k_dp_rx_h_undecap() sets
> RX_FLAG_8023, ieee80211_rx_8023() delivers the frame under it, and the
> bridge learns the other host on the Wi-Fi port (br_handle_frame_finish()),
> so traffic for that host goes to the station.
> 
This frame report as address mismatch error 
"HAL_REO_ENTR_RING_RXDMA_ECODE_AMSDU_MISMATCH_ERR" in the WBM error Rx 
data path. So no need this code change in the regular Rx data path.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

