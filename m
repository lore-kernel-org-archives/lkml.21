Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810582;
	b=dBZaa51LEWdjp3bD9Aik7kstPq8vFzRhBCzmBq9K4cKjbnhKCu7EztBJTn4KLMiDrTm5
	 qKXs1BzBlVTrvzHOSRcAF0rqa7XqBHaEm5OnMjKxpgvLtYQ4Rvvyz5R4VpLxcgP7jtWRA
	 iwV8D2kaYHrY/k3crTFQS3Daa2TCXGZO0MBTCJwdyF/3oCNWVqOgwrteiibY+pXdeAEXz
	 PpyZ+SkNq7DTCHDygsBnqFqeGEgSLQmv922f7X1guDUmJD25T7wspWNKvLl8IId3uUaEW
	 kYR2SEBve4+dnOGNFHIGwvljIMsgVyTs8z8Q1k9szBGj9/snvp/M9oqBgk3owYMU1WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810582;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ogpfngdEHVCrVGXs/lkHJBfSJJ+R0ZTTBq7wN53YBBo=;
	b=vcEp4nyPvjbwhia4aRkPHNvRfkxkdg7byhWJB0Y/3C7VX2ZykUxm8aiR/brhfIeNQo9q
	 MMjF7wJBXpoqZuCcuK5pFQ21D4I0v0UU0n6/opiPefeYTR02Emj79AZVrZHD+9jeTgAJf
	 DW0qn7tD1LEyiFTmo2P9OakECCkF4jmBQ5ES4VfSA/O7uHZZhiXErUVcjq7Vm4IVYULYY
	 5sCKhJGDe9/GmiBOhHkWw6R0sAB/X5999dUV8xmOWRSQI6ELqdRC+z3LKItJQFf/ISsNS
	 fbNSaBcTfBE0Cq7ZF+9sHzGiggJQoQ0zdYgkpadupz72oY6vN2mnEsaDrBIxg75r9eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hcv9gEKg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bt1uQnyq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1142606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1142606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hcv9gEKg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bt1uQnyq
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAqe53982217
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ogpfngdEHVCrVGXs/lkHJBfS
	JJ+R0ZTTBq7wN53YBBo=; b=hcv9gEKguNzNCT8j/mSo2BPn0A6aELN97/y3uMxf
	EERbDM8CieNBWeSmqVN3zISX4KPcPQEhzyaOLGPZA2cTywMvkWTZqhO/5dCL5aj3
	2jYJi4R21B5KbsxGHLK99exphoQr/pLYILVA4xqymhJ+R8e/BvbRZn50jGQnS9Am
	BSI//EJtC4tEKvFIbtgVDLhe7ByflCPOlLI4AZvRTQhUu/IvURR8I1pRtXwLXWDn
	cPdDheXkkwf/4mcvHhmQD7iUHCJ61yTFdVm/FhLfYK/EddY/pRAZU9VLDZ+OnQ8K
	Wt4wQNAexz0CUXlSao/92LIzE6dOnBzTG739c6BmYnMTWA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7f6d8842-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:16:20 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so2266971e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795810580; x=1796415380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ogpfngdEHVCrVGXs/lkHJBfSJJ+R0ZTTBq7wN53YBBo=;
        b=Bt1uQnyqcWs19TmzshryS8gfX6V8Mox5FTS+Q1S+Mvg6AwQRolkrcS+y0cdJ0jNbtR
         eAW4kkzahSvKOVL45GxQRfFTEH+cnyXC9itNbL5MpQh9SKQ58g1kDNtD/sX8sQ66a+VS
         2Qhokmbn7sM4Dj98/LNnW1MAx0UvjZvuFlKzpXtPUswACWjJUxp2Cm0w8eLPpOfjGk77
         6kObgHVNrg6ew4Wy3IpxdEgBZ9lx65v9Yhe4YKxGfE3+QGuu+bKGUQ+oJIrJElGjCahq
         Cj3CwMtdw06Epp9gc9TKuiUYU3XObb3DIM3acJil/oualXGMukRCcJ72LuHF40Pzrmfp
         4b8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810580; x=1796415380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ogpfngdEHVCrVGXs/lkHJBfSJJ+R0ZTTBq7wN53YBBo=;
        b=pP1GifPLjqpHPBGjwe9IWOEnj0LfT8JD0qIyIsc9uWLWbfPHYCDQreDUvCHUNFIRUq
         QGeqN6bW2GjGaDd3yFI6rfW5tngiuWaq7WttWDmTQxgwm9QmQLZzgVXdNEpS4WrtGtL5
         5vEJS01zOg1jy7Mia2UgnUYGx2nsNMjU4EeaT3QP0Oot6kEITuERWiKwyccRJzWCd1oR
         X/GqZ2gpwxQgTj5H4Ph3NIT7njAzvyX13LKx1GlFiJNmX5imENaZOKWsFGkf8U9bR2si
         AgUfSfiKxGAarg7GMytF5B+RE5W77nEJ74C0Qf/4KP/0Xx44/OEWwJVJHQl+pEF9/T7U
         +Pzw==
