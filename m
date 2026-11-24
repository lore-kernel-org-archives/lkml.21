Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515873;
	b=X3j7e1zfOjmY8dTCzzuGuhHFZjXWnJ5UTaGYeHWHI7yJxzHgLXsCBN2JBzWZw+loTJ2n
	 Kw91fhRoaRMwz0mfymGef5sZJFn5X2IdEmwwKVTgKkoP8nGrnR9EnHWbl8AcWvqjThWlE
	 C6dVSxEjAt/eYhywE5rI2Wgs9nomlYsYlYmsk3DA3q2bLTelV/Za0uyMerVpCyFOLmCyq
	 5iU5jHCMWv8V2ijcskoqLMKNXlE5hgPAulyCBOaDrl7BzrJWNy39qSvfSeFucqgZJDS9L
	 3g9//5DdxZhQdcAKHQpUnyhCo3+/Gg5zenPd+C6eqo207ifJxkh4a7ONHXZAKjIAY4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=;
	b=DFh74S2XxW6FlLXVwUOtsBnur946pX74DA6ieiEKdlmvSeF6PUXtizHb/fUtcNYpr7m3
	 PHFXrTEHIQR0xuYHwlG7Piuy+/Y340r/uIGN4LpRzgBAKe88xJS7lOHuQgJmYHvtjq31G
	 BqliWI0GfB169E4BPi8K+iSg9bWlbt/MKLf3hk76wABT3TerN7mMRS0yNJbMKE/k67VA4
	 8bIP1hXeMNe+F6/P6Upwp3CODQgE42+7W4YeqviVY+vFk+4dtRaKc+oPw8VSpKluD4zT9
	 Dw5virujIXqDYNGpL7IGvyQxUbciMSr8Kc9/TGfcPDBSZ+vT15Th/4guXtOgAKjOWag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlQNV63f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWRg03f8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB54606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB54606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlQNV63f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWRg03f8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8VqqB1598147
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=; b=JlQNV63fdfAmkA8E
	F74W/xAOlDgHp/fXni1zNZ9kSE9bKMJUMAVa1mKsgWOerX/Rf73cTIytq5bRMV6u
	+RE5DGG8ECKvWdHxKgmaKSO+S7zfj5j+q1BJ/DlZvijs1wBgqjqb09j2Hc9xG5rz
	eMaBCsd3qkra8xaLYl+HH8njcuutB90ALhds7Dr1rxViwWFIAW4z6FcYdxSdvexu
	Hc1J1YN6A/FUO159bpI4ocJmrlzopHygRxQnjKLL1/Ur2CbF6WWm0DSgBtoNz1gr
	Ggw27QQxHfwsIOSrN1mhDBDOqziHc9geyivC8p5jPxgDlvakZ96omlQqX2mQNKeo
	XhF3Kw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqk4ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:24:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so1020998685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:24:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515871; cv=none;
        d=google.com; s=arc-20260327;
        b=lrPCMhC1StrCUXS5lfXR9zGzloFsEq0XQEaRsVmHHC0jpmGC1UN693KYUE7WJwzLxw
         WyHqnplTwEZpj9/hpklD7scLMJsABl9/06NooQKDV/vIhB942dmC9q0xe3Lds5sN7wbq
         lAUs+HlK9uXckW8rjm3spnsG99C81z7fimc2yFvRwKdvPS/1t7waNs3SNpDUa9nYdp5Y
         HUd/Ma0V14jOeduGXD/K9NBNELUK5PGl9CghLJ1UUhFNDpQIunRJNbVTDNB6hycGV4jT
         nOOiTxL79Ez/gkjjss0Gwq43ssdZEwwD6km3cOlYVnkNKkHdlrkui5UY/JDw45ESw64i
         oENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=;
        fh=xgBatQVcXFM1Pjjp1JYAcTAZHNriOb1XtDp2GdpyDgk=;
        b=UO3qiBeEsRj9ar+6fdCZPxCHnj6GZk/Rhn/vcmHL+gMaRMO+adsMcXm4OH+5kr8S84
         jWFIA6ShYbLI/06ER98doalizyJbDOSyxupzaFMGO2lwOfytVTOJbB4p2mTSJCeXb1VG
         PdbruKCof107HTAjmE66DS/s/jUpnJ6w7DV3dvXOKq/vt8E909M5piCh0vr6+BD/vhuX
         R7FmvmHpVz5WmDJtb9GdstZqc/RNuH+UUzYOYDNX8myk80r3S0zTuHR9sTMArKtCBd9X
         96QA9w3ZYgxVZxJop2FVc2YdIQsSQOcn5Dsm39jITgY/xK577C61328J6EiJZoshxeiJ
         g1Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515871; x=1796120671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=;
        b=dWRg03f8NYLEtm9ndWiVJUGw5aMmyB81mILbdhpEKqXYWH/sIe26mdmzkbHKfFrZSe
         EkNqz5KQ9dLvdrSWJDcHmU+oCsvvg1pDUWpB1VcfpHGQKfVPthLHS7c40igkEGcRHWHA
         437CBmgCikH5SzIxseSUKnF9UarrgFzBWu+9M4oPc6bBGryNmMWne9GlC2bN2xeSvbTP
         F6IHawI93sRF2M3Osj5r4jwrs371jOFZRkLd8kLGZobMRUkJNA/gRN1CqoVax+GhMOJ2
         ClTvVeEXfka9+ha/FwbUusNxSleQKxUMz1YPm0T5QHf/uWsDvzFHQZaWcE0+lAtuqNys
         aygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515871; x=1796120671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=;
        b=KrExeH5NscBKXQeL0QHyyE8t6dRYmlaj9p7PwadROd4TAt/f+xFnGsVYK7/8Rmi4yL
         jRjWknnh5IzaB1kMRTW84bJ7spGH44yhVA8sXdZd6+BMbQnvsKpPQMJmG8UEnBb6NoCl
         l6xJhC2HbPI9ZLDLZHeTQPKU6r7BmOTpQxQWB8anqHFDcS9Xdb7E/xcrG8Jt/Czd7B6/
         IxNQ+8hc4lkG7ruW4kwR6WcAScOFnppzwZzwssgY8gfTN9b9CsCMGGHRFeIvEmg1MWC9
         RTcF3NvVMSjwUtr3DUSLOSFWv8eJZMzO/4cl5AHMH67esSKBxntaW/WrGBxFsZt9w7id
         jk4A==
