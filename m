Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170013;
	b=poPecvO5AUOF6TyZQ2AK6m9a9ZEuRBRx3hzhOg+aBnym/cXiGcE1NnKXKCXbxyMtTvNA
	 10N+Rm0rZ475aM/58mtDEPzir7n4KlY6iciOuk2BPRhVxrf2s96yWWJHo2sZ0dQwUia4Q
	 9HeBnjGQn4Z2Khv3dEXEDOvmXdOXr9xUX3lWuG5k3LPDV+YKOQR0I5DR+sgNOZSo9plyh
	 6bzs+73w8Zszm0ajl+AGg5Woe+mvQJmxB9chmUKHktHYl33qz2mvhgeQnum1KWdDzInm8
	 Zz2+b/FHRJuzbHeVTWHsHGEWXK4MPfG/TJMkfy815EXBICKz+dSvLjs/vGGXt23rQGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170013;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=v1AfoyViWtDD/4lI7K4bWRLDy0Fh89oWvLdt+QyBGH4=;
	b=k2IpTMt+cYFe8LT2zFJrxcHwKmTyqGwVED115j9cYVV2T7i5Cgdp2PTvA7nlc2WNcDdD
	 TxyX3j28yhtFqatdIeHw0E+6CS8WOIMuMKS0JMVShE25ZIRztNsn7jnN8rKLYvdamrvm8
	 S55vqyJaGAr8J38uA/ar8rcQwSMxI0m/kLq5DJ5p0ZT0RICoqmSa9TUr1+Yu0z3GRA4gs
	 UzasHRuk5YOi8fQxOH0Wi+L6T1Xpf4DPtnLhXAHWpnuSjMoS+JrjFdGp3xXyJnCuXgb7m
	 rKeLzWxhOh09uU0Fd2JENZkauBsn0/abkHWJTQ631E4ECS5qZ/Gw7Hcow6lqfZRCRvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqfW3Qxo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T0FuPONZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829E1606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 829E1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqfW3Qxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T0FuPONZ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fEbj758285
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v1AfoyViWtDD/4lI7K4bWRLD
	y0Fh89oWvLdt+QyBGH4=; b=ZqfW3Qxow/MIYLFjJEslozb1q8p2G63CkuN/GhXH
	Gv+PQKzhpZrRadF7sS8OwDEBkEO2xWl3qJ5A3KLoeq3DOPgxRED/xcDFImuk2ZNp
	xE0z8AAsGpoVjqeL8csE3lxl+jAtvSRWeRBwuXraM8VBaSXVFtHIEom47Dmaq7cN
	jHQLSVS9J5GOTPTxn6khc0SBLYmtfha/bQaWP4l6CuJG9s5QB8tVkyM8oG37BfEw
	FouUvGbdbI65ET1wLaRCHt+PBxoy/0iktzL3Ix1AltI4+ljhH9RhDSdpCXmxg+tB
	pnZrDEP9zGEksOVzrhyn44EOGUsTZWjXEYcpM7xBubePVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5u7kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:20:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so198886185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170011; x=1795774811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1AfoyViWtDD/4lI7K4bWRLDy0Fh89oWvLdt+QyBGH4=;
        b=T0FuPONZToqEj5O20Qq/MoJzLpVUdBeuR5+b7XRLxTuzQ4lBFi2KR1gRHOSiN4M+EC
         iZ94N99wdmrDEPgI0b7xXW38cv6Xgk/gmmhLxK+GNlsHK3VgTYSm9VX4+VtetrZqr9VH
         NlZu3ntk9IIIVbbCgehTav3nJnqbafYtUMU+3djXAJfuKFz9OoWqo/n5P6dd7xxFv69O
         CmQKtgwh+oeu7TTttaUdtRMA5z5wz5+1wu31jGrOzmz0EvhCL2nJU0HM5xmtRehK53eu
         AZyPXoLwXPxaT35j7zC8eeNjc3ZXAFahMQyFiYtJVB9hLmNNZRO2OKyHPilQDqHlk5kr
         eFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170011; x=1795774811;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1AfoyViWtDD/4lI7K4bWRLDy0Fh89oWvLdt+QyBGH4=;
        b=yVRvisiPpQoqd4XIgcY02CdSjHbc+TZkbgSoDpjUOfvKj29ufSAWUmcUqHcRBXiVVo
         lRKhaS4QQXPXnzJMbb3Q8mwWRhJpegA728S1zJEuCOAyehKoUE4mhXfDd11KzZ65NO7H
         WHF5n+TF2F0hDUWtpeMlhFSvQLcqoYKMOz0lbyzQOIEOxmvqtga4mCPc9rf3Cu7uLypq
         WW7hfQBngyEB4wWqyYE18UTSZoVKZgarEXOEkAQPBjgJjQs3oLWEpjgy3RCcn4kYK47V
         W+xLRlU6WpThu+HZcB5w3XBNYs42CyFx505pL0E6taK14jEIHQKCsozwEVfgfsIVY/kk
         CP9w==
X-Forwarded-Encrypted: i=1; AL+hErGHwQj9xaKDYibe1WyAvJ3ofnAlmRVnJhvTXyIyMW9s6zR9bsyHMpeqF1c8w/G+ywGaPI3YHameKecE5+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7pDRnkrTaCKr7O8AauhgBRoYjndmNmaTgIysT63U+GBxtDul6
	9gZzpFp0104ptp//X84UrW6feXBpEDwE2fT2KrJZhmLfB0Op0C+29lsa9z5kWxGmIDmvKVQ0FuE
	N+BHX7NVr6HQlp8I6sN1PRkqBM1WumHJYLsE/pL2foPmT3AHKZxjVayGeCIZ1tEzkWaU=
