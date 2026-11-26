Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795708222;
	b=VfWcLQUggEM5PcUpT0xUTuHURAHfTMeOHO/mDrOOvKbIaFmywk+ewtlTlRK/JusycGBX
	 ZdrJto18J3UrnZeJvILlVvBEGaoop2cwGiLEdK7968qQvOGKJuihzOOXfik5Ga9N8VYf9
	 KBIXWxZlriKDWF/ntG4xX1QRUlwnGqX3OR7A2jMzAa3efLilT499pcnlPUbYXvhACBtTg
	 rgpbgogncsn9lvPiOJ+cFXJw03W8mIlDsytUyQ4WYEsJfu8LAvoQO52Q04Sb2BjZPki9f
	 2T+O7wMfjkIUSCNekTh/Ow7a7W5A5YlulRDVaal9/1FEk9KLLlqqpuf/zT0F63YRvLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gIwZcK4QOl3Mm5lzx8mQRAanf4vTLDTmM49asUT7xVU=;
	b=kxBe0dCHiUSwGuM+LZSSEARG1+pb0y13kSKiqPpxw+pNZmP6zjhjb9gbusFzMYXhGkm9
	 dh2zuEaMzhr2YqY3ggOT8dinm35LDO+I0fN730lWSExFle/j6mR9cMQXJVCB+dmhQ8rpk
	 Dr+jxudsUmMzyERrMsdfrzgwM+YPf1xTyshTbb7ngES1Rn9TrrTKDJL8YlmyOCYLeZq68
	 o4Ld3v7NJOm23bo0Quoq1BO4vlYwhaFrpWAAktwazxlBRH3AJ9m0VcwWl6aDbG11eFvk6
	 OeD45otCA8oViMjYCNxv9Z++2IblpHXnVtT0xDCnsCP7OijCCggNcLJYmb2s/37Xv6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Dcvo/I7g";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYr0bRva;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EDF606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5EDF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dcvo/I7g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYr0bRva
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVawD3144201
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIwZcK4QOl3Mm5lzx8mQRAanf4vTLDTmM49asUT7xVU=; b=Dcvo/I7gXFcqEJph
	3qe+Zy7ukwRz60QpxiUvzYinwPbZ5zXry3KOaePjTQZ3wXEzdF/u7tSb1sXtMWim
	OXGUpwOIE7v+kpjy33MHwit8tjOuZg3d8akrKLMgDdah69IxiGeV02/L07X+IZTs
	DL8i4ZqdrKlqmxr2wONtQD9uzMyg1pHnAj7XSNhpQiPzYMqeX/d/sUknJLiV00hp
	xvOer6QoNUdeZ49hS+pzuv+9IzWQCNWo53ZoCo4v/MnyQOyGSqAewwplxdZIEJim
	VHK5o//xNesDq1KWF1Bo1qOxz3Tc8vJAdAhOU6nu7B7B4toBzkQxtEeL4YUOuqDR
	/QidsA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahw208-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:50:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed08904845so93872305ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:50:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795708220; cv=none;
        d=google.com; s=arc-20260327;
        b=YpEJPdbJ5fgF5AHvd3fNN+wJFeG4q7jdtakucyTOl3qnSy0ATOJkXbqi1l5rpbj8c+
         EOZfvSkLtFpvZ6l/3Yg2KHJBRZFsybxbd0Posy3bVcTjIOsPtDkenFozZ3BxhVGxN3J7
         971Z0R7y94ee2K5+qSM4S1opMXmmm5lUfIIhlWA8qx1dvy1rFA1OhMCRdqZA9s1TtiXG
         hacEsjoWQp6sGKkm3DX95IIFqT+dCc8U8IUbOQK9Ob1FiQsH27QJUgIm8zz3/IiQZAat
         SrXwu0xojCOLkA9BZ6Z9XfvHXzwOnII/JnEWLuHZ6d7ZYqjG/gL4XbSTHSVnAirfRirw
         LA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gIwZcK4QOl3Mm5lzx8mQRAanf4vTLDTmM49asUT7xVU=;
        fh=4Mow4x9r+R/1Ui4ItEnRfzQ1F3wGToRo+EDqKwHR28A=;
        b=By8hWqchiz6yiYzdLvXVOs3wPsJtALrWR/gOrOjJOXNmodkelK9qO35sFt95hF0Ta6
         oZxiRwpa7/IApT/8APOrYiUftOIqr3fraAT9tIBLYg0lidd+lnlc6cGa3uhf+hoH31Sv
         D3TLpmffmfyH8Ts66T/vIyQOc91qXUDMVKhXZyErx30XVC8GVIfeLZ7kCDGjOUfofxXi
         I+x292H0kcCJYhiif1V5Ttpa1xhtz367QaUGN2hNmEOis7oksp6PCJw+bzNn9d0c34Cq
         EPvVxZMoAgb5s4prxnRQYciaWAZPCInnuQkG88eXjk9ClzAJvZuuCeJgTPWvo4a4NryM
         HItQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795708220; x=1796313020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gIwZcK4QOl3Mm5lzx8mQRAanf4vTLDTmM49asUT7xVU=;
        b=TYr0bRvan2D5sbZOUEVtFhHcqoQVLGMhef0bhOGsS8bQa6JhXTDXgQ+USn5ORgY0vO
         crndiv1fWxVUyNGnP6zWvpfQ7Nu+B+K9kxwoQwBoOqm3fYfP/oVVeFEZJ/vcwgqQZ9c2
         CpYFtUXBXodJ5jrWDOzKbapp3yEXVpoIHu4jXFuw9bTYXF+CZLesGbbd9Lb93dIK9t2j
         BATouYVChdiiVy4nY3Lwrl2Pg1VgCy8V+z3LbVtyi3xmW9dbJaf7eq3bRLGW2WVQFg2R
         2x8j/aKMrSP8fOjR1l1bX30xymdNJQ2h9mJqrAoeXOwP8dJWw+ZmO+X8j6MvjBErb2do
         Lf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708220; x=1796313020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gIwZcK4QOl3Mm5lzx8mQRAanf4vTLDTmM49asUT7xVU=;
        b=V+EscsiTJLwbaVh0Smbkfqu1/pTfBFWYOtJohEdQOZ08ufFDcSCTi/R4XGHtq1N578
         dBgSCPhmgrOT7WXzxeMfwDRiLgPtGvUKd13PKqXz2X8+2dULlye9GHsxVltdK9/e5LOh
         AKVum4y0yZBsg70hnT0FHIN0nV22jOHr9ASEUeBK+naKLVZte+AILDK233hl5L5V3BZr
         xitaKVmoGKEH3qwAX6muvx0stx6qvpCY2EMB9enquG7ljMO7i9gtAerTk70rXR3H4JFj
         RRlQeD5pbbtcML6VT6mWqFpOYmNYWaC4Jnv5kOj6uLPQYhssZX1BhQEnNS/OkaT0F1bK
         Ydkw==
