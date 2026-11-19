Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066637;
	b=Ats8aSdNhTb6T1rH/Mo6kVOBhFJTLwXTAtRWJY5Om19xkmfQFjK3TNvPFGE5Q3BahrvU
	 rEXA3jSXhkr45tWTjxoj2SaqdlGE0kA1wKcBW5byuNSTAfdUz8WLvfcLFbA0hy+bEeU9X
	 z62U3yKBrOz0LKH2myRqlbNXYvEjkwW36vZE5xUMDTYoolLyBrI4YwZ6A2fuj3e3dWitd
	 fvJrPP5PXkIpU+1JiqGehbxa/VJQU+a7855gEU22jlVKtMZW0wTPnqBRyPD1xbVWKA3eG
	 WSDJUgRpzS9jVAXkOOt0Ezs5LDFsrzcH7HFWfvGa5Z5Cn3LKbe6wfjSB964COyM+eHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066637;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kXuNtSAmr+Pqww7RppGgLBQmvifOl6Hq2LhWjIe71V8=;
	b=QIy6n7CWqGbiIDhjGwi9bqM4z/BCeYjiRz5pm+bMnv5VTRmfFXKMTJcceXw2T7x1WAVs
	 kf6M0N+Xevs/DR6eEBKVwcceN+PycDAb40WgCy3+GZGRQ6cMrg9nq3lDJo+o6N4X7/a4/
	 csnr/o/6DQi+yQwrj+hGIvpsQf4Lj+4Pg97Ym03oXapyxj65T7MU9QvQjdj4TQcgJVB/E
	 7ynkvVDv/BvGzViAEz9Xza/mwYrzirjSjmJ2dcxDS3DfUJAh+FSy3r2+KRlj4qesT9hak
	 YNt59DKm/CuBNpEy2fNoJoF40PsQYG/CrDVUdOWY5GISg8op1mwsQiYmf/Ix/Fl22nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aJYwbou9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="J/KLzxqT";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08AA606B422
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F08AA606B422
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aJYwbou9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J/KLzxqT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1Ax5T2188698
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXuNtSAmr+Pqww7RppGgLBQmvifOl6Hq2LhWjIe71V8=; b=aJYwbou9o1/UPQ+J
	xkqhiHpIVeQUOiIk8ldF4poGvECw3lXj8r9Phir65vm5e/5s++idTxpRfJFjNPPE
	JEURtN29gzHQNQSASetnPP1GfW/c5f5xuPBRn3nXC8zwPBdBqHllTn55yuy8bBOH
	o69+Ijt5lDp4KZkFRyKcqCDHg3bu3isHex+QxRAjVhg0RSTYwaGUNX4YXItzEQQ5
	RxHGVC1yC0w0HlalEl0DIshJh2bS8iHnrIu0DStpbTRkWTyTQD8oj94JkISWYwe+
	UUGEImr4TVf346/fMp1HvqxG+yV6kfDqOSbt6OQ9dnJf29ao25POkNoCBnCfDmOZ
	lCXhDA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ejn71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:37:15 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-862bdb93612so823625a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795066634; x=1795671434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXuNtSAmr+Pqww7RppGgLBQmvifOl6Hq2LhWjIe71V8=;
        b=J/KLzxqTtKKC9dfdoYpsG2B5lkevynJHLm/RxhCS6ZIjfxDUurJaCtvRQTj07HFlJP
         6vNiwPccUp0yyzxqXjpfE8xeOyIce0HhZUvETnqze+goYnNYgvXtFBXD+cZcSidHxc0Z
         M1vdzotkiExILkZY8OyKILXnn0C/QYPpEdyEHhMxbQCD2FjTEx+uTR3tBhIiRf97YHcd
         6sIYOPVsZSCNhkHzNVPQh3R8guuLiQcnr8w6vaomELtF7uDdvusgteaSqnebG0Bs7B+V
         D0BhrS/NackusrfLBcMo9A9wpGnZkYV4GQSWWvbJ+P4eXHPkAkkjWaWEvyI6FpCGorKR
         s0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795066634; x=1795671434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXuNtSAmr+Pqww7RppGgLBQmvifOl6Hq2LhWjIe71V8=;
        b=DMrm80SjbhS69DRgAVJOQXqodQWGlsjQYRaD72pf7iDBZCIPj7a6EzArUg9RjPCoR1
         D4+m4KxABdott2a49dAZr0Szn/YNP4v6NvJmh2Pj7kySNLyE3D+DW+2kmHLzvdBvMsd1
         yNVTs9jJh+e0UXsb6XhjfMxbG4QPw56HUSgDPkOMnvBO750Ni9J9QL53MZgzgYxEP+xY
         88C7xTMrAbVUz4OLj49EWr/zstWw6G7GbCMTGQPEaY/8FNrYDRh81pGar23mrjbcKmA0
         IPUjm0csqMU9YsTPY16SgjUVHhfezxC+zt8OO1lLDKE+G6XyyrAL45VY0Xs2DnH7JX4U
         K5jA==
X-Forwarded-Encrypted: i=1; AL+hErE/6FIMu833HKeOoP9HDiB9vV4Zp1O43I2vR1gm1nDQstIdOtT41pCJB/e5xqlviKz94phWmT0DIQ6bUx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rc/uSoK10UkUbEfAR/y8mrMXsjBLBa5RZe1qpILX++Kf6KL1V
	uEWiWeKKDgP/hcu02k0V+GqkuMQ2VerdaSMGARvkSesQw4JLIg4xFltTQ2wCTYhxGTGhp1/YHWa
	Au7c1TqYC266m2tYDRSN+o3/63ajx1ZmFiAwIMPmiDgGsJgfOmHv6Kcf2X41Lv6Em8Vk=