X-Forwarded-Encrypted: i=1; AL+hErFkHaCDFiD1gQZSMFybD+PZBX83lcEvmd/NdQLcB/aVi+vEAsTdCEqP7hgXUE3nHqXzD8t0QzA56SimrBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eTD0x/ggt/1mHoRMJMlqLZqzBjQEcC+wVU3cHLCKI27n8naQ9
	EFWBRP2Du3wv5z0e7BF8bohhDQ5KKlqVQCZwfUYgzc+hHrvqFmaXK8tyUhil1Z4eZvI8IFrB78a
	8cPO2fHV8CcN/iVCWrTVPjM1bcC042Pmfh+M4gwKWsgm/hTuQyAHiHOFCBpBQQPCCPirH6FjHx6
	QCdUaoGX2kIYXlc4iT9yMcZWF+Rl5wWB4EfAuUDtTnOQ==
X-Gm-Gg: AZFdTZct3KNdf+1qS0yOtfwaUOXEZ74eJnDw+7QB0WcV0NmkNDF8BxehvBy0gO0VTqM
	/Mgt8KDtv72Ktarv1/vb4Athn9F+koATEpvoKBQS+DDOImfgS4lAP4GnwLmknraEsRD53C+oQzc
	njO9tvlwDPfFtlQD8pYSGI+KaGsyXVizRZZMW9lRlwmuWF+yUutsprKjy5xdjIXby3bCsKKYkj+
	VYp5hJvn56U0f44wgyD7tYCoaXz1VhDvHqhpBk7OOEhAm6Q33ClK8eqwy3AJfreU1xoMueFCJU=
X-Received: by 2002:a05:620a:1332:b0:949:402b:f1b3 with SMTP id af79cd13be357-949bab3e8f5mr2104745985a.70.1795515871206;
        Tue, 24 Nov 2026 02:24:31 -0800 (PST)
X-Received: by 2002:a05:620a:1332:b0:949:402b:f1b3 with SMTP id
 af79cd13be357-949bab3e8f5mr2104744685a.70.1795515870730; Tue, 24 Nov 2026
 02:24:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <68bf8d15-8ebe-4d19-8f77-f49ca0cb5488@linaro.org> <CAFEp6-3U+X3gE_AMqn5G0MFFsdqxRGHV+u04iiBJ0RLA_Sb8Mg@mail.gmail.com>
