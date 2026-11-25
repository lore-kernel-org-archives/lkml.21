Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795639814;
	b=1lxRWt4I/CLlf5+NV2/fSzRkZ2Nb7hcT9Wz7hD2NcYqo16C+clDQP4ID3anyQRrjgzWq
	 CyRt6yKqFbtSCs077GsUy5Q349yp+8btBRvwKKvA7v6d2BqKZEnxjJSiVAK8Rasa6WnkG
	 VW3AScj2Ni8RixIroJev73/VkxwRP/fwU9SXDDuDwj865WFLURAXQt3YiHr+E5MTjKm2u
	 j8Tn/wMnDs7ZI42LPcPxUMD3vx7N0KnFxH+iOiDFqJp6vVvNxS/aJYLqBrFe4211PIyl4
	 8FaRKzXU4kcbO0vGaEDLN2TtwvOFTumzWq1lMpx+Hi8MWNW5Diuk89ZUp+0n4WIt1XQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=;
	b=ZCV5bfcUmNHCQWBLYAfO1teBBtXeH8R5olNNZ79ErJ60AnfLNMTy375N/94uoCTsoMmL
	 cbXFNH6PGcqpZkNfS1n3Q5eBx0f7r7jBw0sTtZoz7r6OkgXpsM0DDCaptwvLsR/PoPBqh
	 M9jetKOeKPTemc3KdnF6EEK+ZpGRB5RdvBm2HZH0F0Kx7WbDYbKMptMrbAKE5cdsq9X5m
	 9S6NIevVKIs8usOzdqBjAZ+xf5cba/Pg7SKtT+0Z61Ao5GNIaYPqsd9Ao+gJsw6UnTWYx
	 NawwWEflWOxD3N9LXyXJeTACy0ejaLklyer9ilJmRSuaoNfvRcoNnp+DJDwsPO7DeUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3KjOgZB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erL4VWoR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15C9606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A15C9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3KjOgZB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erL4VWoR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAvJ1162783
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=; b=L3KjOgZB78vnDg2A
	baIrgnhBdVc0qeP90ncluFInuDz8yg8x5HxOFjcy4cnYt19ME9F/hJBw1GVgc+bw
	QdLB3Wf7V/bu1keMiQR7Xr+QM/jdxtZAveg7U1u2HmnSBpDnUejSA2IT8b6546XH
	bXX8eIZsDOlG5scZXWl2ZKNdzpmkUT7MSxPE+QeUNNoJHOjxrcwVJCtYEacXm0LO
	EJHj9X/n2o4d1dF1Q4+wS+j21CJTdh8qY94FPPDqh5biOS04x/k2s8sil7L2yivI
	t9MxXiTK0LrNRwpmC9w4m/bAAg/UVo0Mpvi8yO1d0i9QtU1lgEzBKwfrx77vQLgw
	K707nQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aeh6yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:50:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-946038e22f5so257171185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795639812; cv=none;
        d=google.com; s=arc-20260327;
        b=dOtoqzvUl466hAr6O0ocFVKRugvSZDnr0S7/Tk7JuLdHwo0IcgmDxb2FXx+AJTpXUb
         sRpfrUsgZNRSXUxkmACf8JF8BWrQaCCKyMU9aHbBmvUQF1aLxvFdofQj/4GeiGWht5g3
         3bEouxw9JNa1cwwSx0xp2pnrRzqVVouRbTTThiHUI+iY57Vgo3dwGnC/79gfHIEYegWH
         Kmg+lh3K5xpuYR/cHr0EFJ0RWrVW6semG2F/jsKN/Lp/Fv/uCeON2gzeHfV77CDYk42I
         q7yFY1z054EnO9/S/NuH/iMDt9fVuQKisj6uh9yE40+pkMpwO/lr7vxKLgFaJwrByzvi
         L4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=;
        fh=hy6EXWmxaMnnp7+G4rCW/iM7905w895wtVffgzaEFmw=;
        b=KFKhCX2N2xpyhPx5gFupONyrbit9uMNmizqSn+MXhlhs9hS937pgfqO5Xut1j/caau
         hGpBgdlQJ4hI4PpiTLeY4fd0h9ynE33uz62QLeYi9kHbzmDRMfKIGhaLQ31YWLNBqV/Z
         S82Q3S+svhplv3XtHLS9IbED6gsuqVSoAflrjzZb9uCOycgynYBB+rhP44EVwqDl3VE7
         ObZVP6saQfUXKKNnjsnvbW9EIPWk3eLgU5murLF7Ma0EytI/Ap4LeAqG4pcVKf8V/+V+
         +kA+Dt20LKM9jpqa3CMUSYDZKTi+gRJAyyecfZSulYoRPLXThqh/ciAgv6voIRUJXcCQ
         auEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795639812; x=1796244612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=;
        b=erL4VWoR333+SGGowJLUl03vdR7j9gv/4yGrXRxCwgZM9QH6g6kufYcT1PqI/Yr6hQ
         4TZOxteKGvx4tOFDYhMRYFiPYF7Q2hEDP0MrUMjpzH4Z2L1T5szSY/vA+krpUCgFZJ0f
         DnQXepyhlEhaoyYEuzdDextySiXm+M6x/NSss4Sy/Z35RA0eFTtGvfCgxC2zatwlVs5g
         86zjTfy0nnKSPfaSKk7XT+d0/BPaKTsIa6BnuGQtOzRbp9TmNiWnQjXkeJTB4oapLn+B
         wRsHxoAEK/617mesLWiYpnz/Np08lj+pNRCswN+I82tfHd1ETOcKbLtqF+OyUZemESxL
         JTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795639812; x=1796244612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWc6U6uCl1ugTE+RqE60F8R5GakoN7oFfbCV9Fjoy+0=;
        b=AQF1gzzEPXkIRRoluorD/up4XULotQTq6BX2ASrogTrTwUUhvAEzO8OJ1Gr898GAIf
         HVlV1cx884VjSYaz0ZHj+eJNq5oCAAtB1huwFhav6zX/3c0wF3Ii1FvjEwIohM5SVcQh
         0qRSJSn2w4y8GZtzws4NCInXk+C5Vj9hpZbwiGszgmcx/9v6XM+xwFfrfOQ1Tz3xw+nw
         rkdb6SzYRklfW/eqeEjQpup9JVTV3vxPDnbkgelI+0CJ/tiq9sNf/LuXDqWZWaUVKn7S
         z0QmeXk8tb39ivzam8BoIl01rz4SsQDiHunQzhAzigR1Apw3npKqi2z3ZUpfX0M9SiwE
         Gs2A==
