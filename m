Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795623681;
	b=W7tIHkMmFYA49aOQduXQm00memfFDHFc41sRb2Ya40t2vxaVT9+5MAB1Xa07qnQp3i2Z
	 VjfTBj92qBaFEcKmS24UfReLWIOtB4mqEdJGzOj7jGxPlg8joUWYn9krYLQ3yfCc1PeTL
	 hzk3+3Ywa89fpPmcq0l54M/InAbsvyjK/m9PkKmdI0wVk+hLGYCdSo8LGjrbwDggxdNvw
	 NQLHPCg0orbTSBaUfk/GpAPaZF2wkZ9t3e1eYoZHPNsUfilNR0TMLrXcMOGOg73MSIHE0
	 OwmwPm8rWe3SaYswNvGwn0RZvrHZbO4Ek48/MSJrLJ3ZKbSLoiJ8Wq2VFm38m8OFTCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5BC4g8bU4QMdIwQ76XWMS4NGOXMGnLd0ZfVmZLt4/NU=;
	b=CH1z1Mu3AcqRyiF327eOOHbCeEQLAbwdp/dqzwWriGyugPo/Gxydk7NIbONKDA9pq6D6
	 jf84zDTGGr+fIRGKGQdXqMDtIivPbgTxTzgclNLA2TMtg2OHENIpna/sKzzF67N1kwQv0
	 lg8aMh9JlQrWchFyX1Vdlhb5d698W5frgHVieWbwiramShAEJ2lWEMaGHNcFipOFYiP4p
	 gezHZONPL00sc70aafWCcvqMzKbIcpXyAAgxilmKUkfZrQtmxOwIVXVfAw2767au33EW+
	 6BES9VNiyow51NlVyyLu5vqeA5Yv9MGAt3KCdZ/adPAz/hX1ueIrcp/F8bMBXtHA2gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oO+Ma7DU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GbjySqo7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF51606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF51606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oO+Ma7DU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GbjySqo7
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM3dH047573
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5BC4g8bU4QMdIwQ76XWMS4NGOXMGnLd0ZfVmZLt4/NU=; b=oO+Ma7DU21R4d7Ge
	dIiSMKwZv7hlSmgBP/e3MFihiX1hGf8UrbDjmvcfVMBV9YXgKnGySnWQEu7zNRbU
	oHwjO9zFgAffKI8Rs+OMwWJ59V6GuCt3xK/R6oZOoHJbq18UKb03fG3LXVjII1jt
	mLLg7bHHM9f+ZH97DMthiFKshxNcjIyQAcaLwQQwY7eFkN4hsyUPTuXt8j7J739R
	D5Z0JipbwiTNXbCRtVQLc50tR/oZ3TspNvnQQh+iqFg6QMsmKq3kbHkhxw//wDV/
	YiifrW7A/TVfd4CKbiyhaTalF9LEZaHNzkayQPJfQW9q9//XNjtvu9ml5dmJ3lMS
	s5TOMA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2bs7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:21:19 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b4d1cfe3cdso10040597b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795623679; cv=none;
        d=google.com; s=arc-20260327;
        b=YJEEeFVujLZ44bKu6KTFFp+Vmzf5EbdyttHGzXijjqprPXqF9o1dlN9K9CaFTF2XkL
         +G5Lbx/PUsBb6M4d1SEQdIHscr779WWVF0h+HzyZ7+ZhPB4AqpXdC8HPX6NCekZJrs6s
         1OPd48ZK4o9f71nGvm1KYt6gvQFBkaagEmZyKbrw5LDUoeOMersQSWwdEGIEpP5N+wNj
         ROdcjheOGCPjAaYvn7tjfgspm7FBMkKRXWcEa7Rlfvk6pZZoAsN5/X//n9Z26YMb2WJe
         qMxEL8jz2Blq9VnixhMBQg/zEdxEC6nF++YH0kCJwy6TOQGg4GE2l1Fs1a/HpPsRyrvE
         KfzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5BC4g8bU4QMdIwQ76XWMS4NGOXMGnLd0ZfVmZLt4/NU=;
        fh=J8QEo59oTcPeMgmoWjLqxk9ZhktZ3cRPjr19/4l+UxY=;
        b=QxqakVQ6aj9Ao3PFbGYKEGJBNXvJVxRaVtm4bXokCtUq04H/Brv4eXpC9BvaGmjXwQ
         BRvqiiMLx/kT2+0A1jTQlVwvZGtYBZExWOzBX1p/wpAicc58J4Pz1YQIjmSOKLHZEYON
         pn3CLgfzMrF4bRxEd6l/SYUQ24VcvDt5Df9YCDcYDLNioao4wT6voYKBRLj4h9lIkDR4
         Fe4CWn5hevpdAprQ99k8jM8Pq8yNkE3vE+L+z2nFFQYquwp1nbBjhH0DoVtAgwo2iuBC
         5pA0FSmwwe2/C0DuQo+rmpbiKZbBarvo/xbcqu/toGeDMX6jblYc7B5cIJh6K7by5CK9
         fKfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795623679; x=1796228479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5BC4g8bU4QMdIwQ76XWMS4NGOXMGnLd0ZfVmZLt4/NU=;
        b=GbjySqo7NwhSN04zi01bzWT58ZocWBWcD8RmMOrmnp3dJ1NqWTciFfhLsbq9i86Hl5
         mbgWsIxYdt9BWashmDVGkaR4pyr58G6ZPBu6gvvSD68ZulCWD7UVktVtJtR4C8MDKwL6
         sJaTi93I4TrvE2apZIFUkg812HA7eB7NTeA3FiM896ONFmcxnYBq88kx9UpinbP1lDrq
         brBwvknikgLb5z+BB6xhhEIek2BhBCWQWIcidDbPPuzWPMPkEIonF3KsJDmjl5DTcDgo
         QjYK3eIxVW21QFOMFrHPWntHl1tAFqDdtWxeyQFhGJzzY5QMMCZ7eD34PcnOteVJuNvE
         iO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623679; x=1796228479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5BC4g8bU4QMdIwQ76XWMS4NGOXMGnLd0ZfVmZLt4/NU=;
        b=fVFKs6VM4mr9GhZL9uKvQUrYHlXa4qzeSqzvRMixLD9dPusA+mYjMo4UpKVQ3iYBVt
         w5PNXNG3AXGJKVdqj+eiA6IyYw6SaRitgLdv4wEPGtJeZgTJRWch2Pg/dDD/G3JoQTXZ
         kggdOlzPGfP48Mw7BGJuooMrKbxvShoBnRugjMDhIJJC9qjRt1m55EAaQss2ujeQprDD
         321t16dvi9ORls4RmC6TkAKWTdM8uAn0ktN+Q5G25fQuMtMTTAtr0r9aBCOZXSCJHAJJ
         nSUF6V4ugc/bhoiRN2fcMX4MMBdgL1rOd6Rr6ZovOwcP3xWoRh+uqWWOYUG6tnB92f/9
         ZzZA==