X-Forwarded-Encrypted: i=1; AL+hErEODsD+qbH8GLbAts34+rfXEKrtYgswWqy5v9nxVScLJagDuc1Zh8AETDZZqJq++v3KeUU6jdJinmpwA2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LKxuvRAmFCeSzNBkaQWXOkFktKa7NR3+iehL2IAwaJ1lQxkyV
	E92xLuZqv+uNzftI++dm6Oyj6MBcI4BJ2YoE08g3EDIHMNqQ3r7HSBFVY87euv8jzj+8pLkPPWT
	X3WHicq4Y0OZoRHTtA94cgqy2kjbSGBhofXJRcPPfw2yCy4vA2sy/BBOrypfAD1GX/Ek=
X-Gm-Gg: AZFdTZdNd3k6d/NwO1Jswz7RDdKgyJfJJt9moCHH9XSOXgzkkaTDIrOwvi4a52dudBd
	ss6StxEi8BO+vYimxf8kOtJTmjPqX3yIlJVZaVkhpi5g2goO3A4plipAeRZA0EY1jwV+bgDPk+l
	2MmlNwNX3Sq7jv6aBu/S9wlPI2fKh7muRFwb+cBY6x2tjGORsd6nKCbERSTJCEufhUo6TIa3Mwc
	XiEnsuw0mA+0L+G6qid3d1SJHrXs1lRWiy4wJJ6qeNzTwRYKeR1Yb+6N6qhxtJe3SD1hKBIU1Au
	D0sx2Nbrl+zGAEXBo9JUBrzASy4blC/W2snj+MnfvOorXQ8KnTZAjkOKpZDZQ3JEzPg5Yay/ifX
	AvNYld3tN8zNGajk9Fl0WEZNaU0w+KFzNabrXbWmPOCjxpC6YxvDPWy3LsBVI9ix7WnK3yinYhO
	6pdVlpL2QuBbKcSLVWwSeQiX/ZhDb+QIygBKDbQvz+xDETtL06dKQ46ig03u/BYw==
X-Received: by 2002:a05:6122:1784:b0:5ea:b294:f0ab with SMTP id 71dfb90a1353d-5ee8adf34f8mr15650952e0c.2.1795810574934;
        Fri, 27 Nov 2026 12:16:14 -0800 (PST)
X-Received: by 2002:a05:6122:1784:b0:5ea:b294:f0ab with SMTP id 71dfb90a1353d-5ee8adf34f8mr15650058e0c.2.1795810571119;
        Fri, 27 Nov 2026 12:16:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd043387sm6206566e87.49.2026.11.27.12.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:16:09 -0800 (PST)
Date: Fri, 27 Nov 2026 22:16:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zhendong Liu <yzddmr6@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miaoqian Lin <linmq006@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dsi: Fix double put of the PHY device on
 probe deferral
