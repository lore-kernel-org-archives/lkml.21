Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811580;
	b=rSFWc/er3JAFl+kosPQm7GsK0D5nkUC+cHhZuQp0VhpzkbLz/3HsdPiglJMtyn+anbli
	 VcDCOV9ztGB3n+LADPNFd+4vesL/Dq9CDU1+IiARaq/LTuGszeidxfQ1qDyQ6/+WLKXN4
	 1WdR3Xt3x6l5yoOEuZ0DkTORcS/oLGxTWwyI6LpuFZMGZsUVF5qjaQCSUuMnwEx1b2Ygr
	 X+2HVaVReNdEaqlIg4rjSM2dr9uabqEt5UneufOzvC5N0SHbfZNMBvXbJfncZtLNKwcJF
	 P2L1LlAKapI9e/9mfvX0fQNNPmIf6DzkKLj3X4aqtbgvrHpAwnlIYkg2BgSrn1LFgwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RdbGxG6smopZOWzLypq/6hlFg6tVOfBxaUqDNkzkyXk=;
	b=osje+TPYtCNyiIh6aTU6udjaWzTAPbu9M2AWfHDYbMOmIlodwi8RdFkbIqNKgllSXefF
	 DGvnZaRAjwU5vq8zw+DS1PzuQfW+kS98/VBVkS7gGcXTH7UAnQsiTVzMrvNel9e9vg8nw
	 KhYy0WPXtXz9br7HBkVM6DhPaAVEf4bT/ZQZs9w2wkcm+FxaDBI+O4jniJXtzYFKcsMBv
	 /j5FhjJAkMzZ7TuO9oqs0gW4mcqdbX/tYEauqHL3tK0E8aPbZpal/YKbazrkCNrr2FHxn
	 ItuFCcVgRjrqzQ5f1Nsfmh62mre63CzEt70cf8W2RNxy3Iq2rpvr8A+SkkE9Tv28pJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opzmeyBk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g48J9c+Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D4D606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D4D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opzmeyBk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g48J9c+Y
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAuvl3038737
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RdbGxG6smopZOWzLypq/6hlFg6tVOfBxaUqDNkzkyXk=; b=opzmeyBkNRaTl6Ip
	vhb8AXh7xDbxZjFujumTPew5ZdjDSgWczgXMZ6P/fkbwsBRocrkAhbRbLFw93LWc
	ZQc6dtb2704fOdLQM1IlRnNk6FQhg2OY6y1UP3hA1iKTvAQ6UCd3kbhBAbBcqoHJ
	Oke2YxFTSXrc2zlgBFk1kB8FDPnY1V3aWxF0soS6meoxuEO8sVVqDq2nhoW/Xwkw
	q30c6AuR7CHjzt7YG28ioP3EKAL8zbNsjN7iYVj1BRU8Rm5RXQFkCfWSA758f3Uu
	Zrn18arN+XsUwkTjKn5bFU2BoZIknSL4PFql3w3IecpHTa7NCG5nv4mbjzuw4JFf
	pQzFQQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7e4ngf64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:32:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9210bbc04abso155482716d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811578; x=1796416378; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RdbGxG6smopZOWzLypq/6hlFg6tVOfBxaUqDNkzkyXk=;
        b=g48J9c+YPaNCituTlhvAkTROtSCEsbUmU3xgh5hsBHy0DncpUX+l3cfbBmIvIVCps6
         iZZHceaBKmAwuCWS5UPyPtBF9sE4ZpiC9HDM1JXl8frU/x3yKLub1d+NF8nV8cXm/XkD
         eskW/Fx4FmCzBBts7EvK1aaB34vxGeaJphnnTsKTRGWi5fvHjixt7WVL6cNEwD7m3BMP
         vPQLlOkfYaNiF6SdLR8MdDMlzGTR2fKajx2+t1qRpS0g6vAxPL8n6PhaXbbheqHqxO47
         kWzuo5RTasexOzju1hoz8rIWZRe1j0PCfNHtMgkkRwwnvihljHNNvb7k5yS71FRi12FZ
         w7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811578; x=1796416378;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdbGxG6smopZOWzLypq/6hlFg6tVOfBxaUqDNkzkyXk=;
        b=xoAzAc+Lt+AoKEYRFLcfiIDJkxMiUtbdqyBCZ2j//8v2AR9+nxt6n0RnIYoIvc+MYc
         tR/lCoxSWi2iqIMYhG4O8djfC+2kD399Y7w9TZuPNXvwy4HNgGak+hJw4DvaatPh/gbK
         zC1eZ2XqgH61/5yJPlMCLIaiwHZFOVLtNHzipOvZUuCwGXpE8OOx5lv2SBnMuiDu5G7N
         fMRX/5HzNHjNedZ9693ezmfeOEejfNtnTISmXHkXHSkEtHsKnc8O1J6cP0iWf1/lUO6M
         XeNeaRUCC7BM6zJ4+2xiThm5j9tPQIwfDIWlUkwAWGNavZ+lAGY8fYjg19lj10ZCoytY
         I7KQ==
