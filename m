Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531288;
	b=mbf6jc0bxefTm1IpmoqShNggJOCZu5o1S0sImJuFExM/aU1q+nW2wbF7TLKULgRF/gg1
	 0bdC8NlsLx8qWQw5lJRQFYP+1c7jnNIDjRSuDm8Sc5yqwCaOnlBLg3spp7xDOQBRuc1pu
	 5x+D+L0JG5pqzDQXfQp78dPw7wVOvb8JzeJYY1G35Qz5/MoQc6bQ5YBsbsO4oLT57YpuU
	 oGg5aKJrGhwY6htH08zIFauD4w55ldv8I5VDIUYLKEGOx8SxhycP+VoUFBsw3r5Hu/vz1
	 5vVOucRa78OSScJ5z/WEXtNtruKhhjmWLD1FgtupjlIw/YQ9UdstQ/r4C01Mh/WgOnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531288;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gMaNu0XBKBvpaweoggrsqRVklH2m30swHb0SwRHlLqU=;
	b=DdgaHhGkH1eL8zIhcn0edRJsARRMBT6QMOArZ4Ys6CJne9dp0GK2SQsVp2q7D+ZNBWxZ
	 4+XUI7RCo8a05/+SIdVWR41idjDlJ2qi5xrvEeRLmovLJ932hPTH/rENPvI74aUKXCm5v
	 4XUpvnLqn78rMeOQsxv+rq3Ua+NrPiIbquhbQF2Wrq9vy5Q8JwJq+aSURvq4QpzfbkMiA
	 TyiWyIwuIf5VY0wRQ/FI7G4wzCqRUfFUlmnmuTyzXrMoQ+XiBWvu/96f4BF7OywsHzVRt
	 uovxZfJjXqtV8Ma6gpmI1qqywzp6pMLT0212A9S+LQQIkrCw9Uv0xPjqOeBQPuGnx9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3goSmAI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2GEcFeQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2840606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2840606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3goSmAI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2GEcFeQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOEcQ7E3171249
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gMaNu0XBKBvpaweoggrsqRVklH2m30swHb0SwRHlLqU=; b=U3goSmAI+KeeYxCJ
	n4yMkRsXUQG4j/6OI//Tl7ryrJI5nb342/sMxyjrZSCwvx4afORm4NgrNXAZzks/
	RV1Y3i0OtDcEqu8dUC2Q3U2sm7dUkCuU7gTVLfPt8RzrNL/tLNUzSxuROHZm2UVA
	1lQgHyUShBPgj56i2d8/W4vVKCqkodttNy28NpxmAMkd3ZOFVzl26Z4sjuPlaSH7
	ZdItJo/xOVODKoLjCFGB6TqVhGzCYtX7P2XGzNHqOBJhhk3ToBisHUQd08qY6mKP
	sZ+p71cVss8bm0gSNv6tzQSD+ZLoG6aFJI9d0GsCh/E9xAttlyC3qUvU8PGQGntn
	FbQ1UQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7rpcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:41:26 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-869553205a7so62427207b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795531286; x=1796136086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gMaNu0XBKBvpaweoggrsqRVklH2m30swHb0SwRHlLqU=;
        b=A2GEcFeQIajoLnXrKkaSScnWlLkleXW/JTC6BMdxmek9ICYC5VsZcAVNfYwUrETBwx
         OxEuPnuDidysbPzE8D8oe0cnQ7HCg1ZUnxQThYg5H9MFikJTtUKHpn7lArSnzLUj0lCZ
         owIBHAB4fqDobn/SN0PiG5AQdSauEBe2RFy9MW7UTKNr538u4zFSNu/OwhJjDQvGRTJS
         c1sjUIAbP3NtnkGb6FS6vasOkd8N2pjEPMkSPLku2py7boP+TLmpUVhZKQClHAvEH4Qc
         L7GPGXAvW6QJm4+ZKsgiXp+eHK7a9I/wVql4fSY8baxwAB8T78wv+c1jVGGzfwZ0Nl7l
         00Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531286; x=1796136086;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMaNu0XBKBvpaweoggrsqRVklH2m30swHb0SwRHlLqU=;
        b=m+dISGLVZ7VtXxvzKOFT+6BbmgtqzpMCUpfH5L2zchIThA/ZwlsZkSrtxxkX2LpswH
         AGjIGiB2xEACIqdtvG9439Gz0NeQ2AktQrH+uNexoryzH+vyAJSSxXAYZgbA/DqopTKS
         UD9mF9M2cXPmuBpBYeCd1im9nS2EovbHTsohCe+NFsrt87Z9Y3jwUW0t0OaWVV/Sli5K
         Wyjm3/kpulr+mzzlf8BH7KP/8eUFrehLsBNZ9fkNUAGn8cKWAbUA5vSJZjoEUM9cFhQE
         LqouGn5Y1XL0v/IorTCnqxKaFh4TeWu/OjwALC39Bw3iapXg+nMF/CuMRGvV6KHfE6vi
         vVTg==
