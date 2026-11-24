Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515722;
	b=a5nxvPTObrukzZzIHQ5rBnoeqQINiQELY9REBvfTME0ETCqGnGmEsxNgeffTuBskCTKw
	 vh4WQf5N2EZ+x+FSyQ1Y+gVnIeIlIRp3H4aQmvaTnRidsv9woCVUoip+1C+keD+ygQrXZ
	 lqUuOm4cBIa560NH7y8WoezxfTJC00EAROp+4zR66yZx/8McRDJRx1Jq9J4DfogulKFH9
	 OMmFoyBeB11RAAIwUUE2ADpaSuPAsDY8mOLHifn4zYJWMjF++HqjWJGr7ZoTzx3RgVztp
	 ZzZV3eh5xRjsSjpyEmf6Enr/tocf349MUik4Sj6GNDtIO7GqqQwW1/uA/FJqv1sK21Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515722;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=;
	b=mUJm1A7FvrZOwDAau1jH1oCSX0ncYpKpzpQ/lh20JNkgLUjXD52uvCQZ2JWbT0aovrEU
	 jOIwqxgGmhOLFCVuuwiM3kz34y7r4aX0g2v4vxahR7swioORxagMDTyP1ez/4NqxoAoRh
	 fsNK85TzzevIyr/XsVItx7n9G2tkryJaN1IttxR4MPB7MgEegUrs3gIZ0Ix6yu8qrgKoq
	 QLtwWsjvDkIVpVKhqIuXIsLwkeoPlV7aNf7/yhqQH8LXjfDOlAsSI1plDyXgicHj8XvPu
	 69QxJqEpMmENBSy0JxlRBu318/OoRnFs/YrqpNu2sqZ+acPkJJJHo4PuQ1LqdsfksXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Maeno0M7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arXcqM4P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBE0606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FBE0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Maeno0M7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arXcqM4P
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5lpqM2848086
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=; b=Maeno0M7egfWc/gw
	YJfKWrbbwE0V0jXsr/jkC/8aUibpWhpQV2aMDJxgLrFUmzmfwQJQLLrCzHiIzBFK
	OutSQg0eNIlM8+1E3WoC4zNXv0xCDpqXiGtJV8WBZPxm7pq5j+gYVBGkBVRH2Pya
	pHyS6TD8fyoIvoRMXE583yh3cbG7Y6hxySkKD7x7+DRnIfU+PhzCq6eNkK3hwMnp
	CSIyRU+3O7aEswruaGLX/T9GjHKCT26p7sqpxRYwjdmGt4VE537MGUgZgii+rWwJ
	kc+6gSG5rGYKu9rkwdntxNd9Dtlypd4pEOwnuw2VAErv2EQG/S+96DX2dF2i1Md7
	D/qv/A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh945m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:22:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-947a607ec40so413731985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:22:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515719; cv=none;
        d=google.com; s=arc-20260327;
        b=KVq/1HdCufxbLK9mqvKbo1kduVpDNMKfut68FLLrpASSXXE0wvwAiK7OkIdTNHot8l
         VHGZqhJaQcQ1cFo3Xb9ZIDEbDeIgiWOTOA15j3Jo2BY89KPX4wIU4vo/4yQk5EZsa7fx
         JrTDP/oKpNEs7WOWv16eicuv5eqYyO3DsoG0J9Oa/Bkdhv1gE7MSPzsl10oPLumeRRMB
         nRfZy1eZ4oHyEtLuuEed+4DaO4qxh0kBFl2S6T2yV2uf8CbKpXro9dHFHQNSWurYyFJz
         CF5lQDo1cYjm8oWCEfhCbJOFx2sUT+bbwSO48MK+rIMg+yc04ckDfkjG0MjDNkLpu/Dn
         aK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=;
        fh=STU5DZIN4TJWnXxpRZzIzGUXG1SVIK0g9JoUkNwsuPI=;
        b=qI70GVQ1/N/p0Zdnd3eVN/7D7WwiFtz9gR/kfUkjMSmMQoq+cI2Xwi6l7SOxSxS9pi
         dLJy2X+UQHixl3hJY65eU5hkMIVo1omprFskWAWJXtdRP99+jXOMNVyt7Yd0xRirGZPt
         YbkdB1nFrifVeqx+nc/ZbdNT/Hw/gJEvRBzBTt1g/+l0hQT2nJJuHmTxc5F1yFeNLvdh
         9FjFfk3j3NzIfb/jWM9V5tzrqxYmPVmfXlFy/k6VmewB4nXjsBdT90OwkYcJ+ap+LXij
         xC8vfaoLX77qXebjR7YoIv4tGpFz8yxqfNcvdyymFuDF3cqgj79bh9fURealO7PPN8Ka
         8wPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515719; x=1796120519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=;
        b=arXcqM4PtvqJMToAas3UnkQL5ZycL7YiJRLd0pJfixRD7XK8Upevc8m1QNug/s/qC1
         qYqMUg9eFJJT6PkCDWIfn1XZP0t6A2O9pWVoW9Z1u0gW2fQhTXkI+QZ4w/H3dSmPOtSl
         Cr4IfRhDvTY697j/bGQG5GZrsMT2WO1C4c2ZrJ1GsLtc+4HlLY8TYyEtUPrtfW065jOA
         UynBNduUScoPHAo+AWH7riu6MmZEd/Yk2SewAI9V82rqvHuA5R06DLHKP5WllgM3FxOM
         iWnvWSMPc13WGIo1YzzyjGrF2lOAO4PGVWK5Sug5QJsHYAZ6v+kbN0k6U7imv1kaMb9Q
         U8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515719; x=1796120519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=;
        b=zUv8qMKN43mtPDG6witI7ZmU30HsNXE9CLqnxjyvA/oa+3cdpJjUdSbLn+LQXiNp1U
         Zj2uGuxq6HLWyMm0eJ8WPcWsP9ESjFSAAUkLvnofYRsEnV2emxTwFmzpVw9wLoWnSz/6
         vROINDu0Fkvp+HjQZJ9Ym1zAYLEY4dpzFZblwxSmrU0Yjg6bSHjb9QGuJWInudy6TKkI
         JgIjyAMSDTt+pytZGEWWAlpVhknwjcY6Y4Fl8qpynyIAC6wdxnx08raNc07PadxbzElX
         eMhACsG9+ITvYsuw5cMcaDxuhoWQ7w6HQKEI509y/SLNQI0Jkmdp8Zv5HGNrq0VBCsUo
         uLSQ==
