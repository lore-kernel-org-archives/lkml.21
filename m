Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084308;
	b=mso1EfR9g2wDQJ6mpSYWZ0O3ImLrGUisYVFitkNpfab+ff7BLq2VLYd9O54UpWPrOdbp
	 Hr5FrqjTkinJsgvxvnB1yej7t5NUgGw7oryzUQvbitrWEOllpGagERC+9QE0Nfy4UVqb/
	 M9uTPCeSSpJ6xfZZ6A+HqtqyCZhlFSd64g/VmvPqFYgr6p5mbsCGemtG+iVD2iFluyOhM
	 asei4fOyQL2ONhAMdRxadC+WksmvVHatMUvPcYcfgRSHNmrjjfwf/GPgW6Q+8Ea6aqhSi
	 COMKQnWug5yxtYANN1+4xpypzwvoibWj5m4sxcy4UNPYj38MOxn+X914Log78F8wrLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D7SOOLu4G+MIx/n5d9fRiG+tkN2TgoMcpVaaDx9UbOQ=;
	b=ORL1LSjpYMPGfbBheSFQD3WTtcCfwnoB90HoZFyPCUbDwsVC25qYxrogQhvB+9OeUCM3
	 n6G6WBzk6apNc+U+wUgNA35Uvsqd1/wGcvM7O4BPAKMN3Vvb788c6wIAlMAtTxg8hKU+4
	 6PVETs4dhv7oLjOAgnyE6I33A3n3vL5yaQBneTbginGG0utOR1Qc3hzHLJsR4wTVTX5qI
	 BwyY6/3L/YbyJSgBMI64Mz+XPgJ41VnBF7tX/KR+C/VbIigM7EBAdSr7O5hfRFPFfziAF
	 nVTnjI9aOvwmCptSYqrMs+zARmmbHZChagZPGA1Gch1fl1Z1duXnUGOVTTjLJ5Eo56g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rt8QaKIr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BgQqxjwU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71368606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71368606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rt8QaKIr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BgQqxjwU
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ9INYP2514195
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D7SOOLu4G+MIx/n5d9fRiG+tkN2TgoMcpVaaDx9UbOQ=; b=Rt8QaKIreejd4vOo
	tSBSvpkwnB+f3c3Xf5lf9BqbTgQip9zblH6bavvWtEtSlQSsjXlvTt2j4RKSMWVu
	OsPJFbYX1ngJEuTAJVwuY/ZfNkLokyYV5yuJXTRCV0h63x8yFPeGnMDacqH3SJmy
	ZV+FVqpcYU5GlURs0OjYrYAC/JEfGq2IyA6ZHnFepCIvrukZAOS2Ezlz73pj6lum
	KEsgLU0/W9QfTNg74yP5TOoY0+hoXkaIKgHyMmCsKIhArpXKBbL7h1O9eTxAr0cL
	4TM35j8akQVEbbrP/GeH0QLIc8FuLnkyJlapE/VyiA5zZ5lvLJLHltZ3WTps7Rlp
	wwtvzA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xc6radh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:31:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso396156785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795084307; x=1795689107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D7SOOLu4G+MIx/n5d9fRiG+tkN2TgoMcpVaaDx9UbOQ=;
        b=BgQqxjwU7nXEsAaxHrXhATj9uNnONr1+q4ln9jpgINdJGS3qB3nozrOO00PX4W5XRr
         RV6m+jti4g+uTHJLaS+WAL+A+R0iUpDwAYUJ+PSWG1UFyuyEwglxHEv52TpwSFJnw9DH
         k1+wqxRgQ0S9kLH8pHUuXuDc0mMRmfuXGt7Qvfv1+fSZTzp9UUvhiEZ+ld5AvKu0ZiUW
         rnMWG5FrCmetpX7q0fKmcaJFirv8hTVcnuXrBKlnNuvqa8ZLtIo4fVyLXXDGTLatM/95
         GkrLJJKK+9SxQY7UC6tV/j3wP/hc7CjpAmNybFrzwNuso/wnC012ym2vcExjpqnAu9fV
         oolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084307; x=1795689107;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7SOOLu4G+MIx/n5d9fRiG+tkN2TgoMcpVaaDx9UbOQ=;
        b=du5zq2/7UjOastuoQ3LNaUy3OsGX5oD8J+D+LgCROPdVALsr25dS0msWI26kxCoIDu
         Uz8ZIi3lg2+TEJVDyxJDpKctyCvM3EyUnjI918/H3euudprlKfG7YendwentmbjIYC6C
         ZA3I3pL+rQ5n4N5oc1MToVbifeaA/3VX69n6n/GS2ywcxXrijYQXiOi5rHnYpFTGJZ1t
         cEv92BmlSSJu84KOSss4nUdzD6x7Ko1FodfjyXNRri4ibcVdxt4pRLpot2AuNFNc3SeD
         ui20c+3aReuUzDI+tB0fpO0CBue4gJAmfb+3GxM4UlQTL0N00ONstYrBjcjHZcPkGkIe
         uBNw==
