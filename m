Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795706161;
	b=RSQHCTQ3YK5uxfLK9lJJBkqQTh0ImXVn2L95tm2GpPT1A9gQ2ws17NgIVUndLSKbww7I
	 fDAKN11FftX/molBqKiDEVkXk5wP4MSF5d/W7sSAdC4k8rTzMjmtSOCKv6BlpO9wWpxyg
	 T7vxWHPH8blRMEoq1HACq2CP80/Q0At3m+m3Udg4odzuS6de2ii4v3K+/6YUXsKGqbq0h
	 hdObVpVt+FxiU8+r+73eZUmtBuxqVvGh6lJwsy7cAM9FkJwu6L1UTitERyUpfB338IdTZ
	 akfv6gMaK6GjdH+528T1To7C2Lc4TokRFZWaFec9mOBiakk0LZu97FJv3e3Q+s4uFGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706161;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hUJp0Nzq/FvKa12XTB23VAkzEX8Y0glzmuaSKGpkPHk=;
	b=pW7/bWaoPoTcQFXWO7UR1upHu5Zt4pHe2zKFyk16Dq6TegldPNaKoOud4RR3O7+75wX1
	 nxx+O2vXNwwxvyYQw6Y5YNJagKhDQhl+p34v9wgtgtrVMx4XJVvBrT9vVCvAZheVx9AnA
	 utUOXzbA6o7oxmOL6nlN2Is2jvoUz583VtZDp52HHHaz9kKnokxBDijZVnLj6RVv+BnJd
	 z3PZxj9BnUF6cnJRsvvv9Wq5QeVD+p74FjJL5zOut4sNsR9BJOjJNM+D9OSigc3Fun41x
	 HuLaw39/7BPHzYnFvSTvzIpns3cRNJp0aK+BMhV/h1Wfy1rEVUaJzpJgmQ62d1z1+Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H+kL3J7w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IOI8eNEm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0656606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0656606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H+kL3J7w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IOI8eNEm
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUx3s3563228
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUJp0Nzq/FvKa12XTB23VAkzEX8Y0glzmuaSKGpkPHk=; b=H+kL3J7w5gYVbLZD
	d220/PD1TLVwgLLVljYN6oBRagsyhFVz4HaQwyDYb4RbilqNjrD2KZCMPRKWVXF3
	CQdAQEA7g2sFXs0UIJ+KTZWqGmCiWzbTbR8KYClsSwAz6fEkFK+pDswVaJ03CgXK
	Zb89+lp5V72pLnHznxTYuh9+TX6EBz4/lyivrltiWBZSM/39I2hbNg+UtF7rLu6C
	99UB5IEKOZ7uADeabWShsGdEOcCMHDVxaIj5jiLmy/rQbHTkbuGqmBYNE3Qs8mop
	lQyOTA+vezpjljQiOmIMVJpNuZfa6KVMh86uQ6kGPCpYKo0sDKJNJU0sAzQqwVGX
	mUa4GA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sbp1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:15:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9210ad74fdeso121275716d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795706159; cv=none;
        d=google.com; s=arc-20260327;
        b=lL0UFR7WR0n5S72ZNVrwoPdFtfwRYOhzR/9hpQLAYAqkPWoQlqR6ze7g6/f2lnx1wu
         00zegkJicaOyvLAxG1tMTND8n1mAawGk+ismgHq8EmAgAQvrdLByPne8mT66uFHl1bPJ
         A2HX0uJoF+7HM52fv8wDbrufvKoPsTSPqimNPGHXcTPmTBA0TX6cBEBVN6Ibb7dmhRdv
         WqBxvPNZucNYy1bA86h1bYO5lvudkDloZ8tP5y2XCrWUNGMTcOtcC20v49oBQDMyewLc
         Eck9UEBg+ENQWSz4T8acabOhvDNPHLvmgnoNrZ+Q3T04hYyD5hTeqSOe3vFFLbdpCEHh
         bxJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hUJp0Nzq/FvKa12XTB23VAkzEX8Y0glzmuaSKGpkPHk=;
        fh=NvvdCw3zJq/mhjCgGcMLU0f1B3zSY9xb2c7LT4yYGPA=;
        b=oBQkqNVtq/MjOkiWMCkXLVE7bbdc3h+nwK+XUuqU+XavuCvQm0iTmr8kaBg057FogR
         VK+iLiLnTBRm978IiqI9Fug+U2CkU/5deBIWLJ6GRn7aRZIqUAd/0hPdUj5jII38iPIB
         lAGOFbAWl4hRMQdDXHW0k9QPE0Y+QC0LUwNbfcvHkabAZxcvsZcVrORdfM3U+e7AODnf
         Y5bQXo/RXRO7Mf96RzwKZ/IzckrOvxPsVbz0ZnrF7aQFuW+KiVH1X0KuZ4DvAwVSJPRQ
         98Hc9lyzLHl8WZCCeGimq1YQU66SwlRVc+I3g60e+TdvsRwC38iNtp9IGOuPVBk5muef
         Hj4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795706159; x=1796310959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hUJp0Nzq/FvKa12XTB23VAkzEX8Y0glzmuaSKGpkPHk=;
        b=IOI8eNEm1p/IXRc2DbBWxAUBBGMjJIQF+8RQoO1a6T3Yz5VnO+KyTh5F3VGpGMlc1C
         0Ja/btkrzMNZB5kdapZyFzBFlHsR7wA0ZABJuU4uYtpASl3qzs4qmUdLL/8+YnZLMA+P
         B803FCj4z3sNRS1yEjKiRCEKAG+ZZdxwXn63ytuu9bC7XBf9xpj8LqIVkYLLfvo5L3sY
         oYX9ZhH9Mq1iO2/7MX3MmFVD82V3geCdHRKqAJ+NL6IyRuAmfU3zh7uXSIeQjBY16kjC
         0sSWzHie+pzHiT11IjDK0rg/d0GZCJwg4BI3X9VvJaZ7lbxW0zptJsdc6X5AtlzWVl51
         BUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706159; x=1796310959;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUJp0Nzq/FvKa12XTB23VAkzEX8Y0glzmuaSKGpkPHk=;
        b=s1t/eDVnJBuKJX23mWl5aKMrzWlu6NOEJGS+1AmM69pY02vlw+r84d3ejO/9yCePK9
         nQtySXj3UZ4iSadLMnZHN2Aj5Z25un/Q37Hlb0vWOiIkOzYy8oRgorKulJiPjWf8u2kY
         cRdA2PPTEOBsyqKHiTpD34mFFR1mngg1MF1uhvX9Y5Ym8bqfRnLI9MDnd736jROw/mLi
         7hL1wi6XMd12J1sFuheMAXm6Hy1WvIxEK0LJjcOrE4XplaAP/lYFUkSDqxbSTw/BiKhZ
         WKw4UlwwRgMuYYHes4tN9HZbkSWmZ+IaEqIShmm6Vo3FruRcWSCzRnIfTAaOglO8NJVF
         pWXA==
