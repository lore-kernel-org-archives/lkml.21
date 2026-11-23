Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447267;
	b=blCHnkfVrHEgiX/+vqHNzG/vhVATr08En+uS+jE1qjc0cU7ypwDTK/fBKqI9De0VjbsL
	 xURGBukNkNES30D9fA9FLW3gPOwjy/hyeZJFTQbFmyIYvv2Ne81pBlxGcOJWEMcRmaQfi
	 2oFOCnYHdvriohrX4Otrh/DZSAt1ufQXUEhSe3Elk+iU8I7jy97DOVVVaVTzcSXt5EwO0
	 kcnlyyQfThTS3sBVh9j5jrD0k3SSP77a8IpSJ0wkVsLYAGdFj3THNlE5gW4LoIHG5U+bd
	 cfMr48rz7Ql21L/RpVj2agZp11uFs9RYBVV/i+VvLM/0nJfEBblRd27RBIBP3v4B3zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=;
	b=WPnf63cti0ZVBbDycLWTb6Few3yw3vZFDq5+U1If1yjha6QUYay8UTRttJfDNZYVvNZ+
	 nD9GwzkIJYng9VL78znmwa8HZeqk68djKlxN/XG7IROBpSPCzPG2+Vil6LsEERY6Be89y
	 /jGaX1qDgKLcurWDsw4Ueab5ZfloesKdBRWPNMehAvhSjBv8v94MD1ej/kc6bUC1qBS8q
	 54OaVbpF1if9BzJ0gXUFj/5vK+uL5BIrD/HWh5Czp46od5VUABokr/Zz5UCHtRM5pxNQh
	 Toi672IxSJ3CihqRK2zneQmqq2rXxt6WRJefSOU8fjBl3778qxNClXg4+LP7XgJoNpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7rhCiUm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6ZxGWPi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86728606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86728606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7rhCiUm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6ZxGWPi
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL6oR2369534
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=; b=Z7rhCiUm1Yg2sudi
	2PFkyr/8G2GSQ4Rw42s2N0EEBhXHuCXgraAr7/chrPArc6k1xjUap6408kqVKf8N
	bZmucUTooXeXiCaPET0e12DVrfdO+xM8CgT/1uA8Bin/+lX78MeuOTgU+tX3BKnp
	woRsr0MVaNFnKlf7+OcaJBEib5dlY3RC/Rv1UAt+imNWfpbObrT5lmFCrSQnUdRW
	kmb4qRTCQfdSm36xiRHDrKC0672pJn4zNknHviC4l2oryid8EkVfEG7o4ClqcCRz
	lC9GUrpy26uwxg1m01uZ8hO04kt4DVwCWiWqGiOXcH0etGd7/o8pRRX2YObIi1x9
	nudJaQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa0g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:21:06 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-567c8af65f1so173413b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447266; x=1796052066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=;
        b=d6ZxGWPiqbNxaw5lhbK8DQAGemnqRRPIeiJ5GTZcv+h8E1sgfkr63clTz64Zvng/nv
         BcU2LCU3DHOgPxBzvwFhS9mNzBYK48KoLOPFDlK15SQjuh9Y3bRsL2tR1w5kHsCzSd0G
         DsPF5MTaMNcEXn1DHS21SlpgGI97M5E3BmkX1UYBuOOYWZSrLOyj3a11Djc5kAhWwVSm
         6CjyTgvp+JkZDHOj8GeS1fSy9YSoHauHUZkuv05R7lOK8NoNDSLmQJFdnb1Js0cE12gy
         d4HDPQVgM6jIP6sPFlGSX2YNpKTpwonSI5a4Qo+yhY8LL+zTh9emHltPxqhf2fuuJxvi
         esrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447266; x=1796052066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=;
        b=YLmOKIN5B/PXys8qUIMPp+CHJdPHU3n9mlw3eMjBaovVh82dmqn3qr+BB4C8oSNDSA
         stcxwyt89GFnqXiKxZpep/NmFPZixvEgkFQ7i1PPqKoGDD2lsuzRjrZUVWd3ZNwXqexZ
         qDhdIx0Rn61EnjknvrSBZUFG7pHfOqdwOqUCFXUHqiBGwhQcPEHPBdY+Er+cPqeY8nJH
         +vTKMBld8luZGitWbGrkHpqhB/JdQibzY8iXqzSHtqGwJqX1tXzQLgiVb6yTcaNYsDBR
         xg0yM2Zo5wj5uuMr+lVD0D4TV+sbmWKdYeutbiGrvEwKpp+GRJkUzKfgzLjFL0F8wFu7
         pXQg==
