Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095262;
	b=gbULCpixo7VuV2JhTF5y0VtqBOijQ4sXkzUW7MxrttwCahcGIIb6po7QusHbkchV+QI1
	 03KRMQCHIbXb3Zhf1Ql+2N4kPhvSHcv3Ueovn+85QOXuSdX9Wi6LT5AIAYVavUczctpdY
	 P34AF3W/R87BKSPgyo7Mz71wXEgvgTKtr6V9fof4qnd8mFbUlab28H9Jcdtp9QDFdVItz
	 Op+I8QC65PPMOKa615JYnaGbmjqhzythohMwv+MMDZPr0IAjxezoQ9AIOen8/FEONCjUn
	 hEVA5/esWO/F+qGJN49FoRAaoWkCnQbNaTUTEnpPYRmHAkfpZONfoNTRx786nYkkyFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=;
	b=MGhQ/QrjCm2jtgpIGGUaDoI6TdupY8VI8xMSDIbb65lF1GT7VxRJP/e7kOOdeKq3nAln
	 mNQVrm9S8Xmu3YQHIc0mNR8hIwfW4eraI97NSgYkTd8tVESxsVDFYvVtxIs52xatjeKYc
	 9nXF8foOPW/uA2T3njHTDCE1N6CPFaX295cZkVkRzMFHi5LDD+gxjSfKxqC1ivsCUETwO
	 Q3nGDe4uAVm+rBPeMoEnX2M4Lur1mASCdHP2Az9eVzQXC+Av2BD+uGKjiw8CDI24pS6td
	 5qlC2lgFTxQN6ZyD7hr8ZmOfSPWWXtdI/oZ8B4La97U7QNHR2SX8cwPVuTrq0bAVkNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=im7pBgOR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1FXb2f2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9179460A260B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9179460A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=im7pBgOR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1FXb2f2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBklPX2685345
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=; b=im7pBgORjzoPB17n
	j5y184hEUdw1JoyjvY1hXb7jvS62rbF3Og4cl0O9fz/EjjiYrH2GVj0NtesGegRZ
	bQVx+NbIU+oeb3PhNagba2foACMHlZM9YgNB/SL0Y9xvOPqPBFZnQOzQ0Zbza1uv
	o5ADCGCM/GXFU6QWcJlVHLE1plAjZUS0TCqjCv7YGv9wS93fjRY6z4AenarCi+Zz
	GzERrUKeZAPDfT5p9Qf4CQ3PD0N2CzIPVJkyAiuZSk6ogTUHhpB9nWTJTO5GFWaE
	nH9Ktt1SdhcBC2C+xuKe3Xstv894tt6cTsGU7fpUOwHpX9qVF/b0vjM4W0VnNlU6
	Yxu9Cw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j20gu8cht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:34:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3fd219d07so723915a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795095259; x=1795700059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=;
        b=Y1FXb2f2A6ldofU4SC5eGHthfBy736SjED/xRPvsiBHRZbdRFUEb+ahrOF0yENnnPK
         LjCLQbw8lyg0lpQMtZTYKu119J87hD4t8I1L3kNjGB65Nb4GQYCHyS49aamNWhtmvSyt
         zPzCMzPuou+IbJ3MP3isbfOhS3+ehTssiol7hlTcidOUmaBNsFAFcIrOK5ivDouqMDvY
         a4kFTMiqz71VWUQyTk/7L3Hfkc7RbwZby63ZkoZxL2VLdC4cRws0dg9UoefPgHN96CEf
         35GCozYul3qU0YVqQCeUgvRVp7B+n1KGPmH/ciips33NReQ3MGYVI0GAoLFC8QFLFZZp
         K8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095259; x=1795700059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=;
        b=jNcf3jwroegixkY2zS+vS6bY1sKh0bDUs4lRSxipTNeu7+1vfAJ9IPusu6LoYZpWhj
         jn+k/p4YVvXP6n8iz5OEX+KhwBGl411mA8x+pKxKL85gXQjAkr1wjm+mqxYUYxmC6MSK
         LWv/TzFYf87zzN84Krsi7oLsR0ZhyFachUPhQAi3ugWipPSVKJbV85wRhfzd82PJaQs4
         uQ3Xj0t35uWpzW7Wz0fw51hDYRknP+EUdpAdGy9PPU94Gz/y4kTUfFqln1Fr6jvFHvm2
         QtYB0UJeUI5RCPzYPNKUGwgbjXUHUfeGelxgNUPlUgOVjeLZIJjY6oiJABja7DYkwI3a
         2Rkg==
X-Forwarded-Encrypted: i=1; AL+hErH1+XG4ppTa9VCS8JIWyCLvCA+Mabx4R2s8iD0+0IVzeUIVosUpiRVIHIaqCFeLuL8do/QTJiq51niuH7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H50YrZjBm1fZA3fV4MlQHsXlBrx0t20u/8xaWcXY0ro1xrZLJ
	R4Hg+RmAski+cwOWA7zxTwETssZqT+InTjVR3qFgU4DdsONzTfIzws4RDodOuJP6Ds/z6DR1IZG
	2g190gtH51ase34SFnfwXPJ6eKB41RsGZyVf56rhdieJJCCZClGb/fOYh8Sa2bDD7xTqp+vX50l
	w=
