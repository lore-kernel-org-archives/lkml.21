Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795597986;
	b=qcKjjo9tbcg4zJLSVlHZmUZfrACQtKaLJM3jiYshiZCWXAPvXHC+rWPzb2BstEAMU+4W
	 d051jMnEBqsxkgtE4zfXEkVbY58le1CPlkbgWTXgYnNP/yQ4cRFXflHeGLbmPHAa8TJs2
	 Njxhj6D632hPQNHDblhKU3iVuKsdZE+BAm9IDF9k6sa6+54HtXGX6yNeUSEby+NH3volg
	 9sBnaPdEQZqDFH+BO0iejnieqgGmz8u7UIzaxarUCcluWX0db52gjFNgb520CyES2Mo8V
	 q9Rb0WAPthiMx4+Ookb3tSUmquH7yk63uob2gdCTEJzuwkLhRE03ufelywIxLndxfCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597986;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=;
	b=0tApBrQD97x8v5fubBwO/bq3d8Y/GE0u4n7LXgr49GvhKEP8tHG0gaAff6P8vAY3vkBO
	 cWo+bL2odctpXJZLE032FGdwj/tAXpOa5Dr3NYqkvzIA9Yk0EIGLLJqivU45INLhX2pPS
	 4Mv2JBey3YvP9Wgw6GuIVLfxh8AjpJScbWAy2+ljE+hDwlScbCPVbGoQBC19CpJDkcpuT
	 44ZItm+NTYwM6ZvqVZcZNpBFjs2IeJStft0Mx5WfI75NoXb3jAzjHucmsQGxsEf3peudk
	 CQ9kWYbBM5n2+YStW9ZP2bPKa2vrobILZgsLZDd9ewkD3Oy3x1c9lgne5KKS784I6fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6FJj4hR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpP4qcPg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1392606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1392606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6FJj4hR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpP4qcPg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9Cfqw4048424
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=; b=k6FJj4hRIQKFzeM/
	fKmiZZWGWiscElpCsMLxIigg6aDi/8JLNSuz4xdgrLmz8OJd9VoOA53MgPpy+JQN
	EnOGDDydlLg0DdJK8/O7yqrRhh5qYVz+65evyV/6t9Z5p8Ai5M35Acr4cb3yxeN9
	SFmhQ0oVeW7syHITsfEvvzI34IZ/nE41xeaUWKtBqdvJe+LVR1SBrf2sE9nRe3ZC
	ijaT29iuz4leQmy1+TCV0vyb7nInLzDhxuzO5ZhFN3lBSlH7NrLwm9G75RxCT4QW
	qhrgpi1i6vAx5Ghk6z4VLyMM2T9vwHO6VHSNnMRDUqrmikiiqbDwB1Q5Mj3LX50u
	O2E2AA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhr058-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:13:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-946038e22f5so146363785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795597984; cv=none;
        d=google.com; s=arc-20260327;
        b=XleMJy8hgtdyaHTkTUw7fk0NzYAka5+pkOov5Yfba41jMZ4r1v3Qu6SV0wtddTLSh2
         Le6ze3Zx+QnCW53qmuRTkrFS9NWvBwJSSu/3j+ogcuB6ZIrptCegt7C1+JaQd2FOl3Ed
         P4QpK79Fsp5qB9OHTOnaPO4bVtFi/uku24oI6/gIgEW+2dBSRcxBPsPzZi7sJaj+MHXm
         P1uiTEatQRZ+1YEp9p2n7XGzxIgg4V2+Mjdu/Q3jErgN4G4qwAPX17DNQgAhX41SLYQr
         /gB6jYWXLiLGCAj9Cr1dJhQRqF/KKZXXSTUPsRya+/OquW2iJcg0FkTHF2EZ+6UrWirH
         PHAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=;
        fh=rZM3YIgAXF/Oi2S5P2aH/12AL5se7DTRq5z375LKGB8=;
        b=dPM6Wk1wNsqcGa1B9uqFdfVLXvZVsAdpvOaLwQkmG6D+L2vtMgxW42Bo7mMzL+EUD8
         Zlt3KHKv8v2/mVzv9eWbOXG2iVjoWYWS46XdbADdY25OdfSE2MVq5PbWVyy0xmU8MdG+
         934eGqy/dK6B0leEUgIWW61sh6rbSCD2+KhDt6hQqQPuu1MYTlf61o6aHFsxz8iQ8do7
         YpFfiQp3wxwMDoprogiQY5NmZDHY9mEg3yQyAw04BoEXw4YwfBhlNd2zfTaj9K8yreAS
         gaicDAt6hhLHkWgVXySHUGwXWnW6XhAKKQC3nDy0e1L5KxVAsmdi1Ar+CM+T3+XPyb6f
         T5rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795597984; x=1796202784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=;
        b=jpP4qcPgImboW6uKxuFCyL1nrsr7Bl/vRuXusoNQZUWPo/+6STtX0gsxHsIsOagrIr
         NXjdEqt90nvYoFcSeRu/ke3MX1HgBh1g6atAvSDHBFGX6DfQ7s+Aiu41ESdZZWI+QXc7
         S7ntQFbCFPSBqxH5wOhnYMS6Qofssa72e9106D29qPXeJbVJB67AsNXQymRpIq8/a6Yu
         NJx639ntPGvtPuPKOjeS4zcmE0T72Lg0RoN14sI3cYqmZdf1ZYVzlgrDNalX2Z5Vxv1o
         Zvha7tKmideUgjkXa7wjMA/7elA7YGy/2vLnzVQhV3BWd7uEaRFyXWAqAQx32js8M7M4
         GhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597984; x=1796202784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3n2oncWkqrZq2ixbMH3AwjF/l3bMyJLvRcKcfRec5k8=;
        b=tFnE/jRiciUjNSsGKJmqo3APQ2uS6RkSx+lx1FmeyAamSBCJb6t0aw62ZKE+BLzhsD
         F3KP5VnnnpZTdXQNK8/A/JH1Uvo50OUgriW25KkUX1VEh/Wgp7/aBOyIEP9TLqWNNcz3
         JflWsmRqC7TPdlq1Ip7A7LilkwTKLfN6QmazN7zHGnNC5MWM5t3AaJL6tkaE38lby7T9
         Vp2JByNpIaJ22Qw2JQX3iGQ1l5TW+bc+B5NfWrXPowNBpWjXsE5oHFHYa+z8V7U8/4U/
         v+zm0jx+RzUxVuMeOv3lYr2dVsGpimrI6eQuLdLseMgIiKaSN6Q5eIiL/7lzC+1iaOmQ
         AIKQ==
