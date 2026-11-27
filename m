Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781193;
	b=JPHpJAYU3ucAF1QpQIPDExFMqW3ZKOst/Oecjfnl5DbUqOkZ1n+ZYnoucoLnguSY4vBX
	 QwgiZIqfsVu8kp7oEYB093VFjXmp6YPDuSTfIEYLYR8dc2rMWUrJWXLPR6Ta651D8gBKq
	 R7d9EwTulTzW2gCalPwoMJnGUikGF6asrNDmaP12DFonLx3454fftcOjoAAl5Z1xD6p2+
	 MjszWis5BozNKzJcdXe5niEGCIvvvJtQJ/mkZ1fHxEsLpqAfWmADjX6Ja7dRM7u3cfm03
	 jjlDgdaC3EUNM2uwI0vNWfLsTngSArWQjMOfBdR+/y5qAxOZwFp3fUBe3VxpfKZT0uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FELi3FLt/Pi/OkzOMRJ8+hRRlAJ733i1PeWjERVJCog=;
	b=YFmSsNzsCgO8Qzj5sopiyDZXyG84GAwbvTXy+5Yft0QwysvrqNB889QnKwwkz40Qturb
	 z4UW+T+iT+6IIarm2MTmqMe6ZMpJpCQz6TDVZO7tdSrHcFKuilD1vsQxm9kL33UITKGmc
	 arhYO6CPfmBv3pKnPR+kR3Vd0uuFnb/r5yIWXuFpJ2/ozVTgUc3Tv+EINimYAtBJO0r9p
	 MlgmrB4zzTHSNwJTPPUiSTL8+lckgZycXxR+OoON/yPg7IeAc6/3FoU0LNlEx9T52Zz8/
	 EbroBZPPjgfwoLODFllntIbLxDURs+GetZ7vXITRkxRJn0TtxDCD2dni8kHM1ts+eKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+Wy2cEE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=biOFgqye;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC762606A330
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC762606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+Wy2cEE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=biOFgqye
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp2rS1047040
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FELi3FLt/Pi/OkzOMRJ8+hRR
	lAJ733i1PeWjERVJCog=; b=E+Wy2cEEGp8cp9ec8ULDVVwt6zaET6LAMFhORq3/
	yfd67peeBurtHEtZgo52TiKmrOvoe6BVCBInWBPoKwApmXdisvXsEXYYW6rq/jMd
	kx6KQKyWZnD02QTRElFZgRnP5ubMkMFDepJawLPNrPemza5H4qunjxIvs8J/59Y3
	bTftW9LSA4ftxYqXvm3c74OQ1dXzYWD+RX6Wn7Yje1lCIjZX3rSvdpkRArqYump4
	Q1qnk5H6VHzoVwyM79CYICdIpcoQRlH3QrSWDtEsRfqnV7qX+nAnvC6olcMMJyCN
	JNe/jbVgU7HxNAf1lB0u4HwNHavdJFz5g7BQF42HHSvS8g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqkv46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:06:31 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eab0467c89so8466426e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795781191; x=1796385991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FELi3FLt/Pi/OkzOMRJ8+hRRlAJ733i1PeWjERVJCog=;
        b=biOFgqyes6rdNtNL+EX3DLscZYqZEeElPupO9KqIN7mhBjdQ0Civ8C/Z/pDlNh3t+5
         0N/tAfVB1UFbQ9jjBPlP4zD30tOh/zkzH3usDaNhUvDL5qOgwfkDVGMLcSaR8pMP7sKV
         LlVSbndPqSOkyx3Pbtd51wEsJKG3KsrlepRWXMN7GWSFFSur9sKFYt34Hud2MfW2xVac
         afBwZDFTq+oR87Px8Pv2hFQG9/m8O0fjE8EbJLo689ZsuGAtwa7uE69Av2tVD/0YowBg
         e4RHKYMO7rnkkjlyesEMqnEoHa/yrWJeOM4paMYrM3crgGkEUtQk1z7BvMHleHOSyj8x
         jPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781191; x=1796385991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FELi3FLt/Pi/OkzOMRJ8+hRRlAJ733i1PeWjERVJCog=;
        b=iqWfNkpMEwB/Mc+sGmMtGutPD9SHAdI98cgzKN0LNa7rKMjvWYL5hLapEbVoJH8woX
         G4lAPYn1GJXVIfQS65kkVmZBX2JsnAGAUcdwb1na5uQjTYDxJ83UReqcmxVxZ4Z9G7no
         1tZST72t2Lru3dRq/yYYqdD7cfdcuRWDO+5ylhpN0CtZB1eCLuz9mXC2shyHKmztfVA5
         5+L4iJ9VKgT2fl7gSMkiEx+XyAf/WMDIqnjWyvZv2xXDKy8T5uzNM9GCh/lYIjnHlKg+
         0hilOFNt5MVrgXmK1bOR8eKl5eH2Tav69WGGboOJyTW84tANtoUf7dNMjyZxytRAzXI+
         +ALQ==
