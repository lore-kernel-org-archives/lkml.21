Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795790640;
	b=5BEQVLt4JWcijR6LUZLnhBP9Jr8MloKN3KAIVJ7IzjN1J7L/pV06+fzZZ1HqMF5NdDnm
	 B3XiKnwRd3yHrbv0gHlOa3M3qgnOCoBqmSS7+thIMCTqB775iAhiC87Gp6BXLsaWaHbzp
	 ZYhnSJXgu1xOYEUlxb4h0dfLrkZoo4jxC40Ah5fJy86v6WKp63zeYEWLa8yShrvr6/r7q
	 K2pXm/Aus8q9XenWaN2UHLpW5qMgA0lBaRhWVVuwKSElC4ROgVgTlOLrvhQnJ/GDvbAFH
	 Ru22llxLn/bxPVPEr47oLmQYcf9kRn0BKfeEoV5n8KUTR2ALKvNKnTNkaAeKz8Fg+mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790640;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Djo26OlJqqISxdmZSNHoEzOkF7q+XbnUuQmHWoc5SVg=;
	b=acc6M0t4xu6+aDEsvutw4yePf+F+V0UTwOpf4ZwlKZTVeHLjR/z55yuhaZrlOUcmaClY
	 dk5vMqgUBBGbd/fibO6Kww1/kUbFJLXCZSQzyGKJ+/ZHoK3oEhyZNmVrlpcNqxaz0kkH0
	 5J9l4KTKocOJjsOGaGDaJ+IijdTwcz0QezKZfeDxCM3taOOq7ouKErgUFT45Vpu4C77pd
	 K7oiv3tVkDIoD1fbpHSJscXX7giu6mRRuIL0+MUmtb7QGWM0ZZvg65scDycNUfuccwaW7
	 GyTO/gZ+x8B0coTUw9GmVjNIuGqjMAKyFuCMAj0LD6pVph21N+oJW1pnLowG+0wbt3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f8FSn2iZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yg8aOwut;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D36606A335
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4D36606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f8FSn2iZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yg8aOwut
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1GWr3320409
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Djo26OlJqqISxdmZSNHoEzOkF7q+XbnUuQmHWoc5SVg=; b=f8FSn2iZHcsATKgF
	WJAeJexnlKz3j7WLV/2YKbtM3l9JM4zIBSCZNtCVZkSFLnetxhOoCgADsCKPyyDw
	N2AwHYTLToyOhsd07p1V2HSh6hijG5Kri7/5J6frbe0waGRZqJ1DhocyLHtcRJ4U
	hIJBYxdCDzNU2rX8zUiHQusE4nnPYbAfshnlHtQPt4eyyo0/yPHVHSDzvCAUgZko
	ZvEc/0XGqPhrsgO3u4GzHpUFnX7UzoMXhjS4wxNa3gvvFcxJyDr1iQQtB1PKNAhX
	L3acFofw3917cqzAA0cOfLaR825HOzt6Ehe7bT03fkEuPgjCDHb3VLGhIPPb1pqZ
	Vo0VrA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf94087-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:43:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f040c6e0ceso75732035ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:43:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795790638; cv=none;
        d=google.com; s=arc-20260327;
        b=NEUb+vhwbK2ix7Nqe6pGiOxV0nwD99vh3/fSUHa58e84Nkz42aktCa8O85ZBmtZGQ4
         Qjc4LhuO48lkqW3mtG9F+nQUuiK3RhsXXNd9axhHH5e1QzonNkO5h0MNMpwhuDiCFuBd
         PLIfy2v9wV6SViGa4stwgnCKfxJ3gI1289KI0J0Xsb/IuZHx5c5/3EAUUemCA67P9YJD
         aSXhsAQQc66aVdFGqy1CHe7goMW2TqTzMxN3NyY7kxpAh6R9BqI40Lo8gIv/gm/9Wfoy
         62OBI2k/Nnf0+xRc1iaLrbrRaL2n+8Csy5QiCN+MOgzl7GZwhDnkCrCnfX43slApbw/p
         h96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Djo26OlJqqISxdmZSNHoEzOkF7q+XbnUuQmHWoc5SVg=;
        fh=fKJ6TrRlmIqAa7EibJhPE6MxSTJ3xSj8yxr3zBXl3Kg=;
        b=L8utyoamQpWTmWBEzsbThP09qzfs4kMrSGhkh6lkYYg0+dVky6KRZywv33UqxNZZeN
         0E8z1pbjqDeqVIi4KYS2fwi2agjdUgK9OSBrLc7KxCnzseAZBFDRZX7+4R7UTpnzuVms
         82/ZC5abdCcLlm4XkieWenG0GCACovuGEXzJ3g1bHc1sqAinxX4n08dV2AfYwdUm2nwG
         Dk+o9/7UsuaJDo0KqUgoCZdnDiyhpwu8r6oUOzuGrUUwoIrkho0oEv6s0J2Mdqp7r0/r
         cDk16bNBicTLQmJJlxLFkKEh+gW0+4YPZA5HzwgS+ktB9tvNaJzBM5VrozvZzTYuLvJB
         youQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795790638; x=1796395438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Djo26OlJqqISxdmZSNHoEzOkF7q+XbnUuQmHWoc5SVg=;
        b=Yg8aOwut3eeoZcPoP1WFT57JWYkP4i4Me8Q2XvR+Xe3eOfMdJV3lGgYY5+Dtawlao/
         rO9LFyL5/iusyZTjZVE7/bsDDjS5K9GJI4bpfrcGp9leCoQJOO3Ord/yXUxLtDZkkjD2
         Y/IqVFW9QNi8faxXtt7Yj4r7KKjhjhu7gP8w0H6x5i1SrpMZqtwo9RZ56jJq/v/wyvv9
         LqCb/Q9JJqJ3AizKMagWekdXPQJhXpS788H6KiXndwYyFGbfWnc350DzPw8inniinUGN
         os6pjGznDX+25TQL/9JEmXoghucY4Si4YNUheIJ8dPUERezZ7CXZSy3sk4/npdKM277x
         mkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790638; x=1796395438;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Djo26OlJqqISxdmZSNHoEzOkF7q+XbnUuQmHWoc5SVg=;
        b=TAUbMhuc/0GrVYrpWUhdAltlJpJFwhd72Z6xwQpcKz8ybMuVL38YIws1WhHcp4Yl8C
         dWfVjdJbrSzwwhpCFCVaFdmAl3iOpjUL2uOTvS1/XuCx3pgKzNDuzlLssq6tEDVmOR17
         sVjXef+Z6M7AGXomZrJHhM67aEG6mrTuLJcWp6mn4LfauYDKABLz4l5lu+nq08rsLJZV
         06IpWM4rRsdmrIgB73oIOJUhDzr4GB2ZG3+LHjBaU74BsXPQ4a24Z6myh2z96E9C6vgF
         cVCi5e2O4G9RzIMHVNB8s9rltrp6+7pbSx9SFK7vfTP9VL/FPNpAMXKJOl+VTZ3QJvBp
         ThQA==
