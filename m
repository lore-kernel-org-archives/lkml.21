Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795683413;
	b=Abquo9NPe/n3XW9lbmBuO1Np+VXMtr9/kkY5jjA/q/FxxDB7LJ0E23w3SMep2fq1k/TD
	 PajEr/KxD1KSVlU1VQiRHzV8U2t93gMZjTQ5oUyW0WJ1sdyO6Xu/5L8+DgdV9/cuvj29o
	 4FMslSI+5JkOhoRKqib0EiIzTRk4J3eBYOo/JCBAkog6DO4COiXmRdDotdDPT7UM59vFm
	 gvIOOMg5JC5WU+cNy1yEOi95mBqqJadsF5eI4GAynz1ZVCMJrLbkdtnkO2qasCe1+IhW7
	 c4yHpu6r3c4w4grAOuEG8a3Y+4+qYXQwNdm2ud29XVvw55g5Sc+J+RwfCay7ZbD5ICw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683413;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GdAeT2uzPb1MI1Dd2EoVov680FDkwR732zQnKIcOH7o=;
	b=iumhpOzmgiH6Y21PjzcTFarXMkaRI76bNtn31lh6oDUibQBC2bScdEkXlfKzvZBUXx3F
	 gqzkW+PHMh2Ak5ai+7kgKYRp4YSRYsPNDk6U36ktTameNJ8DmCAQPczKOSYeppz5FZ/mh
	 48U2o8DZwlpEb3bCVxyUINMPi7InQNJCn8jlumottf0jplWYOpgoffOElBhYpXf9vzDCD
	 sUSG9V9KG3tskTZXDF+IH5bOoGDaiJ/eEG90knq8yQsSTde/z7DXqE2I1dJTQPHYKOL4Z
	 nVHTDyPtctRCoZkzmgythzTjCbb1EGlyZqqI34vhkV62y4oXU3XHXuWwE1hZFb0X9tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmySYio4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FS5KsC4u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D7D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92D7D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmySYio4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FS5KsC4u
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8NdVt2860353
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GdAeT2uzPb1MI1Dd2EoVov68
	0FDkwR732zQnKIcOH7o=; b=BmySYio4wd8cI0/sLlw0Wxmdt+mHmtNTeoFQ2VIV
	w+1dHvTgG7ic/V1JDSUHPkrXyovd3mFFbpHuh0Sl3/vufoeqZ0wGEsQ+NhBoa4K9
	9AyhgLwPws32CQjVixp9F/RUqEokZR5yH9mo35c5weqRDA+ZwHndNuGXHF5tRbV9
	VCMqdkwiLp5o9MbTfd/nckN17UqNIp8u+kXpXDvsOfBTrWlLY0BdA0ietklKYdDu
	rG1t/Mchoh5lAzmx99TD09kmcR/NPj/GCP6oU3Bc0vMmZ6MO/dc/iYmT38OMlNed
	2j6JweVSWDLxDL8jbDWxHEpLe1jPgSKqCB44/jlwMfUl4w==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g84pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:56:51 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67e05bd44faso6594362d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:56:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795683411; cv=none;
        d=google.com; s=arc-20260327;
        b=Mxkh/NE9r3eDIw4rFtvsY5eRBSDhnnOJJxls3sFR87MuJKcrQDKIcLCVcPVsIa51Dl
         bll+/GUNGIW4b+7ksI5FpNuBiYUSKhv61BE+ydG6T5rG1qEum0bjjHqGT6Vpu6pwlWUs
         PMSt66Wc6X/3LAeQ7g/VPxvdzLI87khZGsCzT/Wr2RfnFmjmY+5g9dPrS+7gCGCV/9IS
         ESDVpotEgRNRwHE8mKNLKA+TJJ7kBe3BVVQNr6BhXvje01juPD778ww2avyGsqcw49I9
         DZ4Ix3prjs5vM63umlLwBaHhJwt3YgXaBnOmOE9U2Y0J0FBo6Bc6sa75pSSAChZJhv4H
         0yzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GdAeT2uzPb1MI1Dd2EoVov680FDkwR732zQnKIcOH7o=;
        fh=DcmEPAymM91jx3BUolVr2l4BWcvSQs/oh57STZA5JVI=;
        b=odmFhCdQhnwja3E1s2XKbSGEgAg6Nm4AGLWW8ZaCn78rg94tTrVUoYoiEzmB7vRf9O
         FWGPbT8kvO894/iyEzL3R8cty9ddt4Nywh+K6hVirCbJY41wrBihZxwVWzoB81xL43o5
         YXGyrk0fpl6fqIEQzfzFihnTtNIyshiTKwcribtfuiAz7gKi2gj1xYX8YGZOM5dBd+Ob
         XIcoK/L1BUjTdMhkaN0qRz2hblmNSGCIrVavkjqktcspQtxJZh1z77+57eYXeQlV3uMf
         3kxZkUw36eFRz2QYOT1Dq/bhdkrzPsEx6uGE8IPOyUqWAsk/4sAldJx+Kk/4lcyd632M
         TsAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795683411; x=1796288211; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdAeT2uzPb1MI1Dd2EoVov680FDkwR732zQnKIcOH7o=;
        b=FS5KsC4uaNxsB8z23fHgO1q+k6nVhRWWW7JnlrhmCFXyWuK1JWM85JDnZvZ+gcyrOH
         B0zJXzEUest+MSdKZCJqOLh+tuzIC2YSUWKBK/slWdolHNDalZTaygIeZijlkYxHv3YD
         PS8ni/GVnUTv/WxEDP14AKqyqdYUBydGXTvKD/7Y7GzlUGcgLdZ98vUtLSrzQFihgKJM
         HSOwYfKndhX3uvL2Kl5ELjQyL6++gNThILvAa7SL6IAbVfZ6ZS7ST88G3is/Pnx8EJ2A
         AjwaLZdiAgt2mh7kgAEub5o37OzEDFJ5ZxKdDJKIkPphZTNiu/d6LpAFXLXjHRX9ByJJ
         cEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683411; x=1796288211;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GdAeT2uzPb1MI1Dd2EoVov680FDkwR732zQnKIcOH7o=;
        b=tbfEISzN4AnaGkRYwybnMV4TnE1C4eROnXJSEAL1e7NvPe6szyEni3p8rHGADcFnnN
         Z5zBYBNmoMHPs8hhATWQuzVaKSRulF1jXC9+OLsrsi9WNRGA8TW8I0MM27mL3vuMH5Ai
         UBcSKt+wMrMl78fbIM3d+bs58fqzjkIWHd2mFAL+B/gNZT4zwrrtxJe/PWxJ6ZYAFNwt
         dzZzHPXpXHJJX+2P2itUkBSCfqAYtWHP2xCCwD5jLINOyLJoIMoJ+Ykkk2Dmj+m0sqHy
         o3+nJ9SM4ay/4sX9OXYimksiHzF/00OZcmMl9b8Hg3rsDfTsf1s1OAQkGo7xiX+9NbE+
         Sl0w==