X-Forwarded-Encrypted: i=1; AL+hErHi7vEFh8ZAI0TMYz1jb5VN9c2wyIiXRuRml8erv/mwfQge/FGwdr9E/OX7MHroNnqyXcgI3ZrTItykCOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WXwc2SQwSVKkvh6dQlx0sDqvHTspp82W72gqBCSLCao2i8F3J
	Q8KNH948qrFo8LKY680AuPsBYFLhUHaC4uH428nHbVuiR/OW1PJ4iDHf6oNjmr/fBrvnG4YJw+9
	OZ+GN29knSLSqjYtu8ddqB9HhjrZXxSkrAJs2fi508rLvpNdc8+IJUIITNsEe6hqj9jw=
X-Gm-Gg: AZFdTZc/Ys6RSUY2JEKtbvMJdoakRwCABFVEW04h9/PEnHYTuwVQ62L9ONAqWrx4vRi
	sAW95X0Ja7iPaSG1tBttidG6xPCkoOXrR3F4GjgXFR9oysk3I+oVfOMBnZUrG6ngNmgjHC5ho30
	wHZJ0NDT7RhadQnRDapLf5BPsUQdrGOZZ3EGNwl3wrZ7+bgfhjU43GcPTE1TEnY7ZeZAHhc8Oux
	hNFQ8xbU2gyjTBtSDNB8y8/KntoHBZ8qsH27rFXpKQ7Pj90IqVIegVJdPjA3qZsDwqVJTHEcbPX
	pEtqnCdaujo1vaNj8CTojyEessXwYDArRpNAsXeTPiN0EU+4JpHWgWBEP7dZu/TzH0T+XblZBmT
	LHspkb/+DXoHNrDsMcei7R4ygHfcl8XLXKJBfwQ2YoBWRbC5oT5zoNGjgkzH6h8JEb4gEU/gSL6
	U6TB7u/L+3zk1g7Y0pYuMEF89ulyGpzZRs/bU/QihWEWYp6C6u1kFCx1REe1iqfA==
X-Received: by 2002:a05:6122:32c8:b0:5eb:7686:48f5 with SMTP id 71dfb90a1353d-5ee8af0af4bmr14128021e0c.8.1795781190773;
        Fri, 27 Nov 2026 04:06:30 -0800 (PST)
X-Received: by 2002:a05:6122:32c8:b0:5eb:7686:48f5 with SMTP id 71dfb90a1353d-5ee8af0af4bmr14127954e0c.8.1795781190044;
        Fri, 27 Nov 2026 04:06:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04451csm5860852e87.59.2026.11.27.04.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:06:28 -0800 (PST)
Date: Fri, 27 Nov 2026 14:06:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael Burch <me@michaelburch.net>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: count the pending frame before kicking
 it off