X-Forwarded-Encrypted: i=1; AL+hErGy5kxSioXCj6iO0xi4ZuTzg2Xb73uvCVuCTqEqTHenPWKeCSZRt2MQESW2YELiVtxCm2ElIOJ0BQuWcEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nGhvMb+k3x6+fr8B3PlOVFWULnD6oh5hpuO2eNkbTpcxv1Uqh
	KwM7jOQXy9BpQx1ubrbpbrBkcksqihu2NKwSEKOdJq7Q2/8C1Q7yg2JT6eRQRZoEboC+Xb7WAp/
	h4tSRh4U8BxC/sjgMpBzf+aW8CsmyoffDq5gZ88rrZ8btcVwLFXOuhfr2YnMDiGAUGDY=
X-Gm-Gg: AZFdTZelnxfIhAaZBrODWinT6psag2/F43xz2GeapjR0c7hS7rHFYqalSnB+Ter3/vM
	k0ATJqcyLeeZKyyAQuHlnW8ryAovvWQ0ke5S8X/8rmr6Yf3NHDBBIY04w34Y4CEtzw36M++yksw
	1UK44MjFBZE/AQ5BUQtQOPoIMNeqv+Hx2BjbwHHE9rBL6T8//qmlYnA2/AwnBTI4y33FSo4BhfE
	6S9yOrUQp7wiv/SDleQzJfabjjwFtXhPhMYzJXn6eJ5uum/254N8CT9ocKqbQ4lIyMZxgsHX7ng
	J8cGXng1+sDTgyW/bor/Gl7eEaTKe3mhL4N4ycXgRlZSsoOy+0qHrACUsUx+8QF3W7PTdea7C63
	ONPWL8rqmezFZl/t1cszE1AMjcKs6hnQtf39+M1MtkyRINKLr8lfBahaTzOkSfdJ6M2MGb3myUj
	GQtLIFlrMwDb6zDa+df86BsrTz1yZLGyhIrJnWaLAgZjjhiRnbgr5Ou9Sto9UGXw==
X-Received: by 2002:a05:690c:6887:b0:8b4:f3a1:aa65 with SMTP id 00721157ae682-8b52043ee35mr56155867b3.23.1795531285975;
        Tue, 24 Nov 2026 06:41:25 -0800 (PST)
X-Received: by 2002:a05:690c:6887:b0:8b4:f3a1:aa65 with SMTP id 00721157ae682-8b52043ee35mr56155657b3.23.1795531285430;
        Tue, 24 Nov 2026 06:41:25 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb4341sm28701571f8f.4.2026.11.24.06.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:41:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Kent Gibson <warthog618@gmail.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Herve Codina <herve.codina@bootlin.com>,
        Jia Jia <physicalmtea@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/8] gpiolib: fix chip removal with lines still requested from user space
