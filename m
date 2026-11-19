Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084432;
	b=SqQUkGKuRwUYBq5o+1FBjsNrAjL7UXFMp3l77JQc5S2WreIK//KeKKEAbEtQJIGBGADY
	 25foDfIx1HTrciq0LpDCc/K5Q7HisTK3PAlAdXkDaUIeT7MXcZJEtYRpTCryuGuSiZto5
	 4voKg2Kt7CyPjNNIfU8xXje8AHSkYY6AosXpFjykKfStYhKHE07v0WsbU53/cMnQRqlp0
	 WFEIgQb3hpFc26l7xQIpzje50m39VYMaB9ucAx+uoBH5vhvLXwIUCk+G7kOeb3Y6Kadvd
	 bGCIbqoBJCcj4tn2+qoymaRr71y5xEq549XVRerDh+MSabDwC+Y7lu/KjdL+5Ox60KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084432;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Uxj9G2DBZGFLAUE461TexgAskHHLjFFTuDuVsBzMPys=;
	b=eBpxAjh2IwdwSOKCClzzvqc430TWNwaR8QxHAwh4kwDKNT0CoP6ArE7ZnzAI1SdGjUN1
	 k4yMhtWSSLgLlAFFf7JrAisoCjVxKIU/znloOGsjBpOFuoOX1dSTp9Sn25w+cOxZ/QxjN
	 XEKxrwHep5DwnFuh279EamRFZTvL2wsriAB7G7pTi1Ghn4hArMeYNkK3Uw32c+r8oJpZo
	 L1e4Gmlkq/fGDjGMNjU59V3B1afYHGICzRDHaKokwHJjRNkeqVEub1tHTl7FrDL2H7soH
	 vIPVkEOHmdGP6hIB82z+sAVg1xgGZx5VMvxjVHQzIL7V0EQpGTfZjaPvJz7MAlWylNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLuR3he1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MRT0f1t1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A843606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A843606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLuR3he1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MRT0f1t1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ9xrKN3351581
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uxj9G2DBZGFLAUE461TexgAskHHLjFFTuDuVsBzMPys=; b=TLuR3he1ZZ3ZjY5V
	FM4KRNbjaZnRyvGc0UQLSAu8I18Miye/m4MVs5zDYG1tHqnV9tdwcSCt5zBEJgFp
	BvXsh3NNFCmtXegKLa6ZwXJnXeX7rF0SXbfxlKcpsSecyQZKt+UVmf1JuwPtmkUZ
	lt35uOB69mpEk3RLy191ZIu0MmLt1n3VAaTYeAfzTOfQ6j0PE5IH3xC1PFfa3d8v
	KUcLzybiubGderaM9+TvudKpedcIdzB+1mb6Db1GxLdZ5rPxv2weRw6MNdnPhEFz
	JaIFu8qDeQJhBFBpRo8611YhGTViLOBpjQ70QrhrBbPzIsm6O6k+0efWdP2/+H2Q
	zcnBiQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymg46g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:33:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d2c49c3d9so28408091cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795084429; x=1795689229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uxj9G2DBZGFLAUE461TexgAskHHLjFFTuDuVsBzMPys=;
        b=MRT0f1t1DZppPM5NtRI+sKNYABDZJA5A6qbwTtA4wXMuCayy6ns10YcqDR1lBOb1b0
         dkNLZndJau31GwoYnsnh/sF8lmd90Bp52n/mT3qKpfdJK3JXf2x0pX1FnpPa27EFbnKI
         mFMmy9awh1wfI+K1EEnqkP956FtiFrJS3I2VAk2xN2vyXosmDvzbIKKbcxZrnmX3fK01
         xIY6x+ZI3VyA13M+808ZNdfB5eabeL8oH5uwCzGZak+cT1AoRNI4zRI/76Enyyonqlhe
         YY1ijrZCU1t0d9vugoGbgCWC4KGIJLEOTUfqlisP82LpxMQbwn7pKB1M313UBFnmzRSI
         KfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084429; x=1795689229;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uxj9G2DBZGFLAUE461TexgAskHHLjFFTuDuVsBzMPys=;
        b=ptnC5XL5nkvnF8zgaF3M/ar8ar0AdMLSYkwT3YVwM0XZWtCUBo7jKDPsPgw5AeFTeH
         LZuAldsqMtGsg+I02XaVW+oq6mxauCBlrD5MouNyn38RM1Ph9jxOW7neHmHfK7S0n3NH
         EyN7azdy25xm0bbwTPlUKSEIh4bMVXrUq3SE4vn22K2K6MEzDamCIva+FukdfZ6w66iq
         lxEuR2MeaHINCsIMv+BJI1iAxpmBIroZWif+Y4Wf+VK7TtLaXNt3QyH+3EjO3kTHKiMS
         GmAvER1izLIU/mNGyC2UajySdMpVyANe65JcvSSb7MmQYWuub0OdYA/8RvMsrK+KCa3k
         pTlw==
X-Forwarded-Encrypted: i=1; AL+hErHlRSndlKqqyDEKqfLdG632pEIxeF4cROHTjQPKhjntPoUvhnY9kyBE/SAPo+xg077s8fHLF7PA7OkyjpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/luWuSGVEUdxrNbEQoDSd98JLZzZ3u/o2dUPpIg9Ub/uIrUG7v
	edoXNUx7zxZPQtod5Y5pQeSWBTmeET4DYpP8TPdGsrWZ84qe1bX8VEIac4zIXIEItTM+8pvPjyT
	TFpEDhx5aRp+504KOHCuePAhvviMA2oDZthujhL+omBZMhZSibu9F2c99o9YApQ0b4rY=
