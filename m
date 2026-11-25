Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620273;
	b=1mpZkWVpNoY7Am0iB5e7ABIibwjPLYC73rTd7HNyHPkj5+HCRH+48WgR2Xy+wGIv1hW/
	 NzulDijrpqdfXNbkhxjx8e3npPUD9FZawGnnEchAxpsHXk49PXcNwQdYQOit1Tab5BrKw
	 Jj8AeiddEH+fScdJDRZleV3HEbqN/Yz/SlY664+aflMoRdberDNwnWeHSwLW/6Gcx6q+8
	 F++2fZ80id8OcMpOe5nZoCltVKfSG0yOqn7FEll3oN8xOO5Ud2wmj3ocJFQH+wR3I/0rG
	 9A2CYp30VannCSWSaQkhkdXQX8egOkyh2MWKWXMXpMQth3wRjg4ZxxV2bbHjRmWY6hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4PCqqxbAPdHLMDmL/jc+BeC5eGbqxuOHjdxp6tKk8VQ=;
	b=mGU2LWMzj7SY6WaW/sdtBq4SdgmvazMbrLYl0wgmm7uguQIWfvkkyqp/bmxECRucKxfm
	 n5f4JEkbbdIs5yPYN4vQ6ub8uEUpg/mSVCcpow/vcS4lvHVaOEPCUYs9NWDfzraurZb4Z
	 MNq6QOjBicQSR6P5GVHPFjBLkpwb0STUImqZfKP431YN7VhkqW02QMscNOFRjECyPsvWQ
	 jjqtGU9EVk6rC3kMIiHNytEAMUlzSvHCSyzrfWoItFW4r/qz4sItT59Ntnq/4iW93y1cF
	 qN4PA+NpY2urTBYR7D1YUH50lg4sbFAAU/AfqX5cZerXVV+VKNgntpK5ykyIYAij2/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOigGna7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VOB2S497;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20B2606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D20B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOigGna7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VOB2S497
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM4fK539720
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4PCqqxbAPdHLMDmL/jc+BeC5eGbqxuOHjdxp6tKk8VQ=; b=XOigGna7XHOQIbMm
	GNzcHCAVLmMSg3BMLWbKcIUDcT4fSVApjAmbklR+6DTRGWWZT4QeGyR/gSwXXGNz
	FtcIyrW53cY55DrAMJDwJ5vq+delAmX6I/3VTWHa9nXj9HpG1rxVYRKxYOHOnh2d
	6R0rQN8nvkR22MxYoqwvFMhPEyne814gQ9NFPl2raSuMMZi7a3yfwORcxgkme5cY
	j2tEr8Mo8VkHJjBSDS/DTbPrBulmOBFf+egCVCLnhY0CZhkE7zUGwysTuh/Kx4ma
	sVhObKkDO1nIE/t1DhpV/cI0SUTmWOBbJlbo9yLeudytEokGWbTjPHAzF1c45Bpy
	mEAkig==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhshmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:24:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so3724472a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:24:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620271; cv=none;
        d=google.com; s=arc-20260327;
        b=PwTRPYUIvJe+FRdosprYL3EHw6TGovqUya/siV/QjXng5ij0sGoDy9WEe6E3h9vK/S
         hf9K9mFcO7uh6i+CC8SjhFC6BSWd4nWCoR95Gx8bsyJlmMmruh73nmOFho+zI8+NHW2J
         MBvCHXadwJ1PyDE9Gg35U1hjPSiYwoVWzEzlq8lreJAY1uwgN3DRsvQmk7K0MD+677dz
         t62Xq7+ULyLFjBQ8JMiRGusIJkOnc2cAD3Tl8vnsVbzZRn4F+Xb5FPhklwo3mjDVcu2+
         PYQz/2YG0MipivVRFROGtdhjlabNaKa/BzoMzHWzslhjruLJf2KbvPM91jnDeUDkjJ72
         iJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4PCqqxbAPdHLMDmL/jc+BeC5eGbqxuOHjdxp6tKk8VQ=;
        fh=K5d+kqdmM9ixl2aZWtabGVtzODobKj6oN1zxzCbWK7E=;
        b=hQbnx+MJUhCJ0yPFCaNZ3AYEtYpNz56M5VRBOSgniJEx+OGRnCR8s55lQ/KKZhl/Vm
         3JXVAaDjSUhV24IcBpcEXSn4xppNsuUH8/M67fOcw0F25tKGoTP5Qxi8YYAGEegbH5Oo
         H+VCnPwHXtwNQJzDg482iLn8D6/AwiIyZx8eNsFzuj3TSkX5OGV/VheYfmc2ipBQJXA/
         s6XkY21DyMzdp9QzDFCKHPTnKIKL2XoqoU2Y2lLMUK7kCpjYprikY39IBIljMkGFIa0a
         JZk2N8hWeY+EHcYSc88WVuxEsLto+5Povmm3IAQJNlyiI4evSAJnXbLxCfBpBwU9WlFQ
         JlvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620271; x=1796225071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4PCqqxbAPdHLMDmL/jc+BeC5eGbqxuOHjdxp6tKk8VQ=;
        b=VOB2S497wqCcvZUYyT9461tnP47i/P4MfiYOK46CZjJv5X5NLhXKYAKmgbdOV1Nv0S
         Yo/clmaAnfKxZnBKsRqoIPoiJh7GVDU8TslMQi31LDmRWSpE1nWRc8ZD3sYw+S69t1tD
         bNFGEL3xVL8lOgq64lQHofFq2fJN1Xh271IRt2ck6bSywYMjq9cLELLzhaZKiHZx8+f8
         0J/o2Qzdmyel9tQME0Tj821ZKymmuJM+yFenSG0ObME05cBOWY4G5qDTAuoRaAI/GY/F
         +lEhjBVqoWocbw4z2h/YGIF1cMI9Pk+XB0DZoozKzpzrFBZqu3vhp+Rk5YjMRyPJa/N0
         gdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620271; x=1796225071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4PCqqxbAPdHLMDmL/jc+BeC5eGbqxuOHjdxp6tKk8VQ=;
        b=ftSJ2M6JfwvNzMX8t4URTb7TfWid5Pav3l2ETqY7rwFBks5gTiBqUb1gU1ZhezUCGu
         j+2H+E8ahWlH63xd8SqH/shaPXXQEe3Lt6UG0PZtywSEp5FKP+Syj9bBeNI5InW6Qr7i
         03kTDa+cZASbtJE4bxJ23CBpSuXanZqUBU2vezEws0FFMOBIyvDdqRYXXbmdP6u2+tpE
         wDiFSfROKFiiXjBH7bG+Og/mtRzAhWvlyfegDqpPOGHziDOFkI83LfebIHP/GaKskPfZ
         wTl2Q2PRAdUQajyDmNMKaRYmRohKktlLpXZCSFWGd0GvDIsX0G4uB0TDQeM21Oh3sqQc
         +rOg==
