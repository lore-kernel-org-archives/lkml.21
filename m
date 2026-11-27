Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809514;
	b=yf3bVHd+iHyyOBCkskJO+L2vBmP/gCPjM4/fwc1hZap3AoL4GDG5CNmZCBL3yrhqVTVI
	 g1xAoYbZTbMFmZVf/HyYZqTj4RoMlZeu8enrYkoaI0gSbtqVTinwstfhpYex7Xd4ku25K
	 hZbDH88TsUCAGuRdRSdkwz89ZTzOw6z7l34/Uo0ucdT+/T4pu9Uyekw+bSjhzPffN5m6d
	 Btnoklt//3ejtZ1p0hWssFokmQR9Q5tqX5nm3ko95pvpLZ75V+IxZqeReJJIPo3wGyAVr
	 /IMTx+xU7mVSRHsQOY0/Ws82OVbWP0MNH2e33kTtdQ39rG/3301ReyTCmcTnoR/8PVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809514;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+XTNWIgi9ID8EoeN/DwyL/tKJe5joumzVvmrChys3j4=;
	b=4QEp8cpAp6HaroUNZqRdNMvmj30yacp/T2BfBM/QmNtl+hmjAnpEn29tkmkNKBRjtiBG
	 wScFEbHkcKE8B8rVN3cledYdXBtc6ZNXsAb1oS+d1BPUFf1TlgiRQH/PRrSa1+krfgWpa
	 irvl9Ioke6DKVhkJ4PZSzHY6gf/upXXKnYtjiWMj9lheSOMw2lFy3TvlqF/FgmkGGTm11
	 5MabW70WiBPM4BAdHa+X/SpmTl2yMyw611fY85j17+vur/6kzYQyK6be7n9R2veOiFHx5
	 CO93KrGa+9Hdk8e0geqdhGux8Pwrn0evqKhyXeUFbndafGhePhfv7+QOdt5uE/UBn9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3FX8NKb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OsX3jgu6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37B3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A37B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3FX8NKb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OsX3jgu6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJBT173134892
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+XTNWIgi9ID8EoeN/DwyL/tK
	Je5joumzVvmrChys3j4=; b=g3FX8NKb7bzFF9rqGgqaeJGhFiOFZPYid3kFU+dw
	H4wUAAiqNfq2dOJU4uEG35zZVPR/mjCoWWOLltGW8MYRPw1ewdCbr+fW0r+ktYT9
	R7bGvYPtkknaZ+X3X4TUds3mvDYcrh+BtQVvOYed45LCnUHK9GIcPR7EXthKW+pO
	uxc2GME/0mZ/7Fdh6tiD1/BJ0lmxSspyf0B6m4UzCz+SyiF4OO8teYoQcaGzcMMp
	F37MTtK/umQfmwA1mP7CWtb52gXC2rLRLIjk+gdBCN60h9/32UPAhICCW9zqN07F
	pAgk3wOA983UtygjFUiDJHDfKpwkHPWgbmjlz65gKdE2uw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gatsnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:58:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so1173068385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795809512; x=1796414312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+XTNWIgi9ID8EoeN/DwyL/tKJe5joumzVvmrChys3j4=;
        b=OsX3jgu6YYt5dJBvCs9pxRgp2DWcvrW6syOkodpEhu/97WRdeFoA0fZ0Y3Ei5lfpjE
         L+oefhX2rt6CBO9iqGNBIGvSF1ItoqU2NQIzznBiBFMnWbaz1AGQHgSr3dmWbdJSXkd9
         ppSA1/jW3qB8cHBjVXG+6/R7Lb/Ib+k1+Tj8iWhgfOj1wR7hDb1WzTM1z1Ib1wsZ+sLO
         bhp2vygwxYJvhHPLB5sNKJRyfEDWRouZdhBM7F+Ll8CJ1ksOXmyHVpZuR7zxyM7Ivr0O
         0m2R4R0HTl7fkP50gN3YZP7wWih47DyQ0+VckQn+qrECu9+kJP3JaVsdxB3z4WyVukZk
         g5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795809512; x=1796414312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XTNWIgi9ID8EoeN/DwyL/tKJe5joumzVvmrChys3j4=;
        b=ynqlfewJP0mpFXCmi0Cjlw03dU2w/KSDFhZTNRj9JDddX+t9JOsIsi2SFkENbJLiOa
         G+lIVEkZwfMB9fqDO4PMCTf0aFd9Uxv7xRpJVu5UwFDu7iIo8n5r8v8zv0joeju8Y3GP
         APaE0j4kuRki9vITBRUCIN/pU813s1ti0FmAlMsKcTzMT/lXC+7yqUpdXl6u0pZeMUcV
         Gjz0XSJxDqlm77+o9FO0gdH9T+N3klPfFgpugi+DT2LLjUcaaVAzJWKiv8Q5EDJhNBne
         6ARQizUoJ7wQZqKDG8eG+X9TlNwrO64qGKSu0qiSnHquYinJ35qEkLW9nR7dqTViRrTp
         ZA6A==
X-Forwarded-Encrypted: i=1; AL+hErHcAOlbAcLiEBUEGp9wy9d7s9HydlOaLK1QYamTl6gNpaFANEVNtbgb29rOw21LrZkgJlgSLoBKXwvadJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8UZIHQkZQ8RLJMNp8kZ9vj1Zl4a+P2HzyU4r2rxqZbVNz8g5N
	ack3Pr5m6fJZHlfcxrdMZtRdgFPnL3/6ZCSLn0DQXtZrxtjhZgqAjvD5TKvsuLGe91rKGWrwPo7
	ySukeY2IetWTySNOwfnNgUMlUT8KqKC2HcLOshpBToncuyQEExf3Cq74FFTQlEktAFTw=