X-Forwarded-Encrypted: i=1; AL+hErEtbpZZiofRSVx+xIYfTenUNOrF0e/h2912amlJ7E6uWfPbIKwVR5kxr5Y/WTf8RIL5PkDHlml+8QNGnYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z99bS26qJh0z+cXTlFj3gU+g1+ncq9EkU/qb9y11nOVxsKvjesc
	gqSOZ2FTWB8I3J5Wm4z5kTpbmuNlz2dWqeHwYHiVJ8J0RXvFODwV7K6QRENT1/HgG0Z5as8HzF0
	v2InJRjIhXAMCZBDSDuqx927TtjKqAYd6nrOldjjNwoI/mxVDOEszQfk+xdXY84hf589C/YK+79
	4ZQ8QGF01myc4uoBOmSO90JUZgCLGayEqIUYJSjc5Vsg==
X-Gm-Gg: AZFdTZekP5ixbncNBNoJht+8M6n4VSTa4TWcLH0sDZ6dYvxQDkwgHOwOgrYqDOprOPz
	/cK7W9jcWKSz1B5apE7T4z7m4u2q3Qepef6xYKeoZt8tL6Dbm4YEt4nln8jTurLP56nz6zELqLo
	d7vmXijx0wO8xYqD8cp/9+LjLZa94/MdjhBsfd140qUE8BuA+YFE+wm2QFJ4kPrP5u7g6TA9uLy
	BwD5kkPJnxUYZWyI7VKgvGmGj3yDWfT3btZKL5sIX8wT35kEty4cc1NgY9pHXc58CgVkYzizPM=
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id af79cd13be357-949ba9b8ee1mr2412736485a.17.1795515719385;
        Tue, 24 Nov 2026 02:21:59 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id
 af79cd13be357-949ba9b8ee1mr2412733485a.17.1795515718861; Tue, 24 Nov 2026
 02:21:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com> <68bf8d15-8ebe-4d19-8f77-f49ca0cb5488@linaro.org>
