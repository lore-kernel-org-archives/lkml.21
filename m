Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172043;
	b=p9zb7kG9JIhfeRyO9Et2moHKukgg+QVVG5xrLotNXPlZZBU8cz0sNZg8DZL9/vM2Sovz
	 oHXuuBLQ7ewHU18UkDj+qupaascT2EB7/Aghr7u5Ihro6jeR6CTbaiWMlj2isViRTQdEn
	 +CYg7B//yd+u6wuOTS9HYGY/z6xn7LbI1jUba6999vXH//JRIfXJSDfrmcrGsjCiFOrFm
	 ER6wFf+HTyYBR6XWagxYbkRelInxHTwpL60gwKrU7oS6RIlyGeehWU4uVPhQwQauXHPjr
	 3yh6MIdoV+9GAMZULLgteQmITXJEtoIh9dpGTPqDG0A0NbNxzeORov2CAgqpa8Nhojw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172043;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Uj/gif/EMkxaB651vPrPhFUEprfbTV3srXkqqMvLfTg=;
	b=Zya5muFWGcpVtQ6/rOJUjtzPe7BtOjIgEPSNbftAb7qfj/+dO/7F8EKB3JcAdrI0+E/d
	 IxoHzZ2FcdbM/7cu1pY3jzyJK5sj7VvG7HPHZ1q+/xujjfhxfe/flLB+OWon+2JD4IhqB
	 obpn8zkbc6GY/EkpKnifMhTcTwCedFBGcthm+O8fV8ePNcynituGbvHW8Bc9745ijpvN3
	 pl8JxtZsIxsyuOBGRTLK0Ioq1l1PUr05hvzs4c3zvg22FW9sbsIp9x0XInsApS4EMrtY8
	 RR2Otyqwfg7db2+81OeYIhUdH/or9g8qGntLvy9tPvmDV11JHXL3GMxovjYfBiPPCwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cen6HUbP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hNugXNor;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD75060A260E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD75060A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cen6HUbP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hNugXNor
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxlH556459
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uj/gif/EMkxaB651vPrPhFUEprfbTV3srXkqqMvLfTg=; b=Cen6HUbPI02arLjb
	pxF8ifzkAJZ+mH5QwSnReeuz1PFDh7Pi2WJZKu14LG/Y7PQxapT//KpZAAH8qOcC
	JVAZ2Od7N879dZDBaLK3EEkrza6jVjIFq1AFeLOHNW2/RObqNi2zOirxvPCv5MKZ
	fisSgG32nyhGSteM7zUCzKUD+zBLFBgQNUfoB8FwU825XylQidGyithQxbR+hug9
	HaiqaVGTW9jdycB//UD094P6TpkWwVOuxM1PoV6/k4tcut7quInMURNpU12ArA86
	2pebd22Ijvk8ZFOrw6kQvD5dD9AqEtIV3D0FLjmo3c5Sm126agQ+66wZy0LetMo5
	bYITgA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhcgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:54:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so1528110a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172041; x=1795776841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uj/gif/EMkxaB651vPrPhFUEprfbTV3srXkqqMvLfTg=;
        b=hNugXNorJmt6F+SEiinSTWkAzywc0ACXmsrtvVsMeDEssWEa35nzaGP7KfiaCVCQFv
         KytgTwVhI3cagvosQmeSC+snKOim9wjL19+ARWfq1Wo2NrF3UgLHtwtvUM580buJh9Xa
         iHwydpzbByR2RVq24/J4pB+QovyyW094mQfcdMtczVB9TSau6f1vhfteQjZ1RIYU5gWY
         5oQvcZK6h2mTTFJ6nRBcD94Mr87Fyf4tY0cBNTyaC70dg6+ny0vEUSaEMYlG2w7wnB+F
         3Wa3wmshPifoCV9mOa1cr/U4rJ7bAcMm5PsOZ+ZAgZL1gLGOzq301Xj3ACnkC01uFkoZ
         FR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172041; x=1795776841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uj/gif/EMkxaB651vPrPhFUEprfbTV3srXkqqMvLfTg=;
        b=og9vwLoMVvPfOM0qIowiIT7P8mP9CTQ+LyIjphPv3xk9Ncd5eXkmtMCY0adV8kCBHe
         8rLz3MY95wz8CMWww/5/ALXePHFgxVOaBXQoKRk71HCZQXXzz3c6o6VK2HrdBGZcFgCa
         VmgKwHzwXqDluxG/9Suf2g5LeLyZRHpFglZ6H1NcKV74NmtkvvVWykVkhatjfsBssB8V
         tRyotpN62DGb9vvQs4TK4AX6pJd+cWP8mOZQ0qlZ+qFQ6XdO7UYuvkhtLRjQL8eywEDr
         OuHqnxLaqyKBbLcgTExg+I14sgPqlESaTwVSztpNGuzRUZxdenwsYA603Td2HBT/Tziz
         rTRA==
