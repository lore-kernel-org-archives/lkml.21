Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795522815;
	b=I0uhEfcWb3CShMaTS7TiRJaYizJOBZ7wYQzivopSE9yUk+yFgd1IS+qI/V91oYWYMPKq
	 fsGnha8lqbAS24DwAyZz49AVsmLJBJUMJqk+Pz7A8tj/s9HP0JV6CQaRYVYE3x0b8Qrfa
	 WGDTHpxevBHGRS6s4QLi86uNvkKE0UpFZaeEI5vKo+v1ATmcaZfb/mi3MI99aqORuCvxr
	 9/rACAi8UE8DBaR1OH2rb/tRGmBz3LGcQfeSJX+Oo903y869wV7Jw2NE9PeXX4IXqppaI
	 JeWCkH9KBVUG66QdXIsprPvUaAf2VyET4zLhPJchL++BqhE+MxESKca8Qw7uAJ3DJog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=;
	b=W+BXmxa9ZsRhxNaos216JlPm2z1NnPYvLcIkDs6yd5sRzSOLPX3TmxF6ebHBrCh/GOdL
	 9nbGbNsr3y5MG76fueXT0qRnLFzSINdmo0V3AThewQkrCGpa8VVrk+SQ9WDNirB3V+dmr
	 LMAecPu9J2tQQOm6TxnSoLw6Y4Q1cO27uVXuvEm+CNplEu2qCqlysl3+zEd4x4gclLVly
	 UEUvzBZnjxfK+B/KfUVXxSE3RX2nX01GzWyuTGTy9VQoKsFl9Kh17r0yFFNZiIdwj5Qto
	 L25BINxZX+tqWPlcFNaZZ1OVXuPPCEC9767jYVwxnjeMGETDXn6dlpyEU4eV8avceBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kov+r1Qf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uq3T142L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946C5606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 946C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kov+r1Qf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uq3T142L
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAusSv749660
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=; b=Kov+r1QftyYH8jVC
	ajyBFw9xfcFUWym0xUhvCQugPqW5GDZBQ4reTqVxtrPbxtaKIINvSY8i99njlFcW
	5LVYJ6JhL3eQOO2YJ6/mnqS5aSZOIuk9GpdEl40tWAGYCGzuKAzOhNKcWHSo8khg
	VTLQ/hIT23fABK8PwKqDcvyDnyOmEsRM1WgGFKr+R/62ytzjLgwe4HXL/tlSJ1j6
	KshTRS1ofmHvR15Sjr8pUsmpbQk9j+8Rj1lmdpEXw9BnxwVs9P/ZTMBor4nVdKoy
	w3uuBcbZcOHbmz6xGhK3kgmxPrfezM/8CWz0vK+pspCoqcQNxOrIldAlM/wbM3sA
	HC+KnA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb2nmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:20:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so662970085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795522813; cv=none;
        d=google.com; s=arc-20260327;
        b=pO+AZz25Q5t69QlZXDaUULpb7Q+tkma51KsVB8wNf7y1nqWcB6bR0WoSOXB02MC+kV
         t4vTj3pHBf49HwZlRrE2cCNt2UbhWLN8CPEq3uE65IlAdawYbblSeCI7dCXY8Vx/nlWs
         qOF45nepxBYUIJiOGnB3M9E+UjT2iFK4xoL9KBM0AsUqIoiksyVQ/DxB+6I28kbKMGiZ
         UN9fJ/hFRHnfoG7p14oOwYzJXgMdQrJQ4k9B/Ao7sxGijCYvW+boHL8gEVGjDlYmEzhO
         U4TcGEAuje/ri+NpqRyBgoEx6sKiDGrVWxOxKipg1uQajggNJSeCrLP3DpOowGmsoOEs
         PJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=;
        fh=g8MNlH9sk7+QTwGPFBOUwx2zNrcYyz/hma2kpmOM/do=;
        b=dwHAklDtPowITOW6d/Ud3J8Pvg5FTWu7rIK5wP5dskYNv+33Vd/hmO0D2euXgEadtN
         FMlIeuEm39N+U6gLx3niICu2lIYtyDwf/ZobBjMNNfAmc0VsKccyg42B5fdObjrZjpEn
         /XKZ01iE+p7BFV131/3zT+yIl8Ym5BZrj+VMlbY7xxlMZbm8djpKNoa+F0xUsjTqbcqC
         UpOe9EHKnzFf8xVzdgcORxCM0b9GX1c7YGbe54v+FeC4Ik72rMuor6qbI5x9nKUZ3Is7
         1ra7EFDmejtifHp284ewHFqKyMEdtGx3ypATkVNa2G8ebvgTyg3uNFIW60Y65e1ndn3k
         uh+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522813; x=1796127613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=;
        b=Uq3T142LKQPjbCOfDd1a+BjmbQgQ4kQXDVsgVmy2CSd5ubQX1Ez48OkbtTNIq/0DKU
         jWyuA13VUhJoJyC6l1QsqDLsimjb5OcmRFwQtNMxHrnU9ZAHwrdIgiby+gWR9OmqaOVv
         KqL00C4VqSe1/Xbxg/9qZgHFBiv/D6YOkQ8XQ29kmFWS7149Wxqd2D82JV0x1Js1bGm4
         PGTNu8rd2DiPR3XdgHfaFVAkGzyoAGjkTshnXhShmAa5xmhA6lf+XRZqbC3ocRw/wsfO
         r3v+Twnlo6Un8B+XRXqnu3IO+4ffamrsUHPYxUjpsRt+ek6tgZIbxL7r5OOSEiWq5i1v
         hCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522813; x=1796127613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=;
        b=D1U/iBRApbADL8B/cSHjgwg+xYi5btyn8hJB2uC6aft2AjXkILMkRNzNZ9DGpNzyd1
         ea9+mOMnBwVLh7KcIk0q4ZWdg7AJENKPPdi8ZTXJ7Gowu0yCTR3YiZMqJHav/BI0IQ30
         eS+YdBTLS/1LPiPl4ktL7CKMl1FuA76NKp5jvqmDYYIiJVVUm6DPWRtArmgS9b2Rckw3
         eMDFANOs/JuFj6rZVpMLzLIV6BVecAFdS+XDv9qoS9ifcQPeMbc0AQAarI2KOnflZ84w
         gyzMSCsnl2KAG26ejx+2yc2i/t7PZoJY8wUw+RWYcoXMyXm7PUIMsNlOo7DJyl11CiCO
         oYuQ==