X-Forwarded-Encrypted: i=1; AL+hErFHVRk3pYPdjh8hkE0dV9SxpI3f8Ocgf2nrRy6QWrOn2W/qBlMsd6Hgzj3vQEcfjeHi9RTc93c6FVrUWqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8azJGV41Epf6RNHmP51XS5DomjzF49OZHXFjN+ZtTICt3yFvCO
	XM3w1FGEMH7KJqC79qUEmw5dBeIEghKYQ8c/06NDksRLGLWszUg0qhyKlVPik7L1Y8UhfQPPeRE
	o45bPWepL5BzI/6G1K0t0rm2Jp4rg3bh47M9ZVwGhl32jx5etvT04HVNgxacqyhX1IJ/jyXeo6t
	qxACYyWcGdsgJOMGlb6CiUOJ+Vxi23h8vm0HtBTKSgPA==
X-Gm-Gg: AZFdTZcnDwLB9f9En2FYt2Op4SH5cI2C+8dtGZLYpFbg8vdtYzansIj0+CQNP42hOe5
	qQsguS2eZmLZA4ypflzapbQKEydl5JbtWnet8wUKmS60patdEi7zy/j/+ch1a3NEksgrGKUzemf
	T+JjIM+27ABKCtmmiCpYzEfB7X6HI67NTQi+pUsquV7Aa2NeQkPCxYjhJ4/g==
