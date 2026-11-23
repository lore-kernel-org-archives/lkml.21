Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795450890;
	b=u/z1Whgwx5mNBsQwZrODmVLFY4KHAMDyGlJ09dKNWlRN42mMOTMxlkVJYXkfjP6Ykkgw
	 ey2xiXLDZxxpD4A7MwSxclGx+oeb7P1szxIgWYAerXFUlKkMem+N7Ce8m9s2skvwnFegZ
	 jDbiDqNbPx7MY2SDuUb3VWNbLMowvsDRIfWdN/yCaWQoP229GcOuVI/Ss/W3TLBWBjBQD
	 UQsjUwhXoacDMCZC/7df6Z9LGD5JrkipZHXg8ecHOgVRAEV4b6KNJI6ddR7/THUG4qKgk
	 6DqS8Wl7gHGo0sS+FKkVRrAvVvVxnuFfEiWEMi/FRJVGpeIs1tLARm4NDM44hCPh52w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/NnFP+NSq0yyiHjtLtbCC56s3jL1Oe1DEEGxccAA6Kk=;
	b=sNyuARqN3ZquXfrEZU/Lx6E3+JhSiIRsV1C9jS4ZSyNYZjQFSSKqBdr+Z9ZKGWMecmaP
	 2up+W3V6L6H9zxSepVIwUWE8RWlCZp8ktJazIRp1zjq2AQHJSaiXdHdYRA1itrwkJAEZA
	 GMwejDlgDfljri7CpnrnGjB+kMQbJg/hcxZ4X9jBGg+Qu56QsdG+dqvbox1GlhcA3zYS6
	 15hBCh7Nj6yQ8GReFgYwhZCKJg3nJdeomH6uNJB2/4aUZIqOW59mGyTS5c21Oh/qe2coL
	 nvb8NKTldR2wfCdpNa36vibeje+ufto4md/nODK/TwfW3Hx8wER78keH6gYnYKytPHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RClXlg3b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2nA1LjA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313BA606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 313BA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RClXlg3b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2nA1LjA
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGpad2769030
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NnFP+NSq0yyiHjtLtbCC56s3jL1Oe1DEEGxccAA6Kk=; b=RClXlg3bWSFVwFHL
	QIIvMS4osiWGN6plNZ3HSiPYDwk15ExQT2v5rJk2V0p/KYwCTbk+5E/ggifEOVMx
	0VCoGsGrILpuAIPnr6oaLHg2vAOcMH5jtYG04gNG5SMrFgRqAIvwKsIaWxfssHQ7
	06BTXyxsS1ECvl1qEoKkVu4K3OFk0diTyq2HBMVpvObIIc7NSrWyufmYPo3t5ex3
	2CvvJjAKatokjGr0b6B2EFfiVyVw/ArN1NPzw6FQzL5tTsrs/pY3Ke3MDuSypnxs
	3VG5iH0OtjCFw33UpDHw7fsnMMohUbqeG00xpa1hwVanubq3qlrPgoSHh4gRtRhp
	0gdbVg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa9t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:21:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdd9fa2a558so2856524a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:21:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795450888; cv=none;
        d=google.com; s=arc-20260327;
        b=SqsbvXenCdEwu6DwP59pNtPRkDEYU/GlWAjNEPt8EWsujTgjYwjFEuDgerGglT+dHf
         /+hLRGyzAA/odM3f+32Qs0ESG9sSNLcPJzkOM9NqQw7nZDiOtp4m+3l09N8NvXAbq5XZ
         CpcqhE1uLwiJjtKuImb2X8E97Q6vxweQeDAwk74xjNPt+eL3z1a1rgz+qdIv7xeKVYQj
         I2y6lbll/MjO6CiBB2UyaMaW3uwub//gI3s1ngcXZ1zueAsHC11dU4KP2VwkMBsvWJwK
         zgGvPdZbm6Wx0alGaNl0Zcx0CxRWKCjS+cP+aCaKSgI1IPnF/SVb1fQF4r+G8oNYcY+k
         wwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/NnFP+NSq0yyiHjtLtbCC56s3jL1Oe1DEEGxccAA6Kk=;
        fh=QeHKGXP+Ljwt+XM6vZ63wWNZwDqthVMXeWDJRbtja2k=;
        b=NoAYRkpd4+3egiv52yi5tCdPMSf1jy0dSiyM3be5HvbLilVr7SbxrpsMX7Chy9dakJ
         iHtivbkqHm4dynLxl/9mgWWhafkn6AIcHQXuoTcgmWv3O2UX7mhecXClNzmrAX1CAoTG
         wYQP9fkCP1bbQogJpfq8ZjkUlu3y6E2Ms+TqfyWbK5FrZn20s7MGCJYTgb4W8P2umX1h
         FIW2LweklGRolFU2eyxBrQdoyyQj7CWISygswoLIXDawrucFrwZI8bmZdx9bhDLgAHf6
         mngOCRMw6Ea1fO46lPqxTTXuN1b2YM/gXPeop6a1qcw8iJZRXpipf2M4PqNh61w4O25m
         /73A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795450888; x=1796055688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/NnFP+NSq0yyiHjtLtbCC56s3jL1Oe1DEEGxccAA6Kk=;
        b=O2nA1LjA659hTozxTrpLI5fRtA4103sYk2ThZhvXEDjOPKawfOma/kqHkR3zwqU72i
         lu6vYZrbCaQ7nFCPG4fy3BG1q7DNEbOQKsmmJM/LR8O9T0zOKtbFvjFNtg/8u0dJkQZ9
         UO0oH6U8DXLKPm8sDKQxSH2s9ls5X8qCU3eGvjyXuvYvk0pRj8DN2QNQ7jJo7niLhmxN
         4xmHIyAxg3jQUbgM6WaIREC/2JS8J9EhtDraMO+4ITkA0ty4WpcqnCidmtCrDFqJ0RIY
         fHl5t/OZhCLA+lyANVKz30ye/mA59AJo3J6kmaTD90YbClfyspRBuGV1++YQ9EXlWEgs
         vgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450888; x=1796055688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NnFP+NSq0yyiHjtLtbCC56s3jL1Oe1DEEGxccAA6Kk=;
        b=wkvaGEpOTIWshS1xT9Rhry+eb5djV+UQWxWghK7068WzT5L9SlWwvVPNflKSDxqCwg
         6TyX3hnAjAVKO+srkXaBO8h4uxebQBJnC79fNOzYq8zKe1e/Z/xOUkxBaXwjoiJCbIIx
         bB1cUChMp94+zzzGsFaOcrlOty4M3emb7p8f3IwCRIhvvj9GFhCAAZzwlTWykhiq/Tuq
         MKBJeexz5m73dlPZAp6SMXs1GcY0lcTGSdjJMgW/IXqSuEGhlRSlAmpJng3lT2vZxvki
         AbPCl47jZRe2S9p9XBFOR5+5s9MiIdQ7tBezHm7gP6y7vudJ0/7WglZapgXZz07xX70M
         kJdA==
