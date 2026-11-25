Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612879;
	b=ZGYtYPz2NA7y8sN03LPoiVHy3xXFJEmyPn3PdLp6psOURnDZUyckA+ESuZ9ooZsKR8wY
	 w6ocsi+ao9ib8UoIClQkfvY1VlXuEsPAYDhJa4mbDfg1kwWHu9/X1BbdETuhZIekzPANG
	 8VbmMSS8MHhzOZXyjmpdzz3olTnhF7ARxJbWL5bB8LKr/2oiW/pL/g0nrxEkhQBpM73jO
	 8kuGkgivswTWvfgVelsm5KqZ0zZaP1Mjs6MglGyA/R+xy1O0VnErCMnGyY/YHJ11yoF9B
	 qaA/JdbXAWPNS3M/HwarMrrg8oRXgHzGoTglSKYbxFGYzeqPI6WliE35TZ61nCgRmxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FMM3/1V+TPrp69ktuSmnb4C6jU1C5VP8C2Ed2evV8Fg=;
	b=2ygWMaDhj0+iB7gZCJtTWESrqUGtC+7wRy7GHSSvyxeIltxdN2aMVDWvHWkL5JAnFG3+
	 M5i+CTV9eahp2TC0XLpAMchuQSNdpCH3x88veBQAdTgMYMkvzZMZknEWgSaakRAonAYM3
	 NepLiORNlESr34pW49vkbKSGyOtTAlSi1lHImKm4BNFhK91AZDnexS/qP7di9XG4Hgkxs
	 d4seCWcMi8KG0+aO5kIFYKbawI4LcQ+3PjKSuiz9am4tJZmjBlPxeXG6KBE7SPNGiJLz3
	 zl6tSf5EAauQn1XTv0ZXvfxu8M9K6M6uJuJOjWGOg8+C8iwjpOjJoAVTXDFBR/sBbhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IqjpJqd+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="N/TGBesm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF724606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF724606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IqjpJqd+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N/TGBesm
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APC298k416063
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMM3/1V+TPrp69ktuSmnb4C6jU1C5VP8C2Ed2evV8Fg=; b=IqjpJqd+ckLujgOU
	9BQIiufg7z1y26vjEwkjciJynHVumXiC00BEFpuqSRinmo7ZbE1u9/ksMCjl2N25
	JxRVpEB6zc2MdRujdoulVAqrbq3xjJEv/vvEcLXDMZmJmAEtYm7wzac5y3bPC8mL
	9p/UswZjCHyiI2R/8MqTUyRCx7EQ9B+HKH1uq2AW7z6eKGXzpJ0jYntH8LzQNaRR
	ASmmYIrp9S2kJGVt1zfJPOw0+5ckSDuflsXgUiPUztcCwwTqcxH7OQhTM5FvMCjG
	fhWEJEH4ap/iRtMuSrpROzujUtbFCqpWITl+lA5YzgkDQl10Z0kW5d6B6zrw/nSu
	CCCDkQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxr9nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:21:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961ed97d6so996442885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:21:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795612877; cv=none;
        d=google.com; s=arc-20260327;
        b=NEHwJvjXDHy2X0yB4IgLHGJzJKl1kFYnyEzIVBQ8DeBENWLwQdalMuyrXDJ4dVWu/u
         iopuITrE8fomPkz7wOte2grI0pmWEXUrepY3drCkXVRfFEQNn4bAHqggCq1gm0oWIf1v
         ecyglptQU5sQAxE4NrWEQ7Uc3J4QRMJH7n4NQepeUq88vlK+S9QOzHor6fj7aANYCX9I
         YmHnb4cL5KM7Klo6luLU2o6vgmL+444N3+r2VMCLfDPe8GY5CkVAb+VAZr5sJCsj6X2w
         c4/C5VStRcYj6gTqBpFRsgm829R29b991ByitomLU30hxXirhQaHR35gSuTYce+WJZie
         908Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FMM3/1V+TPrp69ktuSmnb4C6jU1C5VP8C2Ed2evV8Fg=;
        fh=9L+tr+kiX3nrts+gBXJ4F/XMZY8kyrp7SafNEtl0sR8=;
        b=duJLFCVfY8KbsXOjm++WXeckl52g9db82pjpPxNeZ/orktYSofC9OSHf97pvwBgASa
         +RNsaYdpLGu3jMgMyRXjLsF1opzA87eqJVv7XgdRjRXPgMI9XJu/2Mhu+fE4Wn8wBvXO
         ajnZjRQYp87I3LwJABipfQNGyQRE6R3gIwXB36ESiLnDDqC+UBlpxRBEtvCl5gbrGlNG
         QB8tlxexqVctcotWYxZrJhOLm1RU3RG7qhwKj06Q3vdqP8SUWypFwWtSIoQGFlrPp5bN
         Tc/20CLwRqVPtkCAWI2THK1sI7SyKZYQ0jlAzWnvY0aqRFaVTHRdONEIAeo1qiuTezIp
         tc3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612877; x=1796217677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FMM3/1V+TPrp69ktuSmnb4C6jU1C5VP8C2Ed2evV8Fg=;
        b=N/TGBesmMzeXNwu4VY5Nudq/5uC+GM84p573SYScN44CyaH9vyeobwrT+yz9T6RrhI
         5laz+AprxcbMcNswcL3Fhiomkmqa/kvdzQN8bdEVw7JvQivKXIXU/l5d3yAl0eFTo9ED
         njs1vZzetP7crQjhciiHb7pQsuw5Fqq1ZaFzeOFpKbt6rHUNme7rQc/DB7GGSfuycaYC
         v6KOtm/AMA+acfOe8jWagvxJyZKq4JJ+TY5H2H72OvWjkfhEYPmXj/wnQRf1IXSwAg0t
         iCC5pNyPdpdoQ8vlqLo7Ig0RHpiY2ESB/A9Dz2x4nHevWTG+w0XWIDoQgbLJYfg2yx/1
         wIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612877; x=1796217677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMM3/1V+TPrp69ktuSmnb4C6jU1C5VP8C2Ed2evV8Fg=;
        b=rYjhGLZvX55KjYxkdYcuL5gfctWFA10+NozNikZZK2dUJTZPbothcMje5hBs9wsHIT
         7A959DLd5jwv+KeRvgqwLylj70KBIgvSgtDGYnv6tdTvXzl+HiMd6RsEzfe/+qhZgqzk
         MY+89P+zngrKMQa7luNFEBPmHYWPI0QYv2gKSCrLYio2MECTGqHBhAi7ZhXLHMY10473
         krqeG8su0s5lEH6ZSzO9M5lB6D8Z05yJiUaBAy77eOBRy33Og8X1DiCLhaSqs3Pnkb2q
         SUKKXGsh3FIMRjx4maYs5iDuyqQ4zqDYP2Gxv1AhjdASkPlbJQq/2HCxKQgfcXIJVure
         8wZw==