Message-ID: <kcjghu2lpoijzanqtdvd3zid6g4onyesvsouqnehepo6q7liws@af36abycxzzh>
References: <20261013172703.12273-1-me@michaelburch.net>
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
In-Reply-To: <20261013172703.12273-1-me@michaelburch.net>
X-Proofpoint-GUID: iTjUWQf-jN12tMMXPE7RhJcsJH3XEv7K
X-Proofpoint-ORIG-GUID: iTjUWQf-jN12tMMXPE7RhJcsJH3XEv7K
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b097247 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=OZ7Xlw-yAAAA:8 a=EUspDBNiAAAA:8 a=o7I13pbtrd0snOxpb2YA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=qwMvOfr3u-Fs83Rmfh-C:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX00kgz/B4RToe
 RB65SEJtXWdw8fWD26tLioaT3GrJwo38YtGglclCGKLBbDW3M+BGujnjbp1i+/um9iYPxUschQa
 ypOALoOcCGIaXSKwIjzcorDcBQL/EKo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfXw8Av2yHz5RXp
 earzM81HPa5X9/DdV8T7pmuIYvSUO7ZAjayi8zY9oP5O4C9PljLpeucOoC2XCrUd7rusPkHGI4q
 7ApwjYovFSAfgaIWwhPOMHaHNz3S0rhrr7pKKElNrk+asfBmkgoEyMTihEcfRouVBXY7uzUx3cw
 941l1/koOky+L0j9Aezhpm6O5/D/ktW9Vt6tMzubpT0auRUhwxLOO+D9VCAmwVX5my0W6BbjxV6
 rMLSkIMemjBTL/rpzJY9Cx0mzKTvQF5QgoX4hJgSExA5Fv1Q7YpgefopRqCV/ZY6OcX0miYihTd
 cb4Eu+hiLTtGhcHtojZ1o1qoDeUrB1OzpIJd7m63hjrjXvlxlpSNTHcVRKx2LR72yNVl2QMiY/m
 9y1OUbo+84JfV+VzbeRyJF7OwYLtw6W0RAkyspGNFWugN8BP4XE2hH5s5cu9PRv4H3PK/0Noe6e
 VNJQCsYhhP0fLtaH15g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270048

On Tue, Oct 13, 2026 at 12:27:00PM -0500, Michael Burch wrote:
> dpu_crtc_commit_kickoff() increments frame_pending only after
> dpu_encoder_kickoff() has sent the frame to the hardware. If the frame
> completes before the increment, dpu_crtc_frame_event_work() sees
> frame_pending == 0 and ignores the frame-done event. The increment that
> follows is never matched, so the count stays one too high until
> dpu_crtc_disable() resets it.
> 
> With frame_pending stuck at 1 or more:
> 
> - dpu_encoder_resource_control(FRAME_DONE) sees a pending count above 1
>   on every frame and never queues delayed_off_work. A video-mode encoder
>   therefore never reaches ENTER_IDLE and keeps its vsync interrupt
>   registered for as long as the display is on.
> - dpu_crtc_frame_event_work() never sees the count drop to zero, so
>   dpu_core_perf_crtc_release_bw() is never called.
> 
> On an X1E80100 laptop with a 120 Hz eDP panel this left the vsync
> interrupt firing 120 times a second on an idle desktop: 14,407 vblank
> callbacks against 21 commits in 120 s, with no vblank events requested
> by userspace. Every frame-done took the frame_event_more_pending path
> (591 of 591 in one trace) and the encoder never entered idle. After a
> suspend cycle reset the count, the same desktop showed 3 commits, 3
> frame_event_done, 3 encoder idle transitions and 25 MDSS interrupts in
> 60 s.
> 
> Until commit ad06972d5365 ("drm/msm/dpu: Reorder encoder kickoff for
> CWB") the increment came before the kickoff. Move it back: count the
> frame in each kickoff path just before its encoders are kicked off. A
> clone-mode commit that fails its encoder lookup is then never counted.
> 
> Fixes: ad06972d5365 ("drm/msm/dpu: Reorder encoder kickoff for CWB")
> Cc: stable@vger.kernel.org
> Assisted-by: Copilot:claude-opus-5.5
> Signed-off-by: Michael Burch <me@michaelburch.net>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