X-Gm-Gg: AYBFou2oaRfXESbc0ny50MqeP5SbAvNXOdYSjh+M32ItuIlnzrsgt6C8mpy/CTh4pQo
	KPU7yzO0vlYpODIhkmbKN9ETzqiusRb/maDz//mvYIcxOvSy13bGHM/F1SiZ57Z0KgOCsxph6oO
	/0NdAQ4ywCdjT2pfjNoJvnC+C5GL3Rga1N/8SZODMYzu+DU7ogZNHfWbVyVY+H7V6+WnL1b4CdQ
	nOwmzOmk26ITZyGGWyX6WydtmKZoXu4mrYd2s3DBHPQL1Vd5SS5TOz1iiQXK9IO3FteLsAwdCLJ
	5B7bdGs+WqzILhkDNkovjkaOsCyxrgUzkvx0IaenvqE8oM6b4kkNi1NuLZPwQmO+V1yksPatG+3
	3FF2SJFq7urIzcJd8w6nhF5XCOQcVnUTQ+ab5fgQ6v1Hq1lcZMJlKoFvwgaL1lmJu
X-Received: by 2002:a05:620a:271d:b0:949:67ff:56c8 with SMTP id af79cd13be357-949bab651b2mr325635885a.80.1795170010469;
        Fri, 20 Nov 2026 02:20:10 -0800 (PST)
X-Received: by 2002:a05:620a:271d:b0:949:67ff:56c8 with SMTP id af79cd13be357-949bab651b2mr325631085a.80.1795170009727;
        Fri, 20 Nov 2026 02:20:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm4998086f8f.36.2026.11.20.02.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:20:09 -0800 (PST)
Date: Fri, 20 Nov 2026 12:20:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: qcom: common: Register clk_ref clocks from
 qcom_cc_desc
Message-ID: <g7i6j3xieuevlouthjr45gsczzq5nppqvwskap7ngxqq2ch3zj@7cc4i75xz4d5>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
 <20261116-halliday-clk-v2-4-28208928da36@gmail.com>
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
In-Reply-To: <20261116-halliday-clk-v2-4-28208928da36@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX8RuLTkc5D0HG
 0S972AvStxYimgFtBS7ohy0Wm0delf71MGCXsAd63qI9xDE4AA1jjx/A3L1jHOnN9N5LRSkZE0d
 5cy3Q7aAnFkfATXWN2pvBg8OzN8MM0A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX3XrG39EmItHE
 MXjOYYGiUws9D48dt7pYAR0mmJX396gDCqk6DTK4BOEmuEHGjCadECmmw0oXSnh0JXRD3CVw7Po
 MrdOKrda867f0znGPcX9PjO8UubPG100l/ZLyHID+vicnnbmL4XabKVNGOx/E8c5+0p1Tg9g2OE
 oyJ5jSHpcEOV1WLqLWRUtr2jPmJK7LRAWkV2Q0wi8cKvK6+c1jK/JeLZ3dK+tR1ZAp2ixopzln/
 uq0i1yAMBr4gymiQ0Xj1hDq3AY3tu+ouRDAVt8fP0mXUtX2gDwHzxmITvZ+N2Vq2eodi+HC5N+s
 seG4uWu1Jg6m0cJgoKKyK4pQcO+MQThsA8AFQdSG+Jc3SK7XwE6Lr6xKFppcPEirRST5dUGRVUO
 4+uAbVsnqDBZaEfgpudUrSQh7t7Sufjts6QnTYRGuIx563a8MRaVqeYfOmG5idxZnHeuYA9MfxY
 /D5LwlroEyYWXDxOqCQ==
X-Proofpoint-GUID: EzfmQkX8l4AyfsgVqf6k3AgmkOu1kSrN
X-Proofpoint-ORIG-GUID: EzfmQkX8l4AyfsgVqf6k3AgmkOu1kSrN
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b001edb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wqR6ls3WrVHNmmoEC9UA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200040

On 26-11-16 21:24:22, Stanislav Aleksandrov wrote:
> The clk_ref clocks model a clkref_en gate together with the supplies of
> the QREF block that feeds it. So far they can only be registered as a
> standalone clock provider with qcom_clk_ref_probe(), as on the TCSR of
> X1E80100 and Glymur.
> 
> On Halliday the clkref_en registers are part of GCC, and the QREF
> supplies are shared with the UFS PHY: when UFS runtime suspend turns
> them off, the USB HS PHY loses its reference clock. The GCC driver
> needs to provide its clkrefs as clk_ref clocks next to its other
> clocks, so that their users keep the supplies on.
> 
> Let a qcom_cc_desc carry clk_ref descriptions, indexed by clock ID like
> its other clocks. qcom_clk_ref_register() now registers a single clock,
> so qcom_cc_really_probe() allocates and registers only the populated
> entries, and qcom_cc_clk_hw_get() returns them for their indices. As
> with the other clocks, entries listed in protected-clocks are skipped.
> A clock ID used by both a clk_ref and a regmap clock fails the probe.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
