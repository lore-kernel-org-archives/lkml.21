Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163584;
	b=3dfrXq08uNXsLqZsxYHnZWwUkEADmWU7+J1WSLHxZbA/+ctaQbYj21Xj7Dd3q5mlGPkX
	 t7oj6Hl1wow+AQZ2Me0u9rGJXAKgLin0Q/TrE26JbwxN4xQQ0ERABnanI1TwrN0Q3jtNf
	 rMahrt5oBlyMJybJ2VGcTPPklOKg94fk6G2+B3FwXbSICwoA9ZrPuv911bR0jY+A4UOf/
	 viWqkcclLjluKBPlvNefJouFcZ7UlNXh5poaHwZeT+/msj73isH0iVYo1xWkbsdtGEamU
	 Jqthnm+v8MpOmrYqAI2nc8iesYSPlzN+wB8KOrGzdJ43zx0KWukagyF23fHE4Ngg/jA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163584;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
	b=sN2cp7jWxBgYS6Ux+FmqByA9kAE1myNjWnYYNSF7xZ77QR321q73hGPpiEotSM5qwlA+
	 QVOY40cMLWL1bfARh7ezyQA8Vgqp/KImHacj/ZeRw+iDg/ZauNI++5I1drSNt4eB2FrGR
	 lWkI6ITh1AMxxHAH0BMzJ+LCR1zhp/RbUPKEsfwFNsS7aO/WM5YPi41e4bm37OLdQDWwS
	 t+nMpqLlO/shd1iTDlcq9GIbJBm5Q6150pCriCt77D821x0bcC74FLvpHFDK91xt5Biqy
	 /dbXZsdwfHN2kKpzcGbQllhBloumuteltgeOyIzYnLkhARWpSzVCqhVirh/KrckwLSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AkMpuipO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bY/H1PAg";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE83E606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE83E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AkMpuipO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bY/H1PAg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7g13E2696258
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=; b=AkMpuipOaXUQtf44
	LKnET7leBzKWmLPkW706dCVmxRawALoP2UOII7YjXnYENh/C/2muz/3xSK7iiubO
	yja2NECnxTbE7LHzKVAWycd4APujSgH6EX+/5oUuHEzX3AKrM7Vl+T/1tE83qdKp
	su9E68arYKGVXgclpypqQAfb814KfdaIEGXdCGVV6m2BltnYz8jUNc17U2twrmjX
	PZUmDnRTbZTnM6EZetbXqpGTcTZkbhy2gIyiUUtJ434I1xpsYXH92uIlFRA2oWe4
	DCRtQZmjYg0ebi/RL0pimpkMXyYhDXUGxvLt/XYbmMfL793SYtq8ny0p6oKGBQQW
	exHIMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au2q5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:33:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso87919385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:33:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163582; cv=none;
        d=google.com; s=arc-20260327;
        b=U0zE2NzSaKnoB4tJUAuHv/6S0g+ug6HesZUbtJp7QuuxpymlXzKkKhRKxEiRfb0T33
         injkvmYg0XufCg4PblknAOrUp1TA9EAXIzGU+ADnil5Oef4SJTsjBee3Wk0WjY2fsvIP
         RatC6iBvlynS1+eFIYeXHCrnCAP5BCVGx8fg6K3L+G720EMMAjHLfvLn5hdEJrJv/EX8
         DNTmbrkX1WWx9S0D394k3A25akbN5R0UhSbeyDwH3fLBSVoUrVeJLdg29nrDha0uGcVs
         MHXUKSG7lehE9+pFzzEjfZDUKxkCXQxbdk7xN4/+UoUgiZAnNl/v+VxDfYA9undfSzso
         A+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
        fh=yF4erz5mfBZ4ozzy14iVPFeTjSlgtNIezPahrZ/1Yp0=;
        b=ORcPWMFJcsbTaBAcrPbWBcViPghHL2wp8vjpaiyR2daqi6UsoxQck8TodNqHYVF8ca
         d1blriGZatz5G2KKCOahOuaGAnZAlCAYyO4puvu2fh49ckSACRP8PEjzIzKYigkjHgdV
         QJKgywcQznO4AzpXZopEOCOS28alBNwI+d2lZuennubFtp7qlpEaRPVuCU+OuUvMyubq
         sQsPsKU4QLPyQMs2YdVVy4KBttDIw8Yv/VK9CqptWVvYjPc3BdjPbL59k4Gqv4tL5SxM
         lEoVqMy9f3kuXkSsw1Lad48onf04bO9VXQFbiI6hvO7MuGaUS9L8q6srqSmCX6R00wTw
         +C5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163582; x=1795768382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
        b=bY/H1PAgTU6t7pOPxCBNbQC9ZYUKPl6AY+CCqVcyeNY7uWBFqCUHpyJpJcqPZL807y
         jVBmPEPfzxix/UMYqfzkiY6TrKKVrkhN8VCZ7XQYOfcWzQ3fcSJI5ZsCC2jVctzhpZgT
         +rQveC/jnyIHVZn7Nth12x2NA1ofo69otODYg9D0kpMLzxCamgdsE532898/MOVYFpJC
         wnIdYlmRwyrMsEt/5Gx3YwJ9BMxcKXT/jFhzF6k/EGHKjGyu4NpAp9De/1n7f0G0F0wX
         w3Reub736UBoHvOuu1CbGgCo29ZDj9BVSCnGOmN1Ovr7wN30jNtdYS9NY3WOgwFjjuyu
         Vlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163582; x=1795768382;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AwhuHb8kzOf4Sv+VK/GWTnxYFGg1t3CavkDXu4WyyKw=;
        b=gObBDIxsHCkFFjrKnZQGCNbtek8k1NMKUqSPl1F2NejNkxFA8KMhh3xD6tc72GKne1
         QmMAdfXDnlathqid2u8zrtjJrWInr+Qu+SPaY15Gzc8m56/qgjS14JeB7Sle8IFXapW1
         iCOvpAOlWJPf+GJjJ1F/e4i/Pm0umTfayqvWm75W2ir/E5UKYJJceCTKM7/CcqP+qKS8
         JZJvpmbR6GWjaCVlvdUruup7rI0XbPocBnujClhV52qk2CtpUqhB/wTS6kpHXwh8GMJJ
         djgqfCQCWv1SCV7/MyfbV9yU17e8HNkeXBYl6IwGrMbcxiD2Q2GyDExw1urFAZfb0H9l
         3Q/A==
