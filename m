Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169353;
	b=p0RpPnp28pBfZ+o0QH4kiEOrzLhvyI6FVqqa9C4Q2t3sZhEy/V6VynLVoOmEMbhSMPl9
	 kYWzNBBWjQj4qLml2m/QiOK3E7tb9NMXo/Bu/Rdd7PoO2GeDVoWinK6GShDCSTJa8XdiU
	 ruMKD+OIkRORpa0HcKIFWb9jaFkkgfPzpdwD0VrCTqSZdkbABla44WjLx9lxZ+v9Zas0O
	 k+ODhnB9f8eyBgIq3gnicDBvm6e9Kdj4Z0ziOvz5GVR/aPTlLo5NPcWkX0keQm6rv79j9
	 pdP2/dJPacHVFCsLWD83cV1rwM4+kTM44A5J9JGTg3S7jjuQTfhCXdDYURhs9G51REQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xosECkvOuZ/563n8Xxgz2gyDsJH59waH8UsNshqhV4s=;
	b=4ul9DR6Lb9Vdgm0RrI3L04Fk/1KhASJwuZhhGtxjudXrAjWGNCJNzeaq6oOblUvRCRR3
	 t5EkfI1LhoUy6wLn7kOvF954LAzKg9HgPQRa7lX+4u0hh+9XWCYK5BZ9dFi8ld7zMuoKi
	 uNanlY5GgZqVxdt4Aau65UTYpPMAnIgbeQODzcHfNjzraEBc/rR2WFcptjNH7BJLVy3zv
	 VRwAS/c2hhu9fPgWYa5VutnOZRdXyiHJl6DgwoUy6uHL4ufDH/QjybBbKoGcS27n6gQSV
	 eqkXlhHfHMb77WFu1B744gnEXniDw5mF4QJn7rw2gvCIC/FtZHI6cSDSunHFsh8hilA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HBV87Y8i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgXHO74m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B451606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B451606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HBV87Y8i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgXHO74m
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fEHY758047
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xosECkvOuZ/563n8Xxgz2gyD
	sJH59waH8UsNshqhV4s=; b=HBV87Y8iA19w95VMXvBhisXc7CBbCY/9XV5ndlQW
	5pHzxWPk2SX5g7G0UwSYAgTfAW3bm/zZKy0Auw9lpGl3tBd4NWYjH2F2EFJua1aZ
	AObNGfX9l8lktP5X+tFN9CRAeNytHQBdgHU9iSJJPDTuy7rMMJmJ0l6nVvmnC4Rc
	mLCDb5JZKJMPj9uSYHvIQWJXkEGBIzhukomEr2ShJjxTuUXi2ZdvHXoir3IJcQ8L
	K2v8EYWm4goWmnNGT8gCo0QU8j2vxEzS3bwlfW9KGlmZb1x3APQ6rLzHTDgqdH23
	60DbW/+hF69FcPkS/kyyPWrDTEKv3Gl8Qq/BPeL3Orv6UQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5u6d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:09:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so139881285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169350; x=1795774150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xosECkvOuZ/563n8Xxgz2gyDsJH59waH8UsNshqhV4s=;
        b=WgXHO74m1uR46QkdPOO9EpJbTHBWy45ZonesB4l+2OSBKpEYyVXChClj6kNIZlua9w
         1f6BGCkkXNM5zSSolEQBYw6xeBcc96tZRmUHtd/7zJciFjx+vomTWBILrTROnbIEac0v
         biR7N6kRLucVImAa9QaOJLjl52e5UdQCyb+14x1Qm5DwODIclF/fT1hEBV54AbDzzfko
         +QUXW8niMkMT6k6wnXssGDFw7yT8VZsLLRLyDrhegU28MXwSOT1j5fbmOsvpbqkt+Xm6
         U0Dnj3HmZ+lNjv8T/AtdKJXhsxiNxuhhQsvRKuV4oBniKE3m9n+qU/PiNhy+UbHEqrBL
         QybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169350; x=1795774150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xosECkvOuZ/563n8Xxgz2gyDsJH59waH8UsNshqhV4s=;
        b=nabcNPzXLmq+oaL0RIwnwhKGpdn2hriiKlalvGgIClDbZ2Rdo86g6XzPkabHIvA5+7
         H4fFx6ZZ6yCChWZfdluyoN6LGFmJsAE2AloHNGEgQbJJDxKUqFCOASs9jRW/m7o25tNh
         l4LnTCXw4MckFNtKLPfwf2E8dXXtioV0Fp6H4plwpVr9c2Plqp8bZX9DZfynqIhKxx2a
         vdCFYvHr1noh55gEIhB2FVT1YHEHOP+eHshU6V25gG2rU5ckGEmtwVuvv36fcUsfOgVM
         AvetljKavvlIRdndY0K6w2Q60pJkOoEWWo+FQnHFCgwAx9IfMXz4aJyPAp+FSPlJ9Hz2
         KRJg==
