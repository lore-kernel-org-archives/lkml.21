Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795678424;
	b=W83XgL7ShXebSkNQyA2ghV7JiJ/pC5A7Xs4SnfRpWdIUqWxkmUQz5pfrc1f/GK37wxNc
	 pycidMNdWVEojMltyvby2gfQbJuuCE2i3g8dT244QwbejThQfCQCk275+xTjhCp+vmnSJ
	 KWUuRAdYIrSZwm44eqXd8zDlnA4HAtXdslN8v9KN2r3HCKw26mU+km2Aj7oj4pJwFpGn5
	 bjWYY39Tc0VpHWFYn8rHeDPM+iaKax58M8I9rOHitelzQDR0kvTKW2MK4RPgEEFLrrSZO
	 8czXAX/MH7nYx3wzFjWFKdyc/O2jZxmI8mteCksfWLKRlfG49OBdnYhjmO7gb5TcE8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678424;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YBSRWO6MC1F0PIG5BHgyDYraH89PBdVkETYH3/gn8Uk=;
	b=QRuheF5MZK5XBO10EP7ezDuyJXGCPBW/01zI2uuTTvEZmnFOnHmD7SFTGN3ajnpSjO4v
	 aSs/QoWxwsHjwBu2/dtXy/CSX/LzL/QC2cGOotm8gycQe79PQqRQ7ZEYnmjkQ1XQUya1Y
	 U6iXntEId1L+T5A0oYrmge8OCfWaMjoY1BG6Qx9yP3geOEiwVkWNgtafUpexA8E7N7gY/
	 ngyLawDNPv/RhJPniktTCtVLyejVzIwddNgsLXxNf60HrOrsV2hxsWPOuJteO3gesa+o7
	 DrPWvm0G7C2PiQqNe9fWS7B+tyKJKLKl9hCHa+94MOtFV1KsNPH8v4sfLgBBx9cUGLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTAMvPwP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PIuifmyc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2677606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2677606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTAMvPwP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PIuifmyc
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7CxgL062164
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YBSRWO6MC1F0PIG5BHgyDYra
	H89PBdVkETYH3/gn8Uk=; b=aTAMvPwPqHQpfSSIjX5E4px1lnzG2cUdofHhTWjs
	rEdm9YMKeU/HXSLrwMyyx05U0fRnumVrEGaAeqc8Xy4YhCxqx8eizuZssJ45o1xK
	34HW0aL29/rUwWASLeQIpRDvHcf7SV2OAvrNlOzHAIClC5QsT4mN7Dgav9EMkfAT
	tY89Z01pQXJhZWUFfi+urUkbU69jnIX6xsh0W1b3AQelmFlVyGV2wbpFY+jOuhIo
	h/X9hHsgf4tUNmovAMMKwYMdCw1HIdke+dAuB1FPDL8H5thIEcVgpkrrEPxDi6T6
	Mbjp+41D45mZc609bQdliJAMBJUNhXB4QT2S80C0mVjwMQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ark82v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:33:42 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-86c3a053d9bso88518047b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:33:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795678421; cv=none;
        d=google.com; s=arc-20260327;
        b=qSL1zYoUwL2LppvTbYZUZly2VGo73XciJ+SvcMaD+iw0B1h4n6SvcoeC+ZnNf0nHjC
         kf8LeX06xKYKtg1vpGSQLBJQUB+RE1oRPTJ/SVgUOoJD6oMeKTxjAzvrSKf4FbE8nZKu
         jdzMg6JDg5CKYn68YBq0NRAYPOF+Fsg6O2cMlMv0w56IF1xdQEGL6Evm/vTu+6iIlQ3y
         J0Sw2Sa4HqXHfMq+kZsdGP7hT5QfpgKe8iHNfEy5KMB8cXJhZwIZWHesRtAHbRneEcLS
         8qzaFAIMyAYk2X8nZEpEKSpHq2adruZ4DENaVfj/vtZ2zV5dejDonNS6H6/2Yh0coppf
         5Kng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YBSRWO6MC1F0PIG5BHgyDYraH89PBdVkETYH3/gn8Uk=;
        fh=+KIDSY8anMwIfHQOZVlrzu7fyEjekwos0SDgFLFoq2o=;
        b=dL6gqR8T506OadgwjRnAwIN5Geg920frIdZvuBY2dOmUsH2dvmgBhGnGXkL/TaLuPq
         GVUZssLO/RK3n8IPaBtevFz6zFRVYgpNyPqfqFKayEv0pe4GrSIOeCu7nR0BHsXWec7I
         +Rb8g3ZdixHEhmiu7Ap4yQPwqYH40Kme5nivRqtzba92FrW9tRyn/Ht5X0aczQaDv/Ta
         6fvL74UY3PDjgiNA3ngezgYUcPhN5//YihXXn8RRaIj477MxEjO44nrmDAc+ZSxsDlcY
         3s1ai5DCI6YZqyESm3XuZ3v4Awe2C5yLXvntcKGrMAVaLMybPIfKLxV/WTQM2BrMbbYh
         nsGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795678421; x=1796283221; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBSRWO6MC1F0PIG5BHgyDYraH89PBdVkETYH3/gn8Uk=;
        b=PIuifmycehLssaSxSavGLG7rtV7+blg32V89Np+BhnGsR7RCwbYtpM6tZKQhdMkErO
         GaWSUZC1aJ90aqL8v87DyEfAxupUvhQM2rFQNHtVsaJibyMvsPhdiNziein8BPNq3EV7
         88Kxc5qx8JpkPD0JSiKtVRkpUqa8DAh9Q9jE64qHYZ/A12Aj+EyL2SZdI4JIqHoZC6yS
         S9XuMeNOX04vZxUfG5Q1WVxIgO2XuqQr6Off7ONZ68iJOTw7y8uMf2h5TdacYHKTdYFC
         psnT61Ozibn4nAOXzMXuWe3vAFPXcLrBFJVif9QjkPFwsw1dSuyyXTZ9Pt6IC/CoGbOO
         zXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678421; x=1796283221;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YBSRWO6MC1F0PIG5BHgyDYraH89PBdVkETYH3/gn8Uk=;
        b=rc3MmRV2PU5f3MPtD2GobhapahJHVHYFtJFTHwi50081iWKizRcjjaz8m8ff9HIx5f
         cDKWnqBzdNWJr+SzH/0clpI+6rYC03DN8CpwwhOkjopbpDcqO6rSYJIH+RrA0Zw1okq/
         Yj3LZ5Dh0il99wTr8jGALWOgePwIqWspfrMJ89ezkFNd+jCtLtyWxtK4uaCO77kTfB9R
         Wfoln4j6R0fTGrI7bOMp3c0xAif/Mvx/zBwthwfMrqruhmMhiAodjqXkgDvyGdj8JwJ5
         eyNOkoG0nKf6p+DdHqcY095JG2pjcGEdIMJq2At/eYOD8+mOTKPbk8lOdaiCdPJyFxvk
         q3sA==
