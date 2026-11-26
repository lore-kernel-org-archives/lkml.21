Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795708928;
	b=4DvombAxGEESAVipmCjyyCibPXiACHUQTQ5kI5GEbhZ74TQDts7srB5mKz14C13LCNKR
	 s5wqMBvkYSQCd9MOz0iKo+8208WNalFD78Rlle8Hm17PbKRIqEShySjTodG3/+B/OrUQf
	 1AW4PAhetU3fjDKCQLxDl056amnDmdL4R7YfZujNB8GRaGp5mfsWBaHfOyymr1HND4xwt
	 AXNgddJ1ELhFW8gk4TVL/WBQgAsEK9nqK99fH/5lwhKeQj/eOWzPRmjytr5PKRahKxHpA
	 0bC1/epEO53JyfcqL4lNq630fNsO9QkfqEeFJ/JM6aieaE8NyaMT+equ+Fpft1QR6IQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708928;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=;
	b=3SY6cfU/d3+W5bea8j/NBFY4M3urXb82gb3B0Fesubjg9VfXy9b5ELb39Eim4MYWMpQZ
	 3Ru+rvBU1FuQW4xbT5UcbpNGXutsV+koyEoPaXM7tXn8I7HsvKhfeFM6n+DSxV1ofd+kt
	 RF/hrV1Hy4zReFtTlIfsKl7M31WtaJJN4MxjW0x8CzcLsPJ4j+DvSPcveOuuPPnTq1P7p
	 suk/s4r7u5i5MkwjgaGI0ufuOy273H+XQ7MM5mMmA9SEQplB4JB4FbkecmhCwx5ABgK1S
	 kNOT/xbT4ZRuxKbyeoXkQPFXv8kKE7uX9Tz8ZoIw2cYPPKNJxkjYBYBEMDGN6wkSEaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MH+xYPwB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ajVpoeiZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6DB606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B6DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MH+xYPwB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ajVpoeiZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuBRl1847909
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=; b=MH+xYPwBCG/SjU3j
	2NdNOS8uSO+nbNsKGh88+fn5vGTMLM1MBqpM/d5H8Rqfx0fp0kcF0+N0rgr7m3Cz
	qrPqiI8kTp0pZkZ4gwkxHjV2zuB0BTU+hdXa1XfrgyBmK3crnI+t82/3Pn3AFjGE
	K2J/Wp2VzT98l2yimS+DNUuJ3xzPn7k4R8lNg3VcniRAxgkPwqSANTf74zXa4dxh
	ibkM1GPOf2/+QQA5irEaIeMi3FVmdd9Pkf1V09pzXsHrjNyWETiUCvNx36C8SMTw
	lhKwhxHy3dWWiPbNTQd7EaOcEo2kefEPt1FDdMEGKiYhYvlaXt6kvgBlRBfQdj4+
	0T5+RA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7sxtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:02:06 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-869553205a7so91967067b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:02:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795708926; cv=none;
        d=google.com; s=arc-20260327;
        b=DOCMZ7s9NqrWezlz60MuhXUt5/DNWV98ZBdqAcxtaatyTawlwrlB/N6nfsT2mTg8qj
         X8VsN8bHlDuHAPrxOpZ2O4SLEr/ir4wfNQ3L1tZJWQUTJ/ui90DUDyviKMhZYK3xBfPM
         OT2z3TblgrvuLRIoBlEUsW+kaZXx4LXVJUIkJflmx/i2FQcfHAWJlId4mY3+WAEd/yO+
         e2z0UTQDvgfhjiB1ccBmxcmq1a8x07+DD0R8lWy5Xqu8ZO3waSAcDyP5bv9V8a+ZYeCZ
         80++f4SrjnearMOB9evyU8JsY+o4qy6sGAriGS5ChK+lF+Skop+Niml3V9zfkwnFg/lF
         xfdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=;
        fh=NDLnp8CgQeLZwLP8hnEqFUhjERrSnuWRKKctNrMGQEs=;
        b=av6AuxpfNwKQ3euObNDUvUeMY6EcT6zxKAOae/LbZmalZXDc8kUexDNZnrFNSGLwlT
         dNOcHjYzY6tkZEa+esaA3NZlGkAUyTQrMp2rQlSCnQES2iThSLT/ibW6AkaOmrtgdyP7
         wMzBs22RNclRkMRPIagv+2XR4G958LaRdqUJB4+EWjKkXMRF6G9ThkpY3us09raG2Fmd
         DypLvOX+0IIFILtEScyq4INMPVeyO6eInTtL4N7UIiswNphDHV/AeeQH3tOViVp0p8sg
         QsQI/I3kMUmd6E0/lvBEAFa7Dbv9oGy8en+Ormxr8ID7yKqcVD8AIWLHcdSNwKVsQxth
         Rc5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795708926; x=1796313726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=;
        b=ajVpoeiZU3MS33/KqP0BPvdKRrh9TE/zJEpDjdInuZhlgVGwPkkMx0KKRQAeOcwsjW
         nFf2QKstiUd1R5sxsi9A/v33GU47peZ0cUavdUcvBsaVOpsPiiL6nQU1Gh1/glGwJCWq
         hNd3YJ4rWahyQnvWVNt+TMWZ705sKd1IWosHB9HdNgRjpPboCXTc7wanzKhfiqH2E1M4
         kQTqC2zlgBUbtcJBq8d6o/kGjHxVIIoFgWoZ7MzlGycc60iT8qr4sJdlAsrbhVORrzxz
         lIz7GWbPDi+IkR2mIz+RDKD1to10QEQUSladBozZCM3mhlf+3xaSh6aTlOz/LBgMhPF7
         uUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708926; x=1796313726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eE+bJaSRmIIU9AssWOZUoI3p9mJoM2Lcz2CzEm2YoJA=;
        b=TL0hXWhSXnnLTBRacyHAyHSNRnAx4jr4VvCLokNx0J11qIlbgoIMpuynXdmTCT2lma
         rJ+3ZXgtkH888exAc7WLEOIa2ZYxoLBKRiURFu1KYG5uTXDoG8HPFGT75HwnoZ1H3swO
         oKUfCYsr62gmieoRsUb69ObxByQYiOhNfF7DR8/ExIbmY8Ar/Wh9ocLoarbmLnU12l1Q
         w3cekHHDk+WczTfuIaDDWzzFMaKuuXMUd6ZWlFJUGQS84a73R69LPMKWRYUsfnytLqGe
         B+k9u/vrIdQgto4QSLbu+M61862zz1+I5NHep7prHVRzw2dbh9hGOi0KWeeTWy5OPbj3
         uDNg==