X-Forwarded-Encrypted: i=1; AL+hErEz+bgW/FqRhO73irJPl6BSZXX3OGMcelEzHj5oVHJSs2gjs1yksXoiNhLi9kYhqHS06W83mLYBrdlWhS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qa8ZzDYAR94doyqnUGIIVhk0KVnro5jUJTerdlrdloXdwuNqO
	5yPQaa6rx/7nQ5ld2mnGA8wmnnQSwLd2UZOpZz+15iElZ7PmYgRmBpE2zoClokPwrgC22vHzpvT
	SQHZtMEGSpm4IC+xloKa/xmBznTFxIdxlOfF1VfCXQOzTA82VRnNdcfVMoZhGdb89QJ60n1aAXe
	ptxyfZJ+gjHkMAHc514FXKtnE6cOJgyt35IzY0zWMS9w==
X-Gm-Gg: AZFdTZe6mEYB1BEaCFcbyvoSHESwIBh1Puf4gvFeBEBw+t/POyFFtQU8ncOta+psKbh
	PqafvDnkLDSJ1HXg2RIvhxD3DN2SdnamYMUqFc6hlEte62230Cg+pIkruYX5iL2saLxDmTPu6Zn
	6Z1S4+Nq4zEcglpI/57UFC/KNcuYCJ1oGPwQy4qpTQC9l0sa4pXSGBFH7+zXo3JxZo7PL+RAbtL
	LHkuKB8wOel+qhXh+Wc6phWRhnO9peV4cg3mz2tnaDJvkmi6SsaQk/jFK5UfJaVIWxAhFvwWUrb
X-Received: by 2002:a05:620a:2b4d:b0:93e:b0c3:388d with SMTP id af79cd13be357-949ba80fa24mr3406476785a.11.1795706158677;
        Thu, 26 Nov 2026 07:15:58 -0800 (PST)
X-Received: by 2002:a05:620a:2b4d:b0:93e:b0c3:388d with SMTP id
 af79cd13be357-949ba80fa24mr3406470485a.11.1795706158051; Thu, 26 Nov 2026
 07:15:58 -0800 (PST)
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
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com> <9b858d24-f783-44e5-a7e6-85b59e054f37@oss.qualcomm.com>
 <6ddbed80-bda4-44c4-b0a4-be2e87b278b1@oss.qualcomm.com>
