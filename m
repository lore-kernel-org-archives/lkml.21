Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780423;
	b=e96OhkSApHQxSUhyhxi6TjAv6zCXI2UWg0vdw6ZJ0ubd35MgFhPslJCsuwpQ95USPHEc
	 mX0B26oFQlA05YIZYTfjejT7VQNsspe60qIhkA+H6NlpVi1onnheq9Ja0b7P7CS/Py+Zd
	 9rtZZjmC1B7hofi/UF0I5s5tXy/cg60rqaOK7DFX3wRz4u2xrmUmPoTuoFqrJH5jCZgSq
	 SNN69CNjKTP+z394HFVR+RmTt1hOHn16De0/ZfDqx3EHo5xrYdJQw3g+U+IDaDBIe/orM
	 mYq2+Dt5YUSgvFglhuL534n/sitiaPx/gdHJA25x05knTTEW10bzSStlR+2A9jGi7sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780423;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h1q6px63hWFp2BtBbqQNwKX16JMwBQoQCIz9pZSqqKo=;
	b=wDYSm4ljwaonYpCc2ickF2+hHlKq3OJmLaxWry9LhAQ1CL7tedA1hNtzzynwcSEewdnq
	 xfybO1LGN8xsiBOaM9teYPp//IyGJunYMmsOAjS3Fal0LsYzqVqYt+36zgklP7o8qFMi1
	 MBJnivdvmMQFW5cBdX3VZ0hLoRET9HE31c3q8LUk1LoFEf/et9xRWKi79AEZqtbVtA08K
	 lHxUgtqcLmiJaVk2APxorbgbghMOcTqjUTuMYmgHH2HLnwtz4mEcxWoTRflHnN17Sj2Ld
	 tNv/FxyOJfHnG1XKLb8wphcWoLvLDNuWTRqMgx8BYZ9ZqZT+aTLs3kiTqT80hIgxHzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YG0tSt4W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdYAn2y3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647E1606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YG0tSt4W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdYAn2y3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApV4E1685549
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h1q6px63hWFp2BtBbqQNwKX1
	6JMwBQoQCIz9pZSqqKo=; b=YG0tSt4Wnt3sw/KXZyt5Sv1Nf8Fxpqws+IcIJj6m
	4whyWDwZ3D3WM4KVOMjhVDSNvWduLKsCRuwypiMqsU45hQyvxtpVYWnPN/igNdxE
	JBAwYmNe9Diyn5oBipi52RloGJk6oUoCpgW47tuAhLWKXcQXTS0LNwNu7AlghWnj
	Uw9/ig0D62O7daP2xAr3Y5SqFZPlZTuUa3K6eAwCPmZUJpZLxdUrnFKT1uxULLz2
	3OlrzIXA+6EejWi81i9QLJjyYWWFQrr7kRE/4NSZsHOQXsFrzJCG53XHU0wIz7sj
	+dsopKMPaHFFtjt/IXoJOFP/t+7knJ0HY5lAXwsTso0oPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k943f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:53:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so1551175585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795780422; x=1796385222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h1q6px63hWFp2BtBbqQNwKX16JMwBQoQCIz9pZSqqKo=;
        b=bdYAn2y3Dijys+JMW7P51tmuJ1fNxl729rWOdih1sVcrwPDrzGnsDkMfvo/Q2+DLgu
         KsrJIMwSFmPHmAlvlJIit0SBSYFNMg1kILjdE3+jVFQdi/eknkePuTIgzMnGMLRQ+REK
         Z80/9M/AN18ltIj70/HqNmhjKJG2e6H4q3Og5KL7pFChzgdUp8nMwbxGItiCSHpFsqat
         6Rl+k6CDcwYWC6vkiIc+YtKjaltWH29RNZB6LrpFYqnh8OL+ICOkFG9oJNwiBLnxDEIE
         bTaVJFFL7/6YOOFB0jVj52wHzsIgrXZNzRK3Cp1kD+nD29fxcyxBffjPWww9bgs90Mro
         sjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780422; x=1796385222;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h1q6px63hWFp2BtBbqQNwKX16JMwBQoQCIz9pZSqqKo=;
        b=zZLfQ0yZI7hAexGbHYZAZeBQXVbSU1QSXMDaOitim4FlHQAZD9q+HY4ldfcujsuBIY
         PTxAWDvO3mI1lJDvizpzxU6l09kGGpSMnJ1XE2M4l5eQskv3Ss2f8B3F/Xwy5c4Zm25i
         ilZjlekWdFDfcHpkJA5ANLJqgdje/QqPi2I1QzaXnrxYiibej0kLn0GfcpQeh1bjgYFu
         SHI1tXjqegYRAB70bhwA6VkEfYg6M2A6yA6+OxI9iZ/ajWJ9+ldQ2XRnHON2Axdeex3T
         Ief6vlF2z25gAzW5QDfkHNQWWOtH8Njy8/TF7Ad9jrU3sHOQC3cvXr9VK7RA56QLR8bG
         nzxw==