X-Forwarded-Encrypted: i=1; AL+hErGfgmluwEZ8gSK1IM9WvkpRb7SEjmi/eRMTmsE8+NoSGfUuwH3N6rGvxWlrzOsN01AeDztV/EFkbzl/624=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xWnFkCnGPwf/vPutyuv8u4G/f1wVLVzCyqiJwVz5sbBYlHagc
	uJ+m4VLWJm8rnQd0v2yPrRuAo/02jGKU6zdUg5425qCYH9KE9y+ckR2/B8E1NFX7oRqKDTD3G4Q
	2KAxNg9HdtCEMVmpXNJWg8CtkjKBdG2xsfnJGP1izx2ASReVngYbCHibZa8UfPr3JBdY94siENi
	g9A9O0CDPHwXw4ObeFq0dwpyjzYc5ACn2fCGmpJ0QsKA==
X-Gm-Gg: AZFdTZcBBzEE10N+pbmgP6OYRL+i/0emqIA04sTrbYsXfKS/DwgLphlXvoFvx3H+Urd
	gp4GKB+ULJ2kt0kPAzQoOzyFhzp9MM+lPpqxig/D9rDZvqw57OoUoy/gUht/Gb4K0pzJ11yHNJf
	95LolyxKh3scydfX67pv3Thyy2IwvWX2weea1ott0oWt4XFVnBA5bDoy9o/EkAo1eN8QzW1xgdd
	ieI7All31aQC89EjCUNCk2TT4jfYv/HsrbEHeRYH5sh42kIk1f13Cod2HDRriFEU4Mr8gLyY8g=