In-Reply-To: <6ddbed80-bda4-44c4-b0a4-be2e87b278b1@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:15:47 +0100
X-Gm-Features: Aa3M54qFufD8dXHGK7qI0JqWErH0MOAaLSJpzFfpWvcnCETN-pln6qRyNROnHVQ
Message-ID: <CAFEp6-07goPSX=fEOmQziXTvSoSt7-FebXAtB9xfavTXB6-Ryg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b084d2f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=BYyRJpiNYB29a2R02p4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: h904fU4ugB9hpttvp8nbMgEyaV7gTE80
X-Proofpoint-ORIG-GUID: h904fU4ugB9hpttvp8nbMgEyaV7gTE80
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OSBTYWx0ZWRfXxn20glbZ7KjJ
 eeWLEmjIwVO9/weBlcurUsE303Q7x6QVWROzT943jKhiYH0AYMyTsfcwhVmqTCIji1PIAAnit12
 sYuNBaPJ5fPcuec1PFcP/XracXblNAXnNcOD45ZfA6NytFyYpe1DtLLygwTE2cg7p2A1qiKGp0u
 i/fRSu0hH9vAzYSwsRUw+AE6fp7y+iB5JYUOMe0OiagWtskiHr1tB8EiNVFmGQlUdfGz2hZitvH
 ub2TnsrwLF39++LUubynDFGO8I5F8nJHJZLoBqVKe0uUhO4LD0Ysf1e28NhkAMV9OFO90XkkB/Z
 s8KoG7sQ/VULBBhdF0kGyx+E1Gin+X0r2cOEUlMNjFeLn7JBaF2DvDw7spkoQkKRjnNxKaxG6b8
 M6o632SbzBrcEg9CDALB12grn1hEgxMYfZDmJ4tPfnoXh546yjNcf1ppKykmnnsI5vqUP0N4Oxd
 9qAd7Lyjbuw0hWD6urQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OSBTYWx0ZWRfX0ouOAAqxG1Yt
 C6VqgD5mKf8hWcsk1Iam+Oc+TEcG/PIjG7yAuYLOXNY02ltF5hUTzyrTpSll/uHzOtYxwHfqVUd
 DeKQO8cFnk08E3l09LSp9MgXB79OW7k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260059

