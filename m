Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780404;
	b=iN7uci0u+v1514Pn0iG7yhdMU5paaE/vvDi7B9Eq6D4ldSRz5rlgzAAxiV065zCFU3EE
	 ATsh4ciIrj8VQcLNWszt4Amfi89NX9th75FeHdjRAVXw6NAgP+dSj4Jp7Y9VTq4sAqjDD
	 TBQmX3bmeflZglS8bAzVEauZhqUK5oLnCYILzJzl0sYyCcQFUp0Wsk8ypOfKxvOBJvcJv
	 6T/oUnlHmAPRXpkEzR6wokCN+qk46Aw7X9jI5Dvxe62tIHGS7fTjK2vsNzlp7tZKy4GBQ
	 Ebizg/KLccbhBiiL/iQSAmDRjGjWZeXUXkXD3ci1hVy/30wu0iPl/0FzdI610AjhaOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780404;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NvFCw+bmf8mxbl0IMnWpK6+ahat2YBHhwXRgKcWA70Y=;
	b=AXnJJ2u7fkPGCUqOnT6yKrFgFSRmWsPh4NHsBHheV9g0bohnHDVufLk8vlPbCSgXDUzr
	 qt17KvwsMASOBfSICZ1ZQusLVC5F4EwP40cbUKfi3D9vI109l71g5eM3A2ixjsAy5R5M4
	 nbqbR+GiZJ0yRyUh/KNgzg1gtLliJ0wCIb6fI+4cMr9AqqJDN/nlA2EBH/bk2o1czteBt
	 N/Qjo2AbAkJ87MRfro0ZT1x7RsZAAQra7Xr0i5JxDr5mDnCvjvTWtQacTgRPzg8cdhZkV
	 jsoz+FEEqKgMPKkGeNY1f0iz1Kkk+cKdRC7HRdQa+7CK/Dqhxwc0c2XWIdMQdcmAu6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZSBRKhgI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NBIdvKXs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E04606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9E04606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZSBRKhgI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NBIdvKXs
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp7DE2268628
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NvFCw+bmf8mxbl0IMnWpK6+a
	hat2YBHhwXRgKcWA70Y=; b=ZSBRKhgItTfJJ5eGZq+gQQci4hJVvlNYV9R5Peih
	CJ+cWDXcpQtM+zwe9+Fej0v6vNY4MN0/mF9WPnbMVHikU9mTIKbE7uTmf28gfaAu
	twH1UsP0rhrLzdHWgTjvDYpK+8/2R4FZJRDAtfkwbKyGE6jRGmML+dcC2CQ8lW2M
	vxp155bdXqRCYgXxBcXPcelss8Id5r1IHuLPkjjRqDZZOqmMCQeV9bORvLC6OHD/
	eRdsuO8rhM7zwHqpGmCcnHX+Gn8qT88h/ua4JAomxQ6OctC/HjGeUjH4BDdN9Of8
	brG0i7pBSKvCqOaHHurHjdhrn0+1iPqPWnBS/azfiiH56w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhhfcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:53:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-946038e22f5so560475485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795780402; x=1796385202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NvFCw+bmf8mxbl0IMnWpK6+ahat2YBHhwXRgKcWA70Y=;
        b=NBIdvKXsJgGVTmOdP0szhH2cDIG1xaQMLTlsOQrmAFbX4FVXPH3scsD43tbEM0BKXi
         h0oE7zZQ6Gwn9mgZmrb/HANEZnMT/mzhIaMF1v4/9/QRYOatmDsxDDXc0l9Y0Qvprjy8
         Vj3ZZiFOvR1gOwmuB05GcIwsTOXI86jr5i9FvR5/E/SLzTxRi0VeAgcIZWp8cpmddy9n
         7m2j+krc28+/HZRw8aXo7QEU4NzeLVcP9KYmdZOrz1g7TJGJnwNjjUdgkYgfZ4II9SSa
         XBs2rNWvqNGfCuvOgdqb64nP/W1c95CRHYCX/+m1tyAn8Kx6sEDkxgdVoOsFY11nEEu+
         4QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780402; x=1796385202;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NvFCw+bmf8mxbl0IMnWpK6+ahat2YBHhwXRgKcWA70Y=;
        b=0T+I7ZVcuWFrob3k94mCxc0C9UMmlfHAGBHW7X6rl22ExFIbBBvo3PRTbpGr66DfMy
         VSxWBHt9uut9C8BNxeEjHJCslI419AEJ19mT3C38EmfAKVtNngvB+DMTlfsxUb1PcXK8
         iXQcPG6JxfzqUIgz0QdW0TaE5JwRZlcrlVYf/VXFG84r/0sBWERNGna+6CwaJVjA9YCx
         8j26A/SPfHdrNB6z7acfrTjScPapOSDYXYg19C5MRR3lHlMnyVovQKzVbVReUnbawW8T
         MjhZnUfPoe1tEp43UZ+ivDW/JxmjvKPsXgZYG0vsXsDK0u0+bgil0JYkCq8WM44tVVwt
         /8xg==
