Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769320;
	b=n1BFJcO+PnlK40f32Mz1H1SlECm58X9ZlJkR0fs0h+NRJtsngdA8+tX0Uy0kKdfmPydD
	 65S41TmvKPFsIRxFtvyOzbtuSADwmCRe7ttOfqqbDukeyYg+jjNbVqgc0B46dpWz2+vVE
	 PaKgofOgno4QUgRglMHEqDlklD0rh21cxrkhSSXxjBLIvHeAHn3FYwza3twQ/rjJibOXs
	 Vld62SHmvEDVAGrFYdGurPWSmYTwt0nmcBOj8ytkCAUV2dA1BlLvtg/q7txvJdWJHIC8D
	 tz0LNd0PifOGJgHLKkwBIZRytwboOXTvdC8sHHyCuvYM6BVSM079Z4fPFT2RxzMDTXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IYfcl8gBzYm4c5w6Ig9rrdhK5KyD2oTR84bvQAzRdaU=;
	b=WCisj5vse72kKNMN1xc7+CVGZ3vLC1EUH+x4D6S7aCVyOrjx6tvEEessdCQVJM6EZ6DB
	 jk8Qz59ymPtLUYxcIi8STAZasFO9MbaYW2Ayuw7d/wRhBM7vb5Zt8oOHifhYbBYDfSfGI
	 7XsbKKyyXR7+UdEBNcOxt4FFYqeDMtk+Krx9a1b0v32dCjNsRPtkuzhObQJc6Jqnuokqp
	 apAT5SB6+YLHT4LZUah6GeB2wYhgcuxIa00AfUl6YApV5EaBLQqq5FOp3xS6bv5zRRSPp
	 +BDHtUfQKDbtGAje4GZzmVQPpSDsdzt42CsZn/oMWXjHDPPeJHYm/MTyP7Et0XimSXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nDWie45z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpn51e5y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03CA606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F03CA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nDWie45z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpn51e5y
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GlJV2421719
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYfcl8gBzYm4c5w6Ig9rrdhK5KyD2oTR84bvQAzRdaU=; b=nDWie45z+VgVQqd4
	nUeWEVlwdo5nsqhqz95Gtsyi2rMbw6vXTbP6nIxtj5TV+6e9YZLtZY9gHyPoHPEO
	KbfEvWjQlpueeOtFTNH2alYytLersTNi1+DoEYtFbZtbXCT0fkB88sFna4env2DI
	SMsFfWlwxR2F4IX/AK9zyntjqCHZelREmztQq/QxN7nz6kFC6gykEM8CG4jeXd2M
	JrENzts8iiLBXQQ0NYURdNB6SAYzr3Zbe2e6xmPXKY91PrL+wHQzPQjwDFq5LZIv
	GRnGv3hOX1UUbKVhWL1J6ODzya33rqbL4dWJCTBvCrlnNmWF8EBDkkxeRCJ7WRRC
	uv09Mg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf92n44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:48:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso1322351885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769318; x=1796374118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IYfcl8gBzYm4c5w6Ig9rrdhK5KyD2oTR84bvQAzRdaU=;
        b=dpn51e5yozIWHhXw8iVTYLW9vYNyw7pFOkPMEqcsXupjYBZ//1Tc0z65XzatxTjRsX
         phgJuyZ0Lzfb3/W/ZY+tt/6cQ4cFpHaypeIUQ0F8ekIt1uQ33we+CoK9SGLFNGD5aIrY
         VxK3sooS9uUFR0TSG4jrkZPn/Gao+clfCy0c3FmkvSgdX3Cgi1Hy3gjYnvjRr3Dr/A5c
         DuAOCVh8RAn82ZYUpfla4wszLBFv63ZCFBJiQdDurtMYoJkcL8J2tqemRxE3ZWubQxpw
         chJy2s0KjqW/V3OVtHj7lSoErGjp1HeAiZl5wRscLx/iNJt0gEcyvgOwlMO00roWRdAN
         giHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769318; x=1796374118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYfcl8gBzYm4c5w6Ig9rrdhK5KyD2oTR84bvQAzRdaU=;
        b=GsbadkYTh0C6U/WW3lCXRtUwNedP0DtbZ3gN+HSQFb5gqhxH5D2Ubf6gMV3DmiTkOF
         hpC+uS20uiNIN/AGoq1gkD24oZz4YRUvM0M6PuOatdTikW/Pqjs3QGArH6C1EmLR6XIf
         3RqGpkD/G90iP4cWeBSclzQBXQ1gJnIQi7/13lc7nPVzCDhIfW9N/5oTUqgc35VLD0D5
         +00iGGk++9M6xWM3cVYcJsb8VAMlHuVAJae0LKu6qAJs7bMUIcj08M0C/EyoHVP+47j2
         4MICi8c138Hq+tpBa++KhvXam+fodfdH/e41PPvUjmtqcxBqH5AMO0mkp0ACeorntZ0x
         iNUg==
