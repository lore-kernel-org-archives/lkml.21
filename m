Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780472;
	b=T99EiBCxlAvLFel0TSKlhMNG2Dm0umPsThlg+UqKAHIqwxmNy86KLpEKi7bsIXMDPHh2
	 8bLGNvEzcQeaCrDuVmaUq8zJQ2P/BzAzOv0tBeTMXCwfBBDFRAtziCh+Ov5Qj8L8Yr/aU
	 C0dp+ct4wCu+mZjKG1bEbUmN0VJ0WxkPTLu6K9A7qO1sxZpjnl5Mjes9Kuh/XS82D5iCO
	 /zLB2pRwU1Gy2oHamTZwJJFyXTGMuV99HQdY4SME4HkCUgdj4x1m6aUoTvzGDYuYxBZDy
	 u84cQScJVNq4vMUpqJ/EqWlm38fEzLmsgECXK7iVQQaz2mAUDtISeBIe/Zfh7vBpHrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jOb3V4s7GJf/HR8izcqd+kAEDQnH+4Otpm3L4J95xHI=;
	b=Ia3/fgmbCezkBGHw6PMvM6iZ8QnSPVy32qb5M50mcBiDCxkJpfDnpirbkvAXrMtEqXJj
	 7VBhpC7GL7S4OJqG6QDQTezBGOHIDVRc8PQnxKD9TP8BXP8G4J57b92JfE3LYakRmym3M
	 izp8zxGaY8KzA1iYLQhALBS+oTfoBGHKPtsZp8dHzEFmZ+AnHZe2t6BJcUmmngR14kB5r
	 tvSrmlkCSyb+JJSwQ3WfzXAZzrfCZoKTPcnYEhao/ymxFEE1VWzv50pIk2yQEmrJl/ZAv
	 3XqbOhjKGwfbLy1dNLTCjHqAmME4iOPgxf7mqGay63HxdM4xgEPvefOHrc2TRCDL9fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dJK3jnfQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jO+mv+nP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5FB606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C5FB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dJK3jnfQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jO+mv+nP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApDNN1047237
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jOb3V4s7GJf/HR8izcqd+kAE
	DQnH+4Otpm3L4J95xHI=; b=dJK3jnfQaGWKJX8QOPDGefiFFSusT1SYTSKJ5OHW
	OYl3DCnYWNVhy9EOmXFJLCdv8T7a8IRMFUhMrYcX9RyjRY39MXbLFVTh3ieeQ1oF
	+LVDE6a3hj5nTBJi7pBnHssZzHheidImR6x+xvZjtV8yJAU9J1chRZ9arDxcC7IW
	rTDhr/98OYT5PmnqYMOaKUSb6JcmJb7ouXYqMhm7E84Br6K0FWvBzrNNArcynm7h
	MPfDtNomKvDmu6I7h+UCxmaiOVrd7Bhizlsi2JTsW3zXB8ng0q/8hhltQ8wF72Dy
	Vtv9G8Mm/LYysGMnpe/gOTx5LkpvBbKlcJYWbzaDNPPuWw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqkts3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:54:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fcso1323734485a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795780470; x=1796385270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jOb3V4s7GJf/HR8izcqd+kAEDQnH+4Otpm3L4J95xHI=;
        b=jO+mv+nPvuJHOZNm693KHmUZ8WjKbPzlu9ttDnGmWlfmuuweIHK0m8J8GxMK7ZtvN6
         cLOPuF+RTY6B0SydqPedUWfeXBvBGAb0BT4TCUNknTu7ZmlwJ27vvVLkZMLabFsBw41K
         271B1g4YdZRED9lyOHBp0RMw70MK5kIflDrVNFUYon6grAQnNwTvMeoz4tPWDtAZSZA4
         ByxkIDvBtg86MMj2BredGkjYFY+LLj88ixlNSclV/AsT1BuCNv2bzsoEghYlSvUPwM5U
         DE2cC8J62iflivcRET1PfOl6CfUw/+ag9xWhGdO5R1NF8t+2sZicz714j30rJzg1Dh4x
         /a8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780470; x=1796385270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOb3V4s7GJf/HR8izcqd+kAEDQnH+4Otpm3L4J95xHI=;
        b=Mfi9vaMtAPNqMMRrok+dmtdohiWU93IjqPLNrEYsGKF0sV9+c5sqM/a22oa/pu7SPX
         nPYofMaMyMmOlflXTZ2Jgd05JU3LWBIVdZfDFeciVym7LAjESwR8LXPD333zWwRtmnH/
         V51xtp/QUiuzoonKc1Uuhr2tzj4K8xO1ghgUkoMjJDeEgVa4oaYVHQoHGeQEibQieTpS
         lHG+orqtrkdNlQnhyLlNT+FK5Qp3aCVxsQSn657ge3YKvi5fT+6fzmOUp5pqDzC456e7
         FXNmXvX5LXbCYRK5wgMvYa3E2NF7A4ANbUNwpMgvYKXuYYqofLgH1gnOl3DDRjz+vfZa
         cOig==
