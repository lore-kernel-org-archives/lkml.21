Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442949;
	b=1A/c1iOtAFS71/iIOnsWFyUSrnQVeM+1u4JOBnHBATbow+QRR389p+JsxvqQS7a+Y936
	 YYAZSSUMqolPr4U136epJSuzjVQ1Nlqr9X9Z1nnBDVCYKnbOz6XVFHmjALuVQN1ahvEma
	 I8x5+UacDYfkd/y0xTGpoPv8Dw095no0vkBkl0Zh/PqEKwP2BoQtjf9v8k5DaGArshaYP
	 jLFyEbT+kFEmnq8csMuUv7jDRmjjKLWTbalG6JC8dhOWmyMxvXLkkkHWWYtuw2ZMuDYK+
	 2FmcTReXM6c+Pd9u9tLXapI1PEPORId1lIHkfiQBZQLg60vYtgdC6whrnF5rx/EiEOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jWm3eC1qijH/907+jc46VCFuhbyfdVngNxfZTJu2DjM=;
	b=5GWjPTAvSoSY5HZoL/NTE+xHK5nY8qhstr8FsMyhZEklM3KNnw3PoHjOs4IqYA2+urqk
	 OfFwb5ABL7remSUV9dYV6lc0of/AyTfPb9LM0oaSfTo4DVmxy1HcUu845jLnn4+YMcsQu
	 zi40ivIZTOsrvjvVM8JYbJId2L44bR+swhkQ8db7Qe+xwXtNKn74yCwR3sUOnVeAbLHW7
	 +XQRlZknc0q9mlGLqZQ0m7ypjl9ovpWeYq7yiRZgGvTxBIbNw4EhOWo07SlHa7Dy8Szaz
	 RVMqrjyPVIFcxduq5U19ZRBed+L6XnV6iw9ex7oU7wVKtEItW1TpQPdSEbdrPr+SNZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LLgpdGUJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFzz6mAc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6053C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6053C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LLgpdGUJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFzz6mAc
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL5ke3072636
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWm3eC1qijH/907+jc46VCFuhbyfdVngNxfZTJu2DjM=; b=LLgpdGUJ1SlXSJg4
	iAjHuvN3tMNuAcVJq86sDrJrdsqkSutslZIpmoxy27btfMPoVMSrSTpu12of/lIz
	53ZtA6kWIF/7TZo/7GdzbNfTvQCYtKagk1lMp4OjiB8j2e7f/qSBZO4IcSXAQTvN
	znpw3SrnTX8eJlFkZDA3hDl13H4DLM890NCeLnt81Si4TBNVZau8f/WiKynlelWJ
	6VjuLy7RIvmP3YEZOAGCdm6t5TUplTs+/XV3m/F6W+w5jWBcoT4x6MQDEVtf8vAA
	ChRu7uBtDabzU/tgiP9q3VBfj3S+X9m9jMQlp7XBiQRhtOv01aUlJH+IsPcx8ggm
	G41zGg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7sbpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:09:08 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b4bb8bf464so48966517b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442948; x=1796047748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jWm3eC1qijH/907+jc46VCFuhbyfdVngNxfZTJu2DjM=;
        b=KFzz6mAc6oJd0WjUxSfoCbtaL5aYGWhd+3jYKePJfWujSXJB3N++iNL7pJwCtPbJLe
         GPAi2Uh7yATU7typn1Xz+bVJS+vKuUiBTbZ0yUtKybjEguWQu4AeXMnxbZ8/EJf5OOW/
         aqB8TGcnGUuVOtNmWu/ofmv3dYDZTDSJ9PFQVW+nx/gerECdz/qCYPiBCRcOcZrXBj03
         5ptLY2sin0WuHFVglRcm2BcEo0+KTtny6S9O1spdqseJC9AloSTvrZ+ljBklXiAAYmfB
         VB2SszRoNkF8N/9QBmiRCupSqE9PfgDlEG2dtD+eCD7k/pw33gvBFyFoykexoJuOLmG9
         gO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442948; x=1796047748;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWm3eC1qijH/907+jc46VCFuhbyfdVngNxfZTJu2DjM=;
        b=YjuiPXPMRz9en1b73OLhUODRJ0WOMEJBdiBP+NellRtZ8rYm+jSdQ4GjET+lH9JCh4
         V5se9C9T3XpIqO+bSac0gHFiEDczSrWMMu8nWZBhZbsT8qxDBiKFCEgbflxvoM/gdvF6
         MeA9YYh6f6uvtPltTDtqJE+3OK7xMq45U44LRHU/H615RwAnNILKvQMipQ4SltsRdbXQ
         aujfShSsURWSPoa1OEt56/flzWU/JY9XFRUGewcdXX4W9qrLYyMU5iEpoJCxS+3tg9Tz
         MjVbSTAlbWD+OX7BJqDKe7ZEDp2RPxgNdYeowDvCV+tEiW1ocaIVm9NCuOpYpG/qO+gh
         pxow==