X-Forwarded-Encrypted: i=1; AL+hErHn5QmBpxZGdANVbJjrxC+VD2LoM+jmuMbydDzKIsVxBCizzvUs2rSZrjliFU8zNQ7hRJxwmk7srKFB8YI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ThQHNxnhlkRwoKWNPFSu8QpwyVJL9tK5EekDCkYANAvUxdXK2
	id+VKcQ5lsoRe1n2lsVFx3Bvn4m5zRAoETlWxbq9S7+wAiVcC2gF2LeT4hMVDWNrKghf1+diQS2
	7MeCOmRHzkF1p/7vXNCsxam62F1425grFsnqlPOeh0BtpgWs8QJjB9FCaE+xWskwXDkZ8chOc0O
	3hsbWUZyk4LSZx8GF3q5RqW3Q1qRTQdpYUjvKxkoczag==
X-Gm-Gg: AZFdTZfXcZmbhWZLo0aGeNCx6+iTb7yn7pSPP7FzNXwAHqHUOYBblaPnEfy8bLAd9Mz
	p2EQacHH5LN5J7URqN8/gXSzjoKhXnorwu/gySg76u+rHXKK95s8lR19RB3+idogAuRgWsNcJlk
	TX45yjKBDy8dQvGHdTX0l4+EcIejZks5gdlMYuUaB1FwTFFzWYYcDIY3UnxzfESF4HzdoScuT1H
	b3kxzHbLpNPNt7MgodJMzV42R1njwV5HVXU6c722gQII0x8aGa+B/ndMwIeM9tEITe80pUSH5s=
X-Received: by 2002:a05:620a:6c88:b0:949:3644:edc0 with SMTP id af79cd13be357-949ba9c6825mr2317508085a.17.1795522812716;
        Tue, 24 Nov 2026 04:20:12 -0800 (PST)
