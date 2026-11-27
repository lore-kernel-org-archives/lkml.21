Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795790652;
	b=Y0FP7hrp4g4sUWd1bRDL0Zdx1VGiuqJgqa7uUB0pw2toB4pk0DkFZCQr4Cv5TZZZkrBP
	 VZWS06D09LXyBhuIIBmaha8VdXjCTRKbIHONvMvsQABYDL61ee5kYis3ri7jIUEHZMuyI
	 CNGLGx2D7Ewbmq979yjGYdFD2OIe4g113uEfZaISwcNjm+br8YroQDq6G3BzOoJ5Dze+g
	 WAFBUDM7eFIj1sODVL8QK4d9YagYBlypEzI5uxhE3p/0R421TPxhE89XYy9wX1iiVbAUB
	 nS61H2PQlZIu9dgRfh1moCzMIJkgRDCgcq5gxS8l7vfmxLifFRriSb8mrZ2p4O7WlTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pmXq4cx53aUwMhwc/UEGREZga34tC+gW3KcyCWNtHZQ=;
	b=e/KZvjB0JBUYlIt0Bluyr0ml+BUyTJP1WsO5pAvviaq13rs5K2UUVuBNO5gaOcrbvx3g
	 4t0ZHNje/lRQP7MGIVXpLa2Iye60DynpAMAgTXEBj88EFaG7gzmD4YFAo4dZUipTPSe7r
	 nboy3o34XYi4G5yTifzMZ8Rc5/d0nB1CdHyIRg1r7lpHoe44qIX/MCfCxdZu2yJOe28QC
	 oF+cAML+kBtg2N2LW/zdsR0d4AaixFOgggmiaz2YRqV7aAPjfpkPXal6BFjTqCwV8ONqy
	 A8JBopPcjbFv/0BwL3kKX34SlLjhlUXAWui6J4VNZrT1KHJawj4rGCTOXn5FxZJv5Ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o1LybMnF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LYzJqxaz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07C7606A335
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B07C7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o1LybMnF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LYzJqxaz
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1ffP4019024
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pmXq4cx53aUwMhwc/UEGREZga34tC+gW3KcyCWNtHZQ=; b=o1LybMnFRa+q79+V
	ekVA4miAUH6PmcFrPXvFjVQ8gPcGrgdAdQgVYMMohiAs5KTTGLs9wRmBzmFIyGAR
	j7eoITOl0kE42BTLSS9ytyByV8FZv8UAaUCTabK8cAoAHpJMnXsxDtIcZP9SPlI7
	ukRBmMXS6h/cJihq8GfSh3KtNSSGD+IHIBXyjJ0GV2rx7klf6IgWEdQHGRgw1/5v
	Zuc4IzPCS05eQrAflhuVMJ8USxnRc8GvxHS+28zCoooFPIA4RrIZ+q+XfU4dLYNi
	kKnF8cCLHm58FFz3MYF4OIt8LHZl/9Bxcl2oIpx3t78rngF5XPwEaxD5nFplt3Ur
	q/SYDA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dha41t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:44:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso4738210a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:44:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795790650; cv=none;
        d=google.com; s=arc-20260327;
        b=Zq5pHbTIf9RzrTY3X4yTfGDk/jBgyWlQXdyQeCsMyPeChDzCLy4MZjc4YEyohTohQH
         7yYiS1rcel5OiSBphYLVV1L7ELuTdmwwkbPXeb+ubfJjSHMHGW0g62MV/qRgCb0kc5cH
         qgT0JCzfhIht40vXTNp0MFyV9fhHx5ouRtiqPZMVh+F68DeBponzbqS9a8+RwRTR1Nib
         Jnz/7M12Wft7tRKROEuqLP9VFF8lZ1YTTjeJyCZQnfci6Sh6f/8OkdLIJ4+pNkVkfLWF
         ZrWcH2J3TofwU/kIsIhSA3ZLemVq/YBmRcSxz/R14bL/3vft3yaz9pIc1OKbbwfDwlz5
         +U2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pmXq4cx53aUwMhwc/UEGREZga34tC+gW3KcyCWNtHZQ=;
        fh=tZAjT+8bauT8KrABWieq2Xw+VmJltfhgMIIyVcYNWuI=;
        b=kbrvDPlRZ0CDK1j+oOjZ66srTYfSRlnAgSG3Mffma41nXIwPJraukZquXd3TCXUOew
         GhZaBSIIo7VMwjfYGJ2ePZMgB5nBxkLUjgkStXjyy/4ZITnoF5eX/SHIwsl8ifO00fBB
         xRyeJ/26oLGC+P+iuKs/7986FA/ydCDATXkUjeqEOWRXfY5ElKBlsPn98PUW+dxmOMOU
         dgvdAoir5MduT7oVLjElJEsp2QLTef16am+D9j1A0p4x/CEBQi3N4p1ktDfooVERSmnQ
         KxZQ1d2Dj+bkypc5VnTGS36sVLk33wXdHuUHfT/+NQn8ARyXIpoD+0z3hMff9/uMX/gA
         RB2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795790650; x=1796395450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmXq4cx53aUwMhwc/UEGREZga34tC+gW3KcyCWNtHZQ=;
        b=LYzJqxazovw/e3wTvv0whYtn4VBANGtVVN0VCGLsv1PFK8e6jCrz6Ce4p+4JAwC6Kn
         MJJHLjN18V4Tj6PFBfO1KXqQAO0+ojMUVoVQFML1urZR0KD34YFlBNoXdxy/K43drMJu
         ZMENt3vp9gng3L0azPcEwlNR4trfewe7d5LmdZ/Vp0Se2YZBn9mkCgqxRmaqxIidJB9/
         ebhdrEyE7n0GGZ5tFotuuE/sav++QNgp0AYVZlxJbTXMgImswYvJiu8gEcArXC7sd11B
         UcQXc0DIa+LTKRpwvaKSal0J+vU898SMcgVx+5p4L50TXxsvXHSFuzYhu8CZbhncfbbW
         RQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790650; x=1796395450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmXq4cx53aUwMhwc/UEGREZga34tC+gW3KcyCWNtHZQ=;
        b=NCnA8gdP0R90PSkXnJv/BsCeBHsfXwN329/ldqCDbyuFLLUAsh0JbKjmPxqJL+M6fD
         RFtaa7hvjpoYdzrJD9FVHj+bD9PE/uwzx22gpBsuqy7QDiQV/+1yHiY42+eQTFKYF6IY
         +I7ioFvqVoxxzGNyeI+ndGd9fvvuG3GfgWtP2i/5fsYQC21eWr6FkdY04doGY+9rgcgb
         +rz2Tutpqccn8y0B1gPgBnU+YI+2MjglaAOO1LvMYEt56sjat1S+nebmpAz+8FyBZRdL
         z2SWfp4Y0uh+WW3BU8CH+bRFJo/0ZDdL4xlct7SfzKM9JccYjIXNoqDI4o0cEEbhqjRL
         mwng==