X-Forwarded-Encrypted: i=1; AL+hErG8Se8KQdOJ+sPz160nBTRnVXdIghNTyER0p8JUIVmtDwdm8ur0ayos2JqeicEHDm6b0aei1fDYytrIk+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z92cCAVk24QrWT3UpA58aW3vZ9aWNChSwWaLSHBxUgAkJBXY1SI
	H5VZONrXnodloe/Kb7pmk4JJgTJlhtkAS7NNRnHuaVBfzDYR9K9ekixX4GLjdTH/CR6BXmAVgui
	cQdKPQSiUwW/mX6si6fm1VY7lRqQjDQ5FjRiYJ8yyr9RGL21CdAi3/dbcuO4/YfIK/UE=
X-Gm-Gg: AZFdTZeHgiTtglBE2UvipOYwhHWnkfqkcq0MQdFB9xghu+qz3Ft3zpI+8Wkj7FgG0eF
	rDa2TK8M39TdWOyjlWklOocBN07Ea0j6Htui8EfADVL0jV0QVK/BenKSznBdqt2hT1Q9bCL85Fz
	ea0iMPHz++kDtJ/k5PP7C/RmQJIBFul3L5CNJMtN9ejq1oVW9w/lpHctsO4VirosbP8k4Yz3rF9
	up3nYadQUo6kykpY7iL9SxxA/btpoVu423JSPG3hYDRSRhlx4OFIAGHoxaLPz4geHMaMFfgw0ts
	CBCE/pwQMtk/tG6u1bYDOg2EfJ/DV7XK/U3AVO38xQQPfHkiHZMIesN/7s7s7WrMPFmXkUN8phb
	to+eTBMbwKlmHUDS1E8XV4ZvTKxjEFPagiVzLbAZJOuEySbbXDTVgyNDw1djgXA==
X-Received: by 2002:a05:620a:28d5:b0:949:6d4d:2396 with SMTP id af79cd13be357-949ba9c6ac4mr4407927585a.27.1795811577965;
        Fri, 27 Nov 2026 12:32:57 -0800 (PST)