X-Gm-Gg: AZFdTZfTseTvuIqNVMJ2DcZsiAmRH3njk/RtOxkbTVDeRNPKqfLEblUwvokzSnvO7ve
	1fTajIRu4PhgfbXB9u+ASIBKzj21P7g8Zb4g/osCoaiW1v8hdOpTFAmVWtTIplX3RzBt1gz3gZ/
	GNF4J5HE9yTINXQW5vGXpmEwW+CC4NiHnzLMsGFPLD6Zj3fDUYlv8EPJySWZhCvXtjlHkJI+eD7
	/wwH5y0Vej48FUO3xuXpLVZs/PAgFNim/km2RU1eXfSGxIXCq0XPA4Eqs0TxZUX1HInHFZ6HEZe
	pyZTaJW2pZVYl5jyeibr1WpF00GtVRC5R+T8zhNJopjenqUMv5Q5sHlXUiW9x/emQ4GcdeNeGed
	azybnP3IhkQuiV8sC5ezmeP62pr+RdJ5+V0VH1n8qp5BYNZIY5WGYWgTCoueH1Vi1G6ILQ60g/A
	uvTQ==
X-Received: by 2002:a17:90b:2d86:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b3d0828c40mr5184640a91.52.1795095258663;
        Thu, 19 Nov 2026 05:34:18 -0800 (PST)
X-Received: by 2002:a17:90b:2d86:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b3d0828c40mr5184602a91.52.1795095258052;
        Thu, 19 Nov 2026 05:34:18 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b401f75ee4sm1493331a91.0.2026.11.19.05.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 05:34:17 -0800 (PST)
Message-ID: <18effb9d-b83a-4842-a32c-0f2305cf0a14@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 19:04:11 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
 <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
 <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
 <d90f6dc5-bd8b-4fa3-a17a-e00470a9b8a8@oss.qualcomm.com>
 <88467521-f50d-4c87-8206-4a3249f65212@oss.qualcomm.com>
 <d741093d-345d-4cdf-a48d-2c5e55be2129@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <d741093d-345d-4cdf-a48d-2c5e55be2129@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MyBTYWx0ZWRfXyajP/7FjazXq
 gYyJh8lqpsqEQr8d101jjG1qZwm36RKKPovvyevSx7Wh61eAY7Y1IJxvdTcrBr0xRB6HDWJfrwN
 QlWzSJYBZ6am9iOJwDgNG3iMliChI8M=
X-Proofpoint-ORIG-GUID: MLwyjsQb2bLc-AazFqrrpDXUw-S3TKq5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MyBTYWx0ZWRfX6y9aoRnfuP4Q
 BAXO/nklRA+jYPR3rFJ++SjcLV7KgqXKkEO3SsTMgqo1Sn4aSQDyYL/ROlttnmR9pdu3kWDutWK
 BI7GKS1zqhUXYHOX1NqYAK1ftal63eDOAy2rKb+K/XAV5sEXbnJ6YhJXKFjQJ2o418gZ5L4SHLH
 4d9+1RwWeQY6YWBtRWhUf7eeID/I0Km2YV3faQPwFjGRLE3XK40YaPb9nzGWWaYK2+werY3QUXl
 FPQU9tvf1sN7wo6cGuTiR/GAarkZZduvGpkUFq08LqzlF86uaxAY/4bqG0SJw2wTcW/B+JCPEZG
 TOmXNFYIgBJF6jSPEqOdmPznvK5sKQeLsg8+bi6SDfZHqzeddt8m3ZpotgzbOhyHyjvkcEiOJId
 sr9CGgHDZ8bHN6/ooCH5Hn9hx/RcDFu/qJHdZ59SCj5URThyB0vfnogpTaYHTsLzdxhggbBWx3/
 5Yqpw9WaNj9xZ9rtECw==
X-Proofpoint-GUID: MLwyjsQb2bLc-AazFqrrpDXUw-S3TKq5
X-Authority-Analysis: v=2.4 cv=XutvqlF9 c=1 sm=1 tr=0 ts=6afefadc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KOBisHcl_ayXGa7m1pEA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190053



On 19-11-2026 17:36, Krzysztof Kozlowski wrote:
>> How would you prefer this ABI issue to be handled, or should I
>> send the next version incorporating Loic's comments?
> Commit msg should be clear that ABI is changed, whether that ABI was
> ever working or even correct/possible to work in the first place. You do
> not answer my question really, because if description was not correct
> but everything was working fine, then clearly IT WAS correct to some level.

Yes, you are right. The old ABI was functional with the driver data at that
time, even though it used the X1E80100 CSIPHY resource index instead of a
Glymur-specific port mapping.

Old mapping:
  port@0 -> X1E80100 csiphy_res[0] -> CSIPHY0
  port@1 -> X1E80100 csiphy_res[1] -> CSIPHY1
  port@2 -> X1E80100 csiphy_res[2] -> CSIPHY2, not present on Glymur
  port@3 -> X1E80100 csiphy_res[3] -> CSIPHY4

So port@3 was functional before.

Now, Glymur is using linear graph ports instead of reusing X1E80100:
  port@0 -> csiphy_res[0] -> CSIPHY0
  port@1 -> csiphy_res[1] -> CSIPHY1
  port@2 -> csiphy_res[2] -> CSIPHY4

I will make this ABI change clear in the commit message.
-- 
Regards,
Nihal Kumar Gupta