X-Received: by 2002:a05:690c:998c:b0:8b4:e2dc:3f2e with SMTP id 00721157ae682-8b5203299cdmr84141607b3.8.1795623678923;
        Wed, 25 Nov 2026 08:21:18 -0800 (PST)
X-Received: by 2002:a05:690c:998c:b0:8b4:e2dc:3f2e with SMTP id
 00721157ae682-8b5203299cdmr84141157b3.8.1795623678309; Wed, 25 Nov 2026
 08:21:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-2-24c955e43d75@oss.qualcomm.com> <8808df3f-e090-4dba-af7d-a51146290d48@oss.qualcomm.com>
 <c5ec6619-7001-4ab4-9035-405dcaa3b739@oss.qualcomm.com> <CAFEp6-2kW9-Cq9kz-T9Rdz5EKL92TW=QzcSPGBPqLNfcLeDYMg@mail.gmail.com>
 <b962afd1-9e66-4780-a7ac-43426bca1a67@oss.qualcomm.com>
In-Reply-To: <b962afd1-9e66-4780-a7ac-43426bca1a67@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:21:06 +0100
X-Gm-Features: Aa3M54rBAS4jvIp0Drk-twS5nFSBdrodHB_5EI8QOAAo0O4CoIBdzNcwTzsYCjs
Message-ID: <CAFEp6-1Sk1rjhqsdm+-GHBESdExWr4vVX5wMcFzEpMt8zQJhsA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] media: qcom: camss: csid: Add an operation to read
 the SOF timestamp
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b070aff cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=n8IlR8rfZ27013JM:21 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=dMq1NhT7bmRrt_ktjGUA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zQFxgT40RQaHDMOhQ3M6nGZd2P-gl62f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2NSBTYWx0ZWRfX02uXMFhre2NS
 d/dg2MVELJQWmBJ7aDgF0wk01rVzKcovjTobqFApMoRqcFQsocq7zVcg68n/0W+u74DxvVP/yOz
 vYMrEFFaXCNK4ouXaBltT9quNIWCZHnYuX+89cW4QcFHxPtah7iMHOLWAVj3rcUNYKYdIhGiOUn
 f0tSrxXWGHzR1ttagyAyztOR7PvNCd1kApqfUHc0QYSqJ3BQgnzLY6PqnyxWhRvpgpWjELRK3TZ
 AHFNN99omFN2fgMWYeYb3YDi+078yEU/XPKEXTYos6dEMeyEQ0A0QzIgy9UZkYMrbDr1KmPr9pa
 W4ni0Cu0LKflL1OM93jlHSuPXM8A9qYdw3EGZBrQFf7MPxF0qr4v2GE4FMsRF01OFZKyGUFpkjn
 cComZuzqiFVYrrh/nCthxlPIrrNGvnsU+bU+A3MPbc17nDANdnBKeljyDGGWztO0uZ0j2Im3zlA
 v+hMgkugl9kdAmPl7gg==