X-Gm-Gg: AYBFou2StbjYCC/ZO0MkJjflys6k1YoDueVef/3e5tYMp75w/ABI1MC22VvhP/vgJnc
	0aeMFVBBTqoph8ls5Iu4A1G4CfWsITxX4SreOr2ZN/9nLx99xcYbLTBxfOCFhXWd7DZPttdmTIo
	3nDdi/NlVkR07ExbdDvZp4R1nmR408U2UgI/I4A3d/UEQuSZOdtKNOPJff7hkzAPzGXMT1vA/Kc
	oGyCfHVPCR986+C2D/VmuxsCd0eTo2UTF4UiYAhSqUbHMmH65wB3VTgz9M3ymkmeyaUYH647p5i
	Tby/QUNKdKshqO5I0TfFIkjGi8SMEWonwizBaL9hFCU8gNsgIto4seVngnebPb0835/AY5sHhwz
	wDtmHTgbmkocRoUrSBG5UHTKpBmk5UCVvxJlx4BPfT4cLBSXsjAV5QRPBZUjoy8d82BRYBFkwVf
	Y=
X-Received: by 2002:a05:622a:17c8:b0:536:622d:6932 with SMTP id d75a77b69052e-55d5a58f8e9mr86938801cf.23.1795084428693;
        Thu, 19 Nov 2026 02:33:48 -0800 (PST)
X-Received: by 2002:a05:622a:17c8:b0:536:622d:6932 with SMTP id d75a77b69052e-55d5a58f8e9mr86938591cf.23.1795084428199;
        Thu, 19 Nov 2026 02:33:48 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343607sm31004775e9.6.2026.11.19.02.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:33:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Hyunjung Ko <hj351016@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Mary Strodl <mstrodl@csh.rit.edu>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes
Date: Thu, 19 Nov 2026 11:33:45 +0100
Message-ID: <179508442284.48856.17227214993153041326.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117104110.240112-1-hj351016@gmail.com>
References: <20261117104110.240112-1-hj351016@gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX9YwR6AO25S1V
 0JGGGPb5sb4AP3S0oViyxWcMoGPfA88sJVwcUYG8o4lUIURrAibP4Q3rsRlpRC+I1/7i+YsP292
 aIqeIVXn4zMibpyOLUwPKUStlEwlEI0=
X-Proofpoint-GUID: l3NKAv1BpVPI_qEJI8l0Jngvn5C0GAEi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfXwWB55FSnLxeX
 hETa4qCwFQEvyOBr4VTl02T9momJ8G6kxng0eubLw8lPjNh7iVPyqaYbJRRsZq/fOLElsaCwOiJ
 uRR2bhEBzQlKTGePtaSwQcuzM3jdK4d5YWOdCwwG9JfW7ZGeKzWiHiUqFxjMsQht2aGFPgCntLw
 +//Y18q/8XgYYnSIXHdQRvK4Hu2BUaX+PFlxOX6WbzKv2kPthxAFVpAt35W2VN9C+q64usR3JWn
 d+fdYFMEt1LqUIe9mhpfxo6UkCjK7TsgJfOIsVDMZeTBhOIf2ukC5Uw8DU8vS/yR5pug6b4W0yg
 Hl6/EL5wdTWniimkHfKF1Cpt/4cImeC1BUQ7BJOXVIA3ZUg2uDBn6W/Zmi7kadNiJ1K5A+p9VI7
 IK497/3t58xCf//qnBOHfyn2NJjI7+QJZjNCIiGdv+216vgdMefqZ3Yyt6+rco46ZzFjGGDf+d7
 XjGzCXXHV0FmKZxIclg==
X-Proofpoint-ORIG-GUID: l3NKAv1BpVPI_qEJI8l0Jngvn5C0GAEi
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6afed08e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eCiaqhuiOIoeic38RQAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190041


On Tue, 17 Nov 2026 19:41:10 +0900, Hyunjung Ko wrote:
> mpsse_read() reads min(len + 2, wMaxPacketSize) bytes and then copies
> len_actual - 2 bytes to the caller. A device that declares a bulk-in
> endpoint with wMaxPacketSize 1 completes the read with len_actual 1, so
> the copy length becomes -1 and memcpy() runs far past the one byte
> buffer on the caller's stack and past bulk_in_buf:
> 
>   memcpy: detected buffer overflow: 18446744073709551615 byte write of buffer size 1
>   WARNING: lib/string_helpers.c:1036 at __fortify_report+0x6e/0xc0
>   Call Trace:
>    __fortify_panic+0xd/0x10
>    gpio_mpsse_get_multiple+0x767/0x780
>    gpio_mpsse_gpio_get+0xa2/0xf0
>    gpiod_get_raw_value_commit+0xf8/0x1f0
>    gpiod_get_value_cansleep+0x1e/0xa0
>    value_show+0x42/0x90
> 
> [...]

Applied, thanks!

[1/1] gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes
      https://git.kernel.org/brgl/c/f94f85f82e042c89a1e64ed3ff1d591a2bccfa7b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