X-Gm-Gg: AZFdTZcWxzRiiRb0lv0e12dj64nLjUTWL+YMqvnUTj0o1VXlT4TiWM9NnQp0Kwl+sHH
	AsJFUUp7KOqYNw6LPY1hWqEVMGSEOpRIulFsT3bzyik8UgK0xXJqgPn2JuVvetNGVn73l7WyFtH
	h3u9Aer+OXO6MKJEmgOmFsdXbJDV2/tWZK/Mdo066Az4XUK2ZBqBd9EbxIHNq7DqVzzhHt66Bdq
	c1g/yLmHKumpHjGNAtIxAAaK67d0BOipTOmGYsfX7+qG8YrL7ATNrYK20WGLUDXp4cDv/d4LdLL
	byG3PIZi2Z22f7Oi+CYClmsws/1W8XE2VD5WBh4mlwk/r7Rbpi4H0yRIxvT2uZBamN8TncPZhwO
	XqZM1lXZa30FiNYHUtd0xB5Zpjvt2rN4lLGbenYr4OYk08Ysn2MWZrnChe14rqq1dtVGPH5pMZu
	M+DqTz/pahSnulJYr0QrDGKq9qcU+sC3eKLXiGvc67pvXF4+35i6nlivNfPYw5Vg==
X-Received: by 2002:a05:620a:8005:b0:949:3066:5569 with SMTP id af79cd13be357-949bab2f113mr4792664985a.46.1795809511941;
        Fri, 27 Nov 2026 11:58:31 -0800 (PST)
X-Received: by 2002:a05:620a:8005:b0:949:3066:5569 with SMTP id af79cd13be357-949bab2f113mr4792660685a.46.1795809511466;
        Fri, 27 Nov 2026 11:58:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd041813sm6192040e87.53.2026.11.27.11.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:58:30 -0800 (PST)
Date: Fri, 27 Nov 2026 21:58:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: clear the DMA buffer pointer after freeing
 it
Message-ID: <o7iv6phsonvuruw7oufoj3d3glo6hpknpuwedue77wnprum2gz@ws2ux4bckblw>
References: <179422752570.88190.13452031230666113805.msm-dsi-pin-leak@michaelmcallister.org>
 <6m4cssgagnpvm2wawyj62veoqbglxv62rcqgxzaxvjynhn3dts@tlkaxvd6ph3n>
 <179458248277.51880.11276326781897812340.msm-dsi-double-free@michaelmcallister.org>
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
In-Reply-To: <179458248277.51880.11276326781897812340.msm-dsi-double-free@michaelmcallister.org>
X-Proofpoint-ORIG-GUID: QTa3lFNu8O_KBjAhsigqc4LGSqa7-45z
X-Proofpoint-GUID: QTa3lFNu8O_KBjAhsigqc4LGSqa7-45z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OSBTYWx0ZWRfX6oFJutzcaDhs
 MzbXTp16p9FYBLwp8VQbxJitKSqRqzmK/n69//8v2R52kZ7fbZsh+9W3miIKR2xK6/IVwyuEPTQ
 +vSnOc0oEGl5fku8Xb6I0yxHZsS6v22tfOIWJC4AQObbKq/RWrUnL+7pLDENwUor/RL9zIWieQH
 RF8TuODMlGZ1AQbpdX8xov+usyj79KWdvgLa6LvlUmZEXB+3+WCofsQxC6OkRFhadOF9bKuwq3G
 AgMUdH+PSdUn9t3v314yBTChbx3dRiEh+FwqZq9FDJDT9wmYW0uQz/9IlQvP+4zHuaZeCTNi0pR
 xIkckUph3D3DmW2M967RMufFLqP3rWVGpjYUm644dw4sT0xNlJomYn3qdxt/L6RstcpW7sLvbyz
 Bb9/k5FSMPL9Emb2WcV9TRHix5bTDE5Kx6zPyAdeKuzVEWfrpTO0xGzt2NV2KoxdEwlZdfFW0e4
 SMlWx0zvcN/I/lPd84A==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09e0e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=JwJ85b4fAAAA:8 a=EUspDBNiAAAA:8 a=hKRTAnW6OJ533CQEYPgA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OSBTYWx0ZWRfX0Y7PSnXERLtM
 Hb4rbCnGTxxk2Qtu/2XCq7t+a8LfKwrO1zD/iF/wtFNsGLxpxUy0ykSDkahm0XeYytbhTBSpvuy
 ZU7rw4FjvJTTIj5kZXToU+U0gMpLUG8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270079

On Fri, Nov 13, 2026 at 03:08:02PM +0000, Michael McAllister wrote:
> The DSI host survives component unbind. On DSI v2, freeing the command
> buffer leaves tx_buf pointing at freed memory. If a later bind fails
> before allocating a new buffer, another unbind can free it again.
> 
> Clear tx_buf after freeing it, as we already do for tx_gem_obj.
> 
> Fixes: 5e05be782645 ("drm/msm/dsi: free TX buffer in unbind")
> Cc: stable@vger.kernel.org
> Link: https://sashiko.dev/#/bug/linux-6f5085d3-ef49-482c-86e4-a2438bc1b91f
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
