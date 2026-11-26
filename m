Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702141;
	b=4U4En68zHwlkHSZvnlsNOjMjvhL0jxmXGdXQBUY13f7UQfU22t6vrHkjK0Qa2zuI4E1e
	 0+u8ObC2Lz5olZ2lsWTDBGLEmo5XHiix+c9Ney/oGn2ocAgmOgivO2P0znOHIXtirB1+f
	 KHJT7npmYSLvuyAMU+PgkpgJiasFCAY7WNlhrJ0emBNWtm0JSuTg3cB7sfzVyFuSAZLzn
	 g4RA8vehHJHwSLJx/gAWWWesfwTy2P0zcMlqTIXb9vW2pN3ZNYlEqE2JnBi0mRLAv9Vga
	 n+VKwc4qVb4yxOeR/NdUJg8oRp1b4cSHOxZc2N7GNrVx6pUplfZY3kQ//YyJ9VQIKuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702141;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+RnIM1HtBqJmr1TYefSFaUGmNdXmFqkNW1kZ1ss1nFA=;
	b=fkuPaXymLvu3RiCT5S382mZvcLteN2yd83Qy/i2S/LZRlQjLWTKAR8OtZ7cDKycHfOKR
	 VEWye2v36d0VBwwzCRruznmsAOP/PouNl2tYPtxMKqW5E9q7aq3fjvJqf5E5GyG9wDtEz
	 hzeeXkmnKnM3y8C1AFhk5NITzG2XjgNp4SCBqgDcG+W9DI19Y6RDWHkFrPULcASbZ5Myk
	 cpWwsmWtYcGV+qJUWrkXeq/VRxc9j/xV5AnLaUa0zklsi7Rl6wemQYx0AyyE9e/ILpqX/
	 fOMLDScLGsmSY4uZa458WflQ0GrP8Wj7c7YJNuc4gP8s4Jk4cCVpn7cIn4oOGZNSsNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lW43wOmH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KIdY7ypv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF63606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF63606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lW43wOmH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KIdY7ypv
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVc3g1275558
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+RnIM1HtBqJmr1TYefSFaUGmNdXmFqkNW1kZ1ss1nFA=; b=lW43wOmHoNPpHkvT
	9ddEi4N2W/l6Cv18M1Won6TjJfjMXKA4KAvrEbtaM9l+Aaqhp886oj0JL/RaYOTI
	LbyetkOg+lFv+f20Behr3HyGcTaL/JSW1yFbeMMTv3a6+grTCWp1pom2c4jMRTt3
	YTevRga6DQgLa2mKWV9uYGqPljyoPnBETEEJCX4cWGQmAEDgLg85SHJ2O310yI6V
	3Ttx/fzhbN4db44RghiiUdYgm/mwYcHFuUmKOG2JVLKhKppFSluIAM8+Wx9+V9D6
	8tidhypqnS1DUVaOtuiuxQSh1r5JJbF06C4wzZrvwvBuKX3UpaFcSLwLdBjvRkZ4
	rt6qqg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7sjcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:08:59 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac41ff334so5307136e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702139; x=1796306939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+RnIM1HtBqJmr1TYefSFaUGmNdXmFqkNW1kZ1ss1nFA=;
        b=KIdY7ypvzWNEJpPE1zjY9JwVUwkmPl3FwlH/V6mvBiFQGbQGytZA4XjCofszz9wY/g
         tQKbwYbzuwkBZbfp/N8vuE+yMsjPHkkyb7pEmP5fbzZak+YnBThwUCVHTj0OGf5GkoWl
         mRN3W1Jsts4urfNJJHajr4zP6qisVOh0z/NwhOrB6xmi7GHLhXh2sc9HjIYllevJWhlY
         6ZCtepY22C7VosJU7pQP2GGyrAxmLI5J5HH++d5DXO4e+fQ02q+XBpL4SPdVFgq4jqk3
         WB/TnPJBcvbIWwZ3LcjedjayFEyid+sy09Xc7PoWF2yKJffvz4xLQktUnWe4wXJQbj2W
         GidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702139; x=1796306939;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RnIM1HtBqJmr1TYefSFaUGmNdXmFqkNW1kZ1ss1nFA=;
        b=hVmjCb1EBhNp4TNMBxXal/kJqMYeVBAIQ+3Mnzh3+NrMt5VWHHL2VOOEE9MEKLYp4R
         FBTeuT/5mZZQRGtFexNgBLK9A3MZHF8pULZBC1cuYoKS+3oiLf222XDrSJpIBIKYKtHr
         PKmEPGeXmwePtQHDboZtf4Ty9JjqFUn11Ap8+6Zfj2ZP6XJVFol2dPy36MHJU/iB82EK
         r3J/xVvq89PCLhBSi+/eZmUOS4/4baNJyGZBazyedz0lGrvjAJ0jwxvY+qEhBSBPMc9r
         BYN8z4uCaz52y9u0FIE3Cn8y07aSTCAusT35YBmmTU+upB/E/I5MfI6uEA/vFgFxrSC0
         N86Q==