X-Forwarded-Encrypted: i=1; AL+hErHewhYwwuYyrTzkJTGsSVaI8Zr7+peIquVYVU4mc1Q4rwLzCyFr/QpFhbRGtfkuOBF7DcxuBUIR+Ksaf+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vlJnklE8aJ2mZlTNeRdfhNZHw5NpzeIgC0f9QMzqrnDdt4DRo
	BpQ3XQr//FCy09ks8mOcnAWpiSzx08OLW0cnsaVWzRK7rMS28AAG0u4SkWcXiEjbwvcBvIo9Xcm
	4o028ytcXsUmozVdU2EWr5+FQrnaLvmXLHIX/7BNh4TlYA4H+EksVVvha3mrY7Kbnh6QcUXbw48
	+/0rvSsh8Lz8hrHtZ8yBikIj0gV2Vs+zRNsXc0Hlm6qnVfC0UnZw==
X-Gm-Gg: AZFdTZe6l1u15gsLnIQ9vX4jwKH8FChPiLz1Q3u1xgXepfFKstM2WytHb9oyvm5h/FY
	tfdvA598j7SKgcOImPH0J3ix7sG+FQozp0X+tS+9nNd8JIE7iKcpOisw1JJQ5+A763RwA3PQEnF
	N01jiazkK087rmRRfgkbgl1K0mMq5iJ6znkE0kanckKFOnFQklVc9T3Q+MiA==
X-Received: by 2002:a17:903:26ce:b0:2ed:3d3b:c5f5 with SMTP id d9443c01a7336-2f0f4a36319mr59480055ad.64.1795790638333;
        Fri, 27 Nov 2026 06:43:58 -0800 (PST)
X-Received: by 2002:a17:903:26ce:b0:2ed:3d3b:c5f5 with SMTP id
 d9443c01a7336-2f0f4a36319mr59479645ad.64.1795790637838; Fri, 27 Nov 2026
 06:43:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:43:43 +0100
X-Gm-Features: Aa3M54qMTgg09-LOlmQZO96BQZ0rleJjZ6ArcEP-EJUj-jeo15UHbVxIpCxwPn0
Message-ID: <CAPx+jO-nDpYJyeKGqjqaO7rMrTW2DzFsv_1WCdFjcR8EborPzg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mmc: mmci: stm32: silent data corruption and HS200 fixes
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linusw@kernel.org>,
        Yann Gautier <yann.gautier@foss.st.com>,
        Christophe Kerello <christophe.kerello@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: hHM8sTZPrwMV9-eRObzz3rocj_j-jsnJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX2+oM3vgXLuY3
 /IxanHodrE/qpL/EMHPwHEM7dB9zyKjZ7RURZQcU5cg3cnV36K1LkqO9Z6WiF8gZAAD7iSRtpy3
 78CpyERmv8PsYWJIEqB3UE2FvOweEiyq5l5fSyP0gSkrZtADJ0vRs2ZS2hKnrWU9+tk/2aQ/qg0
 SVv+TdmhbY5H6ExIFs1Cq4oU9t3O3GC2SzL72RANOZc7QbWO3oz2N8yhTp9Hz54t3OQU8cfIErf
 ILKxf/XvF6Yc4ZeMjARZULOcJIi+lx15wo91oBUcmhBI13sZbVKJ0GHn9t3ONG4lEGyKvvH6WMq
 0iDBKuHpAj+iQspOFBL5BIjXxu9iMR7TSjzg9iAaQi+07Ec+y7nALBL1PS8pb54x5AdVQlDWoHA
 JJsbnHDjiMN5TQPxxTAEBmgmFjR9cEs4Do1yElXXAm9HXpAefWQ6x2wkimdAi+Yn/s3uaWIMRlv
 Az0h4Iedo7VW7HcYH+g==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b09972f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=uChsZFC9AAAA:8
 a=VTaG3boj7W6_II-ye28A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=ULtXvzFHYWHLyBAuiDia:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfXxC4DeY65Iwhg
 vPWIcgOf0q2Y85rDzOsN+lO0ZCbY82rf0hPvw1LbV7wOaEwCFctR/0/IW1W78O4xe/k6F3LCFo9
 LxF39ZLeu2GL1BgvvciM4lpbWRMdh24=
