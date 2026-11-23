Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448813;
	b=ILI6vJy2mu825M7CJ3ZkmzM7yHqbkZaSkdyYGsv9K55HblT2IdSJikqhdi2Kc8d5oql7
	 UFTy9rbUILCOFg1/u6OpVBiLa6gL2JlwXDIzXcVzZKzUpY2Wdzir39tF8gQIQeZxOjM55
	 SMMs3dV2/22io0aEJkS2q/BXMJ1HogzOXN6a4Uw+300MY/RhxcR/oShyX76DfckgXrjP/
	 xlHc2v/zvQ2zh6EpaZY+1wYQoP2UGMI8RUZLH3X73F94nEBOTFclTm2HnVezVIs8Pg1S2
	 yXjnvYvJyZw302TaBF9BSxMKZQK8Mc8usGC+R4UX/CK5r05NhIcASThgjmLw6hA31XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448813;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=;
	b=qDl9LGR2yOXottf3IdKT9c7L+xK3GEJgN+VnOnrIRctqbryXL3tFR3v1drqn8VYzvEnJ
	 1ky/H3sMYwVLSBlBXLfDXWoSshpYW7nvvWYogv14StSJl9lYHva6c9evx6iv8nXMV8tXE
	 PaUbjmf4y9nKveihTgZtlW7wiEv3d/0wXrOYKOFzDTxfMAK7aZhiweDAUyouhUu3wcm34
	 Xpbts3nNQuZYzd86OJf68nQ4ZIC+GnnhSY1s2fJD4ZvZbR5Ik9IIcR9q4My/tC7T5B63G
	 v+ORCel6nhPykWETqkZ4pSBHEAxUEH3hmkB3V6OwCBrQw1+3uF7ft3HNgeD9V57H4eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqSY0Gh1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fGwyLJVd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51E1606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51E1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqSY0Gh1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fGwyLJVd
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLJW14030561
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=; b=PqSY0Gh1fTy0p9/x
	thCR1UDcwGizzcDS4cNyR2czaiCliDa+oDfPVvpnWMobkotiE7JwsMPh1N7k17K4
	UIBCZdJi3RxRPSP6idQ7T9twRX6i4l9aHf0G4Gv9dc4CGp419YlccRgJKp3hXikF
	+xIyWDuWjnsWtbAhU7lpKq682R0cEdvBKMrnF4NQnHwjo2dismK+Nz/f/A1c1ZRW
	kmJzENg5X4dEYjIsFUj6bdDgMgN+JjGLveuea6/evWWdK0lLYqGn0PkEo/KQHD7e
	jc0uz96eC5vcpBhJ6lPHYzqnxstppijENZNyJdgR8MTW3jJGFosA/wuZ9AT5Tf60
	A8AZnQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsjbyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:46:51 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so952540e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448811; x=1796053611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=;
        b=fGwyLJVdlDoTopazap63Xs3WJ3AVdinWRq8SnD0GgDlOhBtvQR7zW8YZ5V9m+KoZcO
         eDbv7NAQibtKD5paq/4iYLUOr7UuAwsXnZeJm+JKh0mqQlaWb23B/uNOXjCfjf9UI4LM
         BjCc1O2j1z2x7h6xIygsztnsI80lJCzQi6hmY17gWrVTvdx62XHCEKf5F7ZAiretL01h
         I3zbRrfLABvw++UlEsODBycXLfcRWUVz9i2VGj65hdJV+EXJrBbrl5av1tm62wdwV1Wx
         q6wm75M+wih8uD7I6VUuUhn4XFZVvapiV6YDh+8oDOQWUmthqttXImIxPee14Q1qiLCu
         61aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448811; x=1796053611;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=;
        b=NVauTpbKhgB2G/ZmfV/mLFpt+XULOF8lYp6FpKK4rJEt7GsCuF78ht5A5tGQ6d23MG
         1MTS6oLUdLBjhYiNzU7SN+Dzv6vXHYw3vCkWBYmv3xp4eaFfuOj85O0L0L/7g1hDUkCS
         CJWpwdklPoRsli0iPepEFvAoahvNmzCV8U8GxiA2fURm7Zw0FrjQP0b3H81wBjJ+od+w
         xOCbr4Iu4KoWIopwbmzYgHGuQ7TKZ7LbvHv5UXsxNg2Tiz4NDnVIayBBjKrJeg5fMFyA
         nDEgLJO7vSjj/r0UyXZzBL20+7ryHzAJjDkvNQne1jV1W9LweymQIeVJEys0zQkojcNt
         qb4A==
X-Forwarded-Encrypted: i=1; AL+hErF3iuRYG5ru+Bn4dXejea28MvnQU3UInZZYE5mgIwki2K7qGCYc5kkHM0IBH52yJtHPErfgLSBrTMkT0aQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U/4aiZWDAMy5WMTke4uSj5UAUrAfjPAVGEjNF8d9bssVwCXqj
	DByg7uopz72C3c20XhlTPk5tEmqlH+jphEyXEh2Kc2X7kF4Z/J/d0HBtnfrWJqpHJUZjdbYwgCY
	Vdab5KurL1u9/0xLwpCGJDMu1nC7I426NR18Yph4geYPhnFk8aGStwSbLnBh3XvpfBEQ=
