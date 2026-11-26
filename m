Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688777;
	b=SAlYdtRZJaQB9l4AJv0O2uhgVFdLqvnBBc81qQiTqb54Cy5GjU9gY4T1L2cXZHXuA5Jk
	 8UUlLjeXnuCeqP6dMHYLQtXlRoU3nw8tbjrt5AKpFL9ssmy2JAwlDbtWolMJ9WqpRKMZe
	 I1SzlYHJPl8fKLavCt38gFTyDol6BVsiM50E6uRvgBN76tPKvHlKwWk8jkGur5eZMBSZz
	 ZyJJqvnl2sf+hQfT7WK/W86ea1sjD0NgrNHmYGrEk/ZVbMyX0oud/axrseNtImcmp/GiU
	 POCQsKNvg6MvclW+wNK2RbfNeTRskesfXyNAGsreuw4kn81IQWE2Kgdujj8v2LRItTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=;
	b=OjtapnI8TfgJ34WH7eV5HfaHbYg990O1CqBGq1g9MTRMK0wSepXp+rjtuD4UDWXifWeC
	 oW2UEpvcZ6x/tIswu8s7OCKEXoVrlnAakF3FnLPNtSU9DKDUeEsp7EDir677HUUlLg/qh
	 tDtpNY9kj1dbvav1r7l+U6pUG4YeUK+A+QTVvCGe7+U8lEAFt6t2eL+UNhnqSGry9aZt2
	 3g7TUYUQXwOsExU2sFHcsFQi1JSBR6DyDsEB+2IP36DCnL9gGhOrY4u2b5F+7axorvAbk
	 H4hXahdnaUBixoodQvOwTGlEa3PCtl6KXWy/5q1XOQ4KNRvMXAnyIfY1BFLT2bWTocA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i5lJGnF4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YwghNais;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637DA606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 637DA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i5lJGnF4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YwghNais
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Awm0695040
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=; b=i5lJGnF4//4uynHl
	2fu/QwxJDg4YM8WIVlJR5yzhCv3egiSmybo0IzbE/1WSyCh6bZowCeOSenWLdMNr
	Yfwaj+B705by2Z27lCCV1LieK+R2LwXKAgnrnwiSDujnoVZdCldukk9kxHzknhOp
	MmpFqiEzkvqT/brCf30FwKkA8S+BByC9q0/sgruwRfNkfBGhqyxnhodYsM0kwN1o
	/5m9XxaZCbx0JWkSlQ6Qhi4RI2VEQHxUg/f9vidoDMxYtK3XTjMD5DcTeRka0tEe
	r4beDKGBvjyVTClG4RloaiaDQgJGnuKm9JobpwJhz9cbVa22bCw+QS2rAgfkT7Hg
	AxvP1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7ru5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:26:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55dc6fc65ebso733141cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688775; x=1796293575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=;
        b=YwghNaisJhCZY4pk0FJpS77OPA5YWKJKlW62D8cXe1w+G/9b3AqLGVO0gowS5IeXAh
         rQkxdRGFlmp7PS5s/TU1nohkHAv9OvWMCQCsVAm+aqDBK6h19cEK0WQwmnlqgiTddAWz
         lgTjILqt+vdmalBWQ4ybG5dvCX21HHkQoOfCWArloIAIvd6C3udPIGldfM1kR0AtVfx4
         mlcrbRFKhBlPOG0Sc15bF+vTyZmkufqcpRYBp4M2BhfcyH02UfsqtIaTsInBbnnsJ7Cs
         E96GufdJrvZmhqWiyTBowTQ291PKCzqp3RoTIOk7HnuBppPdRPPEe1SorjfH1pQBm2Vv
         gKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688775; x=1796293575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=;
        b=y9i8WUT+7P2Laq8YdiFyeVcLadKM59kPS9IqwxfnnKfJdaxtWcDggARMdax852uAsH
         461aJAURIyjT1Z0m4N4f4wW3EE6Ow43rMSAtrDa9RDUe6AytRdBGipSmBzEJppGm3Uq9
         DovWB0z68MXrZpMxfPcrFk+WgcRMoe2VG9hxMg9CLv03FAW5N8vL9fLXLUh++3qcu37Y
         Tg//IWOEcq1OJaieDjbCH+Hr0GWvAS41RrLAm9Uyye6bO2753VNm7UDMf1/rL8mHWYwt
         0LFPy6Jyu4HPXhFxdbpltTX1rbv3yNBYRbyJdwfnVWucs+llpUdqZEMtu8ZB6aEjIVs6
         aG3Q==
