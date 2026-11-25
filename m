Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613026;
	b=qNfWixaPW5IoUmJbQTyNrdlS9vfNzj5dJ2sL68ywmF7898X1u4Tv/yo2/7NICHDv9E7G
	 Y5gJ6oUDHiN5F0f2p6JqCVhEL6qNHetTHl7crDRGP4Q5GKXwBQw9HyTYy718GUkHgoDW2
	 IGEc9g1NUFPpWZ/y4l+SpXKSZvv8ibsLHHReS5xozcqUFW8YaaqXs6tY4rEM91GaSQMYq
	 GzXwgNSXyivQ5C2e9LXavipF7jDYG2DuEX8WFN3H/UVXNlZB94uNhLDNWrFOcst0x/JLA
	 HNWvba8TKcLdR4HXRY9YUeqtSAOb2cgpwucpx6VMIY4f0ESNax5wxpQ2/VBHnHLw/yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DEXSKj0qLtLCuzwB7F4ETUvNv7J3DjigdPft60M7V4A=;
	b=w0U34OFC9KBOiWN9PS6ZZRJMxffS3H15zDyOmHT6Afvt44HCDSPMC0rN6eZrPPOVDk76
	 LuLPHOUXQBk/T7evIaE3zBoHc8KhfEf9s5Wgu+jr1ABeOUqRhxGNICnKq5sNBZN4tuafc
	 WZJXE1DtWMa7xFHgADW21t3DCjB4I4yeZd0LtlmfnZVYRpK6X+93axC6xX9W7gVwz2AMw
	 sMqTJL8zunR6kBLNuESDbwm8wAyjFcABFxLUVx6lYnfprWl61Qb0DHLfG/6gobUCP/3tY
	 jg+aF1DiL7ey9vkte5voc7KpR6NHLajOj8Pxwlc/aoVw36VJ+znN44OxRrtTD20FXQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UeIjzfxP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AgIMKDlQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E13A606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E13A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UeIjzfxP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AgIMKDlQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mcfN796791
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DEXSKj0qLtLCuzwB7F4ETUvNv7J3DjigdPft60M7V4A=; b=UeIjzfxPQSU5Mrvy
	XTX3ZedT1gudutbBoFGqtfnM22kog3U9MaelqjlOHQqrG+gdpoL0tsJp4SFvrPLi
	oBab+Hcyz70CNYP4Jub/V7Tg9VqjRAhQruMxDYh5QqzJcwIgBe01vf+shWbapGci
	DYRCs6QwYfOu/tilS+Z1xCjOfHnXhvbCWeiSBwo7eL6Ew11C+NQpyaeEy3zwk/Kv
	FqCQSQuBmB4ss35oKp0DjbgxwEiCM0mbRZe70N0iaI5QIozEV92VQNMKI2e4ODoj
	dsfAkKDsGQ0SJTddDgZ7UJLJMU08uz7MObJpdsAan5t0hWN/W+ww+rs9OzsoWQXc
	9/uiWQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rtv43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:23:44 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac2cf3905so1262729e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795613024; x=1796217824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DEXSKj0qLtLCuzwB7F4ETUvNv7J3DjigdPft60M7V4A=;
        b=AgIMKDlQmHih4Ig6vpNq1cdJwpFiSfzXiD9vVSoStkJau5zLFtD1DzadvTF6PVd1cx
         5KY17/0Ans9elkFt9PAnblBXytRcu/N1cO9BBDt3mFvX6c9vFGB4LpIVB+YacnlsBga5
         L1pwumLGr3nAnb+CNal47dpi/AWTq1Sq5KGW3AFNKVQasJ9hEPOMkMeueuhCM+T3VoZp
         atwrflmz7xcqCiA7XePjYV8qgIiVxnM4x5IQc32ygWY5janZCMlg7V8JbMV769sZ9g8o
         isYupyC4WnIRS3YpLjVra3gn75oesF5xKR4ouoUjPvqPVXEA8Ua9IanduFOLA681BXwQ
         UpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613024; x=1796217824;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEXSKj0qLtLCuzwB7F4ETUvNv7J3DjigdPft60M7V4A=;
        b=Sgpz5g0d9nEzUtwRPZdU38O1sM1VO3m4+y8WE8WejJNGDuqlN4Gx0YA6CIAFg3Ukp0
         QgMNkqv5Mpe8K5qazqLO7yj3tfkQLwwwBsqsJUktKKVzUWF703JRR5ITAUzo4AbLwNLu
         1HkAzK3h1upn5oLGnEC4GdeWdvktLprdsCJbJDXUG6NU6J0QbantH5+gQWVPfMz7lcjG
         KrNWAYjRIS75TLMz8tyhNj90IoB6RD22/gtGs/XmfPz9PkRjM3Yc9gT8gd8AZpzq6TKQ
         sU8ZwuMtasnlsKo9cGMYKeOSgCA4Px2+h5TpUEnBDiJtbQHzRwCDbfsgrcwKS4mSj/d1
         +oEw==