X-Forwarded-Encrypted: i=1; AL+hErH5WGgCO4nKxu/yBPhLpY3Kn6coG2dXWvjTW3zSyYSOPQhzceOaYp+JE4x/BpKixIerFXV/dnOLhEF2XNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a8D5ewm6MVmu/D47Un0+jW6ooVmmmZYIJumwP4Ny1nhTKhvBl
	gKXHHdb1il3tq4W7tRM9oiNckvaq5ubHjvRhM6d76kNiI51SYtK4oCtM0Dffbr4ru4aDpkZSZsM
	ssFb0KGX0ux1XRSRmwQ5Oo3dCBOT6F+6ZC0tLfVIKPL7HLYLMSpiQewUEbTA0C5RC8WHmdv2+jl
	u7VK0lCg0UoJApXLk9eJJdCYk22IVw4TuAswXaMAN31Q==
X-Gm-Gg: AZFdTZevrTr7ScItJFPJwLafWGlhVkUHLuwSK7yaj8DtiO77L7vZyhEAMnMFXRGaNRH
	elUQXLZBcLmvvQLCuJHkN499NXQO0RsvrqrqtgIlZXnFIrlTQROX3Qntg97G982GgYbLtTONgDs
	+dtbWZ+/vmBaXyQfMQg8IQ8vn9/m8cMCuvP9tTga21LQ0BBcajNxqv7l2QxA==