X-Forwarded-Encrypted: i=1; AL+hErEmqkNaUL+mTdfU1yLDf3JFxh3eRUwC3ZTUYl+LT2jEvRXGM5BBWqsAKENiV335+DrwT3UmR7RgzLlJPJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jelhssPDJXwokrm8DG7eQlW0sobuhjJLdlRYZB4Q4MoUwkSED
	56abpQpnyloPg5uRwOmKu0/LMdM7/Q0SLMcvXtop58JElMrTFnYe8D2vQysXQqdtduSPYD5wfHn
	MtFRNaRUVJU97p4HaSU3mLtqomxxnLshdL36cPkqSkZ4/FPrg2DAYGAqutkZ0Du9iK8hErDMpzX
	YEcCujuRDIPfu558ObhpS3UJA/f5lUeqB2QcvaPTmsVA==
X-Gm-Gg: AZFdTZcHGJ5RX6gNy1lRryDoLJIm6qUSPX+3Md6GldHC0aY79v8OIXPWDM/e89mxRP+
	axuZQTpuWA8gqKc3qOeDBD0i7wFLU7XcL9svAe0p5jeSUzS922arDAUhEGEJNtC2X2iLxYtjmOq
	x2A796yH5FSmmMt6uSm3uoiRHcSST6Bzeukz785OSL6tWdyUpuSc6Y2viIKQofLAGXaMIJ6Rrpj
	DMxqNATJxQcWHNJ
X-Received: by 2002:a05:6a20:7c20:b0:3de:557e:5ea6 with SMTP id adf61e73a8af0-40283cbd05cmr5442952637.27.1795450887618;
        Mon, 23 Nov 2026 08:21:27 -0800 (PST)
X-Received: by 2002:a05:6a20:7c20:b0:3de:557e:5ea6 with SMTP id
 adf61e73a8af0-40283cbd05cmr5442928637.27.1795450887142; Mon, 23 Nov 2026
 08:21:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794615323.git.gahing@gahingwoo.com>
