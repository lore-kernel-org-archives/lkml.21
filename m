Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702614;
	b=282ZDxTUP2ShKLdLC0MGJWUO0Sa8vvsbvEBXg6EqhCzUZ8Z4rquWPVjL1x2Xm8LoZCpo
	 cq/Kv3UaJw2xK4nKHPsIV2AvLCZlEe7Z1yW4/SYBczXCnb8dH7KUwLiAUg0mdAJyGhgrP
	 t6Ahe5XLErb5e7bCztHB/y2Pj4zUkboGSlROXeiqWKmcOMSwSg+Flhhwhc7KzLpBcsInW
	 AnnoKGU7OmNFwXVftgywlbD8Vovied1NcIR8bxFcm66iQJhNtPrSKyOhzgiY9PD3K/KMe
	 Apdbkrlbr5RUulsrCDKziAQgcutw95f0345TIzCGO5IdjZQGh5rRUgKd8hWi3yA5Zzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=81VUyM9OyNKUT0VpP18THwSLW7N2IcKNAzwm/Y2Nd04=;
	b=tJA8hpnu+elYJ0rDgI1xa2czY3c7V543Dx0yJ/u2ykdQRKBPD5Be/mbKgsdjsttOHhNL
	 ih7BTm2zsZz0q8TscuGC5NkEtElUm/mb2cSfU0ftuN8YY9vGhENyzBhO9biprPlXp3nY5
	 ikvDKk6aJ/X3371O0k/Ix9WG0xgWf3t2O5QkI31s3iBNuwZS8UP9MyhKWQsXawsVdAXEc
	 nwW5B/iNP+qu/nW1SB/V51G1sa+evukNttIiexo7i6a1QHnPj8W+NhqQ+Y4cFhbfDSkJr
	 wHsBiBEenCZe/PZqoTv+cE1Z7tIUs6mcrdmo4czFj1J6wLOvkex6gffXwXGnwljKJ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GWx0JCOG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTmTi2HT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C884E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C884E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GWx0JCOG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTmTi2HT
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVUEf2911764
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	81VUyM9OyNKUT0VpP18THwSLW7N2IcKNAzwm/Y2Nd04=; b=GWx0JCOGicO0i4LW
	G4Tew6ke7Z38UvBMWbvtQ0nk5TvnngWUI5xdJJdAuoV7XhvJzd5cHgrU5HjfBEEL
	SO7PE+zqMDEqV3Vyh4/HDSYqte54Sigk+KSYn90RV1P+tfJfHFS5MFoBvmMILDIu
	9FPtEZawDTrbxTXHBeZceFFMA2uRSK+NkGYGNtE6S0ctoeGEhT6C9WgxLBe8heXo
	kqs4UZxrElCwFGRfjGGjEh9gAFn4msgsWzRMursE3tHNibr9hppCoV8swVgR3nRH
	lXXrJffwBvWD0SkKtlTMaDPKvbbldhMn+Eo3k536gcbrybBKUvViobR7R/swALKk
	iCczcA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak02kj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:16:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92134a35ec9so6247586d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702612; x=1796307412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81VUyM9OyNKUT0VpP18THwSLW7N2IcKNAzwm/Y2Nd04=;
        b=eTmTi2HTS+/zYBVxzOZ/wJNY1vydahLtkySrZ5RF2oHXwhAifl3QLLBhx3D+ynnc2O
         FBXELO1Rt7xqrpZDkXgxa6Exl5gXBdWxyuyX3vW+054sZfePh0LQyJhWHkUD0Uf1KZoU
         meC54OkEcULUem63G1pxMbhCePawtKxIv20I7z3Ewzzd8ReKig3MDHiFlpt78cs+rAD1
         Zfg8O0TqfNF4VkmI5sBmGVYVpFldE3LxrsVIWUE/n3B8AzWcbiRpBediw2AnO7jt5Tom
         ZOwxBwHDHfrtdoIPKygHIET0puGq71L4q+1Ph7B66EFP3eLNfvi0dqc/NOMsR8/RqYQV
         yU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702612; x=1796307412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81VUyM9OyNKUT0VpP18THwSLW7N2IcKNAzwm/Y2Nd04=;
        b=ERcxqX8jtBuIzJ3nM1U15M8mY1DouFJB/RaJLHyziG9oKdT4r2twM5d6gW3Me7unD5
         ek+kty9n0JQ1pf98gVtvofubz3UOi78q8OQK5xILk7qG/iFZFsT9GZ8I5qSe9EX5f36P
         KRaa52J0L6hNIfPqXotiVGWZZdghIa0pdAIN26AWCQUCmjWDveu4sWJ0Qbh1s4o0Y9NW
         JFd/llc64Yp8h925i1qeVVGOX1YU/4xJP4klIm7qOyVZnHhn2QfSL0ZcrdATQqdHn1Wu
         uZkDRzbKy+mcoNS9qWo/pF/+Nwh+HhWZ0BmbeeFrukysm2ck8k+R7IIeAsSdLXti6rkl
         Wb7A==
