Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795711903;
	b=DyduQYOcJHIOtQNXKYsFJ9xTL8ln5It6+ZBGYvXG6XgPALELH9pS2tXSvIwLl1nxVbrT
	 A/bmVHWolPFE+N7s+uyf6d1vIPdplj5zzyjaYgyfffCIXfaL4jtanLjAd6+jHubquUsPI
	 9SO1YGZHDgRzcdc6c4T74rMZiBBFQW3OuJJ+3IlwHM3qdSPSvr2evGyZF4KIpyTOLgBl2
	 sjFT0ahwH+ctKdGS7Lh6uKd79i5aC1QdHnyd0DolTZ17LhyiBfTYOw7ew/8IexhtBtPcy
	 EUtHhBqyrgLTZ4zHaoh/zzuu2xyyxBaDpxygpSQvr9JUCStDFvIQKB9MmN990XsFo2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711903;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=;
	b=EZG5wUa/i66qRtk3wMcnySceXZjJz0Z9IqDqjEPRgiK1TGnpMsyfufjN0EJqh4msmhRa
	 D+B/xcqriFrhT0lYJ4Kr+PW44GDZDkdprysQPA/8lZLmiz6+KKNSZttucRH5WD1sU/vV5
	 90FJ0jn1NRDqqqVWNhGVvRiE5WkWUwbBoGCN/9Ib3/TezPdQxKpsmX9ZPPumVJ7+85P6y
	 zL6FLpNnODbKH6xgF0WNSIFTOZSv+nQZEOr4brsV74WaqWoxDGcMSM1KOkMe7EymESXIN
	 ePKbSvwGsXn/L2Tt8ig4tF24lq3PT0pbD2CIdyhM27tmNQN3YgJUm0DC4NKO5+AxwDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VUXwsLnE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=amGfpBzH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAEC606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDAEC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VUXwsLnE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=amGfpBzH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuJ7Z3750176
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=; b=VUXwsLnERin7OHsu
	YlLK/cimg/N6nMwtb/3rFcpTDCS0vg6LajJtxShugWutizcqc4BlTZ7M8Hk+AzA1
	2h0ErmKLGxEdvk/fVu2qs+h+rFQQDjNHaF63+PaWnhJrxh3M9wud0nV2y3SpYSnY
	yrQYkXmANJX6tF26ZAq2Y1Fju3zWRtKvoYUUYnb3oTjQOxEB1vTMEjepS8BcF6C5
	N26j5DjPdfos/ks8jEk2Dph01gCbVcXUhZvjnJZM+I0uXYCIFvAE8KD7sTI0vNpr
	256p1oKqxZX6sennbCWMvGUG6Z63ikwLLWptj3M/2qnhPUBGs8HI86z7FM7XH3K2
	AeMgMQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sc0er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:51:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so9244106a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:51:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795711901; cv=none;
        d=google.com; s=arc-20260327;
        b=lLczFSJ0IlEOsWohlN3H4OwzmYiTAlA2ateYUaZ92sa2lrB8K7YFIWUzeKNBVgOI+U
         MAN0c+0rpi2VQ8TbTLevNMF3mh//GCDzIsIXene6u3AzezQsXglL5Sew6DCihjGUztIG
         fYVeGN3S5VtgCQMON7WYfYQbzsSNua9ILwOkakDVWqPBz2K5F4EIQUDVH5mlwzkFPdT4
         2yVhI7qOam0H5T0SG6YSU266SdgAampwXIpuSrHmF5B9zURfmOZp/10VzeVvWuS2aM0f
         YQrbOAlRqc2iAzmIpXmrkRgSgBXYVDK8jlJ3PGz5K0RCJ94NPlcxAz+0W26n46y3Yq1P
         UMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=;
        fh=SFr0g1d7ihuTfD5oojNZe7LjZ5AjYOSVNCmpHYBfOaI=;
        b=ekS0EeTZ5adUx1eEpyq5nB+4s00NRogsq0TynCaL0CIzhX3UlzY1tkZjAWKhlB5nXc
         YmPyNulKNmnSUNnHlIXjoaF+Z2tar3Wa4SMSeLfFETGHCWaiRf+tQBQT6rBq2E1rC9tL
         7i9Dqft6VRVLMFzG5CCy17jdq7mh5SCwNrT0Vw8648/BY/iiXRVT0GYP+O1+uuuLRtkO
         TBDyr9kZeqHOjqunkCq8Nfed3s/YvZT5UWxlEAEACEAXL60o3Zip6mSNqZvTRNJ/N1o0
         4HM0Dma2oypj8071gl+PqEVXW9lb2TLcmCNoPiTdavTgGnmp/vabTvywSQIz954GSINo
         V9xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795711901; x=1796316701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=;
        b=amGfpBzHCD+BX3hHvBWyv85KpPxZp1lsG0jrWfKICQO8+qxsxydACyJ/k2pZkB9wrh
         K11phOjYC+i9MkSiFNNpLJlArjBJ4s7L0nip6nX7phSlrgvS2XiLEw241yRx0NaIXfv0
         StBJ1LctBqXzcafTuvvbtl1I68UproQLBd5Ht0wDoMnFt0UNlKF4KJFYV2jKFjxSVaXy
         jBIJ/KRWkA8GeQApAYQ8r427F2+kYChCaA5UDmaE772JhtKfbHle2ygH4o1Zy3tbyFmR
         37r1/f/cvtVc88voNNvOlzD4lNWHJRQQxcZJiFQpfAW3VHcoE2O04Nw8j8/I4ss+/faP
         RDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711901; x=1796316701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4L45K5UzzHSSd9C5bR3fkwjaNK7JRzE0XRNmy460r9o=;
        b=CD0a0h4r0Fp3N4vOdmVxywwvD9VQKAfDKkbk7qcrkY5f1DvUiQq43vurSQ3oLNTFDS
         cSZZ80EaMF6XQ3m6ChBG+Tju6ONnk9hxsP6Zo9SjKtMWCn45pLYpyQvsezDNPUDUanTb
         VewRkh9gUWg6oqDpF+M5/GopncYAvN2MjRlDtVlh3kVdSn3fu2WcOw60lBPflBqxOGcf
         PVMxnbeYiLuECdl8IJikm+QgKYMTvj+9rXXTG2N3tjsrrob0iZJz8fTwjWecTC3oiUl6
         C1AQ9ZCYQfHyhU1oXX6IS1AvpasKD8hm5vNbqmk741Wv2sFZETbrH82SHhsX6WGlbdcO
         ZM0Q==