Message-ID: <fetperibduweqak5gdpdahzqb74zs5f4e64l2qc5h5cwolqjkf@4mteepcow6g3>
References: <20261127-upstream2-msm-dsi-phy-ref-v2-1-be82aab71166@gmail.com>
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
In-Reply-To: <20261127-upstream2-msm-dsi-phy-ref-v2-1-be82aab71166@gmail.com>
X-Proofpoint-ORIG-GUID: WwiZpLxQpygIsf6qKcJ-G6Ui2P6EARQv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX8/xb0d606/q0
 BMaaP2pMsX6HUemCzwntp4FNs+U7aBDJoSSm6krvfjYzOLBcI4V7Nl47usUuRhfAPLSY5qVOGFh
 dc9KPdQgfWSPzJFAuyhXypV9ssBojzg=
X-Authority-Analysis: v=2.4 cv=IKqXmQvG c=1 sm=1 tr=0 ts=6b09e515 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=oPjNpEVOrg6OkQjzHwMA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: WwiZpLxQpygIsf6qKcJ-G6Ui2P6EARQv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX4eHIogI1cb0U
 j1l9aX+y7+5qVK7F6l5cHEoQWxSqE093dOfuzEHJxkw//yH0yXBJp2RzUnasi3dNmdHBs/XtZ8+
 rpr9elYomEif+/jTazDTo8YGxiETsS97Lqt8pPElWM36/C8dgnErvNX7yOiPr+5RYQRRKNYz8jp
 9rZm8ppJkBA3eYBmHyWWDgUUyoj7i/MvP7hZCwWj4SzsT/GeECHeq6bIfiFcccTYOcfT03kWnKv
 jyFDyzJ3dkx2rYOXVUcIPqQiyy8M7Rd30MkJ7i8hbDOH08x+n07Q6OFQvTUn1/zB975rKa3+4OB
 DFrlDAgw5gmUjj8ql4wGhkWe7RLhKHKsPE2c//FR3DxMFJUsmiQGkPjBKhe00HTCfWACLS7imhQ
 RThxLA122rbtg5UaKD6PhrFE/35oWNBvrrYmfdEAkxVGAUuTNOEDFz1G6E/grJD+dtYT9+AKaCy
 qKojd/uwVOTdX5K7tHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270080

On Fri, Nov 27, 2026 at 11:24:37PM +0800, Zhendong Liu wrote:
> Since commit 6977cc89c875 ("drm/msm/dsi: Fix some reference counted
> resource leaks"), dsi_get_phy() stores the PHY device it looked up in
> msm_dsi->phy_dev before it checks whether the PHY driver has bound, and
> dsi_destroy() drops that reference. dsi_init() calls dsi_destroy() when
> dsi_get_phy() fails.
> 
> Commit c04c3148ca12 ("drm/msm/dsi: Fix missing put_device() call in
> dsi_get_phy") then added a put_device() for the case where the PHY
> device exists but has no driver data yet. In that case the reference is
> now dropped twice, once in dsi_get_phy() and again in dsi_destroy(), so
> each probe deferral for this reason takes one reference too many from
> the PHY platform device. Enough deferrals underflow its refcount and
> free it while it is still registered.
> 
> fw_devlink normally keeps the DSI host from probing before its PHY has
> bound. The path is reached with fw_devlink=permissive or off, and after
> the deferred probe timeout when no driver matches the PHY device, as
> the device link is relaxed then and every probe retry of the DSI host
> drops another reference.
> 
> Drop the put_device() and leave the reference to dsi_destroy(). This
> effectively reverts that commit and brings back the single check that
> it split in two.
> 
> The double put was found with the help of an AI coding assistant during
> a review of the driver.
> 
> Fixes: c04c3148ca12 ("drm/msm/dsi: Fix missing put_device() call in dsi_get_phy")
> Signed-off-by: Zhendong Liu <yzddmr6@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