X-Forwarded-Encrypted: i=1; AL+hErFGbdTeu79NhjrvVoHVQHAFu/W25UaSA/Tg2uTYhRBS6a2NCkRS6hMehcIy/hOz52oUTDceRbD+i+WNfC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dbD5MQQnZr5hnwfV+fpLZpdwAOsQfyYb4/eI20NrQSsDcQtu1
	pAc5p5MbJ0MNx1bB7QQ1mENBiJqTd5ORP3ZR9aoeNZ4FJGAiw0O9O/NL9JgPiTCcds4ka322i6q
	ASrlU2WkywVgxKWYW4bzinzPA9PXGd+Tn+taPo2/YGlZ3okUOvOFICU+SqQCWS8/A6iZXjyfmx8
	xpgF98Mb9LNmJhAq2dHnq/fh0cKiRp0Xe6QXZwGsO25LJzJQA8DE9d+dU=
X-Gm-Gg: AZFdTZcHe2TKz2jih6xjtxnOytgqIy+nodyX5rVCsgLNJAYeUqpyAof5r6JrWiVXpja
	stFtrij6JwSiN1kkMVdhDA2SpeuJs6yCRy64y4OE2rTqa//W5T+3qCp2UpwZV7NQlc11L1JnfIi
	5sn2Mzd3oILPptzEgzrb7NPu2LpwgTfGqmDoaLTrg6eAmMVOsFup/FpomvRIpQWzL+FbbkIT5nv
	ow3f9dY9Yocta5kL3Xaqot9nRU9o2iwdvjLxxbkJj9XUO4wwAhTMjNcL9B7SSbSfANq7YveaPs=