X-Forwarded-Encrypted: i=1; AL+hErE2y14+gb+vkJ1EsHZn//0JfmLhYWBHW3KdanRE/pia89alBxJevM3OetnGkLRkONKz3WeS0fkc7fXk+kk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TWNP4EvkS1QR8t0+DFeQ/SdXil6ZScgKMoil+SWcsY5eiR8kD
	WRzPoJp32+0UkxY9JlRHndJl3I2FtUa3saRtQXW1j2vxo0pEy60DYREZitT6Sahi3CEciXQxS/w
	jVyXOUcgo0OcRf94Oxt3S4FhUhNmjyPiTiMmMZrAKstTCSFngcQ48tqvuBDqwMsxJaFvUei8AEi
	sfRb6z4zAN/YvcY71ANnAzK+i68MF/AyOeEIQ8cvE8nw==
X-Gm-Gg: AZFdTZdjWari0hxW+jUQYIMFqlKEddMrtgcgW+9ep5HHkpQSdYu1WXC+vc3KXqoLgYp
	sNN+Lx6+u5UZHOKJyikFkOIMjP+fsSYDv7HjULxMsiNdn7Se89YlV0uZFnFOCHG9dSncm77ZP2g
	KNVJ8/R32WlqqfpHZkEAfoloUdCGv/dJlaOhe3ERQ2I2o6R89F8Vx/o1USWQ==
X-Received: by 2002:a17:90b:388c:b0:3b0:a378:1cf with SMTP id 98e67ed59e1d1-3b41c9b2d39mr21437079a91.22.1795711901539;
        Thu, 26 Nov 2026 08:51:41 -0800 (PST)
X-Received: by 2002:a17:90b:388c:b0:3b0:a378:1cf with SMTP id
 98e67ed59e1d1-3b41c9b2d39mr21437054a91.22.1795711901047; Thu, 26 Nov 2026
 08:51:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103183030.81078-1-jernej.skrabec@gmail.com>