In-Reply-To: <68bf8d15-8ebe-4d19-8f77-f49ca0cb5488@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 11:21:48 +0100
X-Gm-Features: Aa3M54qBladabWaKAiUVgu7mNQ_hH4u1R6Ts0EudGSzaq5ubVgXuNh7aq7E1tyM
Message-ID: <CAFEp6-3U+X3gE_AMqn5G0MFFsdqxRGHV+u04iiBJ0RLA_Sb8Mg@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b056548 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NSeZ0p6lN-NMaJu6_AAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfXzaXFgpq1bSVu
 5KsU9cEg4ueZKbOanwOhGNhd9cOMyy6C7rH2GC9RyQz5BbWvyVtkBPKoa2H49k+bJi2ZKm11JRL
 p8VPby8cqWxe24CYoL96udvg4qHSBdI=
X-Proofpoint-GUID: dTlDUaxFCUzvVG7N--qvKGwSZjicq7zP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfXzWegpwkSBkeX
 omJqNk7INMuppKWsg3wWM/V3FjLKz2PW0516lOWeH6aYGo3Mzs95keoiG+4u7vXIsTXQhlJIbRP
 2e+oxBDVy0ul+j5xYroXrn2pMrfaNmqF3Jj8KqQ6lVaNzxB6nehOjTK6u4aRK3lLQzT3hTcxL+S
 nEHMQCSi0DooV5wqZvQRgxFFqJOZa5guV2zWnOiQWYYAKmGSTFZ1jMAcfGYvwj25jkmuC6pJ1Cs
 BUTJMmlNsqgmda18+B8GIxwgr9ZxhSjRrsSDsCZ1APndT5iz1fYVsEySiipoFk6JpJeTVFa8xAV
 R4qreYjQz/as9TbQlJTz7QIxB1mO94Wy0qTKebg/rVBnzivdjGvCuKZYdztqmns04nkCIIA6rb5
 9gsZqRS1F+s3NATwrXy57h6jeoX5mEqsnZ3haVoZLCPiJjGd407a3hZcnbjQzr2djgype7Xu8sD
 GNXPA9XJuusZi0bf55w==
X-Proofpoint-ORIG-GUID: dTlDUaxFCUzvVG7N--qvKGwSZjicq7zP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Tue, Nov 24, 2026 at 10:59=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 23/11/2026 17:16, Loic Poulain wrote:
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
> >        media: camss: Define timestamp registers for csid-gen2
> >        media: camss: csid-gen2: Report the hardware SOF timestamp
> >
> > Loic Poulain (4):
> >        media: v4l2-event: Allow drivers to provide the event timestamp
> >        media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
> >        media: qcom: camss: csid-340: Report the hardware SOF timestamp
> >        media: qcom: camss: Timestamp buffers at start of frame
> So I was offlining this change and kind of left it at comments I
> received to make the type of timestamp selectable on a per-buffer basis.
>
> IDK if that's really required for a first pass but, its where my own
> reviews were left at that time.

I can imagine this being useful in some scenarios, but today the
timestamp source is configured per queue, and there is no userspace
API to select or switch between timestamp source flags AFIK. So I
would consider support for that to be out of scope for this series.

>
> ---
> bod