X-Forwarded-Encrypted: i=1; AL+hErG77VHoC/b08WQbDR8BRVHo51ffooghUgR9vu245mPbPbdzlyZ4yifmeW7eojmtzqkrsYxRUnj4CE0YqXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TwwQO9+3ZtmsXvloEbAwRiZSqPZfGM2VlxC4NNzz5SCu2Lz04
	t0jRH1s3UoijkGSUtkQKxejB0ncdde2QN8ZI0Dg12FKz/ZEvrxy1msZkh0+xYftZjlByd8+3Cei
	zRDfrsxU5Rt5V/xu8Bag03tXuZw3Lpl3xLZ/kCxrVmWDKRwMkh3mv7H5FMxVktfV5mmc=
X-Gm-Gg: AZFdTZcC9NsG4mvUgwcNuXfN1XxYaHcLKg+6r1YAwvYEGH1Rk9qd5QPDoXO6wy16shc
	0ESff97ycBj80LiWL2q8g23/vGOXySYbgOasl0eYgfRq/2+vbdQxxS68QZxe2yBuKTYSiA+bxRw
	c9GcHD01f+DOvSUdgp+pTKTZHsNBFCYea7qcKiDBej8WVnTSnZlboFta/ycrTR9Vmt/IML4E1mW
	sBBZXwQgwsLj4uJ6fzqmLMrG/Watc3ZvSWX8bdqXNkGsbxlL6/NlVA303VyXglIFxiUqX+JIonK
	6BEY/tzTobV1742Y0ajviqmPfRe3UjEUOf7+uwOvnUVz/dMcE8K6qqyQiCdcXYhMIYQzW+CQBXo
	CKbf5HZAo8m/EFin9TAqBHeVf5QsSAzmvkiNUXXtfDlSq4aWsldYhttLcb/scmTnHfbP+DjVCG2
	//sSpTcoL+VPMUXwEsjX/PNeuubO35U43GbIXZ1prFVHyMEE6qg5ZwA1NbKjPyMA==
X-Received: by 2002:a05:6122:7cc:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ee8aee2709mr9459966e0c.10.1795613023501;
        Wed, 25 Nov 2026 05:23:43 -0800 (PST)
X-Received: by 2002:a05:6122:7cc:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ee8aee2709mr9459896e0c.10.1795613022653;
        Wed, 25 Nov 2026 05:23:42 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm506211355e9.15.2026.11.25.05.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:23:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Jan=20Sch=C3=A4r?= <jan@jschaer.ch>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: fix inverted trace values in gpiod_get_array_value()
Date: Wed, 25 Nov 2026 14:23:39 +0100
Message-ID: <179561301701.43809.14124670705710652305.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120130208.89621-1-jan@jschaer.ch>
References: <20261120130208.89621-1-jan@jschaer.ch>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfXzdkT3KBWkz3F
 akFqlHQs3DYLUuPhbZxICxaSi/0XtmlzIpr4fxAHRB3/TNTbky3DLScKYMzKOtuQ96Ov3lg4hXM
 oNr9n1PEAI1uj9NoHOIPKFv6yz4AMuB5LBWR0s3KQJNFq11SH2Cc4Zr6GmaAaXIm+0rD7yN9wJc
 jh/5+VcZrEcP89eRvnBsgIhIgKciRVpnhEmCVhSxWxigNnQZHzL3bfTi7qZffspO3ruigSssLJd
 YT7nn/4FsGPcL7jP6TJItxFYhl+WO8p8TOPK9T87gCsQPt2tDR81gBYkn9NPhAjPPdic59FXZTF
 /QHTGMmqRH+XTtdgQSubu0NKZyAAAhQWzSxwtPynxycyQmgLRlPLRTODoz1CEGuv0EQeqEs6+LK
 wTUmf1Wc63Xc7EfkmfIzIHZ7OUODC1CtrWvqNs4nYTWOxvr+6dL3uMb5CUeQVSPP3/9fHxs5KTA
 FY1MliPiN1nT6zYt7UQ==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06e160 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4nZhoAphiK6mMl3Pq-EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: WpCByskKz6EfQiR_G9qo4p_G5GpT0MMb
X-Proofpoint-ORIG-GUID: WpCByskKz6EfQiR_G9qo4p_G5GpT0MMb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX3RVFNZW60D8I
 X8I+c7acZBIhNxRsDjJJ7U5hXWFzVii+ez/zdALWLK+TdQjslcBr2rypxs5eP+A7tL2a7OR4X3s
 PKyUj+t0DOSVK38rOXSgcnixk9CpiX4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250053


On Fri, 20 Nov 2026 14:02:08 +0100, Jan Schär wrote:
> Almost all trace_gpio_value() calls report the raw value.
> gpiod_get_array_value_complex() is the only exception; it reports
> the logical value in traces unless the caller requests raw values.
> This inconsistency makes GPIO traces confusing.
> 
> Move the trace call earlier, where the value is still raw.
> Now, all GPIO traces consistently report raw values.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: fix inverted trace values in gpiod_get_array_value()
      https://git.kernel.org/brgl/c/601acadb79b62ee52edbd29ec69d8f677dc32dcd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
