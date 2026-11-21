Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795284460;
	b=iLSe2QLsgivlsD2cwtLOEBZMABFOOP3sw8zHSfDkHJw0vZyphfUHulTUhd2MjH43p/Kd
	 53zYibyFw5R8eiYzVQnyaYl09sfnGcekaSAQdhoLKczBnBn4+cZi7ve3ZGI7Ht5VTAXVW
	 YA8N8Rcls1n1bX4E5hD+ZfqPL0jxjAP2fglbr9AEuk9M1Uxnxf5ufAFXyqa+wCKTP393Y
	 N4he7tAn6mkO5ghWehzzHGSk3QnjJZjhMdxp3lUMIX4TXbUwLjRF0N5uZSS7MZbC2qbqn
	 mmDfrXP5QOx310x1UUblsiAiD8n3KSNjzaJ5lNgHBlgRzP87mmOPL+6qfK1PZ/RzvjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795284460;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=;
	b=DeokdZEVx0gpr4uV9bu7NcFxziTv8TFEpRhjQjTodjwKrOP7qxYCW27M8x6CO6biKKhW
	 SieHpPAnkM4+wTyeLSZt7vTzGeTD619rzN1SDg624ZOij3tjJcpaR2dXR6iysy/Hc/t20
	 pwF+9WLhYPP7sdwATodezAzAWRzjEB1B9wP5oBwTPt0PWC3X+yemk4qTXNGFZ+EKeGTJr
	 B4mPYh8sUD19ucouN1ZLEDU9GNj07ALBUyXLYIJvxIU/M02MtuUpbCi5la3Llym43owI6
	 0vr2esFW3fDeo4lrEruGCQaKj2rjlJMNF4q0MyYSnXpqvwvOVAMgjLzukVJmBu/iHOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BQcb4RcP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBodHEvk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B82606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51B82606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BQcb4RcP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBodHEvk
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFafQG001831
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=; b=BQcb4RcPrA0xZ41T
	fJdYhnPNOIyBOdONBtGs2qXOwobbAkIQNULTlAp7Y73DLrfL/jX6t6fE1qndJD6i
	fL73upTrQtUY0p+sq36y5oP6+7wGb/4b/jqEfllxHYJ77GZ/IT6rjd2vvIK9xtZC
	zGHz39sdMakafwjEv9aoexfTEXZH6si6t45INfUWih94fgzyorvYnrOX2LqJ6PAu
	N0kv4bzLPjWSsqIRSuP5ImTVDbc+VXTCQBFD+LFE/4A7t39DeW+5T/9/FrStRKbS
	19CSSmmDF87zaUeTduodl9vPYxOLlbu0oae/+7vEwDYwPoYNiiStUWralHfBm2+C
	wAyccQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka1j08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:07:38 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4e8af48c8so28479627b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:07:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795284458; cv=none;
        d=google.com; s=arc-20260327;
        b=L/C0IE8wNCivJsrA9FzCVjp+bU8ur/n5A1ddx7jJHjLKDbxLkpPm+4TEnm5wj2mKql
         tUr2U2Brn0uexjgxXtvt0D9++n23oVL6BcJIHQKBc3XvNoIdJXy8LTueXX5fuVdjdDog
         g81J4eP4bOjFgSwtii0g4Sxl2rFqr0wZx9JPAoSkV+iyRgfNaU5bK5NGi4mDUJboJTlx
         HNIT7nR+Dez9Vme0PjROSUlqHFynCgRMfRQAyAD3R9MvwcjxdfXCj89tqVc9/yEAw0TG
         bZaDiWN3fTHcwENuB+9Or0UOsR+OZtpuVeYC6bmmT05eBYt2N4zrcdxxIfsP4h8mKQTE
         UnkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=;
        fh=m6+Qn+ksyIaywVOsDWn1eBz+Dd5hOJ3wwyeksPYaWOQ=;
        b=c+KuISKcCwUPp2xncqmNVsaDWrxp3swVkxhVQ9aYwTNjfHNdGON86nlMcc9d+gEutL
         yhGAgryXXpdO0dfpwQPSDSoLhYkS9M6j8oHem6Z+gB7xJt4p7al3+nvEnsK3y/SoLGEf
         iryi1XOPj82QD4VulXAwg8j3Szx3hiV4cIaE2fr1+sCLMMn+zwhpO9gAcTkELd2ki6wa
         UqIXu3rrSDFuPNDdhG3tXdbhdTmYCLGFeAXxodyNcsxb8JuBXKP+B5KCazRqor84u/qM
         id+kDOYrzrLZdGGcithkGdQmF2mEniA9OiChowo+5XUzuR9wVXe+pc0wHA+bjk9DkKky
         EuUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795284458; x=1795889258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=;
        b=WBodHEvk0BZVjo5i8swxkPj0JUd004VxJVFvWlfaZJAax4OfUv7X9WeUkZ2WB1i57x
         2TlA6ThLF2oi1nuGAl0QMyIVZlDWnVuBHvN9h7unro3uy3pPlYXSpF0/ABe6sdDWMRPu
         4NmGrewt3nJsSJkTh2N7Z3LZ4E+j1J0PSnoC2kUn71NLBol/m+aBOE0SQ7xfh+uj9qGJ
         5HTQXejiVCGGzhAm5k458MBI6Sqb2xVX/C9XfLML1eiupQqn+jf+YGcAf/Pt71aMZNip
         fU2GZR+Te+9ocUxE514NJKJV6dSLtizKm7ZJ2z1fyc7rQI0YDuYnBWNMXNdF/f7zninW
         59Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795284458; x=1795889258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bwn7yyMiEP3rci6OEbXoA+Cl7H3Bo7KnvrnZuDyujU=;
        b=rJQVvHVo6eIUe+viLIvJDqQ9BssA8IGuYRWgSi5S9MudtCRie2oc7EF3v5M+kE4a3N
         DR4QcQafDF8FToVcNw33xhzu/Zoz5da8NDYG1evNs3TR67T5Oq1BsbygxxHhdcbpYdC5
         qQQTewYrh7rd/Zx49pY/OdjrIRpxcYYiyrqyeMgv2HTltn5NPzLyGKRTu4YaoQKrx7IL
         YM6wMtiqT/agsgVuK+ALquyHmv2rCGUaqrhCJ2AIpVx0XJjTmijZI3DSnnE52Xa5sUn3
         w470vpTeL73/BMZnvpi2q0DscRp44BgUBeJZ1/W/eKxkBzNzCeMVG8H5bpm/esU5zn8H
         QtTw==