X-Forwarded-Encrypted: i=1; AL+hErEPkRqzTIb6xc+7Za0ioOaXn4UKv9V3MTl8tEMVwUGZyhwPAXjgnb0H+Nlu77wM8LxNkHbpfN68Mygqf0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z94LxCFk9TDHDUOhPinBc62/woZLbI/CVAY7waVV53oAR3eo0Us
	wOe62POfAjTY3Lum3nRYbygw63j64NuXlFDVznIDGLcNng6vCiWJR2Ow9IwS56muff/p5gph2Vm
	Nn/09LgL8skc76p59TQd1hytADsrpl1eH5Gk8XYfcDfzCbmIZsm+o8DjNjYhO63lqQr1B6qDRkw
	7k/x6zguyQaV1nTTZhwXkHV10GHOH8GTXfJ3hnaX+IFg==
X-Gm-Gg: AZFdTZcJVJqM+0di6agwFVbg90hzGqyAu1laP61vZFLnCvYEFJ+hxHUCODwrgExwEwe
	iDDG7eZQyem2YaJl/IIZ2lbE11i6o0Wd5XmGjM5i2a0CU8+3wODIwge6bCD5haayQQwiH/RuNlh
	eSi2a+I7LDFCmeb2JGKWAl3/tvFrqKCHDg2ri1kAxbyhbHyKWCBTv+lAJzuaUradwaf8xtt5HxR
	BqpsYAYvM6tHb4pag==
X-Received: by 2002:a05:690e:1407:b0:67c:8a0:db52 with SMTP id 956f58d0204a3-67df4429198mr9258145d50.67.1795678420851;
        Wed, 25 Nov 2026 23:33:40 -0800 (PST)
X-Received: by 2002:a05:690e:1407:b0:67c:8a0:db52 with SMTP id
 956f58d0204a3-67df4429198mr9258131d50.67.1795678420457; Wed, 25 Nov 2026
 23:33:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-q8b-dts-v4-0-e8e7438f5545@radxa.com>
