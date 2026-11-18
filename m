Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032599;
	b=MmHLocUV8JoXdPd66Ma9d6jG25LMj5Sx5eDEXH3fLs95ZfnlLb70yClxKgMgoPv9Xdqq
	 HSL28HcO6ZPy99oD2mpNrNxuXT8+uBeC4f6EED9M9JzFn/VgpWgbjtTWjyyLuJplsYbOI
	 3/mn/OoGNSCRRibqpWeWrMu4FY94FG7R/+GmRxbeqf96a8FSuOMlFm9Vfe28nIt69QXFo
	 HD9wdlJTvJRTDn4T6BOAb40UdkU+TOZRRVvYJHGX6Qurvel1WorTgzBG/u2SMAyRQNqj9
	 Pb4KHYRKPKerAYMneMo29ntC7hTpjn7FOcmJYEOeLGCgOVlM4dXybOzHEhSWlDVDZYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032599;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:Cc:To:From:References:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yelw5l1vTgIT3KQe49PZmxknXqCh77sINouzym+k2+4=;
	b=PbJi5LAueMBYUPb6dORHsZzXYUKwmvHo02YIdKNlzemxl0iWLHVFjWvefskOz7guiqHC
	 nf5EftF1iI3W3e2R9/0x2Ke5QaAhGIQaMIyQskZ9lvw/vs9YGeLApabMY43Ij0/xDy/RS
	 O1NrlcbwCcQY6Y3ImYNYmT8rXhNEzMGFcMxmbY1KeXMt4nhj52+Pu/NDnkaFUH8U5ge8u
	 xEY/i4dErp2JFg2B0/tfAjHPwN5yp4OwfetnCzW1VU0/FIPYZk9sJ0Q9kJaLxbi/VFNdq
	 i8i4jyBhm49lzOhAoR/UScUfD/jxSb+2CpNfg6Q38eewifw8Tl+CcvjMzC3oAfnItgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPXpFQzU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jAxJEw2v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB06606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB06606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPXpFQzU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jAxJEw2v
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJOFXB038354
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yelw5l1vTgIT3KQe49PZmxknXqCh77sINouzym+k2+4=; b=ZPXpFQzUH6AbsOlY
	tF+ixoIdQ0jj1ae9RM7RCJctNoMbRbIbkMVris6T9wG50ovBmYKYEXHpBN8fVsZN
	B+hlLh1IKIylfzWhm069dLbohnT5QEkpRn/qgJP3A9cK6SQGxVDk4docSmvQgmFS
	gr8o1vTmh0hl3gwg7hmFk/7LjZnJcScYD6A0u13mf8wGY0V9bsaGY7RUV2opoDG2
	5qa8lXB54PX7bMhiQZ61HVmDa0vDI8jqXk8aTDUD3Lr5MHCTiWCDLbQF9VuVMZuj
	NBTRTVKCXtI9u6oLZabbjJNzUI7COsbnFQ1e4d+c4CDlPwuUkDU0gqrN3nXDozug
	mE1tTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpc9kbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:09:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-948d83322f6so256173085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795032597; x=1795637397; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yelw5l1vTgIT3KQe49PZmxknXqCh77sINouzym+k2+4=;
        b=jAxJEw2vw7mj84svelmur3y1n+7Hh73fck/3cfbjwdeSBBRA99sfVkwHwSJnQCI//W
         MojkDTZdQGggmER9wnpKxyDfcrudAljYmUfuZBpgnF248FzrcSPmkPSn/RIIGzI5jv8e
         nm7YuOxJwiDAlOaMNKQ2LUqXUn6tkfl8YwbXhxDjn2iJgphkTj7tdIlXGdKrEkmjD9ab
         LNZH+TzFdfOnSkY0IjOyjw90IjHKnA8gSyA7Ujs/+NAXnMom0VSui9i1Ie6naiFxwPWX
         9IPT2w/bT3JgDiWs5E1MkCSA9+wtO/xVn0jP6a3GUK5M6IB9YVkZCHJJqsRMW42Ffqx7
         liMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032597; x=1795637397;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yelw5l1vTgIT3KQe49PZmxknXqCh77sINouzym+k2+4=;
        b=JUlIvygCkOt0jiREq/AH5aD39LClGdPxwaO+FxE66NShB284Ygj2EF/5Ou/9OtVfjF
         4T1L3/begtFrY82ivbdhhMU1wYf3ICGGUffQOj1ZDOAv6HfHopT7DsPNuVzvl+YtefZa
         wPx0TaqEMNGtKCIcgiGD6k+Jx834xFZgEnxf3+fV58USHzd5ah5qgsOiYP+nRY8Zdylc
         quNeomviVIcDLPQkOiEionxP5JaI2HF49rlZclLePzNvKK1AtCsJR57PNgTIU14CyBEh
         Bd2zB0sf1ZUEF331zvVfWLwGqLbdqdmzOtLeTVVm2LHNxAolmnz+9fWmsYXal0fKa8XS
         82eg==