X-Forwarded-Encrypted: i=1; AL+hErEBVRCR7UNnBkxlqCq6vVpgFfOJ/3rvHbXyVfvqDkZh3HP+j8MGmnwBl456fYn5RJtr9yDi1ZJE971XAk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vX0TtXsiFe2ldovcV1aqASaDxcq0u6apRjDW6VnDcw+UTQ9XA
	v6Wagsq5gxGZsCErbwZGXUdIIUNNuh+KegV39aUNaYhiihrPfiEvXRuN4aQphoz3TGSYojeh/hT
	UQZEMMqL0vYmS/66hraTv+Fo458cngDl5aCSj5Kr8H5RzWYgHt6AXoUl1gjDsEHgJA3GveA5HhZ
	ZXVdeEZtfd/2895no6EjhIE6xIDXxCEMt8uLi0XhENpg==
X-Gm-Gg: AZFdTZckR267o581o3uUiOfax73VCt/WnIwCetdYzsg9+0KXpWBa7XH4peRgS4xLASU
	0hPMEnFxkYkRQTEzPAbvNDEQU/mTSzNvjCFSVdZ1QPxgkUGqwI6MS6DUNu4zEwXa660yXxLD0oH
	8q3Ftk2NsHksj4ecYkFnJtA4EscOQFVZY6mtUTc/xuYU+bw96Wxfm2o+oz83tMwKFsi+pvRPwCk
	SdeS7sbOJBHL5wpzYQ=