X-Forwarded-Encrypted: i=1; AL+hErGQ20dUA0ghrvVZZn9njc4Qe+VRbRi6m24dX+bldnueV/y6zj4Ix8fa+zDkrXqhAWkrSe8hUIHbrGkw6jU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FCC+jxWDTtfJHWCvwQCROtzUstOrEl3rpH1cpiD1h492Gp5QA
	RGrQ55RdgTK+naPMEr6n7+TZjhKKIqH19C26+lZwQnErfMa27+4JfUpLr/TFDpldVln+G6uLycf
	XX2whK2dzStMpcYx3RXivc+bxy3zOE+mTrBFk4+/y6c6lOHj0TpW9GUvOL13dmgwfgcQ=
X-Gm-Gg: AZFdTZc7a0ghOL16ByloGyBYWtOAyPOKH6rgbIE2EcrxnOOhK96wA6ti24hkbnRuU9i
	jdvMMNorsoEAfv/Im2Q4VXU7PV3KNn3jqYHDS6c3gxyAYPc4ALOUCjrF4MGygsCeF6KnMHT2Vkp
	fof95q6mKdn5034VTX7JLkYSaJDg187K9s2KkHzQ5HPLF9bbAq5ZO5YjITBmbWi3eLD4FZhrUmQ
	vjmcIkSSFemSOnVqSEd1niIB8l+gKJEvChp+WwN2fWqD51UA/73wSNOjn6nb52aJcBGb+oWlgIf
	7Zl18E0/Mibymh+lmcGH0oe8OJvt+rkQJgRWynPJbHfLGslC1ZcRTxvGmamcTjhoOWCDUPYz2WT
	Jue59DQh6PHBkgHGhimp1Cv1mURvwOSjmP6C8o2zdih0Fn1Gc1S/kJeukNhzh5+w+CGZjWwU=
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr3824485485a.3.1795702612012;
        Thu, 26 Nov 2026 06:16:52 -0800 (PST)
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr3824482985a.3.1795702611598;
        Thu, 26 Nov 2026 06:16:51 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm2858929a12.2.2026.11.26.06.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:16:50 -0800 (PST)
Message-ID: <5cde45d9-40c3-48b8-8074-41342d0cc11e@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:16:47 +0100
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
 <20261116-shikra_qce_fix-v3-2-9ae31470ef48@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-shikra_qce_fix-v3-2-9ae31470ef48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b083f54 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=i8PxzMkZueSLsKX-AXUA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: o9gePVORS1gXeBPnCF1eCL0UD0BwzlbF
X-Proofpoint-GUID: o9gePVORS1gXeBPnCF1eCL0UD0BwzlbF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX1JluMHMDRLoq
 M/+GA5VY/wayBszqNma0OFtTDgXFrgxqeOkY4d44hpv/wP6kFm5eG2YMV7mX9MobbRa5JXr0RAe
 IeNEvKEk/7mwku3cPKsAgBGBINyAksdOEgEzETSznEDsD4Bp5gCsR4Rc8IWfDB+2l2/o4q38FWA
 kr9+fK+EwV7mAVGhfQTXycILS8DodtowbgYy+dr+WZMQsnFMYgzw39yEi449eYMg3z03D5bS53U
 EZ/8amqOtSVqIsPG4z40rNC03MXHaY+xRQTBVYRPezzgb4b+Z9Ql8PgeW6gainnVfkDEDdqIPYU
 Em1q3D/9+PYJdQhyfzr8Sl/vSWUUms1cp13F8/JkMS1CWu2ukEGn3fAf6argnO9GmuNlfmpBgll
 awuGcrrfv2Nn8F32+ihum8rBE1QoaoeAhV0n0SdhycXdxO6KTRC4wgfF4qmEUS//n7bT75z6oeF
 FQwICZoMRZwZJCJl7Qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX8BnB/ZIJKW+i
 iERye3VJIqR2LzKDSlvrDOkcaBzcAXvPEoTOe+BV0v5iR63TraKAOWXAAoPQE7Bt7V1yHT/vbF8
 9BC/mpL9LHCVXsnMWkADq8RVWWVTumc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055

On 11/16/26 9:59 AM, Kuldeep Singh wrote:
> Shikra QCE requires an explicit core clock, which is missing from the
> current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
> and specify core clock to match updated binding description.
> The crypto interconnect path is already described by SCM node, which
> votes for MASTER_CRYPTO_CORE0. Drop the duplicate interconnect vote from
> the QCE node.

I understand the need for the clock, I don't quite see what we
achieve by removing the interconnect

Konrad
