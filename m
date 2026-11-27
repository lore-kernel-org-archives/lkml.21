Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795811442;
	b=D8vqWrokBadCm+aoiM1pAoA/S5XUEy6yOwc4vGiTr7FzoWHarHrlorHvG6PSzJL3an3j
	 LrZDAzybd5IzwZmmCG//P7cNaBABv1cDFt9auOUFfMlnpohxZKxawNprL+ImSSr48rDyS
	 Xmwfgm+bcvLzy/DbLi9Lj+QaLd0p/krkJsxUobR4Op3NzC7Owgu+T/zzPO5IaHTAJv1X5
	 JAKkBqH/scnvhwEttB52CVrYDxhe9FXvwgtTqnz7sUGcPWouxYLw9u+TaAAKPwyEm3shl
	 Z4xnUGYuyeSEAQDP0Q8WjUSMWJlJM1PKTF9DB8f/XMv9E24ZWLb1RotNwishGNnKxUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811442;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
	b=N0p++55AVZBWU5Q7uFFXsSELynr0gB5dXkokRlKVG/P0V5mUGSuSMvihDZWa5sdqGxXI
	 x8deH9WpOQ0Bs2z/5kYr4A/Umbs/KKK0C+98yQglUMciT0Zi0m9BAVI8CCFq1vxdAGffr
	 wkTT/vUsAWQv6ENEiknozk7KznYe8een7cti+qcbwEkwhODJjp1BTx0+n26ROTcHJ6imU
	 D1XAVzsd92TY+BfqSqRtcyBToyR7EFqiMxDq7X+XezbVMeNrbaGsJOLKE8vlUqxCsP+o4
	 3si+pM6TzeM+AC3Rj7z/wwnzaOuRfxiy32yNOosVE5dUE+NWqRGZw9AXw69d+yn8BFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kNdXS4/7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JER9oDJK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51C7606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51C7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNdXS4/7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JER9oDJK
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJBf0T2455911
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hphn3ZfKORUo3yr9W6IsBbo3
	W049JwCJrXs91ZHeeMA=; b=kNdXS4/7/27Bmjheg0WPfQA0MdTG89+3TYQIrMtP
	KPX1JUzQQodVcJqU8ZuOVICrLCwbfVGxY0KtiAcPltWSjhCKumY4cq0hP/d73q0k
	cAaDuMqGtkCDpD9q+2XFu3dArsBdBFA7IQPBbS8Q5N4es80BriYOYy+nF0xvpSRU
	qJct5pbmkoRU61yfmFWKyHBkw9IKirVLWipywZK7r8utenuJBSa2EG4p6jBJHIK3
	myQwJmE1hSIGngZxKB7kPMV7ZOXPSC5tRhJPSCRfWLM1oQOVwMV2iG7apDEB6TXo
	sRdUM6onL8HQN5XYj9uOEWhDjIhpFS+Nxd2P6Mqr7EzCPA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3bymq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:30:40 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67e05bd44faso8620657d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795811440; cv=none;
        d=google.com; s=arc-20260327;
        b=I7+zifOoB1Oj5VnzesknNO09kisU1FitGBN2LwRRweLlplT0ijPl+6m+cQgUvnqj1A
         Sf+GO6C7chR8TL3jr3MZuMxVURFh186OaaAsz201hsPCmZ0gW1q9bmbGQs3VSWdI9uyq
         Xk8Emmd6NRTP2VywNXz+WWKta53lJvRN2Hvn9QFXlKNM3DIc4dZAiChoXVSnHDILSj+g
         GUHk+3LO7WcAmqxFr9BotjSmYuINNiBNoFMgYaLpvrJml/xCAh92iSfjt4gBe0oI2mGv
         1KMwVGDZhINaSb4DXEe+zClfd6I8e6pE+LTPDIREeUHSugYTR46ZEAEs3pROzgmJhq3w
         bgxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
        fh=N0JWH5hAVSD4VkaESOnMz0Mc2hogUGnEfAWxmEVZKn4=;
        b=qCNmLfaaTEq1LRDVObIHEsTOgKXgBIJ1AAMA532a2Pu2/fdQvfA4jiG0ONj5W1qwLd
         3CDh5sAeu3rne6mFkL+sD/lYVdpAY3DK2EhROvBtOGdgla/jFyaevPb7LhrqX0cc/ttu
         hryjgmYzMiFYskAb25p8M/2SlRjxwsWwpPBATlpdyDLd8ctkg6WDSy1BOx8oSV3Noc44
         v2Fki5ziP7eL+vVHUtWrJLGz9/6PSDVDki6tOGdXpPsp0HI6HY4waJm/aGBFQVXcTDUv
         8YK6oJIDz00roENBaINmR9jJJmp1M2LIJtGrabY0ZHfjuzsp1CjBuLWtiDTlDEV+Lv/v
         IaSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811440; x=1796416240; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
        b=JER9oDJKrd+p/VOFiEVXJktXs+fCy8ZWlsGHbGQkW3otoDmAHelb2RAQd4Gj3jSxZu
         5gry8Zp2+0y9O3Y9eMz0a989TJ0UjcSZtWF9/5PJlajEhJU4GR5dLdwek3C0ioyFbOGE
         z2Yy3kbvqRKhrw4QUMt3MJcds5lq34NJP3u7LdS0v6OQzf6AdVCRQC/c2uYgIvMjGLxQ
         dBahEFwtT/IYlWRNwTHGPXhoyP52nu3xSSthJQAME/2PjiBuYT5YVUFpkKNrCMp3DTIg
         5v38iOQeYv8H20nLxQRquKDIK3JEgPlDk6iieQp0dZp5WQFa5aFkTul0UBmR3j6o3aOG
         EZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811440; x=1796416240;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
        b=eUJFeBzVSH9XJRobnkZ2hobmo3/dgS8m4QGnr1daTnXKuAuZnH5RL4j5pPA+kCdNa0
         k73TASUwtGcoU8WBHqVCpozyYlrn/KvubB2Alj0Xke0joZFZG6yNrw8uK6ri0hWgCixq
         7BaZxDQ9vlncoyJoLmfGGJw5wv1f+qW+XD57cNQPS3teCprsILIhvl3i/8QdtjohfxiI
         DrBzej6Xi9VP9jYFxTISR0t5kzOR7z0uGkiPSbYXMp+ug543Py6MzgdbpJbsJRZEw1FY
         hMLIhXLrT4RzaKbuGyPi/fuCKMi85vS3W7gFdBkMPHMcp0XWMGyEdeRp8AGSQfcrPXxf
         BsnQ==