X-Forwarded-Encrypted: i=1; AL+hErGQLgYjcEYwMabA8Wm6gYNPHECllaRgWLcnSQopRAhJ2bTUd8IZAIg2TSm6aHVKgLusJyL+HasAvBDnQ8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M/BPKRu5nd1XlONH9SB1NKh2BhGA3S4kVyeR6YOwR/6EQj62B
	D2dud03A49jlkZ8XCyOMM7A1S/kpY1kGkPQbk4adS9oaAG8dqtCMd3jtAghXPMNEbatfYucm/bp
	uI4TTjenX8HlYld3l1RE2Wh3fQgz1gG4YgjEWoKAjKGOR78lXK6ZXkeUdkwJlzP9iB54=
X-Gm-Gg: AZFdTZd+q1T3fTBwtw/h8ft+yVXOlX4BqsVL7xAjkon4crEuRUuA8G67qmEph0qkzdR
	Nf7q1DEYUSytk8K6IehFqJnpbyv6u3nZTjMZKiFkvmSAz0Tuw5JDAJKIn4fi3TAg//ZP8MEDHQD
	4VDuYqYzXqHrpI09JtXYa2FDeDZ3V/kpb8x0J4D1fdY8KlnTNj8n2HNguCjnK4pqQLKcGTqSPmy
	2EpoJL3nfC2tVrQsi60WWKYcfQIJbVXiT8BvmhBwacx2FNbVrnb7u9pZJi5kUG9f+R8X0TDK1/9
	aIWuHonpn2f3Jgsldn2tmQoiZfqxu797wUQLPxhl4Sc58SI7I+iDF4fKonMbWZD9GH066i+CqgE
	WvhVON7yKvxJ3iNvnRbQZ47/LdI2ZwrWFVprmlrkBd/pOyuxJfx9diC+GPAeXCMy78I3Yib6sub
	/V7TGYDoQbiw1AGOww3Z7ZB3bpKDc/lEF9BNACHpCnkhbnDYa+cPh7EOedGyvchA==
X-Received: by 2002:a05:620a:2b45:b0:949:a7d0:9fbd with SMTP id af79cd13be357-949ba9e2668mr4432219285a.41.1795780421534;
        Fri, 27 Nov 2026 03:53:41 -0800 (PST)
X-Received: by 2002:a05:620a:2b45:b0:949:a7d0:9fbd with SMTP id af79cd13be357-949ba9e2668mr4432214785a.41.1795780421031;
        Fri, 27 Nov 2026 03:53:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8055cf80sm64383021fa.36.2026.11.27.03.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:53:40 -0800 (PST)
Date: Fri, 27 Nov 2026 13:53:38 +0200
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
Subject: Re: [PATCH v2 3/3] drm/msm/dp: validate modes against the trained
 link, not the sink's claim
