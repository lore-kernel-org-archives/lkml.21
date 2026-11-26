Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703535;
	b=re+QVziGIBIcvdWesbbla6B9BvLX9fm8y6stDKojlvt8g/t+JFAzzEcUHR4AeyTpJ9FK
	 YvQL0Rjv3xCSgJ8AlE74zekPDPCN2ox/1Z/4gZn7hlXNH32AMstuBodETT4cFBZY+3OR8
	 bwFUdklb2Qth0Itbv0sJdW2lS/3cI3pIKWObmwdBjn+M72lKPwzqmurCv95ZFfN+yqC5e
	 8pXBbzUfP/YldtcvFlLtaW+T1x963QwWhixIBgyb0PnFqaKIoSCaWQWao3V45S3hTQtVZ
	 tW08E0KGM4wWb6NgMnek4wDss1UJX0bMWrh+dfXN4D7sAGS3iPQZ3uX+6mmI0cr0gcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=;
	b=hwCTodwSBEbkuVPvDSIAsS8k979Jhs++NAJ+JpCgsCCMzJutFGWQGaQOprxvZhiDx3T5
	 YWTh5TAy6usntpWeEa2s0JwH09ffWcAj9LdUv6uFZNDfJfBSnpEPfwu430TQAMOz8HyNd
	 DbTUOGq2BFTiXlSN/YvxvZ+a3/ulNJTCpQ4vPQ02PvXDuhL9xHczsNrwqap4xqARUkXNx
	 VH3yMqSzQFCAbMLTGc5Spfjr5msXCLbF3yKDlw3DVT1uhxV3TUqMwjrg3rvf5XDR++zEH
	 ScqkqemfLoyfg6BTGoKfyeSolI3pZPRQKaEOjmxyhrSQAkxfgSyUTf9qvCt3xXLEB1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zuic+b+Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8m9wcIP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE6606A684
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FFE6606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zuic+b+Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8m9wcIP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV9qw3664918
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=; b=Zuic+b+ZyUBYCnYB
	Ye31Y4qBd2rm+sfBodz25oJpX2oO8njVZ3iT96cRqLD8R/m7BnbEP7wTfYBRlJ9m
	pXTy0u9zfxXuJJ7QD+Hj9MgnsGHdl/ZtQkcDWCA9EEDYTqaD2qKzdpkB46Bh+Hg4
	uNtratNK0owXs+ywKZ8YU5q1oiz3O5ddToJLkSJQ7dSyvnZUhxnQWiX7uBkNv8Jd
	wWFYC2RFQKK/01Sy5OHaeh7BvkdKsxwPJITg5FWTnDUXWolrZyFmFXwNXVqNEbfg
	Uu54Wdu73yaxZACxCoxO1iJbKY3mZdAA1T2dHhE468o2DawfxaNAYpfsYm+d1c9i
	mDRKOw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g9aak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:32:12 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-57c59d5865eso704992b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703531; x=1796308331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=;
        b=P8m9wcIP6IgcKOB1s/ujb0wz0GvlIxz6nOZhsW45kTekV5dp+ci8AU4UAIErO/sD+5
         9lTORsEF5EUbZhSqhXVZuUSHiZSZ9O8SIMjO2KerZH535dYVJR5gSR3Vfoy2wYjEyWef
         Sys8b858PzHkqTSmoBBex58feo6v8c7V65E5BtU9eTFkDbBsZTgeAXxsFzm4J9bvYcjC
         KsQ6BO10tKsdJt8D7PfcjN6KmhJ6dJaA/2g3TMspLTIJFvwjuR5Uf+SIaByjPXfKBAik
         szgtaoKv+JZ1YJIeABO4P2BVqqC4MXAHfnc0FGv8dVLANd3mrPEpMDU+th78TA56QGvi
         +eIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703531; x=1796308331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=;
        b=yGl2T54RnBYx8fKCDeUi7bxDLptgcuhvqLiFgYchBgQcZdEL/TH74lhBCzkb8YrX3d
         183TEpE2zPhf2C+PYFfPxwoH7kRFviEaELaubaRKX8hzKACwOrUKqiQI76ubvqrQ8ImN
         qgkrekAYqbuWq/PJElhfOYPiVgCGAp1OhjlxSU7JEQspmPDfpP4xXyIN3ORb832qx3Ck
         omiPmIcLggHmvTRn/45+Qqi2MYZzL2I/I/ubHrmQgDa0aUMEFynF/KgJD0dPuknn6F8c
         DSq3KMZUvB8tuAQ/Ra1nqQgfQP2E+UDoorLsWwkVtICAcnt81wf38XIxofzssYZ7++vT
         BO1g==