X-Forwarded-Encrypted: i=1; AL+hErEcctF8B53XEWuypc6NmBzdauIsEwbfIAYK5cfN8kjRhA0cWh9OgnPf16+GDHBJieb8uuTwq6E7gwyRDKo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1COyNYSkC4nTZGLEie5LwdwzTDF/4M6ddEdsiYce4JhyPcMdc
	iO9gXVzzdccNyzTuVFXrVYFTss+T1ef5pU8p5nMqFqpScKHnkseVwAuR3tp778M5kIzflX00D10
	x4hKm+/HAas5go4HJv5mYfiq3Y0m7yzrIbWzMC/M3LVQghNd5ZKtO3eqiy/umkPknE1e3CAPHtz
	T0iR2AcQsrf+HB89dOZgLu2UFKdl4JpssBUhNttflpaA==
X-Gm-Gg: AZFdTZfS7tdgrIKD9Y2oX0TeT/gBRKLNX6+tr8SxleF3qQP6Q+PATqvpUFCL2YvhxqX
	rRyjyGtJ21amZze4+SDteR0xlUk5vMnOnvGZwZ7kcfa5LNST2JbwgB2yaXMULvE608Mcz4ndvj4
	0B1lErVqBQA1MkqzafdRdrPCNM0je1EMCIb+aFvcio+TmyxoVuXpXYnePqnXUqwvVzOk0tTtAXI
	ZV7VLNssD0/zlrWHHiC5mIFa+9YS8e5vpXLdoVpOS98RF2DwAa+BvN8AW8XcIhIiVC0oQB8S5pO
X-Received: by 2002:a05:690c:7348:b0:8b4:cba5:fd6c with SMTP id 00721157ae682-8b52044065amr97501157b3.22.1795708925864;
        Thu, 26 Nov 2026 08:02:05 -0800 (PST)
