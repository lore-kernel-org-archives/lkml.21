Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448378;
	b=uB4zemMVdnZANlYAQZBdDT3+Ngi6oE5OUSBmqvIFuxBqPnOO5a6cBplfl518aJSYMzIe
	 sUdAiwRp3HwirU0wOiEzuQwzI8AMeAFOomus+sXN3lTxajUdu0at7XDYmE+gUE2Afb5dq
	 OfCsZ3SvP+hNxcH9V+f4waQZUhgScwlh2KOn8p/ABWRdjqhPMTf7TvgRb9Q3WMNj2murS
	 12QqmerQdM0d040C0wgR7XtHa9mLCZAQB9HMF4C5Afmea2vAGTv6n2DnNSVmCcLfLdhw1
	 QO6tgCRJUNfzY0cZ9kV3UW/tuct5/B+LP41zpUBpqGkeo0aTIqozfjDB/ok0Cgv2/Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=;
	b=veIW+7c8DLjXqmW3YUSkGrRFGMNcSlCyWSIU7iyjsTiLBWIOS/jNYeJODdogius9hGtc
	 0aQDLHEEgtDNxcLSL5L4kK7aO2SWdgJxeDC/Z+hzYkwNkXPUCYmcqxZXmqN6ySnJXbAju
	 XNpvnZR1xFq0c3e7u87MVirjhYKtyYPXTgd3/bxkYn0ujaH7LdAMGElhQfs7exM+toC2F
	 UWMRAtSfs24r5FdXsML4jLr8y4Ng8OhsKK9P6eBKEjmq5nMg2w9PZttvCE1C1KnlbWAqx
	 4hm1BjtwFhU1rAzVlmF4g3K70ZZUbI2ishpEXPU7i/8nqLvrPxona8oMDBbTUAcj5sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eThCyj5J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SU9L7HdT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AFE606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02AFE606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eThCyj5J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SU9L7HdT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKqIp2369022
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=; b=eThCyj5JdNxBibP3
	6Mn46VkvXbbU5MOIDoXPtfUQvk0/M0DvPuIiLlk9J57EsAu0TZabSuvy8wrHLq22
	rySVbHEnT8Fdgg/ry/BT56mtCr3m6HSbkEag77Osygb0lbATjmJrbmUj6dhHxFW+
	JOAp1nAU+Tyh2O6iw1iz5f9vNe4nZj+oiYkTXk7FMMRMOWz9JWNQISV+WzwNPhdj
	CPwfwHV1Sj47+VK3AnZfmKufp0V/QYY9Pwli2By2e21X4dm/Ge49auMZXv9BLdkQ
	vC56wi+KoF346ejDjvo7BCSonIJXEGUBh4ydB6613RbsOWHWFUPN45WIlwTgmZPB
	Y0gVGw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa3cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:37 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso94081e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448376; x=1796053176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=;
        b=SU9L7HdT33GJtLsdm1Gm9me3IELbRLH7k9X7Wtw2YoI+8xfO/1sdyy6GikzEguDA53
         Z8O88b9jlHd1e3sVInhEz2walGmme1gBHf/Ra3eE1tjubgxyNKcWU9WZ7k2F8glO3ngA
         Ubzv4f9h+vACPRgHlZzJ7kYrnSBrRAyQe1fy11E5zl9R2ie8e29H+jF6gC8M68WJRiWX
         5EE6CVho0x9CJeJ33vgcfIWPihbAz6voiFoDQjkXai//x2BPq5aZZS/MU/6+bQJs/E8+
         EInjQpibMN+I6nhjDxGoBgMuJrlLZNGvM9k+nBpimOEhpenXFQLLBT5rXPrkEB3tOLEW
         ZTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448376; x=1796053176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2dJwtsIOHb1B1Fx3r1nM+JuGNVZo9J8lJ9npEOZltg=;
        b=Ji8dLOkBNX9pKE0SKsLT9FNGnkHnCIEXcNlXxxTQ4V+jkNpNaN12hd6JItK8HNaWxj
         4Smxr68e5SM/3RNSoQQSyjvpYwj3N/e4ppiNexoHxyiWdLu2fuvmOZQuXkW972vuhVny
         Dvsi7xEwswcpl3qz3YMKIqfyusxJJP9bE/SJfShM09xihK1QqhBFZSdBxTCY8sg4nKtU
         ZJDBWAkmXq5EQWm5kElkb5vDk2p8h4RnIlTU8PQ4rAqj4HHxaWpzQPqb8JobmFpMtMQp
         649UEys+NzXTbIucWhr0zkdfO8bqLhS+bvoxLXXnl7GcDHB1B1cBu7Mm/Ay8Ii+8pQfs
         YTKQ==