Message-ID: <bm5qadv5cuyfdeu3ggvwmme4q4rj5bsr6qur6zr66ciq2jv2fn@2vq6f57dyf2z>
References: <20261005131432.22840-4-jean-francois.bobier@laposte.net>
 <20261005155615.32923-1-jean-francois.bobier@laposte.net>
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
In-Reply-To: <20261005155615.32923-1-jean-francois.bobier@laposte.net>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NyBTYWx0ZWRfXzSOtE4nSsDdA
 AEVzmnvruommZjUDEMG7NQDV6wU9rY3023RYi8N5zvJDBCh+aBa9NB8foXR8vGutmJ0WXNbdnNV
 YR5ltneP0Z+Whfs5+Gc/t4+jnTfuXL0hm7m6o8wGQXHKmdf36ogIJSaD3NVXUO3IcPs0MMTcWNB
 RLCpBcEBkVqnibwD2erIW+ZX9/UDrK1HgqRGQWte6oGaYPegLAazbWkxO4j4YjDDR66kvP8FJRE
 PuBst7jAhoSfyu4uBUNAj63gg5Ptbcgl9TEOfb4hoYrDRf9B9YBUDba58yGFywLtfVejycfgqA9
 6IVIyX61GPZWIERJJrn7FKnRAPAMtG5WBBuJGoZvR2fM09dJ9+vv1M2xmnpUbFjV4skhwVg5Uff
 Bo6jqAICx8cGQr2vw+gv+IPO2OY+k+2hCQEmVwMl4YJjDHvcb/bC6NvIqCngOz86c0uDa/9muBX
 l4PsXYJdbSGyus8uCOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NyBTYWx0ZWRfX5vfPY5dUwnmp
 2josRHrdrFitD+9z+B7qzZkgRQvghJB/Whv+/j2NfB9wuK1CbaB1eoO1QxeBW2iIj3/sWGPkvkN
 0bT+7ptuDId4ejymA2eeiEaPMx6UaQk=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b096f46 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=AVbMHacnAAAA:8
 a=EUspDBNiAAAA:8 a=SNIH7UutgQ7Xh_Ke57cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Z8w8RPyABVWp4NBWd0ke:22
X-Proofpoint-GUID: r08AXu2Wgq2_x7S_LfQUmdSg1BjKzlX-
X-Proofpoint-ORIG-GUID: r08AXu2Wgq2_x7S_LfQUmdSg1BjKzlX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270047

On Mon, Oct 05, 2026 at 05:56:15PM +0200, Jean-Francois Bobier wrote:
> msm_dp_display_mode_valid() sizes every mode against
> panel->link_info, which is what the sink advertises in DPCD. That is not
> necessarily what the link carries. msm_dp_ctrl_on_link() walks the rate
> down HBR3 -> HBR2 -> HBR -> RBR and then reduces the lane count until
> training succeeds, so a cable with two unusable lanes trains at half the
> bandwidth the sink claims.
> 
> The validator does not know that, so it keeps advertising modes sized for
> the sink's maximum. Userspace picks one, training "succeeds" at the
> reduced parameters, the mode does not fit in them, and the sink shows a
> black screen -- with nothing in the log to explain it, because from the
> driver's point of view everything worked.
> 
> Observed on an sm8250 phone with a 4K monitor whose cable only carries
> two lanes: the connector offers 3840x2160, the link trains at 2 lanes
> HBR2 (8.6 Gbps after 8b/10b against the 12.5 Gbps the mode needs at 24
> bpp, more at 30), and the screen stays black until the user picks
> 2560x1440 by hand.
> 
> link->link_params holds the trained values, but is only meaningful for
> the sink that produced them. msm_dp_hpd_unplug_handle() now clears it on
> disconnect, and msm_dp_ctrl_on_link() resets it to the new sink's own
> maximum before training, so taking the lower of link_params and
> link_info is accurate once a sink has been trained and a safe no-op
> before that -- never the previous sink's leftover values.
> 
> This does not by itself make userspace re-probe after a fallback -- that
> needs the link-status property, which cannot be set from
> msm_dp_bridge_atomic_enable() because the modeset locks are held, and is
> the deferred work the existing TODO there refers to. What it does ensure
> is that any probe after a fallback offers only modes the link can
> actually drive.
> 
> Also log the rejection at debug level; a mode silently disappearing from
> the list is otherwise hard to account for.
> 
> Signed-off-by: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
> ---
> Changes in v2:
> - Clear link_params on disconnect in msm_dp_hpd_unplug_handle(), and
>   updated the comment in mode_valid() to say so. v1 reset link_params to
>   the sink's maximum at the start of training, but never on disconnect,
>   so mode_valid() for a freshly plugged sink -- which runs during EDID
>   read, before that sink's own link has ever been trained -- could size
>   its modes against whatever the *previous* sink's link had trained
>   down to. The num_lanes/rate == 0 guard already in v1's mode_valid()
>   now does what it was presumably meant to do from the start: treat
>   "not yet trained for this sink" as "don't restrict," rather than
>   "not yet trained since driver load."
> - Caught by this list's automated review on v1, not by hand -- credit
>   where it's due.
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 53 +++++++++++++++++++++++++++--
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support"
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

)

-- 
With best wishes
Dmitry
