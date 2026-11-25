Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602864;
	b=C/yvbrTAxf77a/BPEq9pcouPAzOtx7Pj3h6HEAG05A0sURU4dCz4PiAEE5Fvv0vYakfS
	 OegTCUJrHHa5xxX/Rcrd+9OG5ubWw1almMqTnNiNOuPDmb7O/JKbGBBmKjhnuUnK29wP/
	 ggJgTiA1RR2rXfK0kKcmTVcrkqsnVDd66/Kc2q7E/tGOWLpku8hVrJg53cmaCvbUR2/Tp
	 JrcBG5L3edbieC1hloOllIqTkn4SlxfCPyI8ztU0IHMRwQ6HmJWhuHTWMg39fkzjzjBns
	 vWHbiauCHTmDXKLPAW2n3OLzSgYhM2WdGrgA6CT+8U0qz5/swxMJoUBrQJQXxVY90JQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QhX3qlZ46C7QHPDAi6gO1rqKUJVvN9Ln86oiJ1McZTo=;
	b=AJ1zgDF9VebAboEekmgo9zj7uVFo4N7aK0GpH/AOIDRfMlXWIF4aYPhFWsYBW3qJvvKy
	 UH/Kz1E6SFVmt4CQcQHwruC77Vqd/YuMPN8USBmShM8O3953bHqWLmsu4w+mHOBs4QiTT
	 3hN+I+iurcpJEAzzoFKTxbdAtlxhKMs1833fpqs6b4sY/yHzIdkcBp6EtdI4LM6LwLhyN
	 MhuWAJATBTKjN8FWrvfZEQ6iS6spur0b2QrPH1o0vKJP8iZJNJXjrXleBVBE++PIMMB2f
	 2JEhi8vCVhONnWHOLWj7v2njVlfQqgSqBAMF6XfKWc3xW31Fvcpzz4USGOCfUV2BTwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MTlNwwTQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ikYVrG/G";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F60C60A2610
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F60C60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MTlNwwTQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ikYVrG/G
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mQxq2356563
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhX3qlZ46C7QHPDAi6gO1rqKUJVvN9Ln86oiJ1McZTo=; b=MTlNwwTQXga43xmW
	iM7da30bnloXibrktMFcBqpiXRmX+ABlAZ6LWDcXrCAu0NK0regToQLoMG4X1IXy
	G7tQwe8D89/7GJnRKRlEyOM4FK4yU/t5GDBFMcCZ9zrfTttxMThIoCkVE8yBJV47
	VNirkCtgmLSpMEBLeQa0468ZGW7teO2Cj1gccoqV62Hs1VUwiqyGtwctvF2INn28
	UDR+w28YC9fOR4dapuOlrgxA1VUKl9kwwYJA8zPF6gEKUxe92PZn5cz5Tq/3UmkH
	iLj6bhcMtxKNs2MSEsjmLBLLEPtQ+CuCaAGf7Z/c2vlRF6sd/6D7EHg4pxZkIP9l
	iWGLsQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6a30w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:34:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so4662629a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:34:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795602862; cv=none;
        d=google.com; s=arc-20260327;
        b=S66pAqMhNbEBcT/H2D7H3RxmgqvKBl28pdsrd7nsWB5fpdgKbSBa9/c1bUoUXkr4I4
         21YHrUr6wKskpArjUoNRzCd31LokSH5ltYtdFN3SG+l6mbF6/qvJ34THFmoygDhIdnhX
         SDfr7FbSUCXhQDt3mnwFtQujWUTAtqx7c1kW3Lhh5SlN8ouHR7r7WRUG/lZ0+iXewmwP
         84LP857VczH7bdiHZrsWVK0ShvKIgBBjYUJlh0O8sSvuxOKYnMg/4DsMnoTMZ6iCnFfl
         IvV6bojA7cNJ+au3XJ7kBdo9iW29m0VCRY4iqh+xFd9qFMuXV/zx4NSVSUzFZ9xAkrYr
         dp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhX3qlZ46C7QHPDAi6gO1rqKUJVvN9Ln86oiJ1McZTo=;
        fh=in5sIAO8wIcjWm1qkFhIwpk32+a+VFXhIo4Odq45fuk=;
        b=XdgsLcg0W0+sHkqub8GZVvIzvOPeEC1w6X6z1WnxGZmuqnyxjc4rdY352FHM5vkaN1
         ztVp9msbb7U+CWMzhuplfkVJBCbGU+LIM7NMg9CU1AdJuCoyWMagCNXVtXbToGrvSVkD
         LnFMC7NaX6XwXi33fiSdGsqIdkkwlkR5cOMEHB1N7IPLCSBkquMrvU1fvd82U1N3WFhX
         zxjN59aCU5FiXEQY6QbeyTj6yL7Wo32/03kuXeYAKUjitHHdzbRkYp8c7O+EQWGUgOy/
         aB5xNQD0ZdZs5E8SB/WYc2I7v/0Tq03DoaBv44aCEL6tg1uQO24nDyepA3a+Ej0fRKsc
         dscw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602862; x=1796207662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QhX3qlZ46C7QHPDAi6gO1rqKUJVvN9Ln86oiJ1McZTo=;
        b=ikYVrG/GZVAulKueWOaFTJJixcBWGII0Ze4+J9NdqGZ7mT1POgfcLCPcrEOnGXIEKt
         vdgYZGuRPhm/yB35jVCyEh8ul0CboFwpb9G6SoTPCGSGoDfMp/IrQzUfszm/fqAbwSr/
         OX9pWERAyRf6UtPzm82bOGXp0E13gZhc0/Qa04EVWolL3TNM+67xhRn7Ply8UzTjkbzx
         DDICb7Ur1TcpGILPIn9ixvfmSRfASEHzKMLNmxkHLodkQoUGI36dQwVLX5pa+bwoVu7t
         6WJosC/Y7QJVydozS61+KAVtZN2k4j3p4H+Cls3ps64qsyqh75R9XTMK8Q9qhp4UP/sj
         KRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602862; x=1796207662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhX3qlZ46C7QHPDAi6gO1rqKUJVvN9Ln86oiJ1McZTo=;
        b=1kJf5oCZd3IEMNSEUluCfmjvJgL3zDo30fTTGxGZc+Y/geZYVjew+hybxUyJMyb966
         g4/zr4wj0AiDhYI7FYHHtHTpNUZiDUkE9elz+Yc8KgNXunBuAahTPe6GdYIgfU0q/6r1
         qOAZTtIz1QmF99C1Tsuql+0WTOQbcS7ak6YDSUup3JcUvxxd3GeHff5RQCFg/jHzmXZ/
         HQAk+h722WrgnzoXWCLFGCDxuFy72LQZFceQYtogPNol85YVxhVDb8sSPzUv2A312lKD
         jTbkhNqxwKbYBuQguT9gGlxYPZ4Q1EsJcVBtV3zs2lG1wIqZocpFqsTv9LxkdROjE9ws
         Y4qw==