In-Reply-To: <20261103183030.81078-1-jernej.skrabec@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 17:51:29 +0100
X-Gm-Features: Aa3M54rgEbRi4FWdDNfEkN6ZYS8yeQYigoLC6T4hTzlJeEwKiPC6M76vYk98AsQ
Message-ID: <CAPx+jO9=UzwQVnmUfTpOoYxYhjEPv9V9AyMOCWv7iXDw41bZ_Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] mmc: sunxi: fixes and preparation for A523 UHS support
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Anfernee Cao <anferneemelokc5@gmail.com>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b08639e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=8rAQGYXpxwjhbX_W7ZcA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: rujdhtaBUaP4ikdt3NZI65AL0gUcObtK
X-Proofpoint-ORIG-GUID: rujdhtaBUaP4ikdt3NZI65AL0gUcObtK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2NiBTYWx0ZWRfX9MXe7RYhSBVw
 hnWodK+G8WJfQcdsLii43FJ6FggTRdl0zV5XH0sf47aAVVbycfoSaorHdOWZDllHuhmoEydNFGv
 In/mrgBqnNazevTcU+ykrPETR/fP4F/aqYAFE/0KMAEmPMWjiWtXU3WGKRddmsXaLLTFbIo5eVM
 s6IZzUEPi6pB5+uobfcACt+KZ3AD4QHmL50MsRK3SnDBMwMOhLrXDAuNKUa1LsWX/5gn7vvwaxi
 /2I512rUQClgq1/T7AdiiE4q88YkbVNts30KDEsxJdpi2Kiyfz7qrKi6/VWicRyZVe6ABhK5xm5
 MhaUoCaowmzpTXn4LeuYgkN0giDiRErkM5Y7i9U2HVYGu4TrFiK/eM9s+O6//GDfdkGRJfagB+Q
 2enfH9FFC725sti5vxXpXNbJI88HVl9IDbnW3QR0oipDdcnyR37wCLpnZyjm6qtTldp9P/pDoUZ
 6hZLh4HmCl+T5h+XKlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2NiBTYWx0ZWRfX6IwxYleio+uT
 6NUZZtzF26Ly45WbhcbjYvNmWkjYPrNyRsU/YJRrKnEBrVyZd6fgQHTC9a0lcjAmFUpaCOGvQ1z
 n1vQS/oPF2zlOKpqH4gYFMiDzZsu8hc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260066

On Tue, Nov 3, 2026 at 7:31=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmail=
.com> wrote:
>
> This series fixes a bug in the sunxi-mmc driver and paves the way for
> SD card UHS-I support on the A523, which will follow in a later series
> together with the A523 clock phases, delay-chain tuning and the PF bank
> supply switch.
>
> Patch 1 fixes the manual stop command error reporting: a successful
> manual stop command is still reported as failed, while a failed one
> stores the error in its response instead.
>
> The remaining patches improve the DMA setup and error reporting, which
> the UHS-I work builds upon: a DMA mask matching the shifted IDMA
> addresses, IDMA descriptors built from the mapped DMA segments as the
> DMA API requires, and CRC errors reported as -EILSEQ instead of
> -ETIMEDOUT, so the MMC core can request retuning.
>
> The series is based on mmc next, but depends on commit 5e32202f532d
> ("mmc: sunxi: fix clock and runtime PM leaks on probe failure") from
> mmc fixes, which adds the error_disable_mmc label used by patch 2.
>
> Tested on H3, H6 and H616 SoCs, on multiple boards, including Tanix TX6
> and OrangePi Plus2E.
>
> Best regards,
> Jernej
>
> Jernej Skrabec (4):
>   mmc: sunxi: Report manual stop errors correctly
>   mmc: sunxi: Set the IDMA DMA mask
>   mmc: sunxi: Build IDMA descriptors from mapped SG list
>   mmc: sunxi: Distinguish CRC and timeout errors
>
>  drivers/mmc/host/sunxi-mmc.c | 122 +++++++++++++++++++++++------------
>  1 file changed, 81 insertions(+), 41 deletions(-)
>
>
> base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
> prerequisite-patch-id: 8d600908a2eb84acfcd034482dd6e345242f1464
> --
> 2.43.0
>

Patch1 applied for fixes, thanks! Patch2 needs a rebase, so please
submit a new version for the remaining pieces in the series.

Kind regards
Uffe