X-Forwarded-Encrypted: i=1; AL+hErGUVUr6V7tx4VO4I0HAJnLFK9J/XIk6SWNwaoNKREguXGHHA+wwOmbeWEfZHzxaxFnu5uVnFuCwEs9fqhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4hOwu5Bj5vtCUhgaaiHup70tA5VwdlpWlqE51efugqOzUpctQ
	+9gA+BOUIHJgNCkTKEun51l3t/cFrVhJGuWObYTQjYcBHHnvk6qU9J6I7CtDKfCu5d1oUUBR8bR
	K2Dj43HY5kmmqfKB3PRKwOBTXu2hXhInUrfu5CphfpVyqqQdMTQwhQkPQERppdMp2DmoLLQAOn5
	qsuzZKc/ICvyb6JNjqq9r1w1iqmISFXJhKITiQ/MqEhg==
X-Gm-Gg: AZFdTZfpjmrhHMI1lGd7M0eUSHptsQDmyFHWtdp1QpxliRdHBKpMiDvw5Wzwb0RlH/8
	7QM7Z2iEm73EH1o/pi1xZMtxAvU2mWgFMCGo8EmTiU7F19TxKnZ/wOPSnKZgy09G/M9W8T6ZSpN
	6VTfiRaGy5Vknz8R41kk4Jo+zYpk4UHTADPV8/GZx7TdTHQQaz9KpQIncUcSpOrz7IgCV0Z8X97
	gKz8FncwKHgP7SDiKMJN/pKW+C/7yPjn7RrD4+/Oj/52VtgOk7OkLwPlz9VWFhjtlhP8BMpeMWe
	Nu8OQ9+3q1FJen1614IhS8hNlSeG