X-Received: by 2002:a05:620a:28d5:b0:949:6d4d:2396 with SMTP id af79cd13be357-949ba9c6ac4mr4407922285a.27.1795811577441;
        Fri, 27 Nov 2026 12:32:57 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm709585635e9.8.2026.11.27.12.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:32:56 -0800 (PST)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: Add support for Radxa Dragon
 Q8B
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
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
In-Reply-To: <20261029-q8b-dts-v4-0-e8e7438f5545@radxa.com>
References: <20261029-q8b-dts-v4-0-e8e7438f5545@radxa.com>
Date: Fri, 27 Nov 2026 20:32:48 +0000
Message-Id: <179581156894.3905807.8399699622838832226.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=364;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=uTOlrKK3r5wHlu4GNa7hytHvMz4ce38/J/1xbEGeX68=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBrCejzTK0vY8gwlDXzGRSZrdDk2sadJ0Wm183Rv
 cxZQ1XiJSuJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawno8wAKCRBjTcTwaHBG
 +AxYD/9UsZNT7/FLc955HpspGxAIsT9gvOm/npB6eyd1uICYgQQa5CMdp03G7hw6lorCfcHe5BM
 A3gtWHV+8rfD+AVTMvNdEimJwVR+bQ6Jv5+SoXxZRbw6Dhjvuk5JeDjQCYPSJx8OkQlwe4j3g9O
 4JgPJeSThp0kFksAAjHOVrbxWmekg0WR45tsFX5+fzemIlOxNguBPxtLDzoRFV5jV9+uhlGjUs7
 PU4G/f9h2+t5PZIBoJ89CvaCzh1mRl0eXDXz0q77PYyPYoIlHMXeDADxgvFMCgN0+GXR2g+IBLf
 supvMhGyrT4ItRqqRU9nl3Pu/xMLNMdegq4kKRNCPRRYvDC+jci4KSBTAHx93tA1pJKT8byI3aq
 0KBC/IHH+xt03QLOOxCMsaRI/ZX/NcTYo+1AgVnaD3m/3DY1hYC1QLMlQgja3Va7F5Egnwky5Uy
 4LLp80n4YpNrpMiKMoiJK1ubZwRlhso0hN7j6gUXjJFCmF4FWpj7oydhXyMrsSS55NdiPwjurj/
 zXHmsq8moGAE98cGq7IxHI/Q0Tw632ztNsQVEH93jo1EVNIkZw4ZvHMmGxf5lzo9Viu9xf7Kf7z
 J9Nbuj9ILpohAHYi1FVAI8gQDGZ1eFDGJEviLW6Oe/jCbGtp1KvfD/VR9gcRP7PKO3YtKkMyMcC
 pLsFwktxzCIc4VQ==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX6TpR0zcAxHZi
 QNRcneNti7zGM5GFOxwdIJHeUGDO23Nsw74dJi7MYMN/Me0T0ofhiFbx+DG6VpT4zyhWk4QIMkD
 CamGsBo2xXFaC7aWeSNM8895VH4xvAs=
X-Proofpoint-GUID: S6oCgD0-DUyhfMT__eTKM2wXdE-Dp1XN
X-Authority-Analysis: v=2.4 cv=LPLz05W9 c=1 sm=1 tr=0 ts=6b09e8fb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=bUWDG7REKp_wvTPU5MMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: S6oCgD0-DUyhfMT__eTKM2wXdE-Dp1XN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfXyZGvG52Zt0uM
 oFVWsKD8sHvWicfCmRPo9OdX6vec4QKOu7aQq5bUE4SkECJ32ijF0KeKkkAsQeyiE/GDPkirXaw
 d6UzV3BM6giVq2LFFrEqk1g7WW7nNfcRTt6EmQwBMz0RdZ7lGkeo/uSXTL4fDPlFY5ELFarLz6p
 uoB5NzAX4x8cIz0zJjWWsz66OxI0KzX8L7cxjftrqY1s0jebEFLU6UuAvXkyLG1gF0pcCgZ19tF
 jguoc9tJ4sBFssaOVnRPBodvdjftzxce/glYCkpwxwoU9prlxphySlEy5dIISV2fCLkhdHPoZ2y
 AIufdBxAjT4z/iQk1cRLPHzqzKSBUpw2kSuB/b08tyPrt9WkF3YxBK2XuDyJq4RWO9yveMQmFkt
 CBI3mpeoM9/4+KzoPFmI8eUcr4/ITaVk1aeRSOsDBK1nXOx/IyYS4d1U/dWTC/3b2gEL7KOEOH9
 Nj1ctyCPeH+VaJ6CEmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270081

On Thu, 29 Oct 2026 18:13:34 +0800, Xilin Wu <sophon@radxa.com> wrote:
> arm64: dts: qcom: Add support for Radxa Dragon Q8B
> 
> Hi,
> 
> The Radxa Dragon Q8B is a single-board computer based on the Qualcomm
> Snapdragon 8cx Gen 3 (SC8280XP) platform.
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