In-Reply-To: <20261029-q8b-dts-v4-0-e8e7438f5545@radxa.com>
From: Chris Obbard <chris.obbard@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 07:33:29 +0000
X-Gm-Features: Aa3M54p9KPshpOehHxoS4BJg-DAEPGiNryfudrEn_XbVOFzPOSXBBvyMZarG90A
Message-ID: <CAPnEM6aAK8hwJ3EfhzS=gdMPTf+bhVgS-=JAoM+axcHzBQ1CGg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: Add support for Radxa Dragon Q8B
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
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: BCST2AmkPksYCbHFw9LUojgWNDLW0BGa
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b07e0d6 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=ksxQWNrZAAAA:8
 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8
 a=P-IC7800AAAA:8 a=e5mUnYsNAAAA:8 a=slKOw8fCkYvWlRKagp4A:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=FO4_E8m0qiDe52t0p3_H:22 a=l7WU34MJF0Z5EO9KEJC3:22
 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: BCST2AmkPksYCbHFw9LUojgWNDLW0BGa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOCBTYWx0ZWRfX2i7dDSNsTauK
 DPHAJcCWf0RUyh9+u4c6wpy9Zs7Q93siMlY4ieuwsPMcVxddMUuR2bC3jHNN9Zx5iDTqY4CSV7O
 QywvWiRa1kqkFivW2PdeRtsCzRjNKxE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOCBTYWx0ZWRfXxrQHzF7ZNwJv
 Ck/902HrlfmvcaV4sFArG1mo0g5258PvlobABl7FfRjm40kcY/FLVystOlhrcBQXYmSowU4at4e
 MhPaiRemn/ALNl7LuakqXm2rVFQ/d3pM7Twvy+w0uSnp0n8gZY/zdTU4NKL2LqblBXt6fittOtC
 24tV/GeSPEuW4RshLCJN8LIjpWDBC8dAvGxfm7kruIKypk8yq3LEYLtn9muChnpCrtIDvHa7PP7
 PQPTP7/qtzwX41L2dM5U8y7lj4PD/tBww722RI0DNhf+/e6dP/FGNWCR4P0nHLnvMT8i+KA5gku
 OKw8vpzIsZyewpkjEXxsjJOCaLKh8STI5KMXLaEK3Ln0bpZOGmeolZtTMeBQZe5kYqH2Lu0UWxL
 IP8Wb/L5c6SxhZGo5LVhn3nHsxSRJr2ntLypsSleV/cT93UBAu882hYHXNSHVro9/q33sXXt/E+
 VH6vI/4PjkMPBHCKbeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260028

Hey,

On Thu, 29 Oct 2026 at 10:19, Xilin Wu <sophon@radxa.com> wrote:
>
> Hi,
>
> The Radxa Dragon Q8B is a single-board computer based on the Qualcomm
> Snapdragon 8cx Gen 3 (SC8280XP) platform.
>
> The board provides UFS and microSD storage, two M.2 M-key slots, an M.2
> E-key slot, a QPS615/TC9563 PCIe switch, USB Type-C ports with DisplayPort
> alternate mode, USB Type-A ports, HDMI 2.1 output, headset audio and
> a 40-pin expansion header.
>
> This series adds the initial device tree support for the board. It
> describes the regulators, storage, PCIe topology, USB and display outputs,
> audio, remote processors, thermal sensors, RTC, EEPROM and expansion
> header. Build targets for both the regular and EL2 device trees are
> included.
>
> The TC9563 power-control driver powers off external downstream ports whose
> device tree nodes have status = "disabled". On the Dragon Q8B,
> config-space reads to these powered-off port functions raise an Arm SError
> instead of returning an all-ones PCI error response, preventing the board
> from completing boot.
>
> The PCI OF change to skip config-space reads for unavailable DT-described
> bridge functions has been split out into a separate two-patch series for
> the PCI tree. Disabled endpoint functions remain discoverable so PCI
> fixups can still be applied, while driver binding continues to be
> suppressed later.
>
> The onboard HDMI output is provided by a Chrontel CH7218A DisplayPort 1.4
> to HDMI 2.1 protocol converter. The device boots its firmware from on-chip
> flash and requires no host-side configuration.
>
> The PCIe ECAM and 64-bit memory windows are defined in the shared
> SC8280XP DTSI for all five controllers. The board DTS inherits these
> SoC resources.
> The SA8540P PCIe2a and PCIe3a address maps are kept unchanged.
>
> The series also documents the board compatible. The SC8280XP TLMM binding
> change allowing gpio-line-names has already been applied and is no longer
> included in this series.
>
> The PCI change is required before applying the board DTS patch; otherwise
> the disabled TC9563 downstream ports cause a boot-time SError.