X-Forwarded-Encrypted: i=1; AL+hErE3BxWllcKq31DxzAnNYvP5UjfZ4to0YuhaDETjT2sNmTZP18UTrUm09G4ohwQOahj1DwIXVoW6S02K5c0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ewOFgO5Qb6ZjeRoPsCg+r/lpdPnntIx5WGSaQR353/3yKu3w3
	+SRKg4pAPuIg50NMeVedcEnAMdIWyqSlOO9FPu02BX5qsEiY5PN8mdRGtmuWw6cxyZgNbHSTvHI
	7bKZs+py0xlMUk/Knlht5LaD+XWSazU0mOq+io+tREyNy5DecNOIwRuuhUA1Yusp3RcY=
X-Gm-Gg: AZFdTZcqRzBqsSTp268qtiGhOmd/yTkdQn6wjKXEKbPRjR8WiMnlIW6X4a+WD0E1N4S
	bQzvjaYskTMDTm2vCoGZpWrIfjENH7OdZcQSEKhHe5aRwGbcPA+tuLlAV9uRamA75/8tYu0epis
	UOXdbDuHAQ5Tzz0I8AC+ZNqj28fGq4KjVd4N2/EZH8NrabqwMmGqhc9ljK+knHnAbnjq0pfH2wC
	S60+01FWlRgNeCjY6eTLh3SdX/KjvAKKkuTI/XOruCQ88JaMFxQbB/O87Bf8J+BHyumbLiLuybD
	cwSS5H5tqHxyKkp2pZ2vfEwYbjTH05OwLZb/PnTE+ygnJorowYr4CFLnO3VIUexkzy9crcs3Pos
	uEMIUU3C6gsjIMoqUvv1VLr1zDafOdCOi1yoLCnHthwlJHob/V/BV9DaI1+AxIskMb1CaNWfnqM
	yccw1khQW28O6vXxMmPWvEyPxuQ5ukE0kDQ9qzxcK1Nw6QJEs5IUK2Xlm2WbbiAw==
X-Received: by 2002:a05:620a:8001:b0:93f:2aa8:c555 with SMTP id af79cd13be357-949ba9fdb81mr3886112185a.57.1795780469699;
        Fri, 27 Nov 2026 03:54:29 -0800 (PST)
X-Received: by 2002:a05:620a:8001:b0:93f:2aa8:c555 with SMTP id af79cd13be357-949ba9fdb81mr3886107385a.57.1795780469175;
        Fri, 27 Nov 2026 03:54:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff8ba4sm6010373e87.15.2026.11.27.03.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:54:27 -0800 (PST)
Date: Fri, 27 Nov 2026 13:54:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Saim Shujah <saimzst@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/dp: don't log an expected link-training
 fallback as errors