In-Reply-To: <CAFEp6-3U+X3gE_AMqn5G0MFFsdqxRGHV+u04iiBJ0RLA_Sb8Mg@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 11:24:20 +0100
X-Gm-Features: Aa3M54rGNgMhHGcSZuOu0EdTZ3ZT3TJojUqx1IDZ1tGmv0rflDqz2I231sb358Q
Message-ID: <CAFEp6-1pEL-wcz9omWoyqGAF55LShkUDbBxED2h565-ytZLxqQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b0565df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=LjlbsC0lBQcJaY6aMbIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX6/FRXO/u92nc
 qA5IOCUNWKNrMrJJVe43kkMmSj820j0iR+9YSA8WocBnR1h8ttT9yw9OB/iuN4TdCZT0sL0ha7K
 7X+ML7iLGtcdBSLV78D01gpDAQ71W6qmq5kiGohpobouqpHtwCjo8ePZA86E+NwT6wskLMnfVb7
 Ly5qNKW3XL9NQw0XsX3raYgUPXjuAbqtWW0mqp/jzU/Jm2mQwEMSAQqsUuU+e9pTfgJVtVykkQS
 vZJYK+nQrzKfPeONYztF/ZiUTUb90w9rdwOpdcHg4zWZUBKrEUoJIFZPHQy+m70DvKbbfUIDOVu
 GNlxESQU0XuU3XAKVe2AH+4kFjaPYQHx5MT2IbVipAnP1kVyq0SjZtff7QhuB9ciN7aQRWx6MeX
 UtIboOTajwssAHgvrS73stfRsVzaX2b6z1On81PXv041Y3V2RfAqDU8sugTzLsRSSBIAnD/GKoE
 3QaBeGaYav/4ghqQsAw==
X-Proofpoint-GUID: CP_sF1TvQndRUAElHTJ6TqOp_sC73U4g
X-Proofpoint-ORIG-GUID: CP_sF1TvQndRUAElHTJ6TqOp_sC73U4g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfXxiOlDI7PrPHC
 HH5Ux6+/wI+z+sPORxBCHB7DkCxRdaFnnH1+FCh6uvOo0mrgyja31Vpg2hISTIZjBJx+xHuwDae
 12GqlmjHcmwIhZ2KSmBEu1ItBCC1mXA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Tue, Nov 24, 2026 at 11:21=E2=80=AFAM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> On Tue, Nov 24, 2026 at 10:59=E2=80=AFAM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
> >
> > On 23/11/2026 17:16, Loic Poulain wrote:
> > > The CAMSS CSID latches the ARM architected counter on every start of
> > > frame. This series exposes that time to userspace, both through the
> > > V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
> > >
> > > Until now both were taken when the interrupt was handled, or worse, w=
hen
> > > the frame had finished being written out to memory, which is about a
> > > frame period late. The hardware value is free of interrupt latency an=
d
> > > is directly comparable with CLOCK_MONOTONIC, so it can be correlated
> > > with other timestamped data such as IMU samples.
> > >
> > > Patch 1 lets a driver fill in the timestamp of a V4L2 event instead o=
f
> > > having the core take it. Patch 2 passes the SOF time down to the comm=
on
> > > CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
> > > Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
> > > uses the same time to stamp the captured buffers.
> > >
> > > Patches 4 and 5 are picked from the timestamp support Bryan shared
> > > earlier, with patch 5 adapted to use the conversion helper added in
> > > patch 2 rather than its own.
> > >
> > > Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > ---
> > > Bryan O'Donoghue (2):
> > >        media: camss: Define timestamp registers for csid-gen2
> > >        media: camss: csid-gen2: Report the hardware SOF timestamp
> > >
> > > Loic Poulain (4):
> > >        media: v4l2-event: Allow drivers to provide the event timestam=
p
> > >        media: qcom: camss: csid: Pass the SOF time to csid_sof_event(=
)
> > >        media: qcom: camss: csid-340: Report the hardware SOF timestam=
p
> > >        media: qcom: camss: Timestamp buffers at start of frame
> > So I was offlining this change and kind of left it at comments I
> > received to make the type of timestamp selectable on a per-buffer basis=
.
> >
> > IDK if that's really required for a first pass but, its where my own
> > reviews were left at that time.
>
> I can imagine this being useful in some scenarios, but today the
> timestamp source is configured per queue, and there is no userspace
> API to select or switch between timestamp source flags AFIK. So I
> would consider support for that to be out of scope for this series.

Ah, and that makes me think we may want to tag our timestamp as SOE now.

Regards,
Loic

>
> >
> > ---
> > bod
