Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462923;
	b=uRvrm6UAI/PNZ6VTGx5EQgjQJ+GET/wDqBbGgFTMh2FIED7E7c/PIhMXcMlhE7MBMyrI
	 YlhotrNnKpgkldqE75gadahOc1yARGSHRSiPaW/eqqEWw+oNPgGgaqI0dFTwEKOkrW0d6
	 cSr2hTTdTkf3rd51AfusLicIEaB9LyWAhLUjeyDrWdzfY1Roo6LDjOu8B6tn2/1371uKa
	 2CAcfeYxrnry7E7esmedVK7/yAo0ScywIcBKvI/Vftd5ymPHJJAnxWwH3phSMGTHlN2pc
	 SqwL7EBVeNvnwGw261/z9Eb5g+rMFX1xhglG9duug83/BHLh4MPzaRclbVzPuk1ojDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZP1stIFjrR21WZH3nap4hGQwnj0u77S9FayUUaRW8Zk=;
	b=UwRVRB6d/GgQXPKZ7XNgLnX/t6nU1gCv42QPhiQuFVd9QbJZk1BnnatPOXTPWhssERwm
	 an3+kBMNjKM4tBgv60kj+++ummrgx9SEvAY+3r4r4EkgK2Hbx2unX3HkQVlFEmrXDoZ+j
	 bzbCNz6qIwokrNVnvfLgZ1pXksfXAWAxeQGTNY/IhUHfNjrHWwtZ3jrK8zWBlDROl+auM
	 C4dF8sDVLZobb4867x8N9hRfiz26HhMuubWmIn60plCtA6tjSxpWpmk6bkXn/NzSO+9Mg
	 KFkAlXr1HmAO6TgY3eYTXY3kFv7zNq1gZd9GAHOKM4Bri6MtTXVJMFiBJaWW9rd5oeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cgl6mHPa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CMQFhAA9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04449606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04449606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cgl6mHPa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CMQFhAA9
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH6Jn2340475
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZP1stIFjrR21WZH3nap4hGQw
	nj0u77S9FayUUaRW8Zk=; b=Cgl6mHPaapfmVqEjDLCoi8m8UoIOCaiyU+o1IE4m
	/brL+hrT4eMFEVrdu5g2E8AWyTIONXkiLJXkzjFCPkqHfyKKMyuusXmsJMvmPcVc
	9tzlRSPqI7h8JdbaXm2s6AtA+HO6uPEF7d3IeWN52ptz+Ih/XsauATIF0nFB1K8/
	74Gsm0ztzlG/3knvjkac/GG6YM6E+R3nMjGCMfJeRc633jdP7LXCuHY72+AQiIcG
	0bZkDCzy4gUsrciYDgWOXmim8RD+l3i/HUrZ01tGVh5Cp8WlAtKCQU4GzuXYdzk3
	mAQ979y3apdgKqm4o2DkGIyUccv1kL/Ki0wm7APq1OiERg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3bh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:42:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960bd17b5so614888785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462921; x=1796067721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZP1stIFjrR21WZH3nap4hGQwnj0u77S9FayUUaRW8Zk=;
        b=CMQFhAA90A8zgDFfaal0hJGucgt+fkeROOG2ihpZgnY5Jfrk6zK9x/I7DsrYSij7pG
         22BJHDLyImHZyoEkdHyo3+5jgnmIej/+2W660lFtLq6E9UxGsxOvFrxw4bF9lQLKVgz0
         pHqDduEhd5drC9rj3nV8QY+h130+ViCccypNhOL9ktc5wugM4k54KcwKrs18578UBfrF
         YJ5UNv19Xq2JEwiscEdUIbuAn1scik7YnuwCj8FkHwVLn85l+QS8A3DMQJ8Qb0KQcFMX
         frqxG5bkSjbXaDwXTEPjreZj7pWp+y+q7JIRorYKo8Q//QjOm2mMol0+6SFL/GU9Xe9x
         pZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462921; x=1796067721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZP1stIFjrR21WZH3nap4hGQwnj0u77S9FayUUaRW8Zk=;
        b=ZLBhnQni9T3UqAddAjETIIEhOJDVLbMPRzCJhZK2i7/W9RmjQziz98+1HQkD3QBl5M
         ZBZgSPdirIv/bzMJLSBQfLAcfCNpMYU1ZA3nhXB0ucg8hugRH1lw4NW0d3tQvF5/26f4
         Fxx1DonBviXfCtX9kCfuyHV1bMm0sAtAtCEB9vPnU05Qo6KQb/b4WYUz3SGhJcqN3bnI
         GTkNSCqVbe/JFE0RUlGx3vnuO7wC79gtimjwEWT9zfRrLUTK40Ms1ymJC6uEGKTPKRM6
         VIP9xCc/XTkRjf1kgKaZSXySB01stE76uNfxeaqq4dNqgeP/7+5dfNKp/pS0PkrLdc5F
         bifA==