X-Forwarded-Encrypted: i=1; AL+hErHl+1KHZcUDnwt1Y8JmqSxyJiVuvr6yRYDeITglLegbOPyotosQ5TB3uSX77JUzoIQ2aAgXC5sz17qCQAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MRBG59Ucf01ereR8qotTYL5hSJ4Qw3QPQxIRD1IuObmomofnj
	S7485KvxObX+TAI8qhdYqg/sosFHnrD6AGFj2GhTW2TdhkcA+E3wJ7oErU5Rzu/j6DcE7fUBLrl
	JfhOl0v4S+xuHaURKyjvlSXL5mYlc2l8gWhoPGY1+4wqVMLFaJLzAv/mqqZS6QE5NLRAOFaPnGs
	NA56gpu1Qj9/s2GZ/nU05u58cRDjkJsXyjMaz2phM9Xw==
X-Gm-Gg: AZFdTZf2Jph9HUp7mErHt8DNmG/VJMzUG8XdKi5QtFa9kAyAVTmERP9Gjz8Kbizh2VP
	/TZB0lBlL2mTBsFwkzmgqoslIAsZfbDMvSWh1HVSFhkKz1uMXvAA1XTjnKwqWpYUS9ybhW0B2tL
	WSB2YoFWixI3zFMBbVX2wSwxKxVRB2HYpu4NDPLs7SOQNEANewUhXXlCaPwtvfv0WUfwC/OdHxM
	R7AMJ6wRK88RgPR4g==
X-Received: by 2002:a05:690e:4384:b0:67c:2b34:31a3 with SMTP id 956f58d0204a3-67df4499656mr4524834d50.104.1795683410466;
        Thu, 26 Nov 2026 00:56:50 -0800 (PST)
X-Received: by 2002:a05:690e:4384:b0:67c:2b34:31a3 with SMTP id
 956f58d0204a3-67df4499656mr4524823d50.104.1795683409171; Thu, 26 Nov 2026
 00:56:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-v1-1-81f1a4c9c73a@oss.qualcomm.com>
 <773e7548-4f0f-442b-a737-c288b8cb582a@oss.qualcomm.com>