X-Forwarded-Encrypted: i=1; AL+hErGTtcLTuGhFd7kvRQizA9vyC3icDMLQD7xYO7t/6Qp1UE9EJNLtIZkxg7+s1eaT0F0yJSHSdjaCm9XJ69w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xNfYh+qGjNO8pRuu69193O2smRkl1RbGR4vVOAaZx5ydJzNzZ
	or6EjuGM46tC4NO7dLKQ3kH72+F6hy/VrW18UoWDnfvMSniq5TIVEiwqN1SAU6zAHlVw/chp9OU
	9bwbeaTHsUG9mA3G+Xr+TDdBDjyfP39aw4EsSM5wmy7eoWmq9xw5b1bWfXD8XmFwsr+6qi/6f+7
	ppIBUJaJsxDv8ZKjS3ycSi5E3V239JmsytUHbXrmHctQ==
X-Gm-Gg: AZFdTZdyojMOsPXhF9zSYJlAzP/Q6jLD9xMNGr4QDSlxqMSartrmgF8H0tpud8m5K2M
	O/ohQ3c+7G4NVEuB7+rd1bbxmf5A1ONfdE8uqZ7plqznaowCNaNh0F6qEylBeCK5t4M9tFm0CAZ
	dQypIkBuiybLHJPbh6zp99XptXBizD+Z2qF/CltPX+RsVbLXalmaL+rG5Jyg==
X-Received: by 2002:a17:90b:2c87:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b41c911819mr15585915a91.25.1795602862236;
        Wed, 25 Nov 2026 02:34:22 -0800 (PST)