X-Forwarded-Encrypted: i=1; AL+hErG3DrMwQQ4Ha0TWN+oVUNVMQKjwEKpgxxn2Raaz5UqUASVKXIFEsUJkaqY+tw8DcpIzELXna8nE+B6ilD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+maJHLFAE0cJ9nRCqY1y9I+mXYry6oXYbCgfJIxH+7bSTsYHlI
	OxmnEQiRJezsnJpzatchJ9Y2cJdylKYTjqqosp1ajNbcjI59/lIj2tPXUb1BQ6ezT1q0RwgXKJs
	hlke64z2pzhTNWbACrLPEiqrqxfG4DYIX8U+/F2onKc7mXNImEnJr8foMpvcKr0zDBeM=
X-Gm-Gg: AYBFou0zo0+yIqPHfE8NqcKlpctiOMgO0G2dznIEvLpNdf8eHhYELaTtkR4NJCuOAVx
	cZovE9NHg7LYwwQ3iqrtQ2FbDVPz/Vd+4IvnV71JT4yBHRaMFDvF6C3bZKWkIkTNcegSAes0Sxl
	Ola116IsgIUREM1F32xX5zwNLZC9O2wqyJg5/IeIzLc+nhhsCynArQ4I59SmMYiOvWGRh0Rd+Rj
	4x0J/judcIztSBhx99ERvTqzueDwB1lwsf8FbSqeoF0658G/zU872vlXQBMpDX9aZUY5LoGpb3a
	epZlZKTjXbRv364bjgef6s6sBMvoXQr/f49Q8E1T2pjPMZkI/dP/VZdMmsrTKGWSfUhBFlEoPgt
	TFo/vp27LRpeS/NnhvJeAqoUA4iOLWr4F2psmWN3hm/kPL7wUL+8AmntbvBFr2i/rmbS6BzVofC
	xuvkscu1wRCJchwg==
X-Received: by 2002:a05:620a:808c:b0:943:b019:f011 with SMTP id af79cd13be357-9499965c44cmr677403485a.28.1795032596752;
        Wed, 18 Nov 2026 12:09:56 -0800 (PST)
X-Received: by 2002:a05:620a:808c:b0:943:b019:f011 with SMTP id af79cd13be357-9499965c44cmr677395085a.28.1795032596062;
        Wed, 18 Nov 2026 12:09:56 -0800 (PST)