X-Proofpoint-GUID: hHM8sTZPrwMV9-eRObzz3rocj_j-jsnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270058

On Wed, Nov 4, 2026 at 4:27=E2=80=AFPM Mateusz Nowicki
<mateusz.nowicki@posteo.net> wrote:
>
> The eMMC of the STM32MP257F-DK in HS200 returned stale data and lost
> writes without any error. Patch 1 makes data CRC errors visible to the
> core again. Patches 2 and 3 are the fixes of the ST downstream kernel
> for the causes seen on the DK, as Christophe pointed out. Patches 4 and
> 5 move the eMMC of the DK back to the sdmmc2 pins_a groups and remove
> the pins_b groups I added for it in 7.4: the corruption came from the
> delay block, not from the slew rate, and the slower pins avoid
> overshoots on the SDMMC2 clock. Patches 1-3 are for the mmc tree, 4 and
> 5 for the STM32 device tree, patch 4 needs patch 3.
>
> Tested on the STM32MP257F-DK with a v7.3-rc6 based kernel with the same
> changes, each run writing 832 MiB to the eMMC and reading it back:
>
> - SDMMC2 kernel clock 200 MHz, HS200 at 100 MHz as in mainline: without
>   patch 3 the writes failed with I/O errors in all 9 runs (sdmmc2 pins_a
>   or pins_b, with or without NEGEDGE), with it all 6 runs were correct
>   (pins_a and pins_b).
> - SDMMC2 kernel clock 150 MHz, HS200 at 150 MHz with the delay block:
>   all 6 runs correct (pins_a and pins_b), the tuning picked the same
>   phase in all 10 rebinds on each pin group.
>
> Build tested on v7.4-rc1 (arm64 defconfig, W=3D1). Not tested on
> STM32MP1x.
>
> Changes in v2:
> - Drop "mmc: mmci: stm32: do not use NEGEDGE in HS200 mode". NEGEDGE
>   has no effect with CLKDIV =3D 0 and is valid with a divider, I misread
>   RM0457 (Christophe). The writes at 100 MHz fail because of the delay
>   block, not NEGEDGE.
> - Replace "mmc: mmci: stm32: lock the STM32MP25 delay block again before
>   tuning" with the same change from the ST downstream kernel, "mmc: mmci:
>   stm32: release the delay block before enabling it" (Christophe).
> - Add "mmc: mmci: stm32: use the delay block above 100 MHz on stm32mp25
>   SoC" from the ST downstream kernel (Christophe), with dlyb checked
>   before reading min_freq from it.
> - Add "arm64: dts: st: use sdmmc2 pins_a on stm32mp257f-dk" and
>   "arm64: dts: st: remove sdmmc2 pins_b from stm32mp25" (Christophe).
> - Rebase on v7.4-rc1.
> - Link to v1: https://lore.kernel.org/r/20261031120700.42576-1-mateusz.no=
wicki@posteo.net
>
> Christophe Kerello (2):
>   mmc: mmci: stm32: release the delay block before enabling it
>   mmc: mmci: stm32: use the delay block above 100 MHz on stm32mp25 SoC
>
> Mateusz Nowicki (3):
>   mmc: mmci: do not count a data CRC error as a complete transfer
>   arm64: dts: st: use sdmmc2 pins_a on stm32mp257f-dk
>   arm64: dts: st: remove sdmmc2 pins_b from stm32mp25
>
>  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 58 -------------------
>  arch/arm64/boot/dts/st/stm32mp257f-dk.dts     |  4 +-
>  drivers/mmc/host/mmci.c                       |  5 +-
>  drivers/mmc/host/mmci_stm32_sdmmc.c           | 28 +++++++--
>  4 files changed, 27 insertions(+), 68 deletions(-)
>
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.56.0
>

Patch 1->3 applied for fixes and by adding stable tags, thanks!

Note that, I am planning to submit a pull-request with fixes to Linus
beginning next week. So if things work as expected these should be in
v7.4-rc6, if that can help Alexandre/Maxime to pick up the DTS
changes.

Kind regards
Uffe