X-Received: by 2002:a05:620a:19a2:b0:93f:5f83:2ca3 with SMTP id af79cd13be357-949bab4704emr3161346085a.54.1795639811731;
        Wed, 25 Nov 2026 12:50:11 -0800 (PST)
X-Received: by 2002:a05:620a:19a2:b0:93f:5f83:2ca3 with SMTP id
 af79cd13be357-949bab4704emr3161340885a.54.1795639811253; Wed, 25 Nov 2026
 12:50:11 -0800 (PST)
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
 <CAFEp6-35qT9Ow8SOWWBxf75geq6s169+SPJmw27TnkkD3o0wow@mail.gmail.com>
 <ff986bbe-7cb6-4733-9f95-bf788f4f1f07@linaro.org> <1f16534b-6d41-47b0-93a5-9aaadfc9402c@oss.qualcomm.com>
In-Reply-To: <1f16534b-6d41-47b0-93a5-9aaadfc9402c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 21:50:00 +0100
X-Gm-Features: Aa3M54r5e4YtrpiKqlTGITgZpLV-C59D4ietV_KMYBl2cdChQY5r1W2JV88JQmM
Message-ID: <CAFEp6-17q7nH_WYrNAg6bUMjmg0OZuxMt2E-i6aMA8huNpnHHw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA4MiBTYWx0ZWRfX2IobAQVgXPiS
 3nD/PZZ06/NoAe7LVOpPVQShKEuROtKrcZqRSjUTrOtpgdvroIw2HO6x+KshhaBdGkI82WIm7Vw
 cFxx35tQdzCzrX7Bb/4D/dM4zIr+tlHi/hnqJc8xR5B/YZW+q9fELunCC/lO3xkmbDoy7Oy/9Gf
 sOQzgy+rDII0D4whDyUiBn5O9ksksLNowS8up/AkhDFytmLilr3xrJFMZmJAXSsL/9VJVgh5NT1
 8XAT/IiHfPtXEQ3pUk1klK6uF5TdDFUXTh0nEc+4GBDnYgBMh2tN5i6A3uqqN/iQlQfLDZkk5jI
 xfTKXrnfNivjE1zMQaS/gErVYzwPF86KHXJc3y4/RQJbcwzL9jgC0RMuvddHt/xec+B+eLqtqXl
 UB+NGbN0rgzZSW/l+FSsL+5Gy0/fwA2Gq0ITw6s40MrJ8ELlS87sW81LsajyMQONUvPZNxqGhIQ
 m7ttODfHwLiiwo5gAnQ==
X-Proofpoint-GUID: ubtBd2AKuDau_DKHA4DpTZRPUhqAmUnm
X-Proofpoint-ORIG-GUID: ubtBd2AKuDau_DKHA4DpTZRPUhqAmUnm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA4MiBTYWx0ZWRfX9iLTu0Z2I0dD
 8aohMgnkKd/OeUuoS7g9smVcfHdic61iEz3EgkmngJXMS9t1gj6lkvJEtlbsO0a0zTUkerlCzZ/
 P7xxpudGXzDMdcgiUbRIS+GsMXaAsgg=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b074a04 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=4mQD8COH9B449bK-myMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250082