X-Forwarded-Encrypted: i=1; AL+hErHPT8NrhH4Sa2Kl3hlAK08CsokYN+wbVX1hd7KutLEi3lGjYrorc4zt3PmSxMwa/DV2Ieqo9/1c6yLw99g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CyaABUMPaQI7I2RC4Z8CXLvcBbt19zN5HU1SWd3B7QxhQJgUb
	BlDL5tqAU1KQSUmKSsKDDOUYVZMPxs16oVt9cN5EgE/aLhV5ZibpXR4nwS+FI2e5KwG4TqlKM11
	up6AR5fyRtwNE7qCaZUzhsJnRldR/i3fFrmnC6I8gNMHqo9Ak1mhe4ZAFlBEVp1Y+Yrp8p9JeYK
	X0QR6mbmEgnMvFk3tWNc8RHN1bI4Gr0UTu17XGfF2Kvw==
X-Gm-Gg: AZFdTZfpC8AECih0tNiq85WMQHzrYx3oTZ/FB++nhORckzusSZX3+nRp7J5WYsalbDa
	bkDVgwWoeeo07vAY7sJFG94Hb64+YkddXC3l97Ucr+FO+SNa46usGzc1bMtVtXGdo0ttpkQpN02
	VmCxpWszjpU553Q8AbGHk2kYgGL7Okhk1/XOMIRgpJydy3mYhPc6fUQS1j3U6tc5JLDbJwptFiu
	akVpNisUyVGRnhLf/T6N8DBuXMEH4SYUc6XBUZMYB7ZOxjwY2FGVLlY2gEu0Xc4eJTWzU0CXHk=
X-Received: by 2002:a05:620a:2709:b0:945:f0ca:436a with SMTP id af79cd13be357-949ba826ddfmr2815621685a.2.1795597984020;
        Wed, 25 Nov 2026 01:13:04 -0800 (PST)
X-Received: by 2002:a05:620a:2709:b0:945:f0ca:436a with SMTP id
 af79cd13be357-949ba826ddfmr2815619185a.2.1795597983550; Wed, 25 Nov 2026
 01:13:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com> <0c0b3af6-4fea-422a-a7dc-76e36a3f5db4@oss.qualcomm.com>