X-Forwarded-Encrypted: i=1; AL+hErFG18J3P5yBAiKRGZH4jSoKO/9hO06ATI8MQgVp2jb6TChDHvEmImDFNz3hO3za0Er3GxX4+hfG4zeKLe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZRaerlcVCjwwN0Z56VRpwnx4nJRHix774wBvIkDRA3f4JrpcS
	1BczYyg+O6brETwFjo+jVogIknzrGes0YV8ZlamtammX4+nXvU2Q988RXn69sEMooGnM92Kj2av
	X0MECm/GhjnTypvgFFVS6P9F1Q54m8D3UVuOVttCAcCcrmrhCVg0KdV44SOjP8LytwA4oBmfKU5
	lexmV7kl45EDjmbzt8OZAnfwP9i7++UzErscuDLAng3Q==
X-Gm-Gg: AYBFou2y/tsFGQtDcV2jAmlCUgDubB3GNJ5G4xrPbmXbN4qNIOcnu53W5dS+PVcQW5i
	vlu9/2yYgPx6+SSOczBRhTF701E1uW538cqSiFZbi4tNqIcbbFd32O8jo+DgGp7QXtPOB0R8l23
	rzEcEhz/5F2SyVLffL8EVogJj8TDFPPfOvTU4vAF343nNLJ1uABU8kxGuoVl5562vJxH13tHpuQ
	mCKphQv+t60+Z9Bc9oI1UhP7FsSrm8MCZh06suHJB6mKabg53C/12eceIgaKFtvtnFSOAk1CmXf
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id af79cd13be357-949bda21c95mr163125985a.83.1795163581815;
        Fri, 20 Nov 2026 00:33:01 -0800 (PST)
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id
 af79cd13be357-949bda21c95mr163123085a.83.1795163581044; Fri, 20 Nov 2026
 00:33:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com> <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:32:44 +0100