X-Proofpoint-ORIG-GUID: zQFxgT40RQaHDMOhQ3M6nGZd2P-gl62f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2NSBTYWx0ZWRfXxXH8yyhYP8JG
 jpnygAkH9sHO2ZGuhhGHhrAtRu6xovwWl/rdDUdibW2lMvGKGMeMByfX13f5hL4ASs0Vpnyy/e7
 vZQQlUJ0kIddezqjzkcKCs0wT0UsNSc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250065

On Wed, Nov 25, 2026 at 4:01=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
>
>
> On 11/25/2026 3:18 PM, Loic Poulain wrote:
> > On Wed, Nov 25, 2026 at 1:06=E2=80=AFPM Gjorgji Rosikopulos (Consultant=
)
> > <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 11/25/2026 2:04 PM, Gjorgji Rosikopulos (Consultant) wrote:
> >>> Hi Loic,
> >>>
> >>> On 11/25/2026 12:19 PM, Loic Poulain wrote:
> >>>> Modern CSID revisions latch the global timestamp counter at SOF. Tha=
t
> >>>> counter is the ARM architected counter, so correlating it with
> >>>> CLOCK_MONOTONIC through ktime_get_snapshot_id() turns the latched va=
lue
> >>>> into the time the frame actually started, rather than the time the
> >>>> interrupt handler ran.
> >>>>
> >>>> Add a hardware operation returning that counter value and do the
> >>>> correlation in one place, leaving a CSID revision with nothing to do=
 but