In-Reply-To: <0c0b3af6-4fea-422a-a7dc-76e36a3f5db4@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:12:52 +0100
X-Gm-Features: Aa3M54o5HS1ZSN7gcyaucoZUOYIdk3t5UM_zccpRk9u6cy4s65EXPVC2xdjtFqw
Message-ID: <CAFEp6-0XqOVFjQU0-P8oiDGG6amW5Akj7TVBf=P_S7Hz80EYaw@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06a6a0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=6AgpfqnHUIBFi_xuLsEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: GAiUWgsf4Mfbq8hHzQScphXr0QSLqqVm
X-Proofpoint-ORIG-GUID: GAiUWgsf4Mfbq8hHzQScphXr0QSLqqVm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX0QOEdFRZRlr9
 x1pE1PrSdi40AunVNlngqvQWG5E4FaTuMl4AeD6Zu+QIBNV5KmTxLeA94CsL61q6y8fdC25G5ay
 ZYoLYSKGkfI776+pg/Kv3tXxrmXc9c0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfXz4QGaXgrqQ6+
 /UKxX7q2/6Grb/2+N2+ilArofQzO20DqfP46jRkMwllymjpyevsX9EOl+AsMfXRBa4LFELca1r7
 Qd30AcLpKSGuFbs2crzm6QxNO2uX7cAHaMKvQ9rMlolhRi5fzBYCHmCwQ0M6T3fXXcjBPoqYKh3
 9SeAgqpoyiMwc/MzrgviMG2rVavVIq483/al1H4Et9RMb+s+8XkIydae6R6wUpvxx1nwvfBDyCU
 7mniSEv8KOeTOd7VIk8aWqqI7XTr/I0aTCFXNeX9Z1Dt2S+8+LT5cXMtrgkH872DCcNFLgg8VTs
 XIUd8rj2YuZy5SzxVqdHPzij51aYSXm+7wQcfU3IohJgRed3uy8TeaumDKIDemmNSwEgeskpR86
 CTjXU8JEkyWJYnnR4+awNuO1K9ROmfJwPVlkjiGUO+aCEDWAc5nGvevYUOwcccLuwRuQkbJLhEt
 kjYKVVW6o51j1wHQXgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036

On Wed, Nov 25, 2026 at 10:01=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Loic,
>
> On 11/23/2026 7:16 PM, Loic Poulain wrote:
> > The CAMSS CSID latches the ARM architected counter on every start of
> > frame. This series exposes that time to userspace, both through the
> > V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
> >
> > Until now both were taken when the interrupt was handled, or worse, whe=
n
> > the frame had finished being written out to memory, which is about a
> > frame period late. The hardware value is free of interrupt latency and
> > is directly comparable with CLOCK_MONOTONIC, so it can be correlated
> > with other timestamped data such as IMU samples.
>
>
> Directly comparable with CLOCK_MONOTONIC, does this means
> that csid timestamp is in monotonic time domain?
> In camss video the flag V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC so either we ne=
ed
> to provide timestamp in that domain or convert in the driver.

Both the CSI timestamp counter and the kernel timekeeping code are
driven by the architectural timer, so they share the same timer
source. So, if we know the difference between the current
architectural timer tick value (snap.cycles) and the captured SOF
timer tick value, we can derive the SOF timestamp by applying the same
delta to the current CLOCK_MONOTONIC time value.

>
> ~Gjorgji
>
> >
> > Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
> > having the core take it. Patch 2 passes the SOF time down to the common
> > CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
> > Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
> > uses the same time to stamp the captured buffers.
> >
> > Patches 4 and 5 are picked from the timestamp support Bryan shared
> > earlier, with patch 5 adapted to use the conversion helper added in
> > patch 2 rather than its own.
> >
> > Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> > Bryan O'Donoghue (2):
> >       media: camss: Define timestamp registers for csid-gen2
> >       media: camss: csid-gen2: Report the hardware SOF timestamp
> >
> > Loic Poulain (4):
> >       media: v4l2-event: Allow drivers to provide the event timestamp
> >       media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
> >       media: qcom: camss: csid-340: Report the hardware SOF timestamp
> >       media: qcom: camss: Timestamp buffers at start of frame
> >
> >  drivers/media/platform/qcom/camss/camss-csid-340.c | 37 ++++++++--
> >  drivers/media/platform/qcom/camss/camss-csid-680.c |  2 +-
> >  .../media/platform/qcom/camss/camss-csid-gen2.c    | 32 ++++++++-
> >  .../media/platform/qcom/camss/camss-csid-gen3.c    |  2 +-
> >  drivers/media/platform/qcom/camss/camss-csid.c     | 81 ++++++++++++++=
+++++++-
> >  drivers/media/platform/qcom/camss/camss-csid.h     | 25 ++++++-
> >  drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  7 +-
> >  drivers/media/platform/qcom/camss/camss-vfe.c      |  8 ++-
> >  drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
> >  drivers/media/v4l2-core/v4l2-event.c               | 20 +++++-
> >  include/media/v4l2-event.h                         |  9 ++-
> >  11 files changed, 205 insertions(+), 19 deletions(-)
> > ---
> > base-commit: 2ad58ca589da80990b7afbcff018777851577f89
> > change-id: 20261123-camss-hw-ts-e0297adb69d9
> >
> > Best regards,
>