X-Received: by 2002:a05:620a:8705:10b0:949:cabf:fbc4 with SMTP id af79cd13be357-949cabffc8dmr1217684985a.11.1795612876845;
        Wed, 25 Nov 2026 05:21:16 -0800 (PST)
X-Received: by 2002:a05:620a:8705:10b0:949:cabf:fbc4 with SMTP id
 af79cd13be357-949cabffc8dmr1217682285a.11.1795612876384; Wed, 25 Nov 2026
 05:21:16 -0800 (PST)
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
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com> <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
In-Reply-To: <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:21:04 +0100
X-Gm-Features: Aa3M54rfrmnDvucflOAGULsItU8-QDhBEWytAHLR80QfBQzJ43vNB3ZDATrOiZk
Message-ID: <CAFEp6-35qT9Ow8SOWWBxf75geq6s169+SPJmw27TnkkD3o0wow@mail.gmail.com>
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
X-Proofpoint-GUID: GAngvQ4uQcntL2HIH546BCORMsMWdNBk
X-Proofpoint-ORIG-GUID: GAngvQ4uQcntL2HIH546BCORMsMWdNBk
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b06e0ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=JFttdC-cvXLWoZU56GIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX+qzZ7bRIx/U6
 ji3SZH8eKc8sq8Yr0uLPxkaNp6BK9xDUg8ungls9nTazVnyI4VyrmY3sLr033BEy37PYRTeFzvM
 JZG60L13JguMDtk+7JxQafB1/R3JHUtvIhUVDOvMpCk27Wtf1ozkfnNsvpQMOcSBIXt3NrbqTb+
 te38rvR4eDbPN14LgWbDwNtZrrqte5A2mzslXcFAOsj4KgqLYqQbxDDITu7m+vHU5BVL0OHUkEr
 EPz5hkyhbQSAKzZgF2xTJt7o7EDXSuOF1uDNK+PPltVPDjHqvTmDN+POA2RxQE//qWr1vW46W1g
 5HdC4BUSCJDqdq/aGhM7YGQ/hqebDWCK1WBskAkr/SrAWBZBDCEoij0nrGqttCTfSnwOP2jhvSO
 EFI3DQWXwMSU0xNDnGkPRoWOBflwwWamU2CdNK5InZwl8i5onM6UkuXk8hjaRn6Ml2sDxRi3pmW
 P8R+s0M+CF/REbScf1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX6zRPY9Qz+DPa
 pMSWSX3cYAUI4UBHAc6r4l/d+l4R8G6DbW4He/l+e5N6UvkIE7BwbvMzuMLRtn3/QqaKZ9Wq0bp
 myv+xbq36ozC7O62EJ7HHBrsMGOHylk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250053

Hi Gjorgji,

On Wed, Nov 25, 2026 at 1:29=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hello,
>
> On 11/25/2026 12:19 PM, Loic Poulain wrote:
> > The timestamp reported to userspace for a V4L2 event is taken when the
> > event is queued, which for an event signalling a hardware occurrence is
> > only as good as the latency between the two. A CSI decoder able to latc=
h
> > the start-of-frame against the system counter knows that time to within=
 a