X-Forwarded-Encrypted: i=1; AL+hErHyK8PoibAytuM9yxuoLnVsEN8aXyT0Pd9wMgsxwbDZ+Z/6UxfXlU9JKJzHhozU4Qr9duHGkCBImLKbCdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ybUZaXg+Im9WeJMEPMzkJs1FxQn1ocFPjPZUxxHeON8e+ttkP
	IIG0Phtmy3/raIkRHWjjsKjRfen1czg5gsAfO6ika6PYXR53yy4Odw2oKOfbqcqM2x/rsplWusF
	v2AQhkvp7Ncj8iw4ClO/yUNA9gKB3WTfMSVigIbmvukSG/ux7KAgZ5mBcgdVJg+hdGlA=
X-Gm-Gg: AZFdTZei0BcKGHT/kY48Ccbquo+x4DaGxzo2/e0DwCN9vRptM3Osyln6T+ATQ7T/roe
	Tt3DJ4sibUoO9mFAyfoFWnWIsuEGjv7/dKESaB0ul59cVW3Tv2cO0slOM/w4oTEYPtPiyx7ialo
	G8C68ARvXDOOdYpJ3F0cFP2vh0fxzYMBFUjP8tb48Nj8zxvhDIRoQfAnLPKhawPFT3Q2kUTzxrQ
	AlTd0Fv7XunpDJx/+gg5OmBPglD+TMp8Zf7PnLc5xMSxAPR7gXpmw9DhxCr8Xlhg6fWGDsoOaUh
	TahV7RzO0VjSp9tnE6JeOtwIrjRNHUSFktYT/217UwjlLb8u9/nH1E+yKfocHvXURTrLrSswaQp
	7b621CQxhj+30is9WSRhg+rXU3mY2A7jN46KSN02xA2x8gLk+T2rwJX5j8Yrm0qT3N/4JwyPp2k
	Ei
X-Received: by 2002:a05:690c:9b0c:b0:873:5c6b:a305 with SMTP id 00721157ae682-8b5204dab2emr44238347b3.51.1795442947588;
        Mon, 23 Nov 2026 06:09:07 -0800 (PST)
X-Received: by 2002:a05:690c:9b0c:b0:873:5c6b:a305 with SMTP id 00721157ae682-8b5204dab2emr44238237b3.51.1795442947231;
        Mon, 23 Nov 2026 06:09:07 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm23866920f8f.11.2026.11.23.06.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:09:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        warthog618@gmail.com, gabravier@gmail.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: gpio-hammer: Accept the maximum number of line offsets
Date: Mon, 23 Nov 2026 15:09:01 +0100
Message-ID: <179544293817.66058.4113101033657757077.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120061827.98066-1-zhujun2@cmss.chinamobile.com>
References: <20261120061827.98066-1-zhujun2@cmss.chinamobile.com>
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
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b044904 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CxNR_xoaQCOUwlmFdjAA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX2cLIc+dbYJPt
 cQxGsKffQlGt/IiP+QMgF8vFSoIWfL86ZSS2KfdDEiozTXh4nIPXzujkDn7wb8dZOn4t9PeTkfX
 BTg7rQaQ7dh9b1+blhNHAec0CMe70It+zf7npWhJ7N2NlfyAfrneEpk5SxGUjo0dz/j0H8uTfv2
 gME114HIQl6+BBcoz/5lZCi/oVz4mWPj8b3LBdIiGMXt22iiujCrRA0pcfoyoApOwJ8oeK4lZlw
 cZfw70GeQHDMyTohSyitODs7nHRFbDMDuPQV9pNZ0vBuU4btnPVQuqRuSeRUkr9P3etk7n3IEmx
 3zO7Rzcws9RHphOHBgxOkNLqEH9sITSAOnQs/ZKFwmcNlTgtax1W0oE1OzcWwOko+3PmSQQyBFO
 smUOIGxtzUxLM5qRV2GTuwK3HoCPYrRHVK1a8PpoJSQy0g2R+IBPqYuURZc2s6NRPwCUUsNBvXD
 IXDKZf9pce2kV5pDTxA==
X-Proofpoint-GUID: 3oRBSa-BK8S87wscwW8tZQtMLSaXpxcP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX3mxq9Mjg18WH
 l+80f1H3+bh7Hucv3Q8QhPuCyh6MdA/eVTA8l51sWObwyPPbg/BC+4K0ckKf2SgCodQMtoa37ZG
 UcLn8m6wAZugc8q7OLfoKoABxIm1SSU=
X-Proofpoint-ORIG-GUID: 3oRBSa-BK8S87wscwW8tZQtMLSaXpxcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230056


On Fri, 20 Nov 2026 14:18:27 +0800, Zhu Jun wrote:
> The offset count is incremented for every -o option, but the final
> check rejects the maximum itself and reports one extra offset. Only
> reject counts above the maximum and report the actual count.
> 
> 

Applied, thanks!

[1/1] tools: gpio-hammer: Accept the maximum number of line offsets
      https://git.kernel.org/brgl/c/0b3f1876d6db7fad0391ce714b315269b0dd5758

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