X-Forwarded-Encrypted: i=1; AL+hErF7dpmnmuZyAP1VGPCuAt+Zm5JDuYuGD15wUHLWhl4DN3PMnB7/IHlZbRfd3DUMcnRHrBatEBrIadKNjzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vdOeJqStlmYe34K7J9hhMLYyk4mf6KWgkAarYqEOoqcWDbwni
	jvebDvXAVu6mza730aL1U/KTHdatOqBPNs0UO3leYUUZo7Igimt/LxIrnB7OLEHEZdhoUofEOqZ
	IRhoRYIeFoVzmHR39LS56GjdrIbDsjBCIjWxHb9zhpT4zWtxDWCYZFseorTjrsJFbucA=
X-Gm-Gg: AZFdTZefN50jxbyKrPmLFS0TDxrHR5dwp4mZp/ElsbXwG7H5aKikfJ6li4vVBx/ZNKF
	M6B42AsORwZhKjfvjm3FQacaEyzpGX/501mul7vFuhTSdG0f9ovMieaBuhuzh2o9C/SYaLA7rS4
	i9JS7ufmxTxImq+H9giuUBGQCqWkHIq1jlMKjhOLGogCUgbqv60I7R/PF3Sgve7DQ3JWAfviAfv
	gMIub1ByRaLCwqjoRp16xBn7AHg8K1M4Tm7EYpl1DJA0d56hdOPMx11043eAFyczqTKZ/cKaSAZ
	hu7beBFxN3W83vmb7HgxZq9stfjf6nnnb/4GJE7Z9RQXH9WkJKHNKzuVcsDKL83XQm2llvx647/
	ryJbyoQXTR40/14iauvPDaQvCQQlhobrppMYpTU1JkZBGBMnU1MPjDxaRNZrVxAzwCddjZSJ4OY
	m3FpbVSmFbuS8gMTdv1ys4Cs38LW2Ih75B5GSVgFnNXupJRzSmAQMRtsENl8/bVg==
X-Received: by 2002:a05:620a:1d05:b0:93f:5445:c661 with SMTP id af79cd13be357-949bab4d2d5mr4286070185a.57.1795780401871;
        Fri, 27 Nov 2026 03:53:21 -0800 (PST)
X-Received: by 2002:a05:620a:1d05:b0:93f:5445:c661 with SMTP id af79cd13be357-949bab4d2d5mr4286064485a.57.1795780401434;
        Fri, 27 Nov 2026 03:53:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd081f29sm5910701e87.84.2026.11.27.03.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:53:20 -0800 (PST)
Date: Fri, 27 Nov 2026 13:53:18 +0200
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
Subject: Re: [PATCH 1/3] drm/msm/dp: don't gate link-training fallback on the
 controller's HPD block
Message-ID: <tldbqtuls37jgdkbqpi5ytizqhhxmzejbh3iujjg2coptvxgrh@klt2bt2gstza>
References: <20261005131432.22840-1-jean-francois.bobier@laposte.net>
 <20261005131432.22840-2-jean-francois.bobier@laposte.net>
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
In-Reply-To: <20261005131432.22840-2-jean-francois.bobier@laposte.net>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NyBTYWx0ZWRfXxN3tMgLSqhjI
 x/Wq+irNNSVZ3yJjWHQNBGYKjPtacqHRee0G0fQpNMcoM/v2YLxNGedHG1imFsAY19nwib72F3K
 1Pwj564f3ilxquhm089sihBykmDbN3A=