X-Forwarded-Encrypted: i=1; AL+hErETqAh3SPnpDT/TxKpz1duweVihqOk/krceiXrd16ygbr8fRsbmkgT5a83MR+aMSkJZe5+NQYwKvjK16ok=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xzKdrRnEFNSNRuTGdJNnlczWTLJVn8UIiop96Xq9jqxAo5tfU
	R8o+tCosWtz/VEdMffuxP7tdnvm63bVd3Ugoop4I68YkFkOiUw1rZwBP4Uv8elrGmjR035Bc8ec
	vSqAfxdvz4xYwL9exu34mDdenvDZi4gEYRU7kp5moXDQyjEt3h3YF/RKXjNhfVBv6vmiQ/VDkc2
	LiejX+rU2PfwcZs8xQcfxYxn67+vPCto5NXjD2cMws/A==
X-Gm-Gg: AZFdTZfiiAoMEN/2u4UlEGmapPIORRNeNIrlxxOrYPRBrwdHrchuW+YBSP7GkatoOH2
	gJ81Rl3vpiJeH+YEf9wo3zN+MgHW32dpCvNvyx/z49B2ejntVHW2j7ueTWPQm2Bk1Klsx1cHqiQ
	jZTcEfwaSQLTBmxtYOD2swZHjG1BnzaiBvCJ1uXifzAcmwlAv4DLggqwv20JhNlxpGLdc5WqqIf
	P0QtGy5BjWzkUkQsQ==
X-Received: by 2002:a05:690e:440d:b0:67b:ec5a:2075 with SMTP id 956f58d0204a3-67df4446b92mr7114667d50.78.1795811439904;
        Fri, 27 Nov 2026 12:30:39 -0800 (PST)