X-Received: by 2002:a17:903:b4b:b0:2e2:d09f:d770 with SMTP id d9443c01a7336-2f03f18fcdbmr179271775ad.26.1795620270880;
        Wed, 25 Nov 2026 07:24:30 -0800 (PST)
X-Received: by 2002:a17:903:b4b:b0:2e2:d09f:d770 with SMTP id
 d9443c01a7336-2f03f18fcdbmr179271375ad.26.1795620270479; Wed, 25 Nov 2026
 07:24:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795094118.git.geert+renesas@glider.be>
In-Reply-To: <cover.1795094118.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:18 +0100
X-Gm-Features: Aa3M54pJ48YM6_SXlU_kkTSYJ2hI-57deYpRMNsa0r9P3GyWSoliI7hEQs8n9Ag
Message-ID: <CAPx+jO9dY9yuJ5VUmuNi7t63nPNuYj3A7EWkwzsrmrZbiUQQFw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pmdomain: ti/core: Miscellaneous cleanups
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Tero Kristo <kristo@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06fdaf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=61mVU_RYb79rVc1cBGUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 5CWKT2_di9duAMPXGKRF-Abqa1JyUKdx
X-Proofpoint-ORIG-GUID: 5CWKT2_di9duAMPXGKRF-Abqa1JyUKdx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfXyEKtPgTzNlva
 GByUenRncbFSz1earWEHg7aYoEh5D2ydGC7+GsCWdpogGI4C5wOk0QftxVsuQ3RGQw24CC2u2Y9
 I79Nchdqy80VjZd8TZdOkPEav+U2dfY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX1AgCaetm3KuK
 3A+lCawgsAel2KoThpM5kiZjuPKNfoA44Ibjs5Fypi+xfOB7q+YXH5wDXasEWXO/YjGdWIov3qa
 JG1x0ZbnRvZm8xo+MIoBc6eE3thYx1PAa2ivFZ0owlWDlSr6bxw04KS3tn8S63LzPs2yGgM1NTG
 shCIN2aDUKg6tY209b278kZAl3NiStHT+WuJQDEkP+d33AW9Fs9wJG6WnjaRjVJ2gVZl1F+5iL+
 JAaO3uOb6E60ksqqePWiNk5pKwrZ4iDEHq4133qSRnXCHIUYTANsjsIvIJkwXQ8k6doHpOSEKW2
 CVMEguF4GAvToHviwSpSgDm3Z8FGsS4oyW6jRkatha6r8A1elY1ix2NhNuXDtMg1Xv2uCiCVByQ
 xY0O+ymct8eMA8zPsAl6jBG9qDt5Qy6DeboNAORgjcP8K/232/V/Elu8oJmhOUSSYaV1wer5vTQ
 y05cKQnrMCsqdHKQ5Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250061

On Thu, Nov 19, 2026 at 2:23=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi all,
>
> This patch series contains two cleanups for the TI OMAP2+ PRM driver,
> and removes a now-unused generic_pm_domain_data member.
>
> This has been tested on BeagleBone Black.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (3):
>   pmdomain: ti: omap_prm: Use pm_clk_no_clocks()
>   pmdomain: ti: omap_prm: Remove dummy generic_pm_domain_data handling
>   pmdomain: core: Remove unused generic_pm_domain_data.data
>
>  drivers/pmdomain/ti/omap_prm.c | 15 +--------------
>  include/linux/pm_domain.h      |  1 -
>  2 files changed, 1 insertion(+), 15 deletions(-)
>
> --
> 2.43.0
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>

Applied for next, thanks!

Kind regards
Uffe