X-Forwarded-Encrypted: i=1; AL+hErGsFaTK4NEKNVlYEFbizUpi59aWdCm5Q1U65MtBG+yPVx6kDr+malgkQi9wNu4n90GRgTkJyIHDfczeo1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sDy5+mDJ0bhiJrePWcH3AMKCi77lUaHFB7o2K/DsfkNYukPsp
	vC956QPd11ceqU14G1GchywMCcL9qqYCp2l9KQ7skBVom06IjK0lCzWopjFcj0gBbNy4BuxupWk
	BDhmMVqV3GKItW6/Gf8kutxulUW0ZSTf3D7ncXfURDOarej2Fa5ZFHmu4xdEGC0vE0WU=
X-Gm-Gg: AYBFou33hHxw/tgogdiXibff8rV/C6UpcUZJhXWQNfCuZ1/rdszYWeBDiM4TdevLNcu
	RaoEuvFESwhT4Vh7YSHTkW1nBoHmf9eNeappfEjFg5SUZlmsJwtcqmQml6ADGJPm9iu7gJhYG1M
	QzU5h2IZ9lwNcXWddXsy4BfHxgYBib/0O6Cp76A2hmpqhgqGqyxsdlseBN7iR4tYKu0wflq1Qrh
	twVQwSRXMUJmzOOrkYOkt6AuRWP4Ns8As4aw0B/lANrhFltwfkNesQJF2BTXNiCNJfPrim6qYbJ
	soqctqkF8YnPYtb+ySixALDJAueGCcKvSpTuB1Ct3bdYIBtVEPE5bL0TeP6Gzb69stT0KloOXOv
	qEks1VmXgvDhmx8F87hbWVlso6EZMylXqG7l3KULtRdDpRvTbMssMeyOzpJgEk+FrxdmGRsGodH
	Q=
X-Received: by 2002:a05:620a:46a5:b0:93f:22f4:f0cb with SMTP id af79cd13be357-949995ab612mr1085618385a.43.1795084306666;
        Thu, 19 Nov 2026 02:31:46 -0800 (PST)
X-Received: by 2002:a05:620a:46a5:b0:93f:22f4:f0cb with SMTP id af79cd13be357-949995ab612mr1085615585a.43.1795084306168;
        Thu, 19 Nov 2026 02:31:46 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm26124995e9.5.2026.11.19.02.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:31:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Haipeng Lin <jimmie.lin@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Val Packett <val@packett.cool>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: sc8180x: Add missing dual edge GPIO IRQ errata flag
Date: Thu, 19 Nov 2026 11:31:43 +0100
Message-ID: <179508430131.48541.2060654933340230751.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114-up-sc8180x-pinctrl-dual-edge-v1-1-aaa31ad633f3@gmail.com>
References: <20261114-up-sc8180x-pinctrl-dual-edge-v1-1-aaa31ad633f3@gmail.com>
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
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6afed013 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_HFaMYOssqv2UMXnlhEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX807m0PYMRxvy
 fZDIA/DepXFjQtcVf3UaqUsxXEnUDQxsGbHDux6FcllBmWlFVJv8xTCtzyIB1ToNGtrgl8vtmFs
 ViiXx/d9uY2jufhM5SD93lq0ANxGTJiggt6Qk8dkazX63p0Ho8z+Ydz6frOs5I+DAE0NRZsl6/y
 WqdsF+VvNBzEnhKVcUEj3ja6SE0ZxaCARfz/hHSI2eWM31rsI1OB7/nd0zTJIiWN2BuKNVfd8lz
 SIor2AqvFL2ZXtBKko6fRKIIVxjQk7PPDco0WTHSliO/nmxfW5zeiQ8z4T39O0Xs7ibf/gm8teA
 2+IeNqSvXAIZ4HWOGvWtWcVjammsupshu7F4RWN9QdmH8MzHaQkQhm5KIjT9o9Wrl4NxDLBjIDD
 2n9LKE/OAdHe0fkPtA/t6M6f5AKY+BvBfkUS/WCd+JX9YvLOtAbojm7TQzYTXKPM5yJHoWSA5TR
 bqYyRrO1wEziujuT8sQ==
X-Proofpoint-ORIG-GUID: a31SttHmg0CN_1epZoQ8nMBGOk6fdpxI
X-Proofpoint-GUID: a31SttHmg0CN_1epZoQ8nMBGOk6fdpxI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX3clnZbNjZokV
 wWlwPfhfkpTCGfrxS3Cbuzi3PTal1K0dA4kxEedSmcmKGi+cqoD89fdefll2m9E78SaKpImxnRF
 uRqA/NmGqRCcmgQA+GyL9QD8LFbpiuM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190041


On Sat, 14 Nov 2026 01:18:41 -0500, Haipeng Lin wrote:
> Wakeup-capable GPIOs on SC8180X use the PDC as their parent interrupt
> chip. Like the SM8150, the PDC on SC8180X does not support dual-edge
> interrupts, so dual-edge GPIO interrupts only fire on a single edge
> unless emulated by the TLMM driver via wakeirq_dual_edge_errata.
> 
> On SC8180X boards with a gpio-keys lid switch (e.g., Lenovo Flex 5G,
> Surface Pro X) this causes the falling edge (lid close) to stop trig-
> gering interrupts after the first suspend/resume cycle, preventing the
> system from suspending again when the lid is closed.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: sc8180x: Add missing dual edge GPIO IRQ errata flag
      https://git.kernel.org/brgl/c/a67b4f18ae1c0c8597e2e4804c6f5460450418e0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