X-Received: by 2002:a17:903:198d:b0:2f0:39c6:8ee5 with SMTP id d9443c01a7336-2f03f27787fmr233290455ad.52.1795708219865;
        Thu, 26 Nov 2026 07:50:19 -0800 (PST)
X-Received: by 2002:a17:903:198d:b0:2f0:39c6:8ee5 with SMTP id
 d9443c01a7336-2f03f27787fmr233290095ad.52.1795708219369; Thu, 26 Nov 2026
 07:50:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1789975099-157594-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1789975099-157594-1-git-send-email-shawn.lin@rock-chips.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:50:07 +0100
X-Gm-Features: Aa3M54r82nwhTksPYmbjufapjUhnrkNXbvAYflMCCiHkeElDYkLBJ88_lHxNLsg
Message-ID: <CAPx+jO8UC-6be9-24eXgWdrFnm047niARcNR2CaOjm0jP_CEHQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add SDIO userspace passthrough support
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: o-alFSWRXV63pQHJcJXHI3CQb0B3V6Ns
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MSBTYWx0ZWRfX7e33mj2a3JXx
 A4KCMY4nskcqvbEEVYSXA6Q0G0DV2wvgqsYb7m8iZFAQDzgYSz+Xi2ak9lHoRSltAbiHP5DelGi
 ZbZ6D38E4jb11FTs78Mp7zLbWH0jJi8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MSBTYWx0ZWRfX9LwSctwOgIJz
 es1APyBqzu3hb7NxkYv3V4TGlwHFHPBlxJE4j/akr0VlDFdfE8Tu3GcmMc2JRhs1M2mj77pekC4
 96TvyyQH4cQWiBxrGTtNDzkUS6tmupEZ9mQvDDHQrqRtJ8mLN5Y+itS/yjTnwqSUytuz1Ls7tCY
 f7oSQL332usSpQG5PbdCGQ5yYRIuJEjYmTQGA6nmoLwyBgivWvuPqnltmkhdVm1PFrf46Kr4G5x
 Uy/FOTVLuiS5iA5L/gl5oDBJrYz+8nhG49EdhgiS9J6M7WWnjBV2lIt56N7g05Vfg6JUzR6v6s0
 MDPfVtzcRWYKtbyPnonshchi9FaffcX64zm6dt2LTD3IWHaGfBu/AtaXsVdneo/ThBcGn4c2BYO
 cEExsHPzBK/nd6awp24hWzm53nEWbV2MuCb1qnuwJu09aArZgK5kPdARqowozvCcdH7GMKE0ICw
 WLnkyiVDeRbZUzfkBwg==
X-Proofpoint-ORIG-GUID: o-alFSWRXV63pQHJcJXHI3CQb0B3V6Ns
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b08553c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=s8YR1HE3AAAA:8 a=4V_M4x3YfzuPUH-Wr70A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260061

On Mon, Sep 21, 2026 at 9:18=E2=80=AFAM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
>
>
> SDIO cards are normally driven by function drivers (brcmfmac,
> mwifiex, rtw88_8723bs, ...), but bring-up, debugging and factory
> test frequently need to poke the SDIO register space directly:
> CCCR/FBR in function 0, or vendor registers before any function
> driver is bound, and some deployments, notably lightweight IoT
> boards, want to handle the SDIO function entirely from userspace.
> Today the only way is to write a tiny kernel driver per device.