X-Gm-Gg: AYBFou3LTQNvsRkGprGOCTbjq/cBoPR6nZvSJ4vRunhFLiq3pzXETIoQyT7L/EoCqBP
	h5f0Gqx5bA5puW8Vhtkq5jP4JQcrfxBDj0+6fX7R9N+vj3Y8hFZK+imiBQ94oIoPtkRi15qLUZI
	UHBqgE8rQAh1JDgcw/By/Hs4hT5P80FD7hENgGvioLAy7EWISJlFjyMXraLuB2me64OcLwymDIQ
	JOqu4Mu7JYEY7oWWEmh0Ddpwg5iBtJRTbCXQrNRAPIKL3IjHiu3kpvG/b0RoM857AQKbNvecTOZ
	q/9avDl/WL7hSQ4KmzU7R2PKnH5DDw9HPvVpUmIUdqru74SNh+bt0TEBlwuwxUX4wu9k/0KmHQN
	ccwGQRTAd6tnmOm7kQ9+dZhPMh8RESBWd+PSSk5ow8LUoWg52D5mzJAs/69vvqQzH+zUD8TkW91
	QzScIgRkr8SnZBDk8dtwW2NTzyuaSm7xtm7WE/xS0JqXAN236gdFcc
X-Received: by 2002:a05:6830:2543:b0:862:cac9:8ed5 with SMTP id 46e09a7af769-86308fe3689mr56283a34.2.1795066634321;
        Wed, 18 Nov 2026 21:37:14 -0800 (PST)
X-Received: by 2002:a05:6830:2543:b0:862:cac9:8ed5 with SMTP id 46e09a7af769-86308fe3689mr56276a34.2.1795066633920;
        Wed, 18 Nov 2026 21:37:13 -0800 (PST)
Received: from [192.168.1.199] (104-54-226-75.lightspeed.austtx.sbcglobal.net. [104.54.226.75])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f0138042sm3494162a34.2.2026.11.18.21.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 21:37:13 -0800 (PST)
Message-ID: <7b19010e-54e7-418d-9fdd-bcab69d8a885@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 23:37:07 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hexagon: bitops: use the compiler builtins for ffs(),
 fls() and ffz()
To: Tzu-Ching Yang <shingekinocore@gmail.com>, Yury Norov
 <ynorov@nvidia.com>,
        Brian Cain <bcain@kernel.org>
Cc: linux-hexagon@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261117054939.2126980-1-shingekinocore@gmail.com>
 <av3-Nf01tdGw62lh@yury> <20261119053249.2098578-1-shingekinocore@gmail.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20261119053249.2098578-1-shingekinocore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMiBTYWx0ZWRfXz4jXI3DWr1qk
 ApLW2ZjvBN7TfY3SjSe0TZzR8pMNZqGJvVltzVSxldaFb8OElI/Wk8cYXTriolCUSyJVlnyKQnU
 SqFch2duntqL6f05yrzlIvRlSj2/FYkY66ZomxwstFzlIFAQpn/evlmsLoTlOlRrpXVgfvSpejf
 oEg4/8NuwFn37RRMjH9O7QKW6vRmWvVNheI4ghGsNxpQjnFgI/yTbchKxGM4ZtXQwxzztugEqXu
 JqTYGQQ53cW8bVSwTHw+5L8xPNDFzcFTAX8Glh6JooykiWIlKyBShH33ncvveoibMyir3CGa+xl
 v+tU4Wd7oyUwgdBF+0nDnxDROmIzfvNjIzNu0S1wdHTrg5qHNh7shAQHR5FxX6ZUHuzrF4k4uOm
 kGFntZnnCUD0tMF8pgRjoufrCCmWIHKnqGRsrYBz0U7doeF3y2O8Ud/inm0rr2D9KmjndY7kRyO
 Die8PayZV0+UVTBMqMQ==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afe8b0b cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=x6rl1zRT+JsLSO7OGbGBKQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ikd4Dj_1AAAA:8 a=G0DxCgSbUnPEjjFRZWsA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: yqBtvuPrlFEIhTa0hGWGju742TaixEwB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMiBTYWx0ZWRfXwJhjpOAGorZS
 wlB56YoVHmFDiXFYtvxoM6MbsH+gAPBQfLbwhQi0bJczULVSqhRYNFAQaY9WEYBwbjqd9dV9cRj
 YNRPieObbVwMAzYy4i+wJargN0XPEyw=
X-Proofpoint-GUID: yqBtvuPrlFEIhTa0hGWGju742TaixEwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190022


On 11/18/2026 11:32 PM, Tzu-Ching Yang wrote:
> On Wed, Nov 18, 2026 at 02:36:21PM -0500, Yury Norov wrote:
>> Reviewed-by: Yury Norov <ynorov@nvidia.com>
>>
>> Would you like me to move it with the other bitops material, or leave
>> it to Brian?
> Thanks for the review.
>
> Either way is fine with me. If Brian has no objection, please take it
> with the other bitops patches.
>
> Brian, would that be OK with you?

Sure - sounds good to me.

>
> Thanks,
> Tzu-Ching