X-Forwarded-Encrypted: i=1; AL+hErETm8vRTyi5soHjwLIkQ5px3DSAnyHcxfJQBr0EKjkMCJwG3UNc7i3j4b6/4zg6/fvgEMomsWz8k02r1zk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9evCMazk4G01BOLjlskVF1B1Oxc0HyET5SUGOFlzYZ7Ui9dijN
	o+bSV079Jyw2N32x1FGzF9nfEDP9gvcgSYwD7PthyW5rv1hobso6T1lyoij2on5faq7L6cMA1XL
	Kkd2QMn5SCHC/ORhEUNBcwRrqRHHhcSU1y2yx6/LfVpSwzrtGnLsiua8M7OLbYaqjTR77iEdcTT
	k=
X-Gm-Gg: AYBFou3Hc2p4nY8dkoqQgrPHq8GhiZYXM/KiGIW1kaskwkJaYefw//xVKp/AJpAx5Uy
	XeJokWZtbiD/cnJDgDIa34V8kZx6pfDrv3iCUMkfNck1YFlt10Zz/mhrlK+3A67bLePoYPuPYla
	cuDKlt9pgea/6fYY8Zvt1tBehkaI2PD3Tfq3h0l3JOPwA5O12JKvBh/Xl0HqtdYsdXbj/v44rhh
	O8TBhwPoDMsVsKTGKJ9/Qqd5N+IUgRLE71SfFZjKCxwyv3ZvCztxI+it+2++57In6HwmO+EK+fW
	nYEgwPj9Be087xf1lwH62zKjiwS42p2xkXwy+yeGvFw23mGU10wEkAG7AXpkMFuS/JnFJL6xDFz
	2rtnKNbB5e1P0gKemFhQIRW+ggx7/OlZsNukuPqFk/JixttuGz5hWPgY6tOuFVRdg
X-Received: by 2002:a05:620a:1a09:b0:93f:22af:ccdc with SMTP id af79cd13be357-949b340223bmr618412685a.4.1795169350050;
        Fri, 20 Nov 2026 02:09:10 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:93f:22af:ccdc with SMTP id af79cd13be357-949b340223bmr618408885a.4.1795169349463;
        Fri, 20 Nov 2026 02:09:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm4714314f8f.16.2026.11.20.02.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:09:08 -0800 (PST)
Date: Fri, 20 Nov 2026 12:09:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-shikra: Use retention for USB power
 domains
Message-ID: <yxdwoaan2qd7pwe7ueyxur4nu7zr4fjxix4blqr6qwbw3razg4@si6qol36qa5r>
References: <20261117170854.3257471-1-akash.kumar@oss.qualcomm.com>
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
In-Reply-To: <20261117170854.3257471-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX0Q6/TJRM7TpY
 GaPZXt4nIhHcfng13Hn9cl2867mKndEWUNeKTRnEwFTMN9nXGDf976IvyTvtCAzhjsahe5D1H92
 T72FHeI9gey+EaCULJFkQErYPX6sjzQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX91GMDrFVy9Jv
 tNWbh1Lm2BWz/yt4B2MbD/nmdA6P1BGEkGyB8G1BQvc6gIkDo3Fhg3Z9i7OtTlEXV20jcBFdomO
 6thuQ76VcpycYYMx8Ce+LC/fGWWjvdnA2iyyOeuxzv6fTxR8ou1dGvDTUgFBWI9z/KXebGwa+0u
 yaluRuLR0xuPvxw20cvXzVpBIe8y2UwTjvDcnJ/pz5xVlAVitd216uShS718s4WgjYMxV13J+Mx
 0OQ5BpmVWhwpwNhWbDdO/DH62y7x80fGNjWbjmZX+1msBJE95FXaNLpXLf1IRT3AYHd4OAJrXBw
 5Hdc+LdfrgMrJnpYNzwbi4kt1CfKqKE4+KP2d0uURDrGm6Y4SE89EFIg4QdMEmepVLDmAIlmWwk
 ZP9ZvXVyKnLLhyH9aQKRSll9rEg9rhbJLcNfF8iPIN7xWs9Q4IDHs1lCzTD0adQ2od9LAMk/BCv
 tzHJrGI7YsA51vhwcwA==
X-Proofpoint-GUID: l1kWoG6fksc_a4V1xxHq2F2GF-J8cNIa
X-Proofpoint-ORIG-GUID: l1kWoG6fksc_a4V1xxHq2F2GF-J8cNIa
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b001c46 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qsmAfw9a2cmmedO3nsUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200040

On 26-11-17 22:38:30, Akash Kumar wrote:
> The USB subsystem does not expect to lose its state on suspend:
> 
>   xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
>   usb usb1: root hub lost power or was reset
> 
> To maintain state during suspend, the relevant GDSCs need to stay in
> retention mode, like they do on other similar SoCs. Change the mode to
> PWRSTS_RET_ON to fix.
> 
> Fixes: 01cf3e27824d ("clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC")
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
