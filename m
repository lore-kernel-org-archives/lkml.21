Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702275;
	b=xU0shdm4rz1E0nmYQvM5CxiYGmBm2haBwxxANlP8CUVhQmZpicZQiYwIcjEuS8eD8ZyG
	 C3eCAEApF0WoNOtipksH2Lpu0tcttxtHtkDRPpg97XO0XYYksCVKjzWEKpVZ2wbTHEfQW
	 XokK1D0UWPUC2qHGQ0ndzJDocXleSjV65koa5YUfghBEIy0TieWivO65fMf9xyxr7iLzv
	 1LCkKCBW8V71yxXTuYIchGchGg8i54heavGOg5b44TFqxinMXTrHIfPYSr66A1EDjuvE8
	 ygedT7l7YBIEc9kXjI8phzG6l3ZhFl496z81C+Hvtn2oq32+8bV2L7h1IQeEktGYGBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WbQv9VmMv519RrDxoB3V8STwBIfdnMTFREJPjfzwsyI=;
	b=PRZLYngDIk2h4K8hVGwzJVHFAd7Wx5ZzQhepTmIOj7mLegmgaKVAMwNxMXSBKGiGluX7
	 CCOo+D8ayxqnDA7eWcNu/Sz4GoR4uO/Mc8ZA+eLWvkDWXa4Ii9TvnNsIAuaTzw4nxdl+F
	 0uNqt0EBDilNyPc5u8BLzEOf3ABdZ8IwEohOwBmAXfRnP7cJk0/TPS5/u5TsLhqfu8EXO
	 suTqer9fypdLJ4sU8m6HTi0MB6j4kdF+EMCVQrueOYiiE3ig7qrc/qgNrbPuY7sAdWr6q
	 w0kv7fb6UEU6PuMwUp+iyzDC8yc3p9PQIprbJ6GXi/biFvmADLxFRV9Fw1tp3RrxFEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YrjLyzQb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjWFp1I5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216BF606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 216BF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YrjLyzQb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjWFp1I5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVMsF3893628
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WbQv9VmMv519RrDxoB3V8STwBIfdnMTFREJPjfzwsyI=; b=YrjLyzQbPQuqAF13
	fLqFZi0YYUDLach/z+WWj8mJg/W+n5athvKnEyI9CHfbsjKmmOqTqaXzkk80+iCG
	rTweA0qcoZvgRjLPgMoQL6kxZR3/yYbTtYTv6Vopyox86SWAcbW3ZAa6iuByCBhz
	c0WVYOZZTeKEZtyqLjd40ceb3chelKE4TlGObJXbtCgrn0C1Jz1ryuQU5ZeVKwd1
	6+edBF/CTISzVEEy4qaflp02Ji+Ogm74MuZaNRK+KX+hnfT/OMHUivSNdEnEuUTN
	vLPbK3Sd9YEqLhAIaIW798IJxrObK6Wlp5yJCbEQCaSU7JHBVEFiLN5ai/L4uT4F
	jSxj0g==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm814r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:11:12 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b51464f007so85612207b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702272; x=1796307072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WbQv9VmMv519RrDxoB3V8STwBIfdnMTFREJPjfzwsyI=;
        b=YjWFp1I58/mqA91rEGT1Lmu041a3W4FfTDKTOy3LG/46I+WBHjG4M/ihqpyMEL94P4
         zWfOkMup7PuxWN9WXrUPTpHETrjUS0KkGbojmrBo03FONWxfDsceS2Pqqr6RbfuEl0wK
         JoIFsET6LdQ067Ns8DLsPU4jw9wc4rY8etGWcrVXzTfjsLi4ReD520n+ljQi5Aa7e9WU
         pN1YmGj+UzemiTrxO3KAZv1Gohlk2q+gCU2FlXGnhgs5bDmelPSB0MYzraQHV2nzeZR9
         dUzoe4uhbo07zgmjrdlO4sE6tq+fNTa0C7HyU/W4WAzwpZZLByFVNlKQtoQpkcNtQ1e9
         RYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702272; x=1796307072;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbQv9VmMv519RrDxoB3V8STwBIfdnMTFREJPjfzwsyI=;
        b=2PdsZC5RK2NlmPuFDxR8et1aZwO0gsgE3UOdgnvku6T8jaUhXZ2BwIFOuytEJOBcCv
         jz30McfLpJ5He5Etgl/Xs1T8ntbd+OU4ndlZnFgRkU45SkKZ8JiVbF9t2KjQ8tHdOkkR
         Hli5Ec9ZWTxxoe/kVPetDlM6fwumD2Aj/Fyn0KAEDsxK8Z3/kMZaNHqj2qZtrJoNtFm4
         ug620Z1L8AO5n8d+Zg2QM/mW5CPgH+4RQZRdcQqK+hqXeIS4TokyRuh5fh/UAREqTETM
         LKA3VPaewIOxY1+MlzzmZ3agxASyLQ6JXzSrDozz0ePwBfyqi859iusV9A/4X2y54y9O
         FAAw==