X-Forwarded-Encrypted: i=1; AL+hErGyEeGnw0MLnJ+JiUS1va4ogo+iD+mOPTe0afRhJ6DptPkOz25wEDygANCdGo0sUHCeTBRn6R0cXP+OP84=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NicKJYKYWFQu6jxI+AbrW/CjqcJj8xHJhXRg+xikOTgWdtzPF
	/HBatCGgCShz8YFr9i0Ir8oE8BRKZLvDdRvITIwK/psxZdDhunHCL/R5z6fcLFipjuKBPOHDRqJ
	K28SWGwHGSOiAiEeTHa16U2myJHPuCloTi1LEIfefXjhMnwcAx8NM4QPxtP8cRdvM/Ao=
X-Gm-Gg: AZFdTZfe9NmMSY1HmvzLMOfMABf4+8wegjVWPtJicagD8m6+iD8qiOHYtil1UOAHzJy
	1A3KeMy3pedIoqwmbAVewgR261mjgi5eQuyUu2mMmX+RTQ7BL0DH1Ic8g1s5cBOhQI7H7Ssa7KY
	xs0RWgRdU6kGKr60aWLoK+prGYSPdtEVd5vD4rhweQ2AsfbUR1e0qWPEM7ZbQZEpPjCYrminTLT
	oSc+dQOVmoQGns+LNSQeD5zzOhC78MHnOUjrCnyvNv2aMFZLIeS2jv9wPn2nc146QXBBoSlAnn7
	g9KCwBuO4h1dgolz7wmauk3YJGrLYNQ/GutNKnY5D5+dsBlpJJkC0xRu3VRGmOjhUBUzvYTBqZL
	fjGchcgmBsX1RRknxzPf3ohPXJ9NX+RBHRd6UNvSMBuEQD+/1/QHF3DLe
X-Received: by 2002:a05:6808:5198:b0:573:2541:180b with SMTP id 5614622812f47-57a058e8466mr17194547b6e.1.1795447266133;
        Mon, 23 Nov 2026 07:21:06 -0800 (PST)
X-Received: by 2002:a05:6808:5198:b0:573:2541:180b with SMTP id 5614622812f47-57a058e8466mr17194509b6e.1.1795447265752;
        Mon, 23 Nov 2026 07:21:05 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109c58sm5375497a12.33.2026.11.23.07.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:21:04 -0800 (PST)
Message-ID: <646c17cd-aded-46dd-874b-dbe7ae0f4a1d@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:21:01 +0100
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
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
 <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX+mR412FIFmJn
 T+DdTtKQH/ONzKVEeT/05zUubxEphKdrE6awaZa7dFH+usCkW+f4bgGGAVYmZOCD+HkpnDFfHwT
 OMBYMDeEate+Wecf18FIsGwlEvhAtL77cwsfTHSKqrrKmlDgmnlSYX123ijhFueV7I+AT6phuQD
 xqLKQQ1uDr3AtGPiBL2M/tP/qQXqoY2PWjQUpokq/dUzis9u/R4xGzUNWrvyHo+jIPqkZnw7Umx
 TCN/QjRJBGDk5+Rd/YO2zLFG2Uaa5kN2mZv6OHVl+/17XJLn+Btb/2FixqpwoTZYRbjv67sielh
 adqWknj38QeRg5nwpF6PDApyAuQDEE/iJW3xZHGbTghPp4PYp/bMdqiS8cyqrdpA/Ybt856H6BS
 eSecg/yx76ZDFMtQAbfcai8rMQiZYKEfIgJlNKArOkPVoc5PghPuV0JhBoC6fIydB/woLHQmN6l
 SmkJ5IKDzTYzk4hKbiA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b0459e2 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GtvZotVShuh0uySl3soA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: m8OjKqQDdXGefkOD4f7EEr1JiGVKgp8j
X-Proofpoint-ORIG-GUID: m8OjKqQDdXGefkOD4f7EEr1JiGVKgp8j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX4+mKsVN//Hjv
 ffuWyxpMOBlFFDQxZO+wwGTeFhb0nXPQ550hVATrE8eDadaY4qudj3rzdX/wFv2T0faXVNyzKuf
 xoGcMVo5vGZbFptLa1mRaThqZtK57Ys=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/16/26 6:27 AM, Taniya Das wrote:
> Add the programmable PWM XO512 divider sourced from bi_tcxo and make
> GCC_PWM0_XO512_CLK its child. This permits PWM consumers to select their
> PWM core rate through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