X-Gm-Gg: AZFdTZcOzUZTAWrS73ebyWDPb87fhW1sKKyew+I6yCyvEseB3mC1ZeWqBJnTLniZ3Je
	L4jmOxbApw4f9YI0Vj3ThfTlTBKxilwLQ6Z4qXiMUMxGXy8jLtdG+j7LEfD207UUx6gX81DPGjx
	jJK3hImY1YFQoljfy/KWX9RIjlCRofXwcFNSSsb4V7mVLB6MiGQ4MybV2v+AB4c1MhlL0cppAZw
	8pu4g9PBtcm+Kk5m3m2BgDHMCXJsvo7iyGj0Ofz3qlWF5jXAuta0YUhnJxi5dvWhhG6n+k1yQkp
	zz3nq07U6fmLWZaghH9bdUo+J/eDG9cCm8HAyiCknp5U9oqhlEmfn9yBQNgoI4fYj7j2RfpUpRv
	HDuiZQlEpSlYJIy41AH3c3LadgO1PE1rWhfdhCs6Qh/Nco0sEmWOy9sKzzHmuDlV/clunSK26DP
	dTJfss/s237rtYX+MQwmi5xRsQcJBZ8aM7pv1IoQ7D7abGll/o8omweCvkEgmboA==
X-Received: by 2002:a05:6122:46a7:b0:5ec:e522:70d9 with SMTP id 71dfb90a1353d-5ee8af2f1camr5860602e0c.16.1795448808642;
        Mon, 23 Nov 2026 07:46:48 -0800 (PST)
X-Received: by 2002:a05:6122:46a7:b0:5ec:e522:70d9 with SMTP id 71dfb90a1353d-5ee8af2f1camr5860203e0c.16.1795448806310;
        Mon, 23 Nov 2026 07:46:46 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm133705685e9.3.2026.11.23.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:46:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/2] gpio: Add Cortina Systems CS75xx GPIO driver
Date: Mon, 23 Nov 2026 16:46:43 +0100
Message-ID: <179544880105.88036.6302106975992553295.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com>
References: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com>
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
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b045feb cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=d7jqCbnQutjosXn8mJIA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: H4HL9BT755-k43jOJyKQYH52rTu1Gr3f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX9vs/klP8UOjX
 QwNkYVlf2V2qHN3HeFJDxiJAQOBm6dmNju791Q2536DivPHtjcmbRca1zt8cYYXGujYw7ggKrjs
 w1cD8Dgl8MquGOPw3bK5i/p3lBEDeLauc70F8wAXf1EXBNtbyRLCW2lAyoPIegsOETly0fTjeGB
 8ScKt0KIq4cV63NLnQoE2txoJClCI88uQJmHIi955QkeonT0yFA7m/0HJ7scW5twUfYBSuR9XY4
 39LqaOYPk7wBs1VSK/SlDUOm2Qlv/q10MrfSUpc24ARjue+V11rnSEKakl1h0YB0HZx93HKNF38
 5ybtos2a4fm4PfD8RrIJwP9+cfwOL3iBrN/Ku8Xit8W8K4NR74IJBfj7auy3l/G+HpbJ+YlwIMI
 fotFwZP5nx5jFxyizTZhe1/rJ4hy2CiXO+X7DSecgkAgvJ0m3kFm9n5MWKOQoGPEVrvmWKvm6e4
 K4uYoJd7k2f48pb1pmg==
X-Proofpoint-GUID: H4HL9BT755-k43jOJyKQYH52rTu1Gr3f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfXyOUO9zHcU1Jf
 yZiwSMSs1TLxMEYzifOCE7NL9V2o9zR0bKSxtIpUXsLh9NoTD5FGtpSJHJY0VUySkTskJckzTrG
 xTtVywGDkJ1d1lSkfQkGMxw+z2JL3Tg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230062


On Thu, 19 Nov 2026 18:09:07 +0300, Fil Dunsky wrote:
> The Cortina Systems CS75xx ("Goldengate G2") SoCs have five banks of 32
> GPIO lines, each bank with its own interrupt. This series adds the
> binding and a driver based on gpio-mmio; level and edge triggers are
> supported, both edges are emulated by flipping the polarity.
> 
> Each pin is either a GPIO line or belongs to a peripheral (NAND,
> Ethernet, UART, I2C, ...). That choice is made in the global control
> block, which is not part of the GPIO controller: as discussed on v1 [1],
> the driver does not touch the pin mux and leaves it as the boot loader
> set it up, until there is a pin controller driver for that block.
> Testing the reset button on the Securifi Almond+ requires selecting
> GPIO37 in the global pin mux before gpio-keys is probed; the current
> boot path does not provide that setup. The tests used a separate,
> board-specific setup step. The GPIO driver does not program the mux.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO controller
      https://git.kernel.org/brgl/c/9413109c1005d207ec6cc3edad820d671c4d73a3
[2/2] gpio: Add Cortina Systems CS75xx GPIO driver
      https://git.kernel.org/brgl/c/26a9a31378673ae7da0f2dbc706e2c72628405be

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