X-Forwarded-Encrypted: i=1; AL+hErGbVKZAdsBuFiUe8eQx8W9Wg7GiWUIC/RLM+K7NpjIC+scLiDFdPRTHDpQKOpjHrEkwZH41Ax9v2xow+uE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UqKMwqSNbEkZjYu9FTmyG1JpeYvbFe7a03lX8GmuzF2KWU6mN
	k7exWs9C/mSZgOoj7vatpYKAz1jFH44wkfsg2APtEVixoIjK7uSdAliIa/iK3TpIMfMqjsURF4H
	w5xFNFW9hRjvVAxfncp4M1bxqT+2Kep4VFgeHNlCRQpxtEoAZc9cVQGG215jvjkGLOn8=
X-Gm-Gg: AZFdTZfnMLXcfzeqoJNufdoYUy447ZzQUhNVZt23YfKTlKaxZEhM+OooGReQsvmMV+c
	121UW9MUkBlVFWdVrAa6zrcmUVAXP4rOB6qWYKC0jjir5xYfNHYu91vkAPDmoOpCmmSL3X5XNeT
	qJi7otGsVHFdR8Gp4mwoi+Vhll/abYO7VTF7rQfuxjl4YT372xWKwD739fSQIflrYXn+xL11f3x
	3XEffsw/8PO7pyYcYXwCanCs3NR+RfBzTaT32NBo0cqEAY0/kHJWkSB80vHc9RhZvGFBI8Mpg3N
	VOj8nxH3uEPc/KuIoqtalg/H9cZuWVGOcV5OMXTY1lf5AiGsm1gxto/OD+dvlAFkh3Hq5AxvAxZ
	B8RWXOJzYRSyvP4tfRlYI1OWahoPG9skPDpw5ruYaR+SiTxP+xKYzqs6AdEyq+uZzbv6JaYFjbo
	jcKMvXcf0=
X-Received: by 2002:a17:90b:3d8d:b0:3b3:b704:118c with SMTP id 98e67ed59e1d1-3b41cb4f321mr2403011a91.65.1795172041420;
        Fri, 20 Nov 2026 02:54:01 -0800 (PST)
X-Received: by 2002:a17:90b:3d8d:b0:3b3:b704:118c with SMTP id 98e67ed59e1d1-3b41cb4f321mr2402997a91.65.1795172040980;
        Fri, 20 Nov 2026 02:54:00 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d22888esm1559604a91.3.2026.11.20.02.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:54:00 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:23:34 +0530
Subject: [PATCH v5 3/3] MAINTAINERS: Add Qualcomm TPM driver entry
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-tpm_qcom_driver-v5-3-3d9321ace107@oss.qualcomm.com>
References: <20261120-tpm_qcom_driver-v5-0-3d9321ace107@oss.qualcomm.com>
In-Reply-To: <20261120-tpm_qcom_driver-v5-0-3d9321ace107@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfXyFIJGHCrpt6Z
 5HAc/nEah1p0jgsw9xO+IWe2LOhV13f9Vnf/FbpGEydCrLsn53X+wW8ckVQbd6bGtBKDf0la2iJ
 PSDMk/yQS4SNoSv7nXMak5o3TtVNF0/4EZeXL0BBM/P3cw2h17b3eUcByRG5n1ljHX2Q6W0VxEu
 fWAfQvW8GOyUocNvjD3duoNZYwkWxHzmXWv3TUZla0nLBxyDO25z0PE8ns2t/GrnkWuWmaokzHJ
 vvNGp5hO9qMZgeR0z2tYZpC4deaTS6fvo/gHzqob6RkOnuRhrraW52xOvsqRLYkeyyb3zNaoLzj
 ev3YPOSjRowAyq6rky0Xo3YKifL5zeUel3ZhG7aJji3NQFu1g1gznpxv5TvU9GJZWWnVB39lvlU
 HJi8z/KZLGQdVROoON9azLCui02GgwyjDsuChrCle3P7eTl7OMuVke3G24Aw511FRnfhnsolq9z
 UtjJHLxScMqrBN1mQ0A==
X-Proofpoint-GUID: rV7GwFEzcDvGrkYyfglSXSZuYg5FmY42
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b0026ca cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tHMf5gnvwFDjO4kcr9MA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: rV7GwFEzcDvGrkYyfglSXSZuYg5FmY42
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX2K7FcbhJLBTh
 DH2IgfzTh2FuwHmJr0SWyTcyX/kBR+FZgjdoOhbkrI01r3m6RU2u1O9gCJUJcbtXd1f4KwiFCc0
 /sjoMUtkYpGAI+bAyPDgqK5wB9GBCqI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200043

Add a dedicated MAINTAINERS entry for the Qualcomm TPM driver, which
uses the Qualcomm TEE interface (qcomtee) to communicate with a TPM
Trusted Application running in TrustZone.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 733719f400b3..bb80ced07840 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23435,6 +23435,12 @@ S:	Maintained
 F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
+QUALCOMM TPM DRIVER
+M:	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/char/tpm/tpm_qcom.c
+
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.34.1