X-Forwarded-Encrypted: i=1; AL+hErGz1p7HbRuEUz1bAHrwWCWOHztNlTwgJ6neBlKfDo10rLnmuUlcrVz9f+zzSPhhizZL5Qogzs2jgmbljeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nhbmkuzoqYXTBQ0Aw2DAaH6IaW91oNA6eaZ0uPVjoACZ0Xk4z
	f+GdBq2KMz8RG0uXvEn+QXKBz2OJSeOaxkAfvSDMj4ScGCsfCOpfwa8N1isT9o1ANvO4ueEkqSz
	yN/FiiBVmmMTMi4InSrSEeE1UXAhKvV86SQfRLp43T3UH75VzqnU5vjc9A1FlxEpwk8M=
X-Gm-Gg: AZFdTZfyHXRmSV9v5ed3/YgGX/kH8kK0Dpq6yVBgVJ5qQXqB6tZZkLMhZapI272+XVI
	Y0AT5+XyEcWoVRnaJXom2TT0j4NNLry0/8JvQxEY/s8+3jlBRr1WIuKA+44zqlJNjmwLcGNMCuC
	7MmjkkckT28P6V/sYHVFQq7ZWKTH4I1XQwWveuxO8Pjl/E6Ay1L7Ob8twyl3W5OizCx/c16kmlN
	AJA5dHUkm9BTvchdDg5WHHhCg26XK6cC4vRIivNLzb39caUqkf/Uj7RLd4PJ/uDK30V8Q6D0BUi
	vG+DRzN4Xfx5YFhGsiMhu5YpvYNo/NVlDuk7DkRRmGBK5mysjkEE74OnAkcGH6+nTUH4y/WuIur
	hLs5gKTJOmy5QcYHAAfAejA8tXPBNNvxRsgQzE5A1QUVK1DhmiWAz0RLOg53vWdP+
X-Received: by 2002:a05:620a:2b4d:b0:93e:b0c3:388d with SMTP id af79cd13be357-949ba80fa24mr1912904085a.11.1795462921239;
        Mon, 23 Nov 2026 11:42:01 -0800 (PST)
X-Received: by 2002:a05:620a:2b4d:b0:93e:b0c3:388d with SMTP id af79cd13be357-949ba80fa24mr1912899285a.11.1795462920551;
        Mon, 23 Nov 2026 11:42:00 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm24938335f8f.8.2026.11.23.11.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:59 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 16/20] arm64: dts: qcom: kaanapali: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <4ktoys4kreu45oyhzovmdc3pryzcynecdwqczuzjjppqqaqlca@m4flgwzgfpqn>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-16-be30526391d9@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-16-be30526391d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04970a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qO984ec2hPs5we56H4QA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zGKKIxJ1EHsSN290LBDBWCGWg84jT55X
X-Proofpoint-GUID: zGKKIxJ1EHsSN290LBDBWCGWg84jT55X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX1mS1qVbyCMPi
 J1Xu0M/KiOG8QDLYzxmQbhxufI5pZlyb8IRv6q2du2MZZTa+3J47OESBfSWerevYfQHis5S6aX8
 VJYUGUTxRiYIVtyOE82YShca40r/fus=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX2O/tIrpoyuJv
 0FPoN/FLcRS75fwQt+sDqd4YjtTLq/MXTzu2sytItDitv9OP7OqFJy8yGFnzYyAAfVDNWsZXsqb
 uj8Q+MCmwJBrUadN/oaA/3LPIcPS5RIQ6T/5lSHMsXbj14tzBicm8nTYITNMigtWD9c3F1ZY2fg
 bFsIWGf92ps78TRls2O8t3mP7U99q352iELLMz6HHKjbIHiP9UH95FVb3Yodvy4rhu8SbQ+yyKj
 dvbvhdk8DCzXlMAaA9D0R8CxzDZol4aIthhELZhFsU8zxDhpqpkmnxfk+K30konVNTB0PqH3H/q
 nt4hedKIs/L35Y8NvNG8KJ9/x3+jydMUkqGuxd7eus4TFlaOIcVatVQ7cyHUBeTNgQa6h7tU2La
 rmfUOsqa/H9LOeqeMa7ESWKPItKwEHuwbwdNk7AyMAq6MnF9ijmvsRBmmYJV4n1Eu5Dt3qA7o/7
 o3ORpqvUkE3pSODsHlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:47, Bibek Kumar Patro wrote:
> On Kaanapali the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