My sincere apologies for the huge delay in reviewing this.

I am simply not convinced that it's a good idea to allow SDIO function
drivers to be implemented in user space. My concern doesn't only cover
various new use cases this would introduce, but also about bringing
another ABI to the MMC/SD/SDIO subsystem. And to me, it looks like for
no good reason.

However, in regards to debugging, bringup and similar, yes, we may
have some pieces missing. To address these problems, I would rather
suggest that we look for in-kernel solutions and if it turns out that
we need some new SDIO helpers, I am certainly open to discuss them.

>
> So this series adds raw userspace access to the SDIO register
> space as well a small reference client. Meanwhile, adding a new
> documentation about how to write a proper SDIO function driver,
> because I have recently been working on SDIO function drivers
> and kept referring to the existing drivers for guidance. It turns
> out that the knowledge is scattered and there is no unified document
> describing how an SDIO function driver is supposed to be written,
> despite the MMC core having clear expectations about how the APIs
> are used.
>
> In particular, the interrupt model has many pitfalls:
> sdio_claim_irq()/sdio_release_irq() must be called with the host
> claimed, the handler runs with the host already claimed and must
> not sleep or claim the bus itself, and sdio_release_irq() must be
> called from ->remove() because it is the last chance before the
> core removes the function devices from mmc_remove_host(). Recent
> fixes around the SDIO IRQ work and host removal and the discussions
> on the mailing list showed how easily these contracts get broken.
>
> Also worth documenting is the buffer requirement of the CMD53 based
> helpers: the core builds a scatterlist directly from the caller's
> buffer and the host driver maps it for DMA, so vmalloc() or stack
> allocated buffers are not acceptable, while the CMD52 byte accessors
> are safe with stack buffers.

Documentation for SDIO functional drivers would be really great to
have! Thank you for looking into this!

>
> Changes-in-v2:
> - drop RFC as I don't include mmc-utils to be sdio usersapce tool
> - add sdio doc
>
> Shawn Lin (3):
>   mmc: core: Add SDIO userspace passthrough character device
>   tools/sdio: add sdio-raw userspace client
>   docs: mmc: add introduction to writing SDIO function drivers
>
>  Documentation/driver-api/mmc/index.rst             |   1 +
>  .../driver-api/mmc/sdio-function-drivers.rst       | 211 ++++++
>  MAINTAINERS                                        |   2 +
>  drivers/mmc/Kconfig                                |  11 +
>  drivers/mmc/core/Makefile                          |   1 +
>  drivers/mmc/core/sdio_bus.c                        |  12 +-
>  drivers/mmc/core/sdio_cdev.c                       | 189 ++++++
>  drivers/mmc/core/sdio_cdev.h                       |  21 +
>  include/linux/mmc/sdio_func.h                      |   4 +
>  include/uapi/linux/mmc/sdio_ioctl.h                |  48 ++
>  tools/Makefile                                     |  14 +-
>  tools/sdio/Build                                   |   1 +
>  tools/sdio/Makefile                                |  66 ++
>  tools/sdio/gen-sdio-ids.sh                         |  59 ++
>  tools/sdio/sdio-raw.c                              | 714 +++++++++++++++=
++++++
>  15 files changed, 1346 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/driver-api/mmc/sdio-function-drivers.rs=
t
>  create mode 100644 drivers/mmc/core/sdio_cdev.c
>  create mode 100644 drivers/mmc/core/sdio_cdev.h
>  create mode 100644 include/uapi/linux/mmc/sdio_ioctl.h
>  create mode 100644 tools/sdio/Build
>  create mode 100644 tools/sdio/Makefile
>  create mode 100644 tools/sdio/gen-sdio-ids.sh
>  create mode 100644 tools/sdio/sdio-raw.c
>
> --
> 2.7.4
>

Kind regards
Uffe