X-Received: by 2002:a05:690c:2a85:b0:8b3:3caf:11a with SMTP id 00721157ae682-8b52032707amr33625627b3.4.1795284457710;
        Sat, 21 Nov 2026 10:07:37 -0800 (PST)
X-Received: by 2002:a05:690c:2a85:b0:8b3:3caf:11a with SMTP id
 00721157ae682-8b52032707amr33625497b3.4.1795284457246; Sat, 21 Nov 2026
 10:07:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260914-xhci-skip-phy-init-v1-1-9c46b31a5a39@oss.qualcomm.com> <arMcL9HjfkCDNOHS@vbox>
In-Reply-To: <arMcL9HjfkCDNOHS@vbox>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 21 Nov 2026 23:37:25 +0530
X-Gm-Features: Aa3M54rmkiqihd_IxYxjTdXdYkS2xbqhpvjtR45jB_zIKbtCgVo1zmRXKHlos1o
Message-ID: <CAEiyvpoeJbWJ_nLuf3Ws1SnGR7Kxg2QN75ruN5YKyMBLc53ZqQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA3MiBTYWx0ZWRfXx6j87quH5JpH
 +MOt4evPtQydLdQTflGZc52nFVN8vRrnmZMCGoieK23blrMrolZN+VIsBI6MNlTCyjCmOPglh0N
 KZPNlguXM5e3wISDPo5QO0YCMBGMJtyx2RnwFX8NScKL7WqJ/UErjWDyLzJW5I1U3Z+8ae7L3hW
 raVN77+KSOWKf0rdAGUkt58no4Ivk7Zcmo8CvS03QXmuVBRCWkCrgO/hG4NZylFebPuKivZaPNi
 fBCDX/ebSNw056NaHuI2ySV4cV0LK5PPnns8xwNYKSP0zPRV49UBpFAuY0UL+boFj+fDo/6K4H5
 D4fBg1HTTbCIsRT/GnCOqDNsVQUSwh+9LXDHAoDTSLXaJVrqQX5edngHk7J9XMj1xcsBb79h0eJ
 6zupt9tKqoBwmdRPTc32FjfeWTCgfI/ZOdxXxCi0bY8VT5SqqhYwOUiUQAp+xJE4ol4aaLyjfBs
 ZVWX3s6sUAsTJETyDIw==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b01ddea cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8
 a=xEoOTTLnucjJTz5eKE4A:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: Wq8DS9AROQj74QGKgpmH-KJzX9Fmy6yc
X-Proofpoint-ORIG-GUID: Wq8DS9AROQj74QGKgpmH-KJzX9Fmy6yc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA3MiBTYWx0ZWRfXytpGfnz085Fq
 49bQAZCaDyJA/vbIC9CraP2GxDtwQJfWf7jgR8XGBoJsNiEjaNYa2NcYjbFRifrSjWzWDz4XDHW
 SUGVRwYJrlSMnYoD2R2KibFxHJFhdoI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210072

On Wed, Sep 23, 2026 at 5:54=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Mon, Sep 14, 2026, Krishna Kurapati wrote:
> > DWC3 driver does manage phys itself sufficiently for Qualcomm platforms=
.
> > If xhci-skip-phy-init is not set, the HCD core does a phy_init and phy_
> > exit is done only when roothub is being destroyed. Due to this, during
> > system suspend in host mode, although phy_exit is done by DWC3 core, th=
e
> > init_count on phy is never down to zero since HCD core also did an init=
.
> > consequently causing phy's exit routine to not be called. Hence, add
> > support to skip phy management by USB core.
> >
> > Some Exynos platforms still do rely on USB core for phy_calibrate calls=
,
> > hence disable USB core management for Qualcomm platforms only.
> >
> > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > ---

Gentle Ping!

Hi Greg,

 Can you help pick this patch into your queue.

Regards,
Krishna,