X-Received: by 2002:a17:90b:2c87:b0:3b0:a37a:230a with SMTP id
 98e67ed59e1d1-3b41c911819mr15585881a91.25.1795602861775; Wed, 25 Nov 2026
 02:34:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-01-pm-device-link-v1-1-8932e0862378@kernel.org>
 <CAPx+jO-37Km71oSW+zOO7BBWLj86SNCn=U=EGmBXdC5SfX4nbA@mail.gmail.com>
 <20261116072442-GKA100890@kernel.org> <b7d7ac2eee0e64aa7c267def5c2a8a022c7da425.camel@icenowy.me>
In-Reply-To: <b7d7ac2eee0e64aa7c267def5c2a8a022c7da425.camel@icenowy.me>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:34:09 +0100
X-Gm-Features: Aa3M54rH_iaUZ5ip693Y70gQCtTHGqzR_7H39x_RiS3GWAMpcjgQcywZy4Jp6MA
Message-ID: <CAPx+jO8bY7WZjeSuOjNE1=FxrBhs=M9fxEJx-r06c2S84xFr_g@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: connect consumer with supplier via device link
To: Icenowy Zheng <uwu@icenowy.me>, Yixun Lan <dlan@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: f2HizVKSjNW54ginndEegLwAIG3GpbFg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfXw/ZBfUzHQ7BW
 T6OB5L4sKnkucVdkNQiAeOyOZLz24YLSViRBP92ZzE22xQsIktJ3hpYE/r6r20aZhU1Njns2rKl
 97/VSyIDLBX+8SnTAnSrRe/TjWpWd3E=
X-Proofpoint-GUID: f2HizVKSjNW54ginndEegLwAIG3GpbFg
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06b9ae cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=8NAnHuo4LRsqlWi9iDsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX6U7nLNYzigux
 ANSUfPYx8dKigLPFYHoKkdVyQ192lGrgF4E5pqS2kn8OqqPv5/jxB4YqwVgQm7OyBkq7iIpYC7K
 gIhm7fMvzoDeig9UVZKmbJzZ/oa3I0IEGKnsonky7+MevEHiJnn6a/Sye+hWlfnzyxuFNc9737g
 ctK1GRwvphQ6ahRyY+xN7BBogYKDB3XdsiiMFNEzD3HvlE/+IChMUVM0EORAhtAwBd84WHEdhpA
 7fBzTp1Sx7YGa/bms8SpDAUM6Q8B7hk979armQ2LQMCINbLKR9yS1/TFK00FdfCyYRZfsOgbvFn
 24Aa02U1ij9j4oZZ7KS8ldgvJL8VTQZl3OKgqSJva2as6oSYFnh4HA9vIn+CklsVJO6UoJqbTLV
 XaTjjhhUcX+ywEe8l90gRm70UFFiW/xA1tzyIzXbddavPW1qHvnwNiztyZLh7MJOCBM6oiK3l5O
 kiKKe4/rztPGZPyj6cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041

On Mon, Nov 16, 2026 at 8:47=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-11-16=E4=B8=80=E7=9A=84 07:24 +0000=EF=BC=8CYixun Lan=E5=
=86=99=E9=81=93=EF=BC=9A
> > Hi Ulf,
> >
> > On 12:33 Sat 14 Nov     , Ulf Hansson wrote:
> > > On Thu, Nov 12, 2026 at 8:45=E2=80=AFAM Yixun Lan <dlan@kernel.org> w=
rote:
> > > >
> > > > Connect downstream Power Domain consumer with the supplier
> > > > through
> > > > the device link API, So when the pmdomain driver is unloaded or
> > > > unbinded,
> > > > the consumer can be automatically notified and purged gracefully.
> > > >
> > > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > >
> > > Can you check if the below commit that sits on my fixes branch
> > > solves
> > > this problem for you?
> > >
> > No, I've cherry-picked below commit and it does not solve my issue,
> >  it's a different problem.
> >
> > Problem here is the pm consumer side isn't aware pm driver is
> > removed.
> >
>
> I do think it's just better to prevent PM drivers from being removed.
>
> Thanks,
> Icenowy
>

I tend to agree.

Unless we have a real use case where we really need to unbind a power
domain provider driver. Is that the case?

Kind regards
Uffe