X-Forwarded-Encrypted: i=1; AL+hErHPYyaXvhPRblyDf5nH8wCIqCPzzbuEs9JtiBjHPjp+uKaR0+Aa/pqyz757dDSIIB9z8QeBZUiuOxWllwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IS8rRGFjnub0nHb0IwQb/tAx1Gunoqc7vt5hUGG6vY5nx/aol
	W8Mwy5iqBtMG3q7f38UmJyjZhFcDAiPRlHQciM3bkW+32O10LqcewfcxJ/56j5WWvvdtM87TD10
	OTgmlMAcjRZvLyLWS+4/8cZLaFD2kvuprg37E+L5L7BNAWZOFOd3sd313oIQRkV3+6Ig=
X-Gm-Gg: AZFdTZdfoZ3yyDq/bAYTXsd7Ivus5GY01Ro0jmmb/EXIgrcUp2uiWSr2lqT1J6NbEt9
	NZuncQhoG0S+vCMNnrjsY7NxyHKdrRfWH82Mj+4g7WwvMbGKR1a6LqGZxfjkEvk0D1tjtN4MFcg
	OHtfDChO3WFqfNjQt7wECwlyen0xRr7QEdbIGut0UZNG73NKc+d+qUkO4BYrmTsob1ZMlke6/kK
	E0FJLCnIJVoaddfHjBvQH7UfHRxKvfcUzXPUlM1Ghn7wBimEf89CBnLz8W9nyBCj5VaASJjq5RG
	W0YfS8SZ3gE10E9Why8tSmWw4H3WsbSlETisUdmuPs/ev2YBgjaOm08ZrQCeXC7hFxHMB0DQ7bK
	Bm4pKp8w1rrSak9Dx9SOpgc3Ytxr2wjkK0ZRdScA/kXsRsPot3ThJSf1nuihjBm1eeIHYl7U=
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr3307659785a.2.1795688774774;
        Thu, 26 Nov 2026 02:26:14 -0800 (PST)
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr3307656785a.2.1795688774355;
        Thu, 26 Nov 2026 02:26:14 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm732536466b.51.2026.11.26.02.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:26:13 -0800 (PST)
Message-ID: <4f19aecf-acd2-485f-983e-d10e82eb91b3@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:26:10 +0100
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
Subject: Re: [PATCH v5 3/7] regulator: pm8008: Add mode voting support for
 PM8010
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
 <20261116-pm8010_i2c_support-v5-3-5626ba17c0fb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-3-5626ba17c0fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX6M1hXNeOv26m
 /oZCbGt4hR7rX9QHea6KqbmYHQE1uf/S8Kb2J/o11diPzpAyLIy73bbyH0mlcucP0nciX//o4C9
 sf/2h7jOe9aBxqaxZVmjPEt1sk/u1/Y=
X-Proofpoint-GUID: 5-gb6T5AH_ugF1mi-Y-Gl662KJdJaAMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX5mj9CAwywCQQ
 GZCXSugF4H1fYi+wc3mOBonoPJa6TESEyb1YOTSCQrKPgbEntZI5/uIYIqunRVIpznMdeGDN4Cm
 S7QbczgH+RbXVTHXGaTCcq8EPhImeqZOfHl/u2S+sHc+F0djgwdv0gVISl0ybqvlxyWeilAryu1
 bjlQ/SaGtvFdbv+odQ0ia02NE2sw9WAMOXbIQWYjJN87oagaWj0wP62DUz7o2rsWYTsTli/fX8G
 5iFe8acwP2tM+fqb+bMxj3aWCF7XLzzsu0XMgN39unL5QgtxwZuLRAkIlhgOHshZQRHZBopl6wk
 JaThN6m98hQymmOrlUBzNS5VYo2RREDK38aA0ZU4na1fcmRpFVUWqqJBtbiuVfx4surWV3+HQF0
 Yhexqf8NfTfMyTAvNKmkTsKyJkJB46/m40V5dTIBKhtIUOA1w8EgkkImHjjElEHYFr1Y9i1sjBZ
 Y8U/GZOcFf21sqZuqZQ==
X-Proofpoint-ORIG-GUID: 5-gb6T5AH_ugF1mi-Y-Gl662KJdJaAMG
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b080947 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_U4GOqps37RzzdhOo_IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260040

On 11/16/26 7:13 AM, Jishnu Prakash wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Implement set_mode/get_mode/get_optimum_mode support for PM8010 LDOs
> using the mode control and status registers to allow clients to vote
> for LDO modes. Mode voting is supported for L1 and L2 alone of PM8010
> LDOs and not supported for any of the PM8008 LDOs.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