> >>>> read its own registers. Revisions not implementing it keep being
> >>>> timestamped at queue time.
> >>>>
> >>>> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/media/platform/qcom/camss/camss-csid.c | 72 +++++++++++++++=
+++++++++++
> >>>>  drivers/media/platform/qcom/camss/camss-csid.h |  9 ++++
> >>>>  2 files changed, 81 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/driver=
s/media/platform/qcom/camss/camss-csid.c
> >>>> index 588122beec854ae5b78de9997b68c7a81d4207e1..0d9b4f7dd768aeaed65d=
01da58b4dd8a3a425cbc 100644
> >>>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> >>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> >>>> @@ -8,14 +8,17 @@
> >>>>   * Copyright (C) 2015-2018 Linaro Ltd.
> >>>>   */
> >>>>  #include <linux/clk.h>
> >>>> +#include <linux/clocksource_ids.h>
> >>>>  #include <linux/completion.h>
> >>>>  #include <linux/interrupt.h>
> >>>>  #include <linux/io.h>
> >>>>  #include <linux/kernel.h>
> >>>> +#include <linux/math64.h>
> >>>>  #include <linux/of.h>
> >>>>  #include <linux/platform_device.h>
> >>>>  #include <linux/pm_runtime.h>
> >>>>  #include <linux/regulator/consumer.h>
> >>>> +#include <linux/timekeeping.h>
> >>>>  #include <media/media-entity.h>
> >>>>  #include <media/mipi-csi2.h>
> >>>>  #include <media/v4l2-device.h>
> >>>> @@ -37,6 +40,16 @@
> >>>>
> >>>>  #define LANE_CFG_BITWIDTH 4
> >>>>
> >>>> +/*
> >>>> + * The CSID latches the global timestamp counter on SOF. That count=
er is
> >>>> + * the ARM architected counter, 56 bit wide and ticking at 19.2 MHz=
.
> >>>> + */
> >>>> +#define CSID_TIMESTAMP_WIDTH        56
> >>>> +#define CSID_TIMESTAMP_MASK GENMASK_ULL(CSID_TIMESTAMP_WIDTH - 1, 0=
)
> >>>> +#define CSID_TIMESTAMP_NS_MUL       10000   /* NSEC_PER_SEC / 19.2 =
MHz, reduced */
> >>>> +#define CSID_TIMESTAMP_NS_DIV       192
> >>>> +#define CSID_TIMESTAMP_MAX_AGE_NS   (2 * NSEC_PER_MSEC)
> >>>> +
> >>>>  #define MSM_CSID_NAME "msm_csid"
> >>>>
> >>>>  const char * const csid_testgen_modes[] =3D {
> >>>> @@ -1370,12 +1383,71 @@ atomic_t *csid_get_sof_seq(struct media_pad =
*pad)
> >>>>      return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
> >>>>  }
> >>>>
> >>>> +static u64 csid_timestamp_to_ns(u64 ticks)
> >>>> +{
> >>>> +    return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIMES=
TAMP_NS_DIV);
> >>>> +}
> >>>> +
> >>>> +static u64 csid_timestamp_to_monotonic(struct csid_device *csid, u6=
4 ticks)
> >>>> +{
> >>>> +    struct system_time_snapshot snap;
> >>>> +    u64 delta, delta_ns, now;
> >>>> +
> >>>> +    ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
> >>>> +
> >>>> +    /*
> >>>> +     * Translating requires reading the counter the CSID latched fr=
om.
> >>>> +     * If timekeeping is driven by something else there is nothing =
to
> >>>> +     * correlate against, so let the caller fall back to IRQ time.
> >>>> +     */
> >>>> +    if (!snap.valid || snap.cs_id !=3D CSID_ARM_ARCH_COUNTER) {
> >>>> +            dev_warn_once(csid->camss->dev,
> >>>> +                          "CSID%u: Can't use hardware timestamp, in=
valid clock source (%d)\n",
> >>>> +                          csid->id, snap.cs_id);
> >>>> +            return 0;
> >>>> +    }
> >>>> +
> >>>> +    /* How long ago, in counter ticks, the timestamp was latched */
> >>>> +    delta =3D (snap.cycles - ticks) & CSID_TIMESTAMP_MASK;
> >>>> +    delta_ns =3D csid_timestamp_to_ns(delta);
> >>>> +    now =3D ktime_to_ns(snap.systime);
> >>>> +
> >>>> +    /* Fall back rather than reporting a nonsensical timestamp */
> >>>> +    if (delta_ns > now) {
> >>>> +            dev_warn_once(csid->camss->dev,
> >>>> +                          "CSID%u: SOF timestamp predates CLOCK_MON=
OTONIC, ignoring\n",
> >>>> +                          csid->id);
> >>>> +            return 0;
> >>>> +    }
> >>>> +
> >>>> +    if (delta_ns > CSID_TIMESTAMP_MAX_AGE_NS)
> >>>> +            dev_warn_ratelimited(csid->camss->dev,
> >>>> +                                 "CSID%u: Too slow! SOF timestamp i=
s %llu us old\n",
> >>>> +                                 csid->id, delta_ns / NSEC_PER_USEC=
);
> >>>> +
> >>>> +    return now - delta_ns;
> >>>> +}
> >>>> +
> >>>> +static u64 csid_hw_sof_ts(struct csid_device *csid, unsigned int id=
)
> >>>> +{
> >>>> +    const struct csid_hw_ops *hw_ops =3D csid->res->hw_ops;
> >>>> +
> >>>> +    if (!hw_ops->sof_ts)
> >>>> +            return 0;
> >>>> +
> >>>> +    return csid_timestamp_to_monotonic(csid, hw_ops->sof_ts(csid, i=
d));
> >>>
> >>> I am not sure if we need to do this every SOF. Most probably the delt=
a will
> >>> remain the same during the streaming, so I think it's best to use the=
 delta within
> >>> tolerance and then apply that for the whole streaming session. Also, =
I think it's better
> >>> to have a constant delta from the monotonic clock rather than a fluct=
uating one.
> >>
> >> I think it will be the best to send both timestamps to userspace, and =
give the freedom
> >> to userspace to decide by him self. But the API is not allowing that a=
s discussed.
> >
> > No, the delta is not constant. In fact, that's precisely why we use
> > it, it captures the variable CPU and software latencies between the
> > hardware event and the timestamp acquisition. By combining the
> > captured hardware timestamp with the current system timing
> > information, we can reconstruct an accurate event timestamp that
> > remains aligned with the Sensor/CSI timing, rather than being affected
> > by software scheduling and processing delays. According to my testing,
> > the resulting timing error is below 1 =C2=B5s, from which we can derive=
 an
> > accurate sensor framerate.
> >
> > --
> > watching /dev/v4l-subdev2 (msm_csid0), id 0
> > id0    478 ev   60.06 fps   16.650 ms
> >   events           : 478
> >   timestamp (mono) : 180.160315690 .. 188.102256050
> >   duration         : 7.942 s
> >   frame rate       : 60.061 fps
> >   frame_sequence   : 539 .. 1016 (missing: 0)
> >   interval (ms)    : mean 16.650  median 16.650  min 16.650  max 16.650
> >                      p95 16.650  p99 16.650
> > ---
>
> Ok i will test the changes on my side. Just for other people we have conf=
licting names
> CSID (stands from clock fw perspective to Clock Source ID, and from camss=
 for the
> csi decoder). If you are sure that the for csi decoder the CSID_ARM_ARCH_=
COUNTER
> is always the clock source this will work i agree.
> But if that is not the case and we end up with big delta what is the idea=
 to do
> that every frame. It is kind of confusing to me at least. Also i think we=
 need
> to check for the other platforms if the clock source is always the same.

Yes, the camera hardware always snapshots the architecture counter. If
we detect that the monotonic clock is not derived from the same timer,
we simply fall back to the traditional IRQ timestamping path. The same
fallback is used if the computed delta is found to be inconsistent.

When Linux receives the interrupt, we know:
- The counter value now (C_NOW)
- The Linux timestamp now (T_NOW)
- The counter value captured by hardware when the frame started (C_SOF)

Since the Linux monotonic clock and the camera counter both come from
the same hardware timer, we can convert the difference between C_NOW
and C_SOF into time (T()) and "rewind" from T_NOW back to the
**exact** frame start time:

T_SOF =3D T_NOW - T(C_NOW - C_SOF)

Regards,
Loic

>
> ~Gjorgji
>
> >
> > Regards,
> > Loic
> >
> >>
> >>>
> >>> ~Gjorgji
> >>>
> >>>> +}
> >>>> +
> >>>>  void csid_sof_event(struct csid_device *csid, unsigned int id)
> >>>>  {
> >>>> +    u64 ts =3D csid_hw_sof_ts(csid, id);
> >>>> +    struct timespec64 sof =3D ns_to_timespec64(ts);
> >>>>      struct v4l2_event event =3D {
> >>>>              .type =3D V4L2_EVENT_FRAME_SYNC,
> >>>>              .u.frame_sync.frame_sequence =3D
> >>>>                      atomic_inc_return(&csid->sof_seq[id]),
> >>>> +            .timestamp.tv_sec =3D sof.tv_sec,
> >>>> +            .timestamp.tv_nsec =3D sof.tv_nsec,
> >>>>      };
> >>>>
> >>>>      if (atomic_read(&csid->frame_sync_users))
> >>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/driver=
s/media/platform/qcom/camss/camss-csid.h
> >>>> index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..17cc3b42c8d83180d6ab=
fcc3efe22178dcc2f2e7 100644
> >>>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> >>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> >>>> @@ -111,6 +111,15 @@ struct csid_hw_ops {
> >>>>       */
> >>>>      int (*reset)(struct csid_device *csid);
> >>>>
> >>>> +    /*
> >>>> +     * sof_ts - Read the counter value the hardware latched at SOF
> >>>> +     * @csid: CSID device
> >>>> +     * @id: CSID src-stream ID
> >>>> +     *
> >>>> +     * Return the raw counter value of the most recent SOF
> >>>> +     */
> >>>> +    u64 (*sof_ts)(struct csid_device *csid, unsigned int id);
> >>>> +
> >>>>      /*
> >>>>       * src_pad_code - Pick an output/src format based on the input/=
sink format
> >>>>       * @csid: CSID device
> >>>>
> >>>
> >>
>