Received: from localhost (ip-62-245-98-165.bb.vodafone.cz. [62.245.98.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656b1cfdfsm6840078f8f.47.2026.11.18.12.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:09:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 21:09:53 +0100
Message-Id: <DMYLY5JOE18Z.2CQQGB4INJ4RH@oss.qualcomm.com>
Subject: Re: [PATCH] riscv: cfi: parse riscv_nousercfi before
 riscv_fill_hwcap()
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, "Conor Dooley" <conor@kernel.org>,
        "Charlie Jenkins" <thecharlesjenkins@gmail.com>,
        "Andy Chiu"
 <tchiu@tenstorrent.com>,
        "Anup Patel" <anup@brainfault.org>, <kvm-riscv@lists.infradead.org>
To: "Guodong Xu" <guodong.xu@oss.qualcomm.com>,
        "Jonathan Corbet"
 <corbet@lwn.net>,
        "Shuah Khan" <skhan@linuxfoundation.org>,
        "Randy Dunlap"
 <rdunlap@infradead.org>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt"
 <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>,
        "Alexandre
 Ghiti" <alex@ghiti.fr>,
        "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20261108-nousercfi-early-param-v1-1-ea22d3a60683@oss.qualcomm.com>
In-Reply-To: <20261108-nousercfi-early-param-v1-1-ea22d3a60683@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afe0616 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Sz50MssrUYSuVvM2sb41rg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_3qaHc-GLK8r7rxdq84A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfXz14ev90YJucB
 o6jcmIReL8HuI2S3mNH6h4yCJqFKUQJRAnG85KRzbO4Ma+CzbnaRNCYOHWLlkr0oNc8wbsfaMqf
 lmUforYZsjc4EhA0a0FOZLhb+muT9A7Poqeyv00ConC+u1hfaK1rLK1qfByWLtWzDSGkLAxorXp
 Imqi9rQc0JT2JrOw15hzCsbbY7LbsLHQjgC7eWjx7oHKww8umQZe03LahpV2mOfcp62+t5r9Unu
 oKNF5OOul4af2xSoyeAZJlU+Kb8r0SGGMfWo1Q9zUi6OpJtFNgfwHYxk8fZiEp2Wi3Jn/S979Ag
 2jz78IQGqJl/hZeDQhT28wPEuzrAu/CbECIXuCyDtiAF9opJJzlDuxNAC/e5OuXAxaMqzcWOLA2
 5VjX6QftzKCL6pa/guw9jqmqfvEFsHnoVW5599CuzNs4cMDddj3KoyZgzVhvL/jfsYUA3qfvAYK
 GeXIRV4m34e0gtsoMXA==
X-Proofpoint-ORIG-GUID: BTG6acZ7GjLVOG2OVuVhzUmZ4vK-WpHZ
X-Proofpoint-GUID: BTG6acZ7GjLVOG2OVuVhzUmZ4vK-WpHZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX3fKdxcS165x5
 ZODe/87a8g5fkMeGrlFbSMRtqRTLy1EaOWMDw2EFWYbLu7KQ5D8SReXcOXLVbgeEfaNFJ8eP+7M
 ltloXo5eQIokLwXsqlZ6GN/gNvc6dY4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180077

2026-11-08T04:42:01-05:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
> ISA bitmaps don't honour riscv_nousercfi because the ISA bitmaps are
> composed during setup_arch(), while riscv_nousercfi is a __setup()
> parameter, and those are parsed from start_kernel() after setup_arch()
> has returned.
>
> As a consequence, the riscv_nousercfi test in riscv_cfilp_validate() and
> riscv_cfiss_validate() always sees zero, and Zicfilp and Zicfiss stay in
> the ISA bitmaps even when user CFI is disabled on the kernel command
> line.

(I thought that was the intention.)

riscv_nousercfi definintely should disable the hwprobe reporting of
those features (my series did that), and prevent their enablement in
user-mode.

Why disable Zicfilp and Zicfiss in the ISA bitmaps by setting nousercfi,
though?  Aren't the validate functions just misusing riscv_nousercfi
instead of defining a clear detection mechanism?

I think the ISA bitmaps should consider whether Linux has the
extensions, which with standard SBI means a successfuly executed FWFT
set/get.

Linux can then use the ISA bitmap to decide whether to use CFI for
kernel code, allow it in KVM guests, report it as available hardware
feature, or allow it in user mode.

nousercfi seems like it should only restrict use of CFI in user mode.

Thanks.