X-Forwarded-Encrypted: i=1; AL+hErE0KLAV/acTjVhLi8cMGrjin5SFV5ejA3OC35DVSlN7u3bTGC94TRJrM0OGYakmBWuHZBrIEyDQD9RZU9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yVTSR52AT7aM7XJF6/PVcW1bTf5wZlK8NvUyDGue7GGd30eIy
	r11f3uIr2yUOFz4twnQ6ry30qK6hDJ0lgxLQfmme4akSYDp44YxF6F1ojtc9NgsnYo1PMuV6sJb
	nNY8nbts1jMQyLziCLO2gyoe2lfdhND6Oj9IW9YBF7moofBpE40wCN9s5KWGG1tRGzqc=
X-Gm-Gg: AZFdTZdCNdev+qUS0ziEDmfLl27FjMdOaOZCB6tM7nR3fkfy2/oJcAthgFVwLrtD9iT
	dk73F72UgQ10gKYL7RuI05nWlDE11xMgUSlDSDEV4oYi20NlfxrYeZAQvcguM2O0o/acr+GRI3P
	B0hnsVZHPq2cKMHAOqvKqZ00MHPfd+RlwPJxvFieiMR7v14H1IDLQofnwV3q1NW0J5gRZnieYSn
	C5JfSB+2Vl7mG4u8/Tz1OyVMYJOjHNvZp/N+px57zi7QXVdXM1nf1jGuZs3fkDLe3W1b0f9b9kJ
	RBKlmQ4wJbvOAH5uaqRhllszmvkK7dIb4nbVBWL0OxOPvU5gjcMZYzibc10dym4cnk9puozzczL
	CFrRHNKA/jbCerRnlh8xf269CaOOLTli/brpwRIkIjwdXT6mI2zk+MKxDXlQMY+jZCdjJ1dQ3h8
	1uPZJ3vqHTzvwdSWZQ3aXCJs9aizrQqo9zaPHp0kN/HaNteZ4QRudK+u/mcVA+sw==
X-Received: by 2002:a05:620a:1329:b0:949:8119:6702 with SMTP id af79cd13be357-949ba8236e3mr3942709785a.10.1795769318292;
        Fri, 27 Nov 2026 00:48:38 -0800 (PST)
X-Received: by 2002:a05:620a:1329:b0:949:8119:6702 with SMTP id af79cd13be357-949ba8236e3mr3942708185a.10.1795769317869;
        Fri, 27 Nov 2026 00:48:37 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm698492095e9.3.2026.11.27.00.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:48:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Sasha Levin <sashal@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: shared: restore the atomic set_bit() lost in a merge
Date: Fri, 27 Nov 2026 09:48:34 +0100
Message-ID: <179576929354.17776.11182158061067630768.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126231704.1303448-1-sashal@kernel.org>
References: <20261126231704.1303448-1-sashal@kernel.org>
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
X-Proofpoint-ORIG-GUID: yKAIfTOlCWBOo2VRWcnsrkP88xdNLyYE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX/bHd+GAbskPc
 x9z6/ThPJLWwh/5a37uMPKevo7aEj0n0qpBW71StWt0c194xAkoa7sU1V/mMQcg9cpjtYIi4aNJ
 HI7WkXt66tWs52k4JhZMAECxPf8eWCE4cz3VqSfzxQniXCLMPcEHTXiqQRL/xG33ujdiWkcO8mf
 /UvCdbeFf1lZdeAq9ornucJJkVfUNrTxlN7fd9fRzshtcP2eyYGBZz+mgA/oPQJlXAFIFR8AriD
 76lODDVYqm0qaFwIkkh9wSjSd2G0rfxBSJbtvmBowWo4kqKGo0Pfpoc033ruoo/7BPCVij3iu36
 DlNYnbCu1W+HAYKVyyzXRwxRoADXtaq7zDQxsZmtt2mc4NrisA3V1VF5ASM8LF8VaeYcZM8BbjM
 j18qVst7riKj05K1kTXSO8e2juGCJdM0jXSXj/SR7yzHWjJ1BS/5kg30jKOmDIpIs18L26hjQ3V
 s07NjbpoopWQCnLMwLg==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b0943e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dHVLDEzWKCGuJUyMAcoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX0Sqrfrywf0FE
 vrCpFSKdAtvC3OpQGRdvlbZ5OujGrVeJpvq8S8mXjsvFNeYb8yQTRwQBHlgkENx8DK7rCWS0H9t
 a1Bx0jVrPAoWijvx08wz/SO08+MeJMo=
X-Proofpoint-GUID: yKAIfTOlCWBOo2VRWcnsrkP88xdNLyYE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034


On Thu, 26 Nov 2026 18:17:04 -0500, Sasha Levin wrote:
> The v7.4-rc4 merge into gpio/for-next took the for-next version of
> gpio_shared_setup_entry(), which commit cda42ff53c4b ("gpio: shared:
> factor out per-entry setup helper") had moved out of
> gpiochip_setup_shared(). That dropped the change from
> commit 7d1d799d6251 ("gpio: shared: use atomic set_bit() for descriptor
> flags"), so GPIOD_FLAG_SHARED is set with __set_bit() again, and merging
> gpio/for-next into mainline would undo it.
> 
> [...]

My bad, thanks for spotting it!

Applied, thanks!

[1/1] gpio: shared: restore the atomic set_bit() lost in a merge
      https://git.kernel.org/brgl/c/838e2af4fde3f180abdd0e4755be078be7e132a1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