X-Received: by 2002:a05:690c:7348:b0:8b4:cba5:fd6c with SMTP id
 00721157ae682-8b52044065amr97500147b3.22.1795708925311; Thu, 26 Nov 2026
 08:02:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com> <5e83a95f-72fc-4a5c-877a-9238f76df192@oss.qualcomm.com>
In-Reply-To: <5e83a95f-72fc-4a5c-877a-9238f76df192@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 17:01:54 +0100
X-Gm-Features: Aa3M54ozjhMAAIRiMG-A1E2xZ-DmwTbX9lpZ7R2j6rBAFsZAM3Zkf6dIszSnsmo
Message-ID: <CAFEp6-2b48rEz5ozY8C5YGH_mWJQov1X64S=M=Fv2c+WCWHM=A@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MiBTYWx0ZWRfX8cDxLSWliWii
 sMVoxlaK2o8+0R5hxDHy98HBARiYQLehCozl0Q91SBWYPvz6qukqaMdFt5sDrCeEAplA2Uvdof7
 6+obg6METrRJgVUGi+xlq0U014lc/oU=
X-Proofpoint-GUID: ZI0x2waU0o8LvJR4JNkmOOZOoY46yDgs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MiBTYWx0ZWRfX6JMH8Y36EKvt
 x6aUGDfxi5ybmgOxz1mKUmPEnlb86yd75Mv0dhnlcoTJ+nivM7e0b9soIm5rTZEPo0Z0TC8igzb
 uw2W/gt8Fvc5SKiNUAB0IbefKTRWipCRNT+TJB/aoMCRtzrS3pMf4uvVeVf72NHnLDYPNfx6Zj1
 pOctr9o70k8AFHwG+35oVGM38jiU2WuIPw0gIBYduzsqz6MMzKIwfIt2D4kOCvQhDWLTlZnHf8c
 Fz42EmGTV9STRAICizgxizmnoLEwIunqynVxTkJrWS8GJd9LuMH0sSSVFCnyi5WUNf8GvGxEfxi
 C9A/OWX4tmeC7GdDtM2kQdO99Tnj/2Nqt9v+FRgk6QsdRbb2tWZyfxYEXldJRCSX4ipxZySDJih
 9DKw4+HxChcSh2Dh+HU2RzCQvSiMZJmz4nK98ftFrBV/BX/XfcCxnX8nwAyLLwXjt0SDNYxVajZ
 UXsNVJH4oum3rBdNTIw==
X-Proofpoint-ORIG-GUID: ZI0x2waU0o8LvJR4JNkmOOZOoY46yDgs
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b0857fe cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=1cAfef3_83k28a0CgYwA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260062

On Thu, Nov 26, 2026 at 9:16=E2=80=AFAM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 11/20/2026 4:41 PM, Kang Yang wrote:
>
> > @@ -8170,9 +8177,13 @@ static void ath10k_reconfig_complete(struct ieee=
80211_hw *hw,
> >               ar->state =3D ATH10K_STATE_ON;
> >               ieee80211_wake_queues(ar->hw);
> >
> > +             /* Cancel the deadline monitor first so it cannot declare=
 the
> > +              * device wedged after recovery has completed.
> > +              */
> > +             cancel_delayed_work_sync(&ar->recovery_check_work);
>
> If recovery monitor runs between "state =3D ON" and the cancel. It then w=
edges a device that
> has just recovered. The sync cancel only waits for it to finish, after wh=
ich
> pending_recovery is cleared while the state stays WEDGED.
>
> would be better to move cancel_delayed_work_sync() and the pending_recove=
ry reset in front
> of the `ar->state =3D=3D ATH10K_STATE_RESTARTED` check? Then either the m=
onitor has already
> run and the check fails, or it is cancelled and can no longer race with t=
he transition to ON.

Alternatively, disable_delayed_work_sync() could be used, but it needs
to be balanced.

>
> > +
> >               /* Clear recovery state. */
> >               complete(&ar->driver_recovery);
> > -             atomic_set(&ar->fail_cont_count, 0);
> >               atomic_set(&ar->pending_recovery, 0);
> >
> >               if (ar->hw_params.hw_restart_disconnect) {
> >
>