> > few microseconds, whereas the interrupt handler that gets to queue the
> > event can be hundreds of microseconds late and is not consistent about
> > it.
> >
> > Take the timestamp from the event when the driver filled it in, falling
> > back to the current time when the field is cleared. Drivers have had no
> > reason to set it so far, and every in-tree caller either uses a
> > designated initialiser or memsets the event, so the field reads as zero
> > everywhere today.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
> >  include/media/v4l2-event.h           |  9 ++++++++-
> >  2 files changed, 26 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-=
core/v4l2-event.c
> > index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d6=
91ffd7853d9af714a 100644
> > --- a/drivers/media/v4l2-core/v4l2-event.c
> > +++ b/drivers/media/v4l2-core/v4l2-event.c
> > @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *=
fh,
> >       wake_up_all(&fh->wait);
> >  }
> >
> > +/*
> > + * Hardware able to timestamp the event itself reports that time in th=
e event,
> > + * which is more accurate than the moment the driver gets to queue it.=
 Fall
> > + * back to the current time for the drivers that leave the field clear=
ed.
> > + */
> > +static u64 v4l2_event_ts(const struct v4l2_event *ev)
> > +{
> > +     struct timespec64 ts =3D {
> > +             .tv_sec =3D ev->timestamp.tv_sec,
> > +             .tv_nsec =3D ev->timestamp.tv_nsec,
> > +     };
> > +     u64 ns =3D timespec64_to_ns(&ts);
> > +
> > +     return ns ? ns : ktime_get_ns();
> > +}
>
> I think it makes sense to add an additional field for hardware-based time=
stamps.
> Converting the timestamp to the monotonic time domain introduces precisio=
n loss,
> so it's better to expose both to userspace and let userspace decide what =
to do with
> them.

There is no loss of precision. The timestamp is actually more tightly
aligned with the actual event. So I don't see the point of having two
values, with one being less precise than the other.

>
> > +
> >  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_eve=
nt *ev)
> >  {
> >       struct v4l2_fh *fh;
> > @@ -159,7 +175,7 @@ void v4l2_event_queue(struct video_device *vdev, co=
nst struct v4l2_event *ev)
> >       if (vdev =3D=3D NULL)
> >               return;
> >
> > -     ts =3D ktime_get_ns();
> > +     ts =3D v4l2_event_ts(ev);
> >
> >       spin_lock_irqsave(&vdev->fh_lock, flags);
> >
> > @@ -173,7 +189,7 @@ EXPORT_SYMBOL_GPL(v4l2_event_queue);
> >  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *=
ev)
> >  {
> >       unsigned long flags;
> > -     u64 ts =3D ktime_get_ns();
> > +     u64 ts =3D v4l2_event_ts(ev);
> >
> >       spin_lock_irqsave(&fh->vdev->fh_lock, flags);
> >       __v4l2_event_queue_fh(fh, ev, ts);
> > diff --git a/include/media/v4l2-event.h b/include/media/v4l2-event.h
> > index 3a0e2588361cf451b3dbfc63dfab99550d13cf6a..076f788e0469ae4666c6034=
4e5ea73a698352134 100644
> > --- a/include/media/v4l2-event.h
> > +++ b/include/media/v4l2-event.h
> > @@ -102,6 +102,11 @@ int v4l2_event_dequeue(struct v4l2_fh *fh, struct =
v4l2_event *event,
> >   * .. note::
> >   *    The driver's only responsibility is to fill in the type and the =
data
> >   *    fields. The other fields will be filled in by V4L2.
> > + *
> > + *    Drivers whose hardware timestamps the event more accurately than=
 the
> > + *    moment the driver gets to handle it may also fill in the timesta=
mp
> > + *    field, as a CLOCK_MONOTONIC time. It is left alone if non-zero, =
so such
> > + *    drivers must zero-initialize the whole &struct v4l2_event.
> >   */
> >  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_eve=
nt *ev);
> >
> > @@ -116,7 +121,9 @@ void v4l2_event_queue(struct video_device *vdev, co=
nst struct v4l2_event *ev);
> >   *
> >   * .. note::
> >   *    The driver's only responsibility is to fill in the type and the =
data
> > - *    fields. The other fields will be filled in by V4L2.
> > + *    fields. The other fields will be filled in by V4L2. As for
> > + *    v4l2_event_queue(), a non-zero timestamp field is taken as the
> > + *    CLOCK_MONOTONIC time of the event.
> >   */
> >  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *=
ev);
> >
> >
>