X-Gm-Features: AclHuK9d362EMFPFXhM64AVRYKskGoTlaSxy6WxsQcqESpcHzMJ2h3YDR0lL_Mc
Message-ID: <CAFEp6-3TfPV0iy3O=HKZXPhpDpRLffL0RZZt8n9aVBk-v_HQ8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: qcom: msm8974: Fix WCNSS wifi interrupt
 trigger type
To: arapaille@atlr-engineering.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
        stable@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfXx06nyugHmpyn
 M21LkB2gpxYO/WsgtpNVBkHhk2d6//B7OtRyUjJ0p34KXCUIBmFHTSZd29ooWgD8hwk+o1rK/aN
 0+sHPsJhd1fouXRxwieP6PsL7DG3DfbvkOcoqH4sJItoQ+2yvqdbYYYxq2kIFU/xtvRuUpSjJhF
 RcJeXbvLopFYcME26d4rtUEpCr+DLNIigVGoRw+3u//OvZHBZf1Z4Ou0HXEpGw1SOwjVkBv5puC
 hNQ1PLKMvQonAMaJzXKvb8J8LwmQ8XfSAtF9kVeiyDnDX+0mC7q3LiySElYzo0tS6nel2F+xlf8
 hABUQnQneBQnjTDrOM+CReXbi0m171CSJXRIiBHnNcNFxTHLdENaEvHoZy7pppv0xNJWV0VFcdx
 SO47ciWG5ybWB+3HCL2+SbZz6BEppK3fGpv/jTNPVBYQjPguQ7SQEPOYtRA0cyYmvj0/Ud6JaN4
 rmSgIcRxcfTgyyJe8gA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX8UokuNyDqgmZ
 6zQMvj0poCd0kqt8v+bZOYoH/Eeik6dOJ3ippno4zlLlQU01C6Zp+yLmnU66NUv+rkrpEVxyzKf
 kKqxebfjuNy1GMDAQR1xyt1qxDI4p2E=
X-Proofpoint-ORIG-GUID: ep2DDMWoZVbhVYGsFYmxbMWLt5bvCfXr
X-Proofpoint-GUID: ep2DDMWoZVbhVYGsFYmxbMWLt5bvCfXr
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b0005be cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=idF7ahqy7yQlu2L1qvIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=L2g3GqtBoyQv0ocsUjqh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200033

On Fri, Nov 20, 2026 at 9:05=E2=80=AFAM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> wcn36xx requests tx/rx as IRQF_TRIGGER_HIGH, overriding this edge type, s=
o
> the re-probe after a WCNSS restart fails ("type mismatch, failed to map
> hwirq-177") and wlan0 never returns. Use level high like other WCNSS SoCs=
.
>
> Fixes: c7c0edecfba8 ("ARM: dts: msm8974: Introduce the wcnss remoteproc n=
ode")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8974.dtsi
> index f300de74c4..b9666feb8b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -814,8 +814,8 @@ bluetooth {
>                                         wifi {
>                                                 compatible =3D "qcom,wcns=
s-wlan";
>
> -                                               interrupts =3D <GIC_SPI 1=
45 IRQ_TYPE_EDGE_RISING>,
> -                                                            <GIC_SPI 146=
 IRQ_TYPE_EDGE_RISING>;
> +                                               interrupts =3D <GIC_SPI 1=
45 IRQ_TYPE_LEVEL_HIGH>,
> +                                                            <GIC_SPI 146=
 IRQ_TYPE_LEVEL_HIGH>;
>                                                 interrupt-names =3D "tx",=
 "rx";
>
>                                                 qcom,smem-states =3D <&ap=
ps_smsm 10>, <&apps_smsm 9>;
>
> --
> 2.43.0
>
>