X-Received: by 2002:a05:620a:6c88:b0:949:3644:edc0 with SMTP id
 af79cd13be357-949ba9c6825mr2317501185a.17.1795522812198; Tue, 24 Nov 2026
 04:20:12 -0800 (PST)
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
 <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com> <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
In-Reply-To: <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:20:00 +0100
X-Gm-Features: Aa3M54pX1s8pai2gj6XcjiFfq8IfONplkCIxIiTV-7ktwGrAeuzyti2xMDsPav8
Message-ID: <CAFEp6-1otVCjNJgWLTiOMQpdy1t4qJUP6_NK0CuifrN+cOTTcA@mail.gmail.com>
Subject: Re: [PATCH 3/6] media: qcom: camss: csid-340: Report the hardware SOF timestamp
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b0580fd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8 a=ifR-Ftivm_Zkcip0b6QA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5y5a5TJzBTtppSjFoh-LkuMNuS5_nfGK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX1P0PttMxsurW
 f/p17fShYTAGu8HN1gO1JowEmQ9xAUbBxtLHuy4Umg0XkdmA+nREsbnua4jvW1C8qfJL8FqyDa7
 XyyG9MU7h8cDQlb9SSpkUo1J5upmwhQ=
X-Proofpoint-GUID: 5y5a5TJzBTtppSjFoh-LkuMNuS5_nfGK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX4G+Py2Myicyt
 pKPfyjFD8Mv6V+KDf3eWE75xAQeMpjKQGmxC2w0lxezS7GVWd7B9+Gd1GFJNBogmphLbDeKiw7s
 266JNwd9T1OTKGxPwDugjtucqKthIAPgofcc7AAWnF1aRNwO15nUr3k6l439hQdubTZFPbThFMM
 AlphjoZdG+JifaYdXFWnJTOY5AgUNIgmErxd5kusUgozUdcZakq1uEnwXu9zsiCPoi/eKIsSSdU
 /rRjVLU4+IuSTfMekrmc0Rq9k3pYVrcRTFfhJ0NmQj7VKXDmMaYhot6tO7FVg9cIbfdeZ8rM72e
 lSatO39p+Bo6/mJwARsftcKghWFdeN95AuVg3CYAN5maycQsXTO4bOp8LuOeumbWKF/4Uq/dANz
 YC3gKPqS2PXIttbNakS8l2Y/h4xeXnIGFUKItF8S5z4U7LWms5O4Dl4tST8V0r2dBb/mk7wgrkW
 o3EBnijQ14FJP1ueoog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

On Tue, Nov 24, 2026 at 10:57=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 23/11/2026 17:16, Loic Poulain wrote:
> > +static u64 __csid_sof_timestamp(struct csid_device *csid, enum csid_if=
ace iface)
> > +{
> > +     u32 lo, hi;
> > +
> > +     /*
> > +      * The pair is latched on SOF rather than counting, so it can be =
read
> > +      * one word at a time without tearing.
> > +      */
> > +     lo =3D readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface)=
);
> > +     hi =3D readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface)=
);
> > +
> > +     return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
> > +}
> > +
> >   static irqreturn_t csid_isr(int irq, void *dev)
> >   {
> >       struct csid_device *csid =3D dev;
> > @@ -207,7 +234,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
> >               iface_val |=3D status;
> >
> >               if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
> > -                     csid_sof_event(csid, i, 0);
> > +                     csid_sof_event(csid, i, __csid_sof_timestamp(csid=
, iface));
> >       }
>
> I think a callback in csid_sof_event() might be cleaner or some other
> way to not have to replicate all of __csid_sof_timestamp() for each CSI
> decoder.

I added it as a parameter because it is provided in much the same way
as the sequence number, given that the timestamp is directly related
to and coupled with it. So it is not clearly obvious why the sequence
number should be passed as a parameter while the timestamp should not.

So yes we could also introduce a hw_ops callback, but that would
ultimately require replicating the implementation for each CSI decoder
anyway, or having some semi-shared helpers.

Regards,
Loic

>
> ---
> bod