X-Forwarded-Encrypted: i=1; AL+hErGo9/nTzBzeFAk8zuD5LstjlvNhhhQ2JvT2+Jbeo+kSSIFK3vWQVpijWr1Rj2ahrqZe8TzJ/HnhHeg61Wk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AqJQk53M+TOXAYbQEXzhCd8A6wVp4S/QddnQg62kdE0OmQDx7
	Oj1u3qyHBf8kk/9CTV/Q77zW+VFzO7oIHuwBd4o4CFWC9yZv5XCzCvxAe2B2QBNFg7lyqdIh3E/
	P+efNiYuKYdwHmbhNS83fyCzKUINVVO1q3YL++XPjgf5c2e/EhEyEqMunvbfdgFgJKvKOEgqeNd
	xNUFseIlRj0/IsYz1PHa/dzrZv3p6NN1dSMWubY4YtnA==
X-Gm-Gg: AZFdTZfbdTPLR0zFt4e5aRoqn6rxsbAfuFo5H+X0HFHprqe3qCKQFW1S0Brn/CfE8w7
	qZYMANP+8I4ZI2lAkorHxvPzpM+ooj08XInHWK7pbErJXMTNs1qNoqJOxvE/Ydicn3YofDbGgmj
	osO6r/M5VoDBhD9UN1LpmGKQPxPf9pthS+xMN10zN1aHI789XfGaZwdIQ/aQ==
X-Received: by 2002:a05:6a20:af1f:b0:3fb:3d85:ef56 with SMTP id adf61e73a8af0-40295495278mr14267545637.66.1795790649545;
        Fri, 27 Nov 2026 06:44:09 -0800 (PST)
X-Received: by 2002:a05:6a20:af1f:b0:3fb:3d85:ef56 with SMTP id
 adf61e73a8af0-40295495278mr14267522637.66.1795790649103; Fri, 27 Nov 2026
 06:44:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
