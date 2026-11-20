Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168185;
	b=ffzMNfELraIg7Q3rqCkLYbHBFOIng9xw1TKjNISbrebnAk1hV2d54B5TIRLqjJ8CJRVO
	 iKC9yA3ZpgV0vononbj34FBlic94Noaonygwy3cnRWob/UyVGDVftPxzEwsicaIAaqH0k
	 UI7GNoz7plJJkjBMHbMlwusWWP4gQi0gc68uAhhJvu1Npv4bZtAE50qBc2wIs9NisbdOk
	 OW1F4wxDY6if2+AGhFe+mBhsm/elM0MGdrwMjXOTnFrT0J5wHniDBHD2bU6q6vfepkTl9
	 /JviyASI6RFkZqLNJM9uJ5Wdl6SvHJZwIeVDfDb7UiNGybUyqvdnyrXhlUJTRUgsjgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3Qobe5Koi0hqdQPSNyvly2xZNog+FVkjUKeG4gVX+Ls=;
	b=BlqwyfU6rcCvIV2qCm++ayZgOsmL8W3HzsPZyCUYm6RsIITe0fjFUlZ10ZMlGwPI4FaU
	 l3Qc7MYMjXehPuuFtyFBOJVPD5FSomdDZjrPkQ2n7g+r/gIsXKWe7vUUTChlQMsHsRvib
	 A5ELdL9tHmAlx5orIduOzb/ibtzDWXPoBiywQQKvLgY3h/xAmO9/m1f9nS5+CqBGcbGMB
	 4tU95jardHK7JHbDR+kdxAJfUwJRnYvCrqqo86k5/X3ViY2L+Zdr2Tz4KlEFTlCMcDp0K
	 /tSBGeXoT+8bdSOh/NLRpO+M+q/CjPE2I0jTsLHFJ7tt11w26lt1+XlrVc2B+wpGceQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRT9DmCy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f2Uq1hnP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971FA606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 971FA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRT9DmCy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f2Uq1hnP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ewWa605905
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Qobe5Koi0hqdQPSNyvly2xZ
	Nog+FVkjUKeG4gVX+Ls=; b=bRT9DmCytUwXRpDtGoTds3HLK6B3uF11frldUEDT
	LfO6Nfek7yDpJ9nZxe/L5HJPsj8m09jNv6Y4HIxu+Ozsf1dnApWEIe6WFjDFCsqu
	iznZD9bZJCUUQmZfGQlgJHwfiLv1ghJr/Ou6ifG/5Js2yn2Y7feiBZ4WQIAVdIQD
	jr4f8Ca8jRRzxAtwfsbNJhMQWfJac+PeMheXMrjKj701ls+iGB8wUmAc7kPPV06p
	994KH9lBe6Mnqu5P2UzlrtyKKrz5OXCE/4v9Kf2JPaMkrNUcLrDgjQShbbsXTnjK
	alho0bsO4FaPR/D/Rb+/5XIpFQnOAsdugptkgOp2VJmxZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrwv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:49:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495a1f5e47so134447885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168183; x=1795772983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Qobe5Koi0hqdQPSNyvly2xZNog+FVkjUKeG4gVX+Ls=;
        b=f2Uq1hnPi6UMSwFZ6zV8yv1uN4V7cktNZQUpg7Ma7DPo6jOMVIWHF2WPB9KVGDcPvc
         4JKSSw8ojq7FAAfERwPMLgE/GyvbseMKUR0cOYxQ6p8ouFKuDgwXj4AdurjBskFvC7j4
         NLPFvM/UTWlbLlYXNZWS9CtKdarD8xnV5qgIn2QBkO3U2C3HI797686KKjGxy2+vEVCb
         ImE3Agtx1TOE24xtRhTWT01c5zlsZnGgQstuaqOuvWyFFycT5zToSwbdCJSnPjdbHJHX
         l2o7hmHDnx8VczAEehzeQ3DrvqW18HVN1QFF9x+itcW5k0OadpOROM+TY8KvTABX8uWJ
         294w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168183; x=1795772983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Qobe5Koi0hqdQPSNyvly2xZNog+FVkjUKeG4gVX+Ls=;
        b=NO+0nN8FVwuA4n5mON1hV/u4LFKXLeEgbPaXM1o7zzRlgX5hly9TTRVNZznUrRvrQ2
         b8soESVJr8drDWu/5g54Rt3AmPF0ewW7pA23KNAA6gqROWYsBTecZq40ntEwbBNbalwO
         sRdOg4PH6phoMKIuPW6FBgbWk+ErkOVOMMfIMuqECE6bvnswe0JKFwYagTAMzvGcbi1w
         G8YtckhgDHZSep2GPZuqYbpYdjDQVWw2xsbykI+Id6NVkSZ+B7rQu9XA9lBxRFt1Rze1
         P0ZIYUQ5BAnHQ+R55cBgchn1DOOKn6ySFu9f3T/RL/rNFCek9faSPi12icgVFgjJlPpo
         +/7A==