On Wed, Nov 25, 2026 at 8:53=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Loic, Vlad,
>
> On 11/25/2026 9:39 PM, Vladimir Zapolskiy wrote:
> > On 11/25/26 15:21, Loic Poulain wrote:
> >> Hi Gjorgji,
> >>
> >> On Wed, Nov 25, 2026 at 1:29=E2=80=AFPM Gjorgji Rosikopulos (Consultan=
t)
> >> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >>>
> >>> Hello,
> >>>
> >>> On 11/25/2026 12:19 PM, Loic Poulain wrote:
> >>>> The timestamp reported to userspace for a V4L2 event is taken when t=
he
> >>>> event is queued, which for an event signalling a hardware occurrence=
 is
> >>>> only as good as the latency between the two. A CSI decoder able to l=
atch
> >>>> the start-of-frame against the system counter knows that time to wit=
hin a
> >>>> few microseconds, whereas the interrupt handler that gets to queue t=
he
> >>>> event can be hundreds of microseconds late and is not consistent abo=
ut
> >>>> it.
> >>>>
> >>>> Take the timestamp from the event when the driver filled it in, fall=
ing
> >>>> back to the current time when the field is cleared. Drivers have had=
 no
> >>>> reason to set it so far, and every in-tree caller either uses a
> >>>> designated initialiser or memsets the event, so the field reads as z=
ero
> >>>> everywhere today.
> >>>>
> >>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>> ---
> >>>>   drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
> >>>>   include/media/v4l2-event.h           |  9 ++++++++-
> >>>>   2 files changed, 26 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4=
l2-core/v4l2-event.c
> >>>> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb07=
2d691ffd7853d9af714a 100644
> >>>> --- a/drivers/media/v4l2-core/v4l2-event.c
> >>>> +++ b/drivers/media/v4l2-core/v4l2-event.c
> >>>> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_f=
h *fh,
> >>>>        wake_up_all(&fh->wait);
> >>>>   }
> >>>>
> >>>> +/*
> >>>> + * Hardware able to timestamp the event itself reports that time in=
 the event,
> >>>> + * which is more accurate than the moment the driver gets to queue =
it. Fall
> >>>> + * back to the current time for the drivers that leave the field cl=
eared.
> >>>> + */
> >>>> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
> >>>> +{
> >>>> +     struct timespec64 ts =3D {
> >>>> +             .tv_sec =3D ev->timestamp.tv_sec,
> >>>> +             .tv_nsec =3D ev->timestamp.tv_nsec,
> >>>> +     };
> >>>> +     u64 ns =3D timespec64_to_ns(&ts);
> >>>> +
> >>>> +     return ns ? ns : ktime_get_ns();
> >>>> +}
> >>>
> >>> I think it makes sense to add an additional field for hardware-based =
timestamps.
> >>> Converting the timestamp to the monotonic time domain introduces prec=
ision loss,
> >>> so it's better to expose both to userspace and let userspace decide w=
hat to do with
> >>> them.
> >>
> >> There is no loss of precision. The timestamp is actually more tightly
> >> aligned with the actual event. So I don't see the point of having two
> >> values, with one being less precise than the other.
>
> One does not exclude the other, since there is a way for this platform
> to convert to monotonic time maybe is not an issue, but i am sure that
> there are platforms which has separate clock just for the camera hw and
> maybe make sense to propagate that to userspace.
> And if there is a hw block which can generate sync signal for other senso=
rs on
> using camera clock domain i think make sense the whole camera to operate =
on
> that domain. But those are just assumptions no real usecase as of today
> for this driver maybe.
>
>
> >
> > The hardware produced timestamp may serve as another unique id associat=
ed
> > with a data buffer, under the circumstances it might be helpful to rece=
ive
> > and rely on this kind of information.
>
> Yes this is another aspect which might be helpful.

Okay, I see what you both mean. However, the goal here is not to
change the meaning or UAPI of this timestamp. It is still referenced
as a monotonic-based timestamp, and we are not changing that.

The only change is to allow drivers that can provide a more precise
monotonic event reference to do so. Adding hardware-specific reference
timestamps is out of scope here.

Regards,
Loic