X-Forwarded-Encrypted: i=1; AL+hErHBeVaNpwARYtoJ/aVLLzBORmZbuSX1AQgniTKq4fb/uc8/7cclfnOcX2i8g7Txi0PSZ6dAl/KIMvgyG18=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oPnFL+JtfLItVBqbf44M2bqWhJpZUSQRx//GDzMJAC3WXHRW0
	P+NjIHhU6bvCQnKiBc1Rce7eLBfQYR7Uh6vOWnn2x8cO0sHQn5JAbNMJeAXDuv30eD4dVE10rVv
	nN6ETSEWPr/CrEB+MPeHDIePdu6Vrnqw2c52Ctk0mqwOA44P+g9dDhVtaxG650aE7FFg=
X-Gm-Gg: AZFdTZfjT1p5Jf0Bf2Sm1LF9oopa0xY0o9HbKLo7JUm5qb0F0IYagsi394MU8Y1bQ6Q
	utzoNo6iWPQDqelrTJLY1wdnTLjBaO9NpxINkcz44+4aLCWdQzJrUYVgdAPhoS4h8RIIVmYnDxl
	oQ47NZ/4O1wW4Sj5Yyq+2giQMiQemsnuVYZgvgNhSiw/KkcR2Z2F3+vp3SELwe1mt2Vpt/S4JFf
	HhO2YaERuM0zj5HISMHRIkQ5vQYgc+m9XdHObxpAYoZxOaRvgw0OXnI3Dzd+5SBUVnOlWUId4ym
	fA7pFL2ivpxPoHJnf4WRHXnZl5vi9TQAM0twr+sb1nZ3JcKjUu2RWrA40GBwCpCy3tllxHBUUGw
	zQJYrebOegyIT6Z6eJcmWJacebA1b+MRDhb4lTqaQZwcrCgP9LahjhyxtV185R2lR8s2Emho=
X-Received: by 2002:a05:6122:3a19:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ee8ade9b2bmr8021135e0c.1.1795448376239;
        Mon, 23 Nov 2026 07:39:36 -0800 (PST)
X-Received: by 2002:a05:6122:3a19:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ee8ade9b2bmr8021082e0c.1.1795448375818;
        Mon, 23 Nov 2026 07:39:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm425248766b.63.2026.11.23.07.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:39:35 -0800 (PST)
Message-ID: <65e2907e-a856-4496-886d-c9c3e8ea3351@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:39:32 +0100
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
Subject: Re: [PATCH v2 2/3] wifi: wcn36xx: Do not enforce interrupt trigger
 type
To: arapaille@atlr-engineering.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Luca Weiss
 <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com>
 <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX2MJa1J8T1st7
 5OaYDJkkd9R9sZh1YPOy9nMgnKe9IMMWNq4c7idlc2RdNFXGCfEVX9HJCoyOU8r3hk4lZ0HgBp5
 NecEvamllszuuVwb+FBeAMLLT8BHCXI3pPMz92HyrUJGrlBZnPKauo3Y+hIEksmF6G0O2f49Pet
 pJqvbYcKO2hL0XVOsXVTnaElIgHgdYx0ylv10ozCLrEZp21+WtopxIGX0CNx5swzHJK1/VV2/F2
 U6xNkepVmV6/zr6QVFK9Em2c8I7IpxaFKfAdLh6cqyW14M2gBDXykwe0BKbHWtzmckqJBxDPXUK
 l++bZboFXterX+iYEY2DTwSGhntkXLDNO028+ZjYhIvPMjakEeCi0g64tQJ98lbaaGxg6j534r/
 ulY962tN7BDcm3k5Vr+WUS34DIUp29HcNvkTVZIXOAXeLPbz1HO+bLl9oIPbjo8hrQAsB5o+ZV0
 YCTk33o244SGZ5Fio1Q==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b045e39 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Knk3v0qlAAAA:8 a=wt33j95wQlzQpC1BO6QA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-GUID: pNG3tVpPLYN_OsEKt7htT9nZA1JchyHa
X-Proofpoint-ORIG-GUID: pNG3tVpPLYN_OsEKt7htT9nZA1JchyHa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfXzT6pTeOdzWWa
 0vonFM/7QPInE+rODP6W6rcY99MScBWYVgdc7veaX9WTaw6WJ5lR0uLY/jyV9+Z2SHD4pqpYnkD
 oj+XdFbzkCksLG6w0z7crsR6+1DF/Ys=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230062

On 11/20/26 9:05 AM, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
> 
> request_irq() with IRQF_TRIGGER_HIGH stores level on the IRQ mapping,
> which outlives the driver, so a DT with another type gets "type
> mismatch" and -ENXIO on the next probe. Rely on the DT as ath10k does;
> every in-tree qcom,wcnss-wlan node is level high (msm8974 since the
> previous patch).

Drop the last part, this won't be ""previous"" patch since it goes
through different maintainer trees

Konrad
