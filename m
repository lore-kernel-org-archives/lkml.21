Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084533;
	b=uMEisz/YmHLgwfatjQYWGoUs9F8u9lRe+RuPZvKAtl1+5uTUaUoV8EAcNWeU6ArumyDF
	 JCtMhUAFl6wemrtojoBVjtUhm6w1uSxGf1J1PT8GT4UY5NkQqonnWzmp4X/ZbgOpkvonT
	 DeNzSFp2FScoqVG80ANjZrfNO9aFguY02N2UguZI2QHFirl4bAJRvj2HLOPaJCEm6Jnn2
	 N7DQ8geoVLCMbEFnf+1zocag8Jmr6Nc+BSvqAAFgJYz0M+XGRfZLHXzzALUruNQpVbW9M
	 LspsVxcUQUaT8s7nbPYpp9Cy2nPxEPlOqECdWV4bMQnR/YGy5x2f9TfY7Swhykq80rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Cnrr4Yn7YHkbhryjrkHy7utpdkTnIjvy/NXUx3UPL3k=;
	b=JHfq4eVJBsPyC59G+L6QsMh3NuJOyMRhz5r/S7pyqv51QgHRZ5rvSjulJYXEvoHrH7tb
	 PbrOtcYGnTxD3bheCEiPJpQ9mQ4wAdAmm/xGeikngTxhSWQm8EZi8Ctu6p4Mx1cVB8Ma0
	 2wAQiZSAlYEK9rCPqijaycBZPx6RxOeN8SMWGb+Yw1mPr3ddJO8vdnShXjohoLJzKPRH3
	 Rtk4Tp/t6H1j8Lwhv/VnwJ1qzlervEmHY69m+rQuXEvNa6h0lU165foQ6G6Rxp0b5w40p
	 lecHZGS4J1p4T6fF/h7iIdtV1rUWN0lsKDYryBsY0w7EetNYDB1txdd+/i0UUcVXnHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcfjQf6T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEs3TUN4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95410606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95410606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcfjQf6T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEs3TUN4
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ9IOCX2514207
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cnrr4Yn7YHkbhryjrkHy7utpdkTnIjvy/NXUx3UPL3k=; b=mcfjQf6TW5pUx3ik
	7wCEwTKM/pEtSHAzhdW41rpIfKhqj4q70h6/JeA5SWJgk6ZpSnYnVbrRx75oYPF3
	4z5kT6B9vpPg6GrVHxvN9Md/63GXQDNXlmgRtIHpHaPm9XyFe4BPkg5wTOfcVJas
	/YGBEh42IlsICnVQSN91glTcE4s6J94V2HfdjpbSrY2N9RUrNlFnSHNp6/zILFLu
	O2SFvLa8d0PnklJfX/XiCBQvz34gzWlqPSvF/e50ysT9TbekwAH391s6S0BAQ3e9
	NW1EZzIWD1HHjDK4HLJs0X1083GavdZLWya5MyrJRGc29FLCd6Jwz3cbYtUixSiU
	2jgfnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xc6raw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:35:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso396589585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795084526; x=1795689326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cnrr4Yn7YHkbhryjrkHy7utpdkTnIjvy/NXUx3UPL3k=;
        b=WEs3TUN49r7BzVVrpbPYgSUAmwgV1xmr9y5/y33hD+4EYg6iafwb6FTmPKVO8oHBeD
         zGvIwL19J870RNP6raf/In9ik+rDYBOJK7RkrW3RfgryBKkH/8k1czbAZMSTS1tLSo5c
         +C43d2ikNrTPck27fTbZe433Dw63ZlvELoHti0Ri9upfJZ8x3Z5YLjTouJg4cg9eAlM5
         Ebt2R674t8SNGkvzEfXpqwBO97Wvl7BIBNc0+npBmcOeiPRn4U4wkwoxWP4U3uXK5knx
         m51UpBqTr9NOHDMWoAs6dWM/+qcSP15DFIpYc7/zhdSjAhcG1SZ5H4t/kS9GThAUanz8
         gTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084526; x=1795689326;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cnrr4Yn7YHkbhryjrkHy7utpdkTnIjvy/NXUx3UPL3k=;
        b=belYsUZzOZuFomhBvKKnLRRzW7hqxa2SYduPDA6L/5xXiQAYCV88e2HteYxsXwq8LC
         5Hy22uPlDyeBX90xpmNRMmawftfV/N2/uwekenXXWOxFzf4h4Mi9jFzT6Z3MvbrSn0xE
         bc5c3AS/FbyArpVncGpb0dMSgSZzd/Ojok1Ot0jZENt7iXcteTAJ2IJVX3/AgL7a+bV/
         6A2phm+2+AALhRj1Y9kpQN7Yfx/kV15v6R6I00sHOZ0yhKrN5nDo1YbPWNgl+lg7wGVP
         3JnkyGw4tHY/sl+9B2Fq+6HQKR/RTofHXS0PqXT5sJULcP55711jltXihy9yn+cKU6qU
         p/mg==
X-Forwarded-Encrypted: i=1; AL+hErH8hqWGV8UqAw9nrcbIqzCnYQISyZMcVIPwFwEkrXvdSRwIv1h1Aclt6RQz3A05yLa55PApApMVvsv8Ye0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p5CxgLwsMv0rbrPQ6d8D84yvM5KAddBC9p2cc4HQFRsTaKR6l
	PInYxqW4FwZVKDkLVje8B2UxslIgiTBLMaXuVdgoo/G2q1vpCsvLgTnJ6Crnto7ZIo1d07Gd/XR
	aujedTGwcChB3ClGqWnI5jWKZ+4T+BWMOOSp0ym3YsBWTWfEKWuikDwFrwAW4A0hwb90=