In-Reply-To: <cover.1794615323.git.gahing@gahingwoo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:21:13 +0100
X-Gm-Features: Aa3M54rrQb2REYtBcbw06BpA4JyTdY7S7pcOgeKDB2ZGguRFDoBBypEfHT-AJbA
Message-ID: <CAPx+jO_F5T8zW3D9CNjH0W5pLLM9srGovUmqvVeWL2Z8dDDo+Q@mail.gmail.com>
Subject: Re: [PATCH v17 0/3] pmdomain: rockchip: RK3576 NPU domain supply and
 settle delay
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: ulfh@kernel.org, heiko@sntech.de, finley.xiao@rock-chips.com,
        shawn.lin@rock-chips.com, sebastian.reichel@collabora.com,
        vlwwwwww@gmail.com, leonard@lausen.nl, abel.vesa@oss.qualcomm.com,
        tomeu@tomeuvizoso.net, linux-pm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX8QHxcAfk3Y7b
 ffIx9v00ALe+EQmCoQb2aDYElQj2r06urVARZaMdYBfsOJ521E8JleU/gMsrGrBm9BnQdFNUvyl
 xFXpB/eZaWbWOrrSUUE3GPnjYDgyvg4h/qpzDmOCMLsZsFkJwIKap4861u1yht3jyGsVYbwrFxB
 OEfWY6eqpeNMm8HeYpgC9LLojbqm4To7w885f8LNYmPe+HaopnqN7CaWtfQM8kj83KSA1O03/+w
 zkBHn6F2nZWr7f9qvcbO8Gz4mzs80upSOld2aywcWjctJ/DygHjGSz9Y4FYjZiR4ocH1Vs0rHU0
 uj8iLEyFlU1SYXn5FRzcjiygO4RZa1aFKnNTvQnzx7Bd6ZSn83/48X5PeE3U1Fpn+MtIvOzZ+Da
 Fo7kvm5TU5gpu+hdNDHNg+2VFX7E7Hk6eIEj9UWxnnoZPrFpX69Xl0lHFevrUhEZXSVunOMH6ZX
 oEuYV0jHzoGyF1iz0tQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b046808 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=9GNsruGHAAAA:8
 a=NEAV23lmAAAA:8 a=HctJ1lBftkvV2UQOCVsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-GUID: Nnn0ZfD-cagb7yzLSyhe_LeAA8p8Th6y
X-Proofpoint-ORIG-GUID: Nnn0ZfD-cagb7yzLSyhe_LeAA8p8Th6y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX7uMLUflu6sE2
 k+S5UNWgcDRcO1AjlMk/mEM2plSZ8k1z5K1RnCivbfG1qisWZBbY9f9d9aYOYn68cwsP0tkiGOW
 ICVcCGcWDMJtAr1zLvZYxfAUFjYwYnk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230065

On Sat, Nov 14, 2026 at 4:05=E2=80=AFAM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> This series fixes how the Rockchip power-domain driver initializes
> domains that need a regulator, adds proper regulator handling for the
> RK3576 NPU power domain, and adds a settle wait after power-on for some
> RK3576 power domains.
>
> These are the pmdomain patches of the RK3576 NPU series, split out and
> rebased on Ulf's next, as Ulf asked after dropping v15 7, 9 and 10:
> https://lore.kernel.org/all/CAPx+jO-KKvgRS0br-3QGh6Jt4efWJ+A6YoRZKFV_bcfB=
+8sm6w@mail.gmail.com/

Patch 1 applied for fixes and patch2 and patch3 for next, thanks!

Kind regards
Uffe


>
> The accel/rocket and DT patches follow as their own v17:
> https://lore.kernel.org/all/cover.1794615324.git.gahing@gahingwoo.com/
>
> Based on: Ulf's next (844a13010b0b)
>
> Changes in v17:
>
> - Reorganized the series as Ulf asked, and split the fix for regulator
>   domain initialization from the RK3576 NPU regulator handling.
> - Following Finley Xiao's (Rockchip) review of v16, the RK3576 delay is
>   now 15 us on NPUTOP and VOP only.
> - Fixed the subdomains of a regulator domain being left in the wrong
>   state at probe, reported by Vladimir Bely (1/3).
> - The RK3576 NPU power domain uses DOMAIN_RK3576_R, the same macro
>   Leonard Lausen's GPU patch added (2/3).
>
> Testing:
>
> Tested on a Radxa ROCK 4D, with these patches and the rest of v17
> backported to Armbian's 7.3 kernel:
>
> - With the NPU disabled in the DT, NPUTOP, NPU0 and NPU1 are switched
>   off and idled at probe on every boot (16 boots). Without 1/3, all 14
>   boots left them on, and one of them hung.
> - With the NPU enabled, 30 NPU power-ups after a warm reboot and 30
>   after a cold power-on, with identical output and no SError.
>
> Logs: https://github.com/gahingwoo/linux-rk3576-npu/tree/main/board-logs
>
> Tag changes:
>
> - 3/3 changes the delay values of the v16 patch and is organized
>   differently, so I've dropped Abel's and Heiko's Reviewed-by. Abel,
>   Heiko, could you take another look?
>
> Jiaxing Hu (3):
>   pmdomain: rockchip: switch off the subdomains of a regulator domain at
>     probe
>   pmdomain: rockchip: manage the RK3576 NPU domain supply
>   pmdomain: rockchip: settle RK3576 NPUTOP and VOP after power-on
>
>  drivers/pmdomain/rockchip/pm-domains.c | 115 ++++++++++++++++++++++++---=
------
>  1 file changed, 85 insertions(+), 30 deletions(-)
>
>
> base-commit: 844a13010b0b93f8561ef2c088f843647d5e552d
> --
> 2.43.0
>