X-Forwarded-Encrypted: i=1; AL+hErHARrrbFpEICIwjyph8mxp4QT3/46agBJx0We6yagbEK7kO3UO08aYXRk/zTvvwVYVmnhDh7iV2qvWIWmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Mpg0tpQILq0FHGslqr4qlba4VzuGQ4apMbd21f7noP8mSI1Cz
	nYDhdwHJPXikLCAzQmX0+yWGzk/6pQxn533X40LkVHtyvAFCJkLDsTnp2/5Hv5ADlkc5UIjZY0x
	KJq9bINChPo5AJRLaVwpXzIacO8x0Wp4LG+fXZHUyNKg0BY5BtuZRCvxDEC3Xbxgb6X4=
X-Gm-Gg: AZFdTZcJm6jtvGOsuao6pZxME9XS5KtU0SxrEOyz39hXqWwDOB9t7x5UWNwW9kfrgjs
	I+hSgH1+MSiTcMtn3Js4MEt/wzpPizLBqoyURinvlg+Kynn/db3z9kfFkOwHmjp6Ell3uirzNTd
	EJVNJ5FFCwSXTX87En0OxphG3l3rTm/v16D+hS/hzTeF5riYOefteromszTkrazEL7PTc3F3hkL
	873JGYx33rjR7NEq1sqL66EzpqrGdufiVJeYS2HwNLlgCmX8vZ3oSRbEg1McM1SKM11lszO6taa
	1dOhTijCPq6YzPx+KzOYNdxYwwQ214E+4O73QqUB7fjIMkpk9NXNfW7VhMI4gUFFdfsDl+7dmJ/
	cnzSK1kCJUZecD+9r8eXQdr0rscZ99prKDK1lpaNYnBTzX25KF7xq5ualA3pkM5OyRBoL13yQWY
	O4zFmUwAWqf5XDNnOz4D+jAXpKkGI9JwwGzIEFT+GnB+smKLxHY2uIprSZZj1zgw==
X-Received: by 2002:a05:6122:893:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5ee8af4d132mr13026179e0c.13.1795702139118;
        Thu, 26 Nov 2026 06:08:59 -0800 (PST)
X-Received: by 2002:a05:6122:893:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5ee8af4d132mr13026141e0c.13.1795702138655;
        Thu, 26 Nov 2026 06:08:58 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8533579csm524644075e9.2.2026.11.26.06.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:08:57 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org,
        Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        j-keerthy@ti.com, nsekhar@ti.com, prabhakar.csengg@gmail.com,
        avinashphilip@ti.com, sujithkv@ti.com
Subject: Re: [PATCH v2 0/2] gpio: davinci: fix probe-time IRQ setup
Date: Thu, 26 Nov 2026 15:08:55 +0100
Message-ID: <179570212798.21589.16916308704407177260.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124121500.2cd5cbf30f89-1-sahaj123.sc@gmail.com>
References: <20261124121500.2cd5cbf30f89-1-sahaj123.sc@gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX4z8Rv/o4wh5c
 0INqXT9x0MgQ3146msGwQUn5K7pjWWoBnImM/FnaSXlN4NZ7LkIa4JghGIEbgkTE8bptx3Sw8Uc
 +s3rC+Dzv5p3me9NlP3UJag3rd/j79c=
X-Proofpoint-GUID: k3p7JN9ouaesxHJEMLYLSkZWtWwEhkiQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfXz3axXcfQF3nK
 awJCW47CmFXZRYsmdCqqLRkFF5onDFlDYuWwksG0yTHQ33xuyBkSx1IQIqmmuU5HgxqEWUS1eSF
 BIs/xEMoUlCk6fUY5d3t1hw/FtJ+blJyZy4/nBrWyKhe+0HdbPRpDKhqbpVj9JEK2+rapXIgB9N
 95IcHB1n/aPykJGbMbXjdTQWpHObkgv9QEjT+KF+JEts1zMcMaALJzJ6ji8KSUobajguVXhOXNX
 hG0sk5upROL7VqcJp6k+uheSWP6LmJCmKYQ87wzK/y3bFgpMDKCyTIRjLuYjx2KLHf+W2YsoNQ0
 pF/170h3Md4bXEy5sVNvhNiv8y9U87QVlKicS+DyPI+HlrABNtk5eCxDFVsU0K8pWTSLWybA7T+
 yKcLejVJVkPxH8snGrjD8ikgegLNCFpSjKUbCfoXMAHJqkarHRw8/AoxFwJjfTlKLYZSUsogNAu
 yCZKcdMzI0dOgKMDXPw==
X-Proofpoint-ORIG-GUID: k3p7JN9ouaesxHJEMLYLSkZWtWwEhkiQ
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b083d7b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2qz6BBfO9x0p2zejefQA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260055


On Tue, 24 Nov 2026 19:06:52 +0530, Sahaj Chaudhari wrote:
> This series fixes two independent probe-time bugs in the DaVinci GPIO
> driver:
> 
> 1. A file-global MMIO base can be overwritten by overlapping controller
>    probes, causing BINTEN setup to target the wrong controller.
> 2. Per-bank IRQ data is allocated as chained handlers are installed. A
>    later allocation failure can leave handlers pointing to devm-managed
>    data freed during probe unwind.
> 
> [...]

Applied, thanks!

[1/2] gpio: davinci: use controller-specific MMIO for BINTEN
      https://git.kernel.org/brgl/c/a142f1c5de4b9c03910cc304a26fbbdef69ca422
[2/2] gpio: davinci: allocate bank IRQ data before installing handlers
      https://git.kernel.org/brgl/c/9c5f350322837c83882e350f11f10cb29ed7f9eb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