X-Proofpoint-ORIG-GUID: wlydAcS2P-1xICuAmMHA_JNnOIJLl7ZJ
X-Proofpoint-GUID: wlydAcS2P-1xICuAmMHA_JNnOIJLl7ZJ
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b096f32 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=AVbMHacnAAAA:8
 a=EUspDBNiAAAA:8 a=6AKRNlzo6MLLK9Xf-kYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Z8w8RPyABVWp4NBWd0ke:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NyBTYWx0ZWRfXx7Y2Giq2v9H0
 +ip1y2ftDPZkCvRVXSGLDeG361gf+X7mYAUJCQ5AMzee7x1nqMb9h5vOWDObDUOgD9aku71PLKV
 bk1YawMaLBhAkEge4XQVlCU1ZegA5iD6GxgKI6oj5Re14rkbVhJDglazjoQZuuXT8Xn+v8aWgPz
 e3iK2XAopG8UyYdu7HeUH0tFAK3P5slHB4FMZXZlQJzBLK60eswLq7tglIZyos0oEGTNhD9SoRP
 27ftmmpTrqpX7sl4huvXSE4yV10DjMVjDFzK2rgAZdgfblp6Un42idOsaxKbv7KMOjPH2mQnPTi
 Di6/ChZwA70Fxvg76caelGIRB5HVFv14WOo1YfExMPc+39kW2JFiHir/bSMIt/vz9wMCRQmPab+
 YWXq73TYE0Yi7QisMUSZnf+k80fvT2rDJWOVQMwGUg7K2L8FL/TX/f5UeXH6FrxYlBBlZRR15y5
 ZMduAM2/0CHnQMRFKbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270047

On Mon, Oct 05, 2026 at 03:14:30PM +0200, Jean-Francois Bobier wrote:
> msm_dp_ctrl_setup_main_link()'s retry loop is what implements DP link

Nit: msm_dp_ctrl_on_link()

> fallback: on a training failure it shifts the link rate down HBR3 -> HBR2
> -> HBR -> RBR and then, if clock recovery succeeded on at least half the
> lanes, reduces the lane count. Both failure branches guard that with
> 
> 	if (!msm_dp_aux_is_link_connected(ctrl->aux))
> 		break;
> 
> which reads REG_DP_DP_HPD_INT_STATUS, i.e. the DP controller's own HPD
> block. That is only meaningful when the block is wired to a real HPD
> signal.
> 
> On a USB-C port it is not. HPD arrives out of band: the Type-C port
> driver owns it and hands it over through a drm_dp_hpd_bridge, and the
> controller's HPD register reads DISCONNECTED for the entire time a sink
> is attached. msm_dp_bridge_hpd_notify() already shows this, logging the
> register beside the bridge's own verdict -- on sm8250 (OnePlus 8T) every
> attach reports
> 
> 	msm_dp_bridge_hpd_notify: type=10 link hpd_link_status=0x0, status=1
> 
> So the guard is always true, the loop always breaks on the first failed
> attempt, and the rate/lane fallback is dead on every Type-C DP board.
> msm_dp_ctrl_setup_main_link() then returns -ECONNRESET and the mode set

Nit: msm_dp_ctrl_on_link()

> fails outright.
> 
> The cost is real. With a 4K sink attached directly (4 DP lanes, no USB3),
> a board that can only carry two DP lanes to the connector trains lanes 0
> and 1 and never lanes 2 and 3:
> 
> 	v_level 3: DPCD 0x202 = 0x11 (lanes 0,1 CR_DONE)
> 	           DPCD 0x203 = 0x00 (lanes 2,3 nothing)
> 	link training #1 on phy 0 failed. ret=-11
> 	Failed link training (rc=-104)
> 
> A fallback to two lanes would have trained -- clock recovery was already
> good on exactly the lanes that remain, so
> msm_dp_ctrl_clock_recovery_any_ok() would have passed -- but it is never
> reached. The same sink works through a dock, because the Type-C alternate
> mode negotiates two DP lanes up front and the first attempt succeeds.
> 
> Use the DPCD read the loop already performs as the liveness test instead.
> It expresses the intent directly -- a sink that has gone away cannot
> answer AUX -- and it carries no assumption about where HPD comes from.
> drm_dp_dpcd_read_link_status() returns 0 on success and a negative errno
> on failure.
> 
> Signed-off-by: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 

Fixes: 231a04fcc6cb ("drm/msm/dp: deinitialize mainlink if link training failed")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