In-Reply-To: <773e7548-4f0f-442b-a737-c288b8cb582a@oss.qualcomm.com>
From: Chris Obbard <chris.obbard@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 08:56:38 +0000
X-Gm-Features: Aa3M54qz04OSpkfl1fvVhCmYpAObBtZsQ0kjRELJJmyBWonCoo2wb2JsmKgjWbE
Message-ID: <CAPnEM6aF98vbebMhCU6akpsoVzjS0pH5xcurmEsekWw3RF1vMw@mail.gmail.com>
Subject: Re: [PATCH] soundwire: qcom: Fix off-by-one error in port exhaustion check
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: ECek4tOoqIHw6crSr8sQsDZZ2S8Io7pk
X-Proofpoint-GUID: ECek4tOoqIHw6crSr8sQsDZZ2S8Io7pk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNCBTYWx0ZWRfX9pfqlGzHjRN1
 fQ0O3HNbSAI+BUoiwdRzhdHsiNsPW/+Pe9OObv7yV4Un8TxeGtNguAe8AHJZFr8P4A5qh15iKuw
 LG/IN+S302VVDmic0LYa/g3FIHF95fRe0NDzkgPbc1R/h954/06Gsz00pRRKopiq8QEPnOw8bJK
 n6qnzFi2+6lMxayaJHN0Go/PWsI2HVG2vAJX68bcSSw6JxmgaQai7oQIzqXgXi9+/EpPZjqWLEI
 5wE7XEPhn9OSLyL/PGUusqnfxywJ3GG1c6SmSZYfpqrdAGAiZ6WRD8wyxFDF9jxjwDstA6CbSxn
 HRbJ2aHzZ64ZYxDxC+Vz2TxijzOPFQ0P7vboM1uGNviBtrdo28c4CHuDiazyjct1MK2CJSWibrO
 xJ+qIDFa09p+YDK6ysUuopLjXBgAgalrf/U+TAafUkEt1sBLXwxJqcTeYUbCRhLeiwYR9cD9+zQ
 +BspTpcAeqfdUrecFMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNCBTYWx0ZWRfX6gveMlN0Jsih
 g/5FYDWE4rgj7TsqyPBCuEzmymIwbGA0NeD+jkmb3uGe5uJFSgCWpP5vpWTZ1d/9C/Hy9QKPXoP
 yebMG44DAw1WDqA+YL2/aVb6jyYiDzQ=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b07f453 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=rLSoK4kSsnz7ToN-XvQA:9
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260034

Hey Srini,

Thanks for the review! I got some time to send a v2; it should be in
your inbox soon.

On Mon, 19 Oct 2026 at 09:10, Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
> On 10/12/26 11:17 AM, Christopher Obbard wrote:
> > Qualcomm SoundWire master ports are indexed from 1, with bit 0 of
> > port_mask reserved. Valid port numbers therefore range from 1 to
> > maxport.
> >
> > Commit 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in
> > stream_alloc_ports") changed the port exhaustion check from
> > pn > maxport to pn >= maxport which rejects the last valid port.
> >
> > On RB3gen2 (QCS6490), two WSA883x speaker amplifiers are connected
> > to swr2, which has 8 ports. Each amplifier uses one port for playback
> > and another for voltage and current sensing. The right amplifier's
> > VISENSE port is mapped to master port 8, which is rejected by the new
> > check.
> >
> > Since all ports in a SoundWire stream are allocated together during
> > hw_params, this causes the stream to fail with:
> >
> >     qcom-soundwire 3250000.soundwire: All ports busy
> >
> > The codec DMA backend then returns -EBUSY, preventing speaker playback.
> > Disabling VISENSE works around the issue but also disables speaker
> > protection.
> This comment is incorrect, we do not have speaker protection enabled on
> any of the devices.

Thanks; I've reworded this in v2. This bug was found while testing
AudioReach userspace on
RB3gen2; Speaker protection isn't (yet!) enabled in upstream, but with
AudioReach userspace PAL mixer
paths enable VISENSE on every speaker stream, so playback fails unless
VISENSE is disabled.

> >
> > The original fix addressed an exhaustion check that could never
> > trigger because find_first_zero_bit() returns maxport when all
> > searched bits are set. Include the reserved bit 0 in the search so
> > exhaustion returns maxport + 1 and restore the pn > maxport check.
> >
> > Fixes: 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in stream_alloc_ports")
> Cc Stable and Reported-by missing

Added Cc Stable. I found the bug when testing the AudioReach stack so
no Reported-by is needed...


> > Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
> > ---
> >  drivers/soundwire/qcom.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> > index 6e0c5fb10efad..b4ce96792fa94 100644
> > --- a/drivers/soundwire/qcom.c
> > +++ b/drivers/soundwire/qcom.c
> > @@ -1348,9 +1348,9 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
> >                               if (m_port)
> >                                       pn = m_port;
> >                               else
> > -                                     pn = find_first_zero_bit(port_mask, maxport);
> > +                                     pn = find_first_zero_bit(port_mask, maxport + 1);
> thanks for adding this case, rb3gen2 should not hit this anyway.

It does with AudioReach userspace, which reads the VISENSE port :-).

> >
> > -                             if (pn >= maxport) {
> > +                             if (pn > maxport) {
> >                                       dev_err(ctrl->dev, "All ports busy\n");
> >                                       return -EBUSY;
> >                               }
> >
>
> Once those are fixed,
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

I didn't add your R-b as I would like a review of v2. Hope that's OK.


Cheers!


Chris