Date: Tue, 24 Nov 2026 15:41:22 +0100
Message-ID: <179553128045.30278.93325260808484684.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
References: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NyBTYWx0ZWRfX7SzjEXrV2a8M
 FkDV89Z8kWh49PHBt78emRh54wyG5gbn7IfhRP43PzDNF3w9FSSUesDFMl3fFXvwajGzJ7IQ5vG
 mlZ09XaR+QYJsPuQk2webbcA5lqeBUA=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05a216 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NrOanRE69mB2D77-yfwA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NyBTYWx0ZWRfX+YL7GtcQ/1ta
 xsV0/p87qrWCzMuK0peNi1iBx3cB0bhaxbVnhCsM1wbeFnL6FOIe+NvBbTgWTB2J2KIoqM3XepJ
 klyyWyyGiehRu3Ny1sQyBuyM3ddgUWtIQc91urPvbHQ03kt+KbvZmOxMlFHxE09v5wCpOkpite8
 RgW015NP8q3rb7gIPlGk+uFE2M9XznywUHggDisxz8N4PbfQtGEokIFxQwE8wtQf97GCxNEOaAD
 JClm5ByBffhJJB4AfBvyNKaYwA6iJDANwZmeu8Ztnyn14Y1P3lJ6WsZbP3Sc/vxKR3rTsmifFgd
 GZotYYFy5xmX+o7I8QozUG+E6btopvW2Y1SY63YrxkA6PQujcYqPh7yrnz7O+l43sjrLQkRIfVL
 p9Cz3gJ/zskEyVSLsZubXWUYKZOdQS4nDM+cn0oHlouqyJ9wXLUuVWB8IFcziR66hDwoGKalchh
 BnDzdpHpxmyVIFr1pXg==
X-Proofpoint-ORIG-GUID: 6v6NDo8QIQN_66BQRPD3H67Fp7s8urZi
X-Proofpoint-GUID: 6v6NDo8QIQN_66BQRPD3H67Fp7s8urZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240057


On Tue, 24 Nov 2026 11:20:31 +0200, Adrian Ambrozewicz wrote:
> Removing a GPIO chip while user space holds a line request, as when a
> hot-pluggable GPIO controller goes away, leaks the line labels (patch 2)
> and IRQ names (patch 5), frees IRQs twice (patches 3, 7 and 8) and lets
> a blocked read() stall the removal (patch 4). Patch 1 makes
> gpiodev_release() wait for pending label frees; without it,
> cleanup_srcu_struct() can warn, more often with patch 2.
> 
> [...]

Applied, thanks!

[1/8] gpiolib: wait for pending label frees before cleaning up desc_srcu
      https://git.kernel.org/brgl/c/803a7711476580a9ec74dceab90bb3f8ff1b90cd
[2/8] gpiolib: free the label of lines released after their chip was removed
      https://git.kernel.org/brgl/c/1e63be74fad7990efd58e3221de9a060f2d6f53b
[3/8] gpiolib: cdev: do not free line IRQs again after the chip is removed
      https://git.kernel.org/brgl/c/e275c654269a4372b93b67243135cb2e78ba2afb
[4/8] gpiolib: cdev: don't sleep in the SRCU read section in read()
      https://git.kernel.org/brgl/c/1641cbc799d04da692c01d07abc5cae269b62504
[5/8] gpiolib: cdev: don't leak the IRQ name when the chip is removed
      https://git.kernel.org/brgl/c/de364634c5a2aa50505c41cea0d27e2209d3a058
[6/8] gpiolib: cdev: don't report a failed line read as an edge
      https://git.kernel.org/brgl/c/6a59150a97aa414efca1acf77800647ce9921735
[7/8] gpiolib: let the character device free its IRQs first on chip removal
      https://git.kernel.org/brgl/c/8fe46885e513cbf6127694f12a39f3e4ff4a6ea2
[8/8] gpiolib: remove the shared GPIO proxies before freeing the remaining IRQs
      https://git.kernel.org/brgl/c/88f18f606f18796851674af74c286e55159618ed

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