X-Forwarded-Encrypted: i=1; AL+hErFdPwAl/QTq1p+k5amkbjOGGcjYqh0JSDHs5nnYU+cJBkRliF//1E+Ixd840SCvf6XPLcyIFRwWpOlcLnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NNoNcNdtHybTg1nXBD9som2Uksd+4X3usXmWjTS6JUAGTjTEd
	yYlSiH7efSCArZ8RLXnYqwNRCEtYwixFocCVJaRDQMamnYjCN+MNZF+p/umIJJpxJiquEjlr+4V
	+i7lZDNtiwGueugI3PoL2TVx/6NCDKc5iVFW797ilSwJbC79noqo3UQCWMWdacx6Ly4M=
X-Gm-Gg: AZFdTZfufkpktP9RlE3vsV9YgpkEWeQO+UL4m6NsGMXrVjS7eymDTmQkxBM0notlsPx
	LZKZ/ix48suWOGVq31iULhjRQwdQYJDhmB4d9rN0LbTbEnTSQZjQlx8ADiY25RxSuCkIdxqjF3t
	Kimv9vxi8gIXedve2GOlxvP8dlczIfdMfK5nyBNjNkh53a02E8Mcg7vJ1Hsdl+PPVb2uNTxLCWt
	+Chy34f+59Kp7USgVQ6MLRXioRKOlJGpsklLIxJ+RqzOXzNT7WWPVTz/wYcaQ7DFzLtJ0z9lA8Q
	Dh61iy/o872B18L37bS0axc/mX7dJzHyyFeQ+7EfzOKimB0W4D6zRJmpLDuJ2Cs6F/JjU4d7usq
	/+o1I31BJqkiluWqHaHtrUn/f1bU1VB71Ek8/+A+BKxuDrNKFk4q9HoWjKaVtBC9qlfV+vc+zJN
	SkP1rUq9Nl860m0ztIlxaKBdiBRCfc41Xe/iXl9fuBWLhUQemc9dnUUhBjL9npEw==
X-Received: by 2002:a05:690c:9a8f:b0:8b4:dc8e:2e6f with SMTP id 00721157ae682-8b520514f25mr71918247b3.63.1795702272460;
        Thu, 26 Nov 2026 06:11:12 -0800 (PST)
X-Received: by 2002:a05:690c:9a8f:b0:8b4:dc8e:2e6f with SMTP id 00721157ae682-8b520514f25mr71918127b3.63.1795702272013;
        Thu, 26 Nov 2026 06:11:12 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm42005648f8f.2.2026.11.26.06.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:11:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: aspeed: Fix potential coprocessor bank map leak
Date: Thu, 26 Nov 2026 15:11:09 +0100
Message-ID: <179570226688.21819.14587859111511548697.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124135833.2275409-1-liguangshuo@mail.sdu.edu.cn>
References: <20261124135833.2275409-1-liguangshuo@mail.sdu.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nmncTOfz9gbHQy2on2422qQnVsw7g_9C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfXzQQGgDOk3dAU
 x1oKcMzM3iE04vsGVob25WIqY4d6cG8Nb1VBFQWGBFqFQtpaQe1YkcmCPJVglCBQss7NsZYKxp+
 ftT6ayA2SjcBLlyaGQ2EULkZX57SHFM=
X-Proofpoint-GUID: nmncTOfz9gbHQy2on2422qQnVsw7g_9C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfXxTGSkEghTM7U
 ++6uTe19kjIJLfe3UCFShUD6+7XR8Sj3zeMGIXtaog6Q5gRD/FBZ+YDN5obHWGA8gtL4NQKfO7v
 UGofhDumHKpnPqgsitzeY3MshWFs27QciC6mQRFINt+15LGS2OXR9iiyg0A6dC/hFDiCW26JJJZ
 kvlXlfV2QjsuuwkVon0kAxPhlgf/FWsmoAXX9v6+Lagp8PzMT3pCxvkieC3HGXy0jiRG47SE0E4
 nSvZMH3pKchrS32mBXPQ2Xc1iDYw2K/LYx0DaJMIOFBxn0BcyOLR/OsPicVyhrIZDtkr9Wy6jq7
 nmlRktq0x2I31XznyML1Aunm1Pv+vsNt3JPBLcOYcLsf5QoLHWPPOjpjPPtj7I405Bv4KCM1otO
 YpRtNSy26Kcmw1pb0D7dfhMVGfG0rpW0nGXJGOWb9U091MsStO3toFBkR4ilkkRZZk3Cgw/wT1l
 PVHS7y6mdUFKIa4Y6jw==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b083e00 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TMjF35BhI2Zkm1y86xwA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055


On Tue, 24 Nov 2026 21:58:32 +0800, Guangshuo Li wrote:
> The coprocessor bank map is allocated lazily but is never freed when
> the GPIO controller is removed. Its only owner is the device-managed
> GPIO private data.
> 
> Allocate the map with the controller's managed resources before
> registering the GPIO chip, so chip removal finishes before the map
> is freed. Round up the bank count to cover a partial last bank.
> 
> [...]

Applied, thanks!

[1/1] gpio: aspeed: Fix potential coprocessor bank map leak
      https://git.kernel.org/brgl/c/f18a4698b0124f77549c23600fa5105bac2951f2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