Message-ID: <5pav6gzpp73wqwyewygyko3aj4lhy7jzcwzwfb7ro267xjmzib@drwkmrcselc2>
References: <20261005131432.22840-1-jean-francois.bobier@laposte.net>
 <20261005131432.22840-3-jean-francois.bobier@laposte.net>
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
In-Reply-To: <20261005131432.22840-3-jean-francois.bobier@laposte.net>
X-Proofpoint-GUID: LMIbDIXHEf2TYWMfCAMrcUuFj0QwI5jN
X-Proofpoint-ORIG-GUID: LMIbDIXHEf2TYWMfCAMrcUuFj0QwI5jN
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b096f76 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=AVbMHacnAAAA:8
 a=EUspDBNiAAAA:8 a=-PfVqtTFaXArj6z4HRoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Z8w8RPyABVWp4NBWd0ke:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NyBTYWx0ZWRfX3bKEq11bU1Hf
 bV3x3thck04hCwFFnjeO4bplsQ9+cj2GtXght1PmGPQvRHAdAL4B1P32Plx235091kOtzjxvO22
 qHgBZaHVHjMsi+sW5dbv1OBlXJWQuIk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NyBTYWx0ZWRfX0jLxbKlXmzQg
 ZieZMZ2klL8Ee3PAP+L+NqgnI4hbl+HUBc4yBTlCr2WPUmGdqZSjiyRhpIu3YQJsNGLqucvwM+6
 Ey7jvfudkKY7V3oiC+d4g5bNrj5BcjyH5IaJWsdQhEwroWOeC6VT2X1MepN1nl4Kqx815OSFF4H
 8VdC1EhHfI7zebaoU0e8zz39wGevgeR4ilET7ZxjlDn9/xTRix91s8oe2/A7lrmrdOMwC0ArbPp
 FW7g00jDt11qgnp2YziDkbDsR6IdQsi21Y/Zrweg/GokO30kQvN/R/fIZV00SiueOyQNutqn7YF
 4/Xh+lxscpoIJNEzyagynApUTzJjhBbrveCFyOIIKhw8rMX8TFMk1hA7Spa19c3FIllFBXl8U1o
 gu1ouFP0meqG+NmuGPAUWLEo8J82nn3q5WBvoJg30SO2SEwP0Wr26xDVz/J/xElZ2lHbY2jTkM6
 89U+7fUhnphwGGidUqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270047

On Mon, Oct 05, 2026 at 03:14:31PM +0200, Jean-Francois Bobier wrote:
> msm_dp_ctrl_on_link() implements DP link fallback: it retries
> msm_dp_ctrl_setup_main_link() up to five times, stepping the link rate
> down HBR3 -> HBR2 -> HBR -> RBR and then reducing the lane count, and
> breaks as soon as training succeeds. Every step of that search is
> therefore expected to fail before the one that works.
> 
> Each failed attempt currently logs at error level, from four places:
> 
>   max v_level reached
>   link training #1 on phy %d failed. ret=%d
>   link training #2 on phy %d failed. ret=%d
>   link training on sink failed. ret=%d
> 
> A monitor that settles on two lanes after three attempts prints nine
> error lines on a completely successful attach -- which is how a cable
> that merely has two bad lanes looks identical in the log to a sink that
> never trains at all.
> 
> Nothing is lost by demoting them. When the retry loop really does
> exhaust itself, msm_dp_ctrl_on_link() returns the error and
> msm_dp_display_process_hpd_high() already reports it once, at error
> level, as "Failed link training (rc=%d)" -- which is the correct place,
> because it is the only one that knows the search is over.
> 
> Demote the per-attempt messages to drm_dbg_dp() so they remain available
> with drm.debug, and keep the final verdict where it is.
> 
> Also demote the unsolicited AUX interrupt message. msm_dp_aux_isr()
> returns IRQ_NONE when no AUX transaction is outstanding, which is the
> whole of the correct response for an interrupt that is not ours -- the
> AUX block shares its interrupt and sinks raise AUX status asynchronously
> around hotplug, so this fires twice on a normal DisplayPort attach.
> 
> Signed-off-by: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c  |  9 ++++++++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 15 ++++++++++-----
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