X-Received: by 2002:a05:690e:440d:b0:67b:ec5a:2075 with SMTP id
 956f58d0204a3-67df4446b92mr7114661d50.78.1795811439276; Fri, 27 Nov 2026
 12:30:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-q8b-dts-v4-0-e8e7438f5545@radxa.com> <CAPnEM6aAK8hwJ3EfhzS=gdMPTf+bhVgS-=JAoM+axcHzBQ1CGg@mail.gmail.com>
 <FE7B564926118C33+50565d89-ad83-441b-b85c-cafba0df5546@radxa.com>
In-Reply-To: <FE7B564926118C33+50565d89-ad83-441b-b85c-cafba0df5546@radxa.com>
From: Chris Obbard <chris.obbard@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 20:30:28 +0000
X-Gm-Features: Aa3M54rOA0nGZYSsdhumtFBM_XfbHqu3BlAs81Bv2P-Z0wUA71uwNq6De_uad1M
Message-ID: <CAPnEM6YXXVJ==OXinyZyGBfKS4iX=N+eMJRGZframsnfAeTtjA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: Add support for Radxa Dragon Q8B
To: sophon@radxa.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniele Briguglio <hello@superkali.me>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b09e870 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8 a=NEAV23lmAAAA:8
 a=05-C0eYiNmMOl18pgPwA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: PNa3p-b3DsHgfxu63VTbVtzv-8rltZYG
X-Proofpoint-ORIG-GUID: PNa3p-b3DsHgfxu63VTbVtzv-8rltZYG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX8ZM7qgr7r+mv
 TpKFh0qlaNCgXTFS2HtFbmg7wRWsxVLwz/Vwwhhhlxa3tlz+Ix3tiCTGBM96sDRMI/DF8lq8dQ7
 5xEl69Y0sRUgCpcTADr0CIfSnwUbzLeU/A7syROjusJkwvKeVymNHcn5QX7qlhi6X09CuhXlK6M
 I/XWyvV90nHUE5hffv04r3vg8KF+qQ+gNRRLf0DqQuRED3anSbTxQyu+6wjrxSyClu7Te3EkBx3
 LoCgdQe5N7/nGC6cfZ/nXlLwrt0cAbzQBeS05rKqi9NOrmbM+Q/td3ky2q3XMLNB6V6TtzQgU5E
 dHfmgYuk6OlqB4Z4gJf9OwRzs/IrvhSmm7gY1nrkN2QWGztJ/lH3mG7p7DAzsPSg0yvzYlotRW/
 fBs/C3dom0K32xu90lNv1XBk5b0HdqCGIZSCNbHTGihYQi0L86t+BzeDrYsNkoBKWqQZClhSXwl
 n5auuX0Nd+WC/hNavPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX+VAiKDS7Ano5
 hxCxuUZlGbuBga0LWqrzyxdgfLdBhiuMuHCt/laEz8VRF5ZO5KOrUHMQZ4ngJaHDpBp/FcrG1Ru
 yzTi90XBTp7J+aj3mWdCkId077KDdts=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

Hey,

On Fri, 27 Nov 2026 at 02:43, Xilin Wu <sophon@radxa.com> wrote:
... snip ...

> Hi Chris,
>
> Thanks for testing the series.
>
> For issue 1, the Iris init failure and SMMU fault might be related to
> one or both of these patches missing from the tree you tested: HFI Gen2
> support for VPU2 4-pipe platforms [1] and the missing Iris IOMMU stream
> ID on SC8280XP [2].

The two linked patches solve the first issue!


> For issue 2, I'm not sure what's causing the hang during the password
> change.

The second issue was quickly uncovered after adding UART - it was the
SError you mentioned
in the cover locking up the device - which of course
https://lore.kernel.org/linux-arm-msm/20261127-pci-of-disabled-bridges-v1-0-3bedcbe51cda@radxa.com/
fixes.


> For reference, this is the Linux 7.3.x branch we're planning to use in
> production [3]. It still carries quite a few patches that aren't in
> mainline yet, both for stability and to fill in missing functionality.
> It may be useful to compare it with your for-next build.


Thanks for the quick advice - you'll see some T-b tags shortly !



Cheers!


Chris

>
> [1]
> https://lore.kernel.org/r/20260915-sc8280xp-hfi-gen2-v2-1-c52075bc284a@radxa.com
> [2]
> https://lore.kernel.org/r/20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com
> [3] https://github.com/strongtz/linux-radxa-qcom/tree/linux-7.3.6
>
> --
> Best regards,
> Xilin Wu <sophon@radxa.com>