X-Forwarded-Encrypted: i=1; AL+hErGGPf5E6K9UBJ8cSgJLEf0iM/c5uXHn7JJhwy3j/OplJrnwbo3AOFou/wcG8SZxcdeFSTVLcKcswJkMIBI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/RsogOYqHMQ0Xr+y7/kqH67FMxWfO+qyiRZ+QOEltKVEj5u3E
	M7gz2VoKAEek1CbChpk/+fHrNkHl3Cm3dZC1EHnodiHpIGNOXoboVjMFRWw1JK7h0DddHswphgw
	DQZFo/L1nNzLElKIsDsfliArnN3+DaARGMIq6VmP5Oc7a9m90TBQ4U/6Fw123qFO4ft0=
X-Gm-Gg: AYBFou2hu28Ck0exwseUHPL9ii7tn/umnbab/DtTMN0T5iW1WJe4nRd8w41dTKO+1vs
	SQsoSriNp8VTzHXIOlKoc3iKfWs2D5xT/rVtbrVn9BAqgr/SeZncPaeVZg6RCfGl1h1n0Wat/LX
	kUbYyQiTsDbgtJPZ75gXk5ukpSpzmmSzvWVUoPmnqDL+nKKIzccoLmSJUyI5+XdQ4DO8am4fMi2
	uozJ19FHVIwUsiffe1raTEopyAieNGtP87gP1Rqc5saxlxY/S0nO9406e97bYHIl1cmXge5YNwi
	/TYOHx6aJCL/r0L8y4lr4C7s4jttHWrY2ciynH/Ro5IHC00N2RYf0cBZmkwIaxbKMdev3YPw8+r
	F5+09RWuxB29iuPlsN2CIdXdU6jG49hjHiKCDYTy9WcrDqiNFGYo9ypJay10EcQUz
X-Received: by 2002:a05:620a:4388:b0:946:6:129d with SMTP id af79cd13be357-949ba9e8dfbmr404460685a.54.1795168182657;
        Fri, 20 Nov 2026 01:49:42 -0800 (PST)
X-Received: by 2002:a05:620a:4388:b0:946:6:129d with SMTP id af79cd13be357-949ba9e8dfbmr404457485a.54.1795168181963;
        Fri, 20 Nov 2026 01:49:41 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm4443810f8f.50.2026.11.20.01.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:49:41 -0800 (PST)
Date: Fri, 20 Nov 2026 11:49:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: nord: Describe the GPU CX SMMU
 aperture
Message-ID: <zdolt2jlnv4gg36pjbtcaxseqbcui7f7pemmoo3ixlyk3ivcvi@qxkutu3vxbnv>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-5-e99cdbf3121d@oss.qualcomm.com>
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
In-Reply-To: <20261118-adreno-scm-fallback-v1-5-e99cdbf3121d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX8OqAdf8dBfSA
 lliuZRKgIZTU3QH1TdSoxuqBywHEt6C88qDfAyjj3lR6KJLz5qs25uH5oVEXa0M68zvlgk9VXxr
 Xm1kVbcdAIGiJa5QXk8HWiyf/rI4g7qGe62MriNrOVC8NJhkBsxElcB+9nJPpf0wzRLjYoMyC6G
 0bypk1I2cgaL1ALf8TsU5QlKxDvVriyGdEdVDCr2IoPg2eWsOn6lya0YYQrT2vMnd8Ek830qumj
 tnMusa1cruGfUWytPTJsJ1EgGBQWhAW5jDVLOwl3hvPyQGtAZW5POcOpUlpyLDzPxq1sUC/rm/3
 yCTUXoxI0WgSwVSMuRB+esA8AJz0FYmzN3khii+iN2+TenZk36+aFrghe2aZs+83PqVVYqYSyc4
 t9K8xk2CgBdgtDiOwYEF8SErMCRlOnvdOG8fBIsOqR9xGFdAwdf9ZJnQm0MPt0jCjp4EkjYM5z4
 ij49lzSqLuyvOcPjLGQ==
X-Proofpoint-GUID: 5HdCqVO-T4Adsa4uMt_mQ-grGy6sLgV7
X-Proofpoint-ORIG-GUID: 5HdCqVO-T4Adsa4uMt_mQ-grGy6sLgV7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX5tv1+dIcYv/1
 H3gKfRCmF6tEqnjYW3y5UdV6nuJu4cl8z5eaUQc//FVOnJwzekQhSWINosP25HpsPhqzbBHI0Do
 Yj+xY2wpcfilQlq31nPZaOgDz7BA+Ms=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0017b7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=G6VyOm33As555aFvO9IA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200038

On 26-11-18 18:38:29, Puranam V G Tejaswi wrote:
> Add the CX SMMU aperture register region to the A753 GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