In-Reply-To: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:43:57 +0100
X-Gm-Features: Aa3M54qM6x7CvrBi3F_w95jH3rk5p3lMNpHZ4R4dB4h4-G4B4KSdfHnhwL7kMsY
Message-ID: <CAPx+jO-iz4bWj32mAQy548YA+RpKN5jVNzAg4y7m1-1PTFwwig@mail.gmail.com>
Subject: Re: [PATCH v14 0/6] mmc: core: Keep the card powered across suspend
 when firmware needs it live
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Lin <shawn.lin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX3w1RPfGch9oj
 KXJhL0B1imuqlUeF9Hi0cQLP8eT4C7k7NVxmX1edsznn0u41Kn1HCA9G7J+GuDQ8tEqNdXCyfi1
 m0PZEZO2NqtD7OmG7/YANsrcTPMWy+A9HQdz10K2dap7ua1LD7JIR9e+T6u9WevvSbUGjhBJpZY
 nmdpeuRfR4g5l5aelp9riI7diRBMg7KapRYy9/Cscemcg+O6DKdkZtRl3+cSM5N6/1O9T0cnIBF
 AJYyHOjr1KyVlgpTz2d+PteivWIiAQ917o6z7d3i8Yja4Tvt4dWtgH8kDvde7xWvJz5MZQx47+8
 SGqNRogfHeCujGops5Ox8ltf3cqmtOneCrF+66GFQA0Wslg3OMZH+7kGps8gAR3eTrLG5AbtS1/
 sewhun5xCVr4OHDruGeaU0rvCnCd0X+4iGX6D6Q4shE7NHkXicsMcs/J/j9nmZp1z6lE0Y1QT44
 PwmMK3U+uhkMatm6a6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX9RcJ/rhU3dap
 KjgfKDNN4MOl2t/p7O7FpMiVkzmWC6bH3kfuqAI9qRuKUj5F5l8h/fMPbsrf3GYxE7Us3rzGAOJ
 XKqUeVXvvXo4gGby7DbrsQdihmAd3sc=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b09973a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8
 a=14t6xIGfFiX4SUP_uEsA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: hW-a3tqyrbbij5gKWNN0lV9ZbYlkR4nx
X-Proofpoint-ORIG-GUID: hW-a3tqyrbbij5gKWNN0lV9ZbYlkR4nx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270058

On Wed, Nov 25, 2026 at 7:21=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware accesse=
s the
> card directly during resume from Suspend-to-DRAM, before the kernel's own
> resume path runs, in order to load boot code using hard wired logic that =
is not
> field updatable. The card needs to stay powered and responsive for that a=
ccess
> to succeed, and since it is never power-cycled, it also needs to be reset
> before the kernel reuses it after resume.
>
> v13: https://lore.kernel.org/linux-mmc/20261113211143.3759154-1-kamal.das=
u@broadcom.com/
>
> Changes in v14:
>         - Patch 6: Clear MMC_PM_KEEP_POWER in mmc_host_class_complete() w=
hen
>         MMC_CAP2_RESET_AT_RESUME is set. The flag is set in
>         mmc_host_class_prepare() but was only cleared in mmc_resume(), so=
 it
>         stayed set if system suspend was aborted after prepare (reported =
by
>         Sashiko).
>         - Patches 1-5: No changes.
>         - Tested with CQE enabled.
>
> Review feedback addressed so far, including Sashiko's AI review comments:
>         - v14, patch 6: MMC_PM_KEEP_POWER is set in mmc_host_class_prepar=
e()
>         and was only cleared in mmc_resume(). It is now also cleared in
>         mmc_host_class_complete(), so it doesn't stay set after an aborte=
d
>         system suspend.
>         - v13, patch 3: CQE is turned off explicitly when the card is kep=
t
>         powered, as the cache flush may not send any command that does so=
.
>         - v12, patch 6: An error from _mmc_hw_reset() in mmc_resume() is
>         propagated instead of being dropped.
>         - v12, patch 6: reset-card-at-resume without keep-power-in-suspen=
d
>         makes the host probe fail in mmc_validate_host_caps(), instead of=
 only
>         warning, as the card would otherwise be powered off and system su=
spend
>         refused (Ulf).
>         - v11, patch 6: The host is claimed around the card reset in
>         mmc_resume(), as it sends commands to the card.
>         - Earlier series, before Ulf's rework: Sashiko noted that the DT =
schema
>         allowed reset-card-at-resume without keep-power-in-suspend. Patch=
 2
>         keeps the "dependencies" entry that enforces the pairing.
>
> Tested on a brcmstb board with a Kioxia 016G01 eMMC, running S3 suspend/r=
esume
> (pml -d) with the DT properties set as below:
>
>   keep-power-in-suspend  reset-card-at-resume  Result
>   no                     no                    board resets on resume
>   yes                    no                    board resets on resume
>   no                     yes                   host probe fails with -EIN=
VAL
>   yes                    yes                   resumes, card re-enumerate=
d
>
> Kamal Dasu (2):
>   dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
>   dt-bindings: mmc: Add reset-card-at-resume property
>
> Ulf Hansson (4):
>   mmc: core: Add option to keep an eMMC powered on at system suspend
>   mmc: core: Split sdio_set_host_pm_flags()
>   mmc: core: Move and split reset functions for eMMC
>   mmc: core: Add support for resetting an eMMC at system resume
>
>  .../bindings/mmc/mmc-controller-common.yaml   |  10 +-
>  drivers/mmc/core/core.c                       |  10 ++
>  drivers/mmc/core/core.h                       |   1 +
>  drivers/mmc/core/host.c                       |  26 ++++
>  drivers/mmc/core/mmc.c                        | 111 ++++++++++++------
>  drivers/mmc/core/sdio_io.c                    |   7 +-
>  include/linux/mmc/host.h                      |   1 +
>  7 files changed, 123 insertions(+), 43 deletions(-)
>

The v14 series applied for next, thanks!

Kind regards
Uffe