I've been testing this series rebased on top of Bjorn's/qcom's
for-next [1], with a vanilla Debian forky userspace
+ gnome, booting from a USB stick (in one of the USB-A ports). I've
had a couple of issues:

1) Reboot shortly after booting; with:

    qcom-iris aa00000.video-codec: core init failed
    arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
iova=0x00000000, fsynr=0x120001, cbfrsynra=0x2a00, cb=7
    Unbalanced enable for IRQ 252
    WARNING: kernel/irq/manage.c:776 at __enable_irq+0x4c/0x80, CPU#6:
v4l_id/918

Adding module_blacklist=qcom_iris to the cmdline works around this; I
didn't look any further yet.


2) With the above workaround I get to the gnome login screen (GDM),
but the device appears to lock up when changing the password on the
first login. No logs or reboots this time, just appears to hang.

I'll try to debug 2 some more over the next week.


Have you seen either of these issues? It could be related to my rebase
or userspace.



[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=for-next


Cheers!

Chris

>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
> Changes in v4:
> - Add the missing pinctrl configuration for Bluetooth UART2. (Sashiko)
> - Link to v3: https://patch.msgid.link/20261029-q8b-dts-v3-0-655696dfec45@radxa.com
>
> Changes in v3:
> - Rebase onto next-20261027.
> - Drop tested-by tag in the dt binding patch
> - Drop CH7218A patches which have been applied
> - Mark vcc_5v_s regulator as boot on
> - Add the device to the QSEECOM allowlist
> - Move PCIe ECAM and 64-bit memory windows to a separate SoC DTSI patch
>   covering all five SC8280XP controllers; preserve the original SA8540P
>   PCIe2a and PCIe3a register and memory windows.
> - Format the board DTS with dtfmt and fix subnode and audio-routing layout.
> - Drop forced output states from the SBU pinctrl configurations.
> - Explain why full-pwr-cycle is needed to recover the SD card state left
>   by boot firmware.
> - Link to v2: https://patch.msgid.link/20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com
>
> Changes in v2:
> - Describe the TC9563 embedded GPIO controller and use its GPIOs 2 and 3
>   for the external downstream port PERST# reset lines.
> - Drop "PCI: of: Avoid config reads for disabled bridge nodes"; split it
>   into a separate two-patch PCI series, including the kernel-doc fix.
> - Drop "dt-bindings: pinctrl: qcom,sc8280xp-tlmm: allow gpio-line-names"
>   because it has already been applied.
> - Link to v1: https://patch.msgid.link/20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com
>
> To: Andrzej Hajda <andrzej.hajda@intel.com>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Robert Foss <rfoss@kernel.org>
> To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> To: Jonas Karlman <jonas@kwiboo.se>
> To: Jernej Skrabec <jernej.skrabec@gmail.com>
> To: Luca Ceresoli <luca.ceresoli@bootlin.com>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Abel Vesa <abelvesa@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
>
> ---
> Xilin Wu (4):
>       arm64: dts: qcom: sc8280xp: enable PCIe ECAM and 64-bit memory
>       dt-bindings: arm: qcom: document Radxa Dragon Q8B
>       arm64: dts: qcom: sc8280xp: add Radxa Dragon Q8B
>       firmware: qcom: scm: Allow QSEECOM for Radxa Dragon Q8B
>
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    2 +
>  arch/arm64/boot/dts/qcom/sa8540p.dtsi              |    9 +
>  .../boot/dts/qcom/sc8280xp-radxa-dragon-q8b.dts    | 2053 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   25 +-
>  drivers/firmware/qcom/qcom_scm.c                   |    1 +
>  6 files changed, 2081 insertions(+), 10 deletions(-)
> ---
> base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
> change-id: 20260901-q8b-dts-a3afc5f9b8b2
> prerequisite-change-id: 20260507-sc8280xp-qup-pinctrl-5ab8af9be35f:v3
> prerequisite-patch-id: d799218553d1a8d44d83ab7d5c36a9ba7dd05e92
>
> Best regards,
> --
> Xilin Wu <sophon@radxa.com>
>
>