On Thu, Nov 26, 2026 at 8:52=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
>
>
> On 11/26/2026 9:00 AM, Gjorgji Rosikopulos (Consultant) wrote:
> > Hi Loic,
> >
> > Apart from hw timestamp propagation some other comments.
> >
> > On 11/25/2026 12:19 PM, Loic Poulain wrote:
> >> The timestamp reported to userspace for a V4L2 event is taken when the
> >> event is queued, which for an event signalling a hardware occurrence i=
s
> >> only as good as the latency between the two. A CSI decoder able to lat=
ch
> >> the start-of-frame against the system counter knows that time to withi=
n a
> >> few microseconds, whereas the interrupt handler that gets to queue the
> >> event can be hundreds of microseconds late and is not consistent about
> >> it.
> >>
> >> Take the timestamp from the event when the driver filled it in, fallin=
g
> >> back to the current time when the field is cleared. Drivers have had n=
o
> >> reason to set it so far, and every in-tree caller either uses a
> >> designated initialiser or memsets the event, so the field reads as zer=
o
> >> everywhere today.
> >>
> >> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >> ---
> >>  drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
> >>  include/media/v4l2-event.h           |  9 ++++++++-
> >>  2 files changed, 26 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2=
-core/v4l2-event.c
> >> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d=
691ffd7853d9af714a 100644
> >> --- a/drivers/media/v4l2-core/v4l2-event.c
> >> +++ b/drivers/media/v4l2-core/v4l2-event.c
> >> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh =
*fh,
> >>      wake_up_all(&fh->wait);
> >>  }
> >>
> >> +/*
> >> + * Hardware able to timestamp the event itself reports that time in t=
he event,
> >> + * which is more accurate than the moment the driver gets to queue it=
. Fall
> >> + * back to the current time for the drivers that leave the field clea=
red.
> >> + */
> >> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
> >> +{
> >> +    struct timespec64 ts =3D {
> >> +            .tv_sec =3D ev->timestamp.tv_sec,
> >> +            .tv_nsec =3D ev->timestamp.tv_nsec,
> >> +    };
> >> +    u64 ns =3D timespec64_to_ns(&ts);
> >> +
> >> +    return ns ? ns : ktime_get_ns();
> >> +}
> >> +
> >>  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_ev=
ent *ev)
> >>  {
> >>      struct v4l2_fh *fh;
> >> @@ -159,7 +175,7 @@ void v4l2_event_queue(struct video_device *vdev, c=
onst struct v4l2_event *ev)
> >>      if (vdev =3D=3D NULL)
> >>              return;
> >>
> >> -    ts =3D ktime_get_ns();
> >> +    ts =3D v4l2_event_ts(ev);
> >
> > The documentation states that:
> >
> > "In order to queue events to video device, drivers should call:
> >
> > v4l2_event_queue (vdev, ev)
> >
> > The driver=E2=80=99s only responsibility is to fill in the type and the=
 data fields.
> > The other fields will be filled in by V4L2. All other fields are filled=
 from the v4l2. "
> >
> > So here we are changing the driver-api. I am sure that there are driver=
s
> > which does not set initialize the whole event struct. This will introdu=
ce new bugs with
> > some uninitiated data send to userspace as timestamp.

No, at least none have uninitialized value, this is mentioned in the
commit message, so this should not break anything.

> My opinion is that similar to frame_sequence (which is different from eve=
nt.sequence)
> to add frame_timestamp in the frame_sync data field. Whether that is mono=
tonic timestamp
> or specific camera hw based timestamp is yet to be specified and decided.

Yes, but we're not changing that here. The reported timestamp remains
a monotonic system timestamp.

Linux provides a hardware abstraction layer, and in this case we're
reporting a SOF event, which is fundamentally a hardware/bus event. If
a driver can provide a more accurate monotonic timestamp for that
event than the generic framework helper, I believe the API should
allow it.

The goal is simply to give userspace a timestamp that more accurately
reflects when the event actually occurred. If that level of accuracy
is not required, there would be little value in providing event
timestamps at all, as userspace could just read the event and obtain
the current monotonic time itself.

Accurate timestamps allow downstream elements of the video pipeline to
make better decisions. For example, they provide a more precise
inter-frame interval and effective frame rate, and enable derived
measurements such as object velocity or motion estimation to be
computed more accurately.

That said, I understand this point is somewhat controversial. Since it
is not a hard dependency, I can drop this patch from the series. We'll
still apply the timestamp to the frame itself.

Regards,
Loic

>
> >
> > ~Gjorgji
> >
> >>
> >>      spin_lock_irqsave(&vdev->fh_lock, flags);
> >>
> >> @@ -173,7 +189,7 @@ EXPORT_SYMBOL_GPL(v4l2_event_queue);
> >>  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event =
*ev)
> >>  {
> >>      unsigned long flags;
> >> -    u64 ts =3D ktime_get_ns();
> >> +    u64 ts =3D v4l2_event_ts(ev);
> >>
> >>      spin_lock_irqsave(&fh->vdev->fh_lock, flags);
> >>      __v4l2_event_queue_fh(fh, ev, ts);
> >> diff --git a/include/media/v4l2-event.h b/include/media/v4l2-event.h
> >> index 3a0e2588361cf451b3dbfc63dfab99550d13cf6a..076f788e0469ae4666c603=
44e5ea73a698352134 100644
> >> --- a/include/media/v4l2-event.h
> >> +++ b/include/media/v4l2-event.h
> >> @@ -102,6 +102,11 @@ int v4l2_event_dequeue(struct v4l2_fh *fh, struct=
 v4l2_event *event,
> >>   * .. note::
> >>   *    The driver's only responsibility is to fill in the type and the=
 data
> >>   *    fields. The other fields will be filled in by V4L2.
> >> + *
> >> + *    Drivers whose hardware timestamps the event more accurately tha=
n the
> >> + *    moment the driver gets to handle it may also fill in the timest=
amp
> >> + *    field, as a CLOCK_MONOTONIC time. It is left alone if non-zero,=
 so such
> >> + *    drivers must zero-initialize the whole &struct v4l2_event.
> >>   */
> >>  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_ev=
ent *ev);
> >>
> >> @@ -116,7 +121,9 @@ void v4l2_event_queue(struct video_device *vdev, c=
onst struct v4l2_event *ev);
> >>   *
> >>   * .. note::
> >>   *    The driver's only responsibility is to fill in the type and the=
 data
> >> - *    fields. The other fields will be filled in by V4L2.
> >> + *    fields. The other fields will be filled in by V4L2. As for
> >> + *    v4l2_event_queue(), a non-zero timestamp field is taken as the
> >> + *    CLOCK_MONOTONIC time of the event.
> >>   */
> >>  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event =
*ev);
> >>
> >>
> >
>