X-Forwarded-Encrypted: i=1; AL+hErGPT678EnVPglyBBjYmeOKGcOqfCaM919NcLQzQdJVg+45iN2+/Hsq1RjAIHwpjBWmzieaObTDiHvuWtOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+cFVdP0GxM7rRW12lba9K7FcnhxBeF4IPDyJtasc6xsf0r+0i
	/dHv7ngX8L87SsnLkWsn3/VVYboWG2GP8LT4WZranBvkVf1DEIiHKbw2+dQ75d6Y7F15HTlyrmZ
	S5AddEcAI0PjatzrFAKEHrTn3SAfoCJSrd8VE6tWFicv4/u7oT42eQxFObATEBjU+2Dg=
X-Gm-Gg: AZFdTZd+fXG3ckn5d+8zMeNboOR+X9Xq7so9LsivcWyXHiSGQ/BZKDzYWAuZBXw3BaM
	Pimm7fdbt276TSIlGhI8IxKsPWYSbbGNQ/Uv+AP/0BnUQFxbvo5KKU1FTJpMWl2unrWb5kxpovb
	QC2ley4WsZMi4JlCf+zqFSr2KNPcjRublFQU3Ai4bJ8MPILIT2ewqdfTyvicf98ynD5iWrX/QY+
	t8PLTklj1oXu9fRFeORn8KkRGi9+Sgql8agYz6+hiB5CH6vMrbi6btL6q+Nj7qXgn+oU80pRKAj
	30JGQ94kUjlp0z5oGJ5eA1L/hxnKtYPaXncWdNdrrit/8vES+81ZBoQdkZWn2nQwBsatkgh9Sl6
	lhEM/AvskI7H1fOfpbX5yQk9aAb63cpVjqs76/nRLfgQiRLwyU0Lmx7HgWmu918VAok48
X-Received: by 2002:a05:6808:bc6:b0:4bd:73d9:85c7 with SMTP id 5614622812f47-57a024f2218mr31443859b6e.0.1795703531627;
        Thu, 26 Nov 2026 06:32:11 -0800 (PST)
X-Received: by 2002:a05:6808:bc6:b0:4bd:73d9:85c7 with SMTP id 5614622812f47-57a024f2218mr31443826b6e.0.1795703531228;
        Thu, 26 Nov 2026 06:32:11 -0800 (PST)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm676995995e9.10.2026.11.26.06.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:32:10 -0800 (PST)
Message-ID: <84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:32:08 +0100
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
Subject: Re: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday
 (SXR2250P)
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4oF5KEO13jIfNhizoOL2lbKkGvVhKN5I
X-Proofpoint-GUID: 4oF5KEO13jIfNhizoOL2lbKkGvVhKN5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX+8RoRkMja1DC
 +4+rQk9Whzo8AJuiFYuGrEuCNutLVvTxiG7PA/Akd2cSKhZiZ110hcssv7SpnrXnqEmMA3bgq4y
 AzhblbTIoZwPCdLsZGfaq30umnHTjyInmCwFRZ/JOXdRzMSHkTWNCNZdi4XzF/akcRYqGNaysU5
 VIdq0RHGmnyA878FY6+FvzdlEAbc6kLIoBDPdWYUz/k+1wgbOzOArZ2Y/oebI1fmuKN+AZsyBq2
 FIYiUJbCJfu5Cb86yrkNDHd3DAarFCZFZ+/nI6x1FyNK383UZGb8uENoaiDPdkO4DtoSp9YNIx5
 SF4+WbOuM+1dibny8zvPiutUnJhYF3rDtpoI5AnKd0bXPLDVQaPtI6Hvz/lZV488WUMbTHS0ayE
 rxJmoduWGid/UBwZADMxFILKGf2KqbUhp7WlWpodOz4KdM9OcMYdryPdPBW6pAe2we5BuqcPthO
 oKopfZ5iwrfU/6wwhbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX69TnLEbr1tZN
 DbpmAwjJzie86EG4CjZYhZluwNH9wQivtuj2te1IvuQq03YyQqiX65gGtGgewIMgSn/ClNNyrJI
 cVsR1sLjREw8ctl5a1ZaeMoSBRRf9BA=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b0842ec cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=dvIHkycpzy01oOa2bCIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056



On 24-Nov-26 16:29, Stanislav Aleksandrov wrote:
> This series adds the devicetree bindings and pinctrl/GPIO driver for the
> Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
> Snapdragon XR2+ Gen 2) SoC.
> 
> This is part of the initial bring-up effort for Qualcomm Halliday
> and Samsung Galaxy XR.
> 
> This work was made together with Claude, ChatGPT and Gemini.
> Reviewed and tested on my Galaxy XR.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Feedback from an LLM with doc access:

gp_pdm_mira: GPIOs 35-37 at mux 2
gp_pdm_mirb: GPIOs 88-90 at mux 2
gp_mn: GPIO63 at mux 4

Konrad