X-Gm-Gg: AYBFou3Nbampw5jw9bWaqBrUJkuBYhB+i02d7hZzmBpdDUdujjfVYNUfTo7Jom4YzC2
	mNlH0Q0OIjgJ89S6HHfr/BIJQCcJl3TQ7WY8kVYxgeCn7W48QDQacIRjzz16I8qgkxPyIcP1AEP
	FwwvRcY7veDwkvf67n8qdj+SFL5ZuL98Bd+qgeHNL3/Hwc8LpDeZS5fb7pQspgSu1YgoXxTi5Vc
	ecG0hTuPDgsyrW7JpxNf2vn2XjQ0QtE1TYzAQX8fBkGcbPBNUDZEWlHot54Bupp1O9TiRCqznCm
	02+9Z/tNzIEbRr/+d3GBREyIiwm302L7nWhHJHWuR0gJRdDR2nYvQ7sJJ+ZxzCn7a52CdIbTq2a
	x0Z2zbxPkFAQ+E+0TYcNMIOXqc3JJBYAku+p8e9yRq8vJmhNEZYmzoXuSemLsJdjIPD8fDtODR7
	g=
X-Received: by 2002:a05:620a:4551:b0:949:873d:3dbf with SMTP id af79cd13be357-949995e0f87mr931933485a.59.1795084526252;
        Thu, 19 Nov 2026 02:35:26 -0800 (PST)
X-Received: by 2002:a05:620a:4551:b0:949:873d:3dbf with SMTP id af79cd13be357-949995e0f87mr931931185a.59.1795084525819;
        Thu, 19 Nov 2026 02:35:25 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm10237506f8f.44.2026.11.19.02.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:35:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Jiawen Liu <1298662399@qq.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>,
        Dan Carpenter <error27@gmail.com>,
        Markus Elfring <Markus.Elfring@web.de>,
        kernel-janitors@vger.kernel.org,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v2] gpio: omap: handle debounce clock preparation failure
Date: Thu, 19 Nov 2026 11:35:23 +0100
Message-ID: <179508449069.49049.11977204683056699145.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_D8A4B6EE90931660EB6F586543FD58110E06@qq.com>
References: <tencent_B4F504456790E8BA3C4EAB80F4BFB6954E08@qq.com> <tencent_D8A4B6EE90931660EB6F586543FD58110E06@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6afed0f3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AXu-sfnRVQekOsvvnCgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MiBTYWx0ZWRfX/+hrV5rQUzK2
 BHU0CORn/ItV6x93Xvdent3qItUcvoCcyTjs/ddKcJLWzqI2W92VJevv2IPDPsfEORVBVfbkqbq
 LkLHv1Ojwzdb9x8ynGkQ4PPPXYUx2syRuxCNQXoOMFF1bScwxI4nEWJFmmXiUosAoKqZSqlDvrP
 H/weAJRBhw6cddYYC8TQKuotipPg+rwghO3CvXHztK5JlYFFf8pizpzzLUbjpYH7BKSlPSmh2jm
 kuYSL1DF7EOL2+EeFhTTkXi3qX8u8u3Whp9spnemqRTGYyS2KR9UZcfJxa3ysf/TKIaE2w30LPR
 8H1uQiBrTvzy/349hEA4Fhrc/lVnB7zFEpuE5+59BTLdrkA8RJzvknqXm0cRAjNBKq6ERN9ewuZ
 3MNhroef20U4tOkhrwh6iJry9/m+zTNa/u3EATItHRjq9Mc7MAg7LG3n/bh7HlrLbvsfJagHItw
 mP0uQ9nOrblYWQAtKYA==
X-Proofpoint-ORIG-GUID: vQJ14BqCKLi1ylYYYmrcCA7655Ny7V82
X-Proofpoint-GUID: vQJ14BqCKLi1ylYYYmrcCA7655Ny7V82
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MiBTYWx0ZWRfX5eeRXZyilYGC
 zMKYkLXzPfPFZ1FKHbMnQU7lMZ9FNPqx4fmXS5XgncbP9DpLWnD+CuvJLSf+fBXH/FDANoOiLEl
 q09MoNr1YUmu1m+Cdr8YRe8Hp5oVU94=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190042


On Mon, 09 Nov 2026 17:42:04 +0400, Jiawen Liu wrote:
> omap_gpio_probe() ignores the return value of clk_prepare() for the
> debounce clock. If preparation fails, the driver still treats debounce as
> available and may use or unprepare a clock that was not prepared.
> 
> Use devm_clk_get_prepared() and disable debounce if the clock cannot be
> obtained or prepared. This keeps the existing behavior for clock lookup
> failures. Remove both manual clk_unprepare() calls because the managed
> clock is released on probe failure and device removal.
> 
> [...]

I dropped the development history from the commit message. Next time please
don't send new revisions as replies to earlier threads.

[1/1] gpio: omap: handle debounce clock preparation failure
      https://git.kernel.org/brgl/c/9df982f1f283d2f2a9aad764dff92e36ed764e16

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
